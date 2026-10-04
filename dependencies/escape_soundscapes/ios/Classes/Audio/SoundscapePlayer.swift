import AVFoundation
import MediaPlayer

/// Plays a Lucille segment set as one endless soundscape: intro → shuffled bodies with
/// crossfades → outro when the session ends. Two AVPlayers swap roles at each crossfade.
///
/// Info.plist `UIBackgroundModes` → `audio` (already set in this project).
/// The AppStore talks to it through `AudioEngine`.
@available(iOS 17.0, *)
@MainActor
public final class SoundscapePlayer: AudioEngine {
    public private(set) var isPlaying = false
    public private(set) var composition: Composition?
    public private(set) var current: AudioSegment?
    public private(set) var isEnding = false

    /// Seconds of overlap between segments.
    public var crossfade: TimeInterval = 4
    public var masterVolume: Float = 1 {
        didSet { if rampTasks.isEmpty { players[active].volume = masterVolume } }
    }
    /// Called after the outro finishes (timer ended) or a graceful stop completes.
    public var onFinished: (() -> Void)?

    private let players = [AVPlayer(), AVPlayer()]
    private var active = 0
    private var scheduler: SegmentScheduler?
    private var timeObserver: Any?
    private var observedPlayer: AVPlayer?
    private var transitioning = false
    private var rampTasks: [Int: Task<Void, Never>] = [:]
    private var blend = false
    private var remoteConfigured = false

    public init() {
        players.forEach { $0.automaticallyWaitsToMinimizeStalling = true }
        NotificationCenter.default.addObserver(forName: AVAudioSession.interruptionNotification,
                                               object: nil, queue: .main) { [weak self] note in
            MainActor.assumeIsolated { self?.handleInterruption(note) }
        }
    }

    // MARK: Public controls

    /// Starts a composition from its intro. Replaces anything playing.
    /// `startOffset` > 0 (Listening Circles) skips the intro and seeks into the body loop,
    /// so everyone in the circle hears the same moment.
    public func play(_ composition: Composition, blend: Bool, startOffset: TimeInterval = 0) {
        stopImmediately()
        self.composition = composition
        self.blend = blend
        configureSession()
        configureRemoteCommands()
        var s = SegmentScheduler(segments: composition.segments, shuffle: { $0 })
        if startOffset <= 0 { s = SegmentScheduler(segments: composition.segments) }
        guard let first = startOffset > 0 ? (s.nextBody() ?? s.first()) : s.first() else { return }
        scheduler = s
        isEnding = false
        start(first, on: active, fadeIn: 1.5)
        if startOffset > 0 {
            let into = startOffset.truncatingRemainder(dividingBy: max(1, first.durationSec))
            players[active].seek(to: CMTime(seconds: into, preferredTimescale: 600))
        }
        isPlaying = true
        updateNowPlaying()
    }

    /// Crossfades into a different composition (e.g. a new Mood Field variation) without a gap.
    public func crossfade(to composition: Composition) {
        guard isPlaying else { return play(composition, blend: blend) }
        var s = SegmentScheduler(segments: composition.segments)
        guard let next = s.nextBody() ?? s.first() else { return }
        self.composition = composition
        scheduler = s
        swap(to: next)
        updateNowPlaying()
    }

    public func pause() {
        players.forEach { $0.pause() }
        isPlaying = false
        updateNowPlaying()
    }

    public func resume() {
        guard current != nil else { return }
        try? AVAudioSession.sharedInstance().setActive(true)
        players[active].play()
        isPlaying = true
        updateNowPlaying()
    }

    /// Timer ended or user stopped: crossfade into the outro, then finish.
    public func finishGracefully() {
        guard current != nil, !isEnding else { return }
        isEnding = true
        if let outro = scheduler?.outro, current?.role != .outro {
            swap(to: outro)
        } else {
            fade(players[active], to: 0, over: 5) { [weak self] in self?.finish() }
        }
    }

    public func stop() { stopImmediately() }

    /// Timer fade-out (0…1).
    public func setVolume(_ volume: Float) { masterVolume = max(0, min(1, volume)) }

    public func stopImmediately() {
        rampTasks.values.forEach { $0.cancel() }
        rampTasks.removeAll()
        removeTimeObserver()
        players.forEach {
            $0.pause()
            $0.replaceCurrentItem(with: nil)
        }
        current = nil
        isPlaying = false
        transitioning = false
        updateNowPlaying()
    }

    /// Blend on: play under other apps' audio instead of stopping it.
    public func setBlend(_ on: Bool) {
        blend = on
        // Only touch the audio session while we're playing, so launching the app
        // never interrupts someone's music.
        if current != nil { configureSession() }
    }

    // MARK: Segments

