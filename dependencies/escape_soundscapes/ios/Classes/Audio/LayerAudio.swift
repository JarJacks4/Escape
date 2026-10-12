import AVFoundation
import MediaToolbox

// Layers + Whisper audio. Everything here is driven by SoundscapePlayer.
//
//  * LayerEQ / EQTapState: 3-band gains on the playing track (Ambience = high, Melody = mid,
//    Pulse = low) through an MTAudioProcessingTap on each AVPlayerItem.
//  * AmbientSynth: Nature (rain-like filtered noise) and Brainwave (binaural tone), generated live.
//  * WhisperVoice: Lucille Whisper spoken cues (AVSpeechSynthesizer), ducking the music while speaking.

// MARK: - Track EQ

/// Band gains for the track (1 = as rendered). Written on the main thread, read on the audio thread.
final class LayerGains: @unchecked Sendable {
    var low: Float = 1
    var mid: Float = 1
    var high: Float = 1
}

/// Per-item tap state: 3-band split at about 250 Hz and 3.5 kHz (12 dB/oct). mid = x - low - high,
/// so at unity gains the output is exactly the input.
final class EQTapState {
    let gains: LayerGains
    private var aLow: Float = 0.035
    private var aHigh: Float = 0.4
    private var lowA = [Float](repeating: 0, count: 8)
    private var lowB = [Float](repeating: 0, count: 8)
    private var highA = [Float](repeating: 0, count: 8)
    private var highB = [Float](repeating: 0, count: 8)
    private var g: (Float, Float, Float) = (1, 1, 1)
    private var usable = false

    init(gains: LayerGains) { self.gains = gains }

    static func from(_ tap: MTAudioProcessingTap) -> EQTapState {
        Unmanaged<EQTapState>.fromOpaque(MTAudioProcessingTapGetStorage(tap)).takeUnretainedValue()
    }

    func prepare(_ f: AudioStreamBasicDescription) {
        usable = f.mFormatFlags & kAudioFormatFlagIsFloat != 0
            && f.mFormatFlags & kAudioFormatFlagIsNonInterleaved != 0
            && f.mBitsPerChannel == 32
        let sr = f.mSampleRate > 0 ? f.mSampleRate : 44_100
        aLow = Float(1 - exp(-2 * Double.pi * 250 / sr))
        aHigh = Float(1 - exp(-2 * Double.pi * 3_500 / sr))
    }

    func process(_ list: UnsafeMutablePointer<AudioBufferList>, frames: Int) {
        guard usable, frames > 0 else { return }
        let target = (gains.low, gains.mid, gains.high)
        let start = g
        var end = start
        let k: Float = 0.001
        for (c, buffer) in UnsafeMutableAudioBufferListPointer(list).enumerated() where c < lowA.count {
            guard let d = buffer.mData?.assumingMemoryBound(to: Float.self) else { continue }
            let n = min(frames, Int(buffer.mDataByteSize) / MemoryLayout<Float>.size)
            var la = lowA[c], lb = lowB[c], ha = highA[c], hb = highB[c]
            var (gl, gm, gh) = start
            for i in 0..<n {
                let x = d[i]
                la += (x - la) * aLow; lb += (la - lb) * aLow
                ha += (x - ha) * aHigh; hb += (ha - hb) * aHigh
                let low = lb, high = x - hb
                gl += (target.0 - gl) * k; gm += (target.1 - gm) * k; gh += (target.2 - gh) * k
                d[i] = low * gl + (x - low - high) * gm + high * gh
            }
            lowA[c] = la; lowB[c] = lb; highA[c] = ha; highB[c] = hb
            end = (gl, gm, gh)
        }
        g = end
    }
}

private let eqTapInit: MTAudioProcessingTapInitCallback = { _, clientInfo, storageOut in
    storageOut.pointee = clientInfo
}
private let eqTapFinalize: MTAudioProcessingTapFinalizeCallback = { tap in
    Unmanaged<EQTapState>.fromOpaque(MTAudioProcessingTapGetStorage(tap)).release()
}
private let eqTapPrepare: MTAudioProcessingTapPrepareCallback = { tap, _, format in
    EQTapState.from(tap).prepare(format.pointee)
}
private let eqTapUnprepare: MTAudioProcessingTapUnprepareCallback = { _ in }
private let eqTapProcess: MTAudioProcessingTapProcessCallback = { tap, frames, _, buffers, framesOut, flagsOut in
    guard MTAudioProcessingTapGetSourceAudio(tap, frames, buffers, flagsOut, nil, framesOut) == noErr else { return }
    EQTapState.from(tap).process(buffers, frames: Int(framesOut.pointee))
}

@available(iOS 17.0, *)
enum LayerEQ {
    /// Adds the band tap once the item's audio track is known (a fraction of a second after start).
    @MainActor
    static func attach(to item: AVPlayerItem, gains: LayerGains) {
        Task { @MainActor in
            guard let track = try? await item.asset.loadTracks(withMediaType: .audio).first else { return }
            let state = EQTapState(gains: gains)
            var callbacks = MTAudioProcessingTapCallbacks(
                version: kMTAudioProcessingTapCallbacksVersion_0,
                clientInfo: Unmanaged.passRetained(state).toOpaque(),
                init: eqTapInit, finalize: eqTapFinalize, prepare: eqTapPrepare,
                unprepare: eqTapUnprepare, process: eqTapProcess)
            var tap: MTAudioProcessingTap?
            guard MTAudioProcessingTapCreate(kCFAllocatorDefault, &callbacks,
                                             kMTAudioProcessingTapCreationFlag_PostEffects, &tap) == noErr,
                  let tap else {
                Unmanaged.passUnretained(state).release()
                return
            }
            let params = AVMutableAudioMixInputParameters(track: track)
            params.audioTapProcessor = tap
            let mix = AVMutableAudioMix()
            mix.inputParameters = [params]
            item.audioMix = mix
        }
    }
}

// MARK: - Nature + Brainwave

/// Targets for the synth. Written on the main thread, read on the audio thread.
final class SynthParams: @unchecked Sendable {
    var nature: Float = 0
    var beat: Float = 0
    var beatHz: Float = 10
    var master: Float = 1
    var fade: Float = 1
    var gate: Float = 0
}

final class SynthRenderer {
    private struct Pink {
        var b0: Float = 0, b1: Float = 0, b2: Float = 0
        mutating func next(_ w: Float) -> Float {
            b0 = 0.99765 * b0 + w * 0.0990460
            b1 = 0.96300 * b1 + w * 0.2965164
            b2 = 0.57000 * b2 + w * 1.0526913
            return (b0 + b1 + b2 + w * 0.1848) * 0.12
        }
    }

    private let p: SynthParams
    private let sampleRate: Float
    private let carrier: Float = 200
    private var nature: Float = 0, beat: Float = 0, beatHz: Float = 10, level: Float = 0
    private var phaseL: Float = 0, phaseR: Float = 0
    private var seed: UInt32 = 0x9E37_79B9
    private var pinkL = Pink(), pinkR = Pink()
    private var lpL: Float = 0, lpR: Float = 0

    init(params: SynthParams, sampleRate: Double) {
        p = params
        self.sampleRate = Float(sampleRate)
    }

    private func white() -> Float {
        seed ^= seed << 13; seed ^= seed >> 17; seed ^= seed << 5
        return Float(seed) * (2 / Float(UInt32.max)) - 1
    }

    func render(_ frames: Int, _ list: UnsafeMutablePointer<AudioBufferList>) {
        let buffers = UnsafeMutableAudioBufferListPointer(list)
        guard buffers.count >= 2,
              let left = buffers[0].mData?.assumingMemoryBound(to: Float.self),
              let right = buffers[1].mData?.assumingMemoryBound(to: Float.self) else { return }
        let natureT = p.nature, beatT = p.beat, hzT = p.beatHz, levelT = p.master * p.fade * p.gate
        let k: Float = 0.0008   // ~30 ms smoothing, no clicks
        let step = 2 * Float.pi / sampleRate
        let twoPi = 2 * Float.pi
        for i in 0..<frames {
            nature += (natureT - nature) * k
            beat += (beatT - beat) * k
            beatHz += (hzT - beatHz) * k
            level += (levelT - level) * k
            var l: Float = 0, r: Float = 0
            if nature > 0.0001 {
                lpL += (pinkL.next(white()) - lpL) * 0.35
                lpR += (pinkR.next(white()) - lpR) * 0.35
                l += lpL * nature
                r += lpR * nature
            }
            if beat > 0.0001 {
                phaseL += carrier * step
                if phaseL > twoPi { phaseL -= twoPi }
                phaseR += (carrier + beatHz) * step
                if phaseR > twoPi { phaseR -= twoPi }
                l += sinf(phaseL) * beat
                r += sinf(phaseR) * beat
            }
            left[i] = l * level
            right[i] = r * level
        }
    }
}