    private func start(_ segment: AudioSegment, on index: Int, fadeIn: TimeInterval) {
        let player = players[index]
        player.replaceCurrentItem(with: AVPlayerItem(url: segment.url))
        player.volume = 0
        player.play()
        fade(player, to: masterVolume, over: fadeIn)
        current = segment
        observe(player, segment: segment)
    }

    private func swap(to next: AudioSegment) {
        let old = players[active]
        active = 1 - active
        transitioning = true
        start(next, on: active, fadeIn: crossfade)
        fade(old, to: 0, over: crossfade) { [weak self] in
            old.pause()
            old.replaceCurrentItem(with: nil)
            self?.transitioning = false
        }
    }

    private func observe(_ player: AVPlayer, segment: AudioSegment) {
        removeTimeObserver()
        observedPlayer = player
        timeObserver = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.25, preferredTimescale: 600),
                                                      queue: .main) { [weak self] time in
            MainActor.assumeIsolated { self?.tick(time) }
        }
    }

    private func removeTimeObserver() {
        if let timeObserver, let observedPlayer { observedPlayer.removeTimeObserver(timeObserver) }
        timeObserver = nil
        observedPlayer = nil
    }

    private func tick(_ time: CMTime) {
        guard let segment = current, !transitioning else { return }
        let item = players[active].currentItem
        if item?.status == .failed {
            advance()
            return
        }
        let itemDuration = item?.duration.seconds ?? .nan
        let duration = itemDuration.isFinite ? itemDuration : segment.durationSec
        let remaining = duration - time.seconds

        if segment.role == .outro {
            if remaining <= 0.3 { finish() }
            return
        }
        if remaining <= crossfade { advance() }
    }

    private func advance() {
        if isEnding, let outro = scheduler?.outro {
            swap(to: outro)
        } else if let next = scheduler?.nextBody() {
            swap(to: next)
        } else if let current {
            swap(to: current) // single-segment set: loop it
        }
    }

    private func finish() {
        stopImmediately()
        isEnding = false
        onFinished?()
    }

    // MARK: Volume ramps

    private func fade(_ player: AVPlayer, to target: Float, over seconds: TimeInterval, then done: (() -> Void)? = nil) {
        let key = players.firstIndex { $0 === player } ?? 0
        rampTasks[key]?.cancel()
        let start = player.volume
        let steps = max(1, Int(seconds * 30))
        rampTasks[key] = Task { @MainActor [weak self] in
            for i in 1...steps {
                if Task.isCancelled { return }
                // Equal-power curve sounds smoother than linear for crossfades.
                let x = Float(i) / Float(steps)
                let curve = target > start ? sin(x * .pi / 2) : cos((1 - x) * .pi / 2)
                player.volume = start + (target - start) * curve
                try? await Task.sleep(nanoseconds: 33_000_000)
            }
            player.volume = target
            self?.rampTasks[key] = nil
            done?()
        }
    }

    // MARK: Session, interruptions, lock screen

    private func configureSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .default, options: blend ? [.mixWithOthers] : [])
            try session.setActive(true)
        } catch {
            print("EscapeSoundscapes: audio session error \(error)")
        }
    }

    private func handleInterruption(_ note: Notification) {
        guard let raw = note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: raw) else { return }
        switch type {
        case .began:
            isPlaying = false
        case .ended:
            let optionsRaw = (note.userInfo?[AVAudioSessionInterruptionOptionKey] as? UInt) ?? 0
            if AVAudioSession.InterruptionOptions(rawValue: optionsRaw).contains(.shouldResume) { resume() }
        @unknown default:
            break
        }
    }

    private func configureRemoteCommands() {
        guard !remoteConfigured else { return }
        remoteConfigured = true
        let center = MPRemoteCommandCenter.shared()
        center.playCommand.addTarget { [weak self] _ in
            MainActor.assumeIsolated { self?.resume() }
            return .success
        }
        center.pauseCommand.addTarget { [weak self] _ in
            MainActor.assumeIsolated { self?.pause() }
            return .success
        }
        center.togglePlayPauseCommand.addTarget { [weak self] _ in
            MainActor.assumeIsolated {
                guard let self else { return }
                self.isPlaying ? self.pause() : self.resume()
            }
            return .success
        }
    }

    private func updateNowPlaying() {
        guard let composition, current != nil else {
            MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
            return
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: composition.title,
            MPMediaItemPropertyArtist: composition.creditLine,
            MPMediaItemPropertyAlbumTitle: "Escape Soundscapes",
            MPNowPlayingInfoPropertyIsLiveStream: true,
            MPNowPlayingInfoPropertyPlaybackRate: isPlaying ? 1.0 : 0.0
        ]
    }
}