/// Nature + Brainwave on their own AVAudioEngine, mixed with the AVPlayer output by the system.
/// The engine only runs while something is playing and at least one of the two is on.
@available(iOS 17.0, *)
@MainActor
final class AmbientSynth {
    private let engine = AVAudioEngine()
    private let params = SynthParams()
    private var playing = false
    private var fadeTask: Task<Void, Never>?
    private var stopTask: Task<Void, Never>?

    /// Follows the player's master volume (timer fade-out).
    var master: Float {
        get { params.master }
        set { params.master = newValue }
    }

    init() {
        let format = AVAudioFormat(standardFormatWithSampleRate: 44_100, channels: 2)!
        let renderer = SynthRenderer(params: params, sampleRate: 44_100)
        let node = AVAudioSourceNode(format: format) { _, _, frames, list in
            renderer.render(Int(frames), list)
            return noErr
        }
        engine.attach(node)
        engine.connect(node, to: engine.mainMixerNode, format: format)
        NotificationCenter.default.addObserver(forName: .AVAudioEngineConfigurationChange, object: engine,
                                               queue: .main) { [weak self] _ in
            MainActor.assumeIsolated { self?.update() }
        }
    }

    /// Levels 0...1 (0 = off).
    func set(nature: Float, brainwave: Float, beatHz: Float) {
        params.nature = nature * 0.8
        params.beat = brainwave * 0.12
        params.beatHz = beatHz
        update()
    }

    func setPlaying(_ on: Bool) {
        fadeTask?.cancel()
        fadeTask = nil
        playing = on
        if on { params.fade = 1 }
        update()
    }

    /// Session end: fade along with the outro.
    func fadeOut(over seconds: Double) {
        fadeTask?.cancel()
        let steps = max(1, Int(seconds * 20))
        fadeTask = Task { [weak self] in
            for i in 1...steps {
                try? await Task.sleep(for: .milliseconds(50))
                guard let self, !Task.isCancelled else { return }
                self.params.fade = 1 - Float(i) / Float(steps)
            }
        }
    }

    private var needed: Bool { playing && (params.nature > 0.0001 || params.beat > 0.0001) }

    private func update() {
        params.gate = playing ? 1 : 0
        stopTask?.cancel()
        stopTask = nil
        if needed {
            guard !engine.isRunning else { return }
            engine.prepare()
            do { try engine.start() } catch { print("EscapeSoundscapes: ambient engine error \(error)") }
        } else if engine.isRunning {
            // Let the level ramp down, then stop using CPU.
            stopTask = Task { [weak self] in
                try? await Task.sleep(for: .milliseconds(400))
                guard let self, !Task.isCancelled, !self.needed else { return }
                self.engine.pause()
            }
        }
    }
}

// MARK: - Lucille Whisper

struct WhisperScript {
    struct Cue { let text: String; let pause: Double }
    /// Seconds before the first cue.
    let firstDelay: Double
    /// Each cue, then the seconds until the next one starts. Loops.
    let cues: [Cue]

    static func script(for topic: String) -> WhisperScript {
        let t = topic.lowercased()
        if t.contains("breath") { return breathing }
        if t.contains("sleep") || t.contains("story") { return sleep }
        if t.contains("focus") { return focus }
        return affirmations
    }

    private static func spaced(_ lines: [String], every pause: Double, first: Double) -> WhisperScript {
        WhisperScript(firstDelay: first, cues: lines.map { Cue(text: $0, pause: pause) })
    }

    static let focus = spaced([
        "Settle in. One thing at a time.",
        "If your mind wandered, that's okay. Come back to the next small step.",
        "Soften your shoulders, and keep going.",
        "You're doing the work. Stay with it.",
        "Notice one breath, then return to the task.",
        "Progress, not perfection.",
        "Unclench your jaw. Stay with this one thing.",
        "Nice and steady. You've got this.",
    ], every: 75, first: 15)

    static let affirmations = spaced([
        "You are allowed to take up space.",
        "You are doing better than you think.",
        "This moment is enough, and so are you.",
        "You can be gentle with yourself today.",
        "Your pace is the right pace.",
        "You've handled hard things before. You can handle this.",
        "Rest isn't a reward. It's something you deserve.",
        "You are safe to slow down here.",
    ], every: 70, first: 15)

    static let breathing: WhisperScript = {
        var cues: [Cue] = []
        for _ in 0..<5 {
            cues.append(Cue(text: "Breathe in…", pause: 4.5))
            cues.append(Cue(text: "and slowly out.", pause: 6.5))
        }
        cues.append(Cue(text: "Let your breath find its own rhythm.", pause: 60))
        return WhisperScript(firstDelay: 8, cues: cues)
    }()

    static let sleep: WhisperScript = {
        var cues = [
            "Imagine a quiet cabin at the edge of a pine forest.",
            "Rain taps softly on the roof, slow and even.",
            "Inside, a small fire glows, and the room is warm.",
            "You sink a little deeper into a soft, heavy blanket.",
            "Outside, the trees sway, unhurried, in the dark.",
            "There is nowhere you need to be, and nothing left to do tonight.",
            "Each sound of the rain carries you a little further down.",
            "Your hands are heavy. Your breathing is slow.",
            "The fire settles into embers, and the cabin grows still.",
            "Let yourself drift.",
        ].map { Cue(text: $0, pause: 20) }
        cues[cues.count - 1] = Cue(text: "Let yourself drift.", pause: 240)
        return WhisperScript(firstDelay: 12, cues: cues)
    }()
}

/// Speaks the selected topic's cues while a soundscape plays. `onSpeaking` lets the player duck.
@available(iOS 17.0, *)
@MainActor
final class WhisperVoice: NSObject, AVSpeechSynthesizerDelegate {
    var onSpeaking: ((Bool) -> Void)?
    /// 0...1, from the Lucille's Voice layer.
    var volume: Float = 0.6

    private let synth = AVSpeechSynthesizer()
    private var enabled = false
    private var playing = false
    private var topic = ""
    private var loop: Task<Void, Never>?

    private static let voice: AVSpeechSynthesisVoice? = {
        let en = AVSpeechSynthesisVoice.speechVoices().filter { $0.language == "en-US" }
        return en.first { $0.quality == .premium }
            ?? en.first { $0.quality == .enhanced }
            ?? AVSpeechSynthesisVoice(language: "en-US")
    }()

    override init() {
        super.init()
        synth.delegate = self
    }

    func configure(enabled: Bool, topic: String) {
        guard enabled != self.enabled || topic != self.topic else { return }
        self.enabled = enabled
        self.topic = topic
        restart()
    }

    func setPlaying(_ on: Bool) {
        guard on != playing else { return }
        playing = on
        restart()
    }

    private func restart() {
        loop?.cancel()
        loop = nil
        if synth.isSpeaking { synth.stopSpeaking(at: .word) }
        guard enabled, playing else { return }
        let script = WhisperScript.script(for: topic)
        loop = Task { [weak self] in
            try? await Task.sleep(for: .seconds(script.firstDelay))
            var i = 0
            while !Task.isCancelled {
                guard let self else { return }
                let cue = script.cues[i % script.cues.count]
                self.speak(cue.text)
                try? await Task.sleep(for: .seconds(cue.pause))
                i += 1
            }
        }
    }

    private func speak(_ text: String) {
        let u = AVSpeechUtterance(string: text)
        u.voice = Self.voice
        u.rate = 0.42
        u.pitchMultiplier = 0.95
        u.volume = volume
        u.preUtteranceDelay = 0.2
        synth.speak(u)
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        Task { @MainActor [weak self] in self?.onSpeaking?(true) }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor [weak self] in self?.onSpeaking?(false) }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor [weak self] in self?.onSpeaking?(false) }
    }
}
