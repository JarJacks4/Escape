import Combine
import SwiftUI

/// Host hooks the scan flow needs from the app. Defaults are no-ops so previews and tests run.
@available(iOS 17.0, *)
public struct ScanHost: Sendable {
    public var haptic: @Sendable (_ soft: Bool) -> Void = { _ in }
    public var saveToHealth: @Sendable (_ valence: Double, _ label: String) -> Void = { _, _ in }
    public var open: @Sendable (_ deeplink: String) -> Void = { _ in }
    public var playSoundscape: @Sendable (_ mode: ModeId) -> Void = { _ in }
    public var close: @Sendable () -> Void = {}
    /// Called once when the result shows: save the check-in (Lucille v1 /v1/mood/checkins).
    public var saveCheckIn: @Sendable (_ reading: MoodReading, _ words: String) -> Void = { _, _ in }
    /// Saves the check-in and reports what happened (coins awarded, or consent needed).
    /// When set, the flow uses this instead of `saveCheckIn` so the coin badge shows real coins.
    public var submitCheckIn: (@Sendable (_ reading: MoodReading, _ words: String) async -> ScanSaveResult)? = nil
    /// The person agreed to store mood check-ins (GDPR consent `wellbeing_data`). Returns true on success.
    public var grantMoodConsent: (@Sendable () async -> Bool)? = nil
    /// The person's real coin balance (lifetime coins drive Energy Scan levels). nil = unknown.
    public var loadCoins: (@Sendable () async -> Int?)? = nil
    public init() {}
}

/// Outcome of saving a scan as a mood check-in.
public enum ScanSaveResult: Sendable, Equatable {
    case saved(coins: Int)
    case needsConsent
    case failed
}

/// The whole Mood + Energy Scan flow in one view, so the Mood Orb is a single element that
/// moves between screens (never a cut) and stays reactive to what's being scanned.
///
/// Drop it in as a full-screen cover / route. Pass the scan-background loop URLs (day + night)
/// and the three orb-loop URLs the app already bundles/streams, plus the user's coin balance.
@available(iOS 17.0, *)
public struct ScanFlowView: View {
    public enum Phase: Equatable { case start, pulse, feel, words, result, eStart, eScan, eResult }

    // Background + orb loops (from the visuals bucket). Night variants optional.
    public var moodBg: URL
    public var moodBgNight: URL?
    public var energyBg: URL
    public var energyBgNight: URL?
    public var isNight: Bool
    public var host: ScanHost

    @State private var phase: Phase
    @State private var reading = MoodReading()
    @State private var progress = 0.0          // 0…1 within pulse / eScan
    @State private var coins: Int
    @State private var saveHealth = true
    @State private var words = ""
    @State private var elapsed = 0.0
    @State private var showWalkthrough = false
    /// Real fingertip pulse read (back camera + flash). Nothing is recorded or uploaded.
    @State private var pulse = CameraPulseReader()
    /// Coins the server awarded for this check-in (nil until it answers).
    @State private var coinsAwarded: Int?
    /// The server needs the person's OK to store mood check-ins before it can save this one.
    @State private var needsConsent = false
    /// Seconds into the current pulse read, including time without a finger (for the fallback).
    @State private var pulseWait = 0.0
    /// 0…1: the orb swells and glows while the mood is changing (sliders, word, new pulse),
    /// then springs back and calms once it stops. Like the Soundscapes Mood Field orb.
    @State private var surge = 0.0
    @State private var surgeToken = 0

    /// First-run tour shows once per install. Pass `showWalkthroughAlways` to replay it (e.g. a
    /// "Show tour" button, or UI tests).
    @AppStorage("escape.seenScanWalkthrough") private var seenWalkthrough = false
    public var showWalkthroughAlways = false

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    private let tick = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    public init(startAt phase: Phase = .start, coins: Int = 0,
                moodBg: URL, moodBgNight: URL? = nil, energyBg: URL, energyBgNight: URL? = nil,
                isNight: Bool = false, host: ScanHost = ScanHost()) {
        _phase = State(initialValue: phase); _coins = State(initialValue: coins)
        self.moodBg = moodBg; self.moodBgNight = moodBgNight
        self.energyBg = energyBg; self.energyBgNight = energyBgNight
        self.isNight = isNight; self.host = host
    }

    private var level: CoinLevel { CoinLevel(coins: coins) }
    private var isEnergy: Bool { phase == .eScan || phase == .eResult }
    private var showMoodBg: Bool { !(phase == .eScan || phase == .eResult) }

    public var body: some View {
        GeometryReader { geo in
            let W = geo.size.width, H = geo.size.height
            ZStack {
                Esc.night.ignoresSafeArea()

                // Backgrounds crossfade; the orb and body draw on top so they stay reactive.
                background(url: nightAware(moodBg, moodBgNight))
                    .opacity(showMoodBg ? (phase == .eStart ? 0.4 : 1) : 0)
                background(url: nightAware(energyBg, energyBgNight))
                    .opacity(phase.rawGroup == .energy ? 1 : 0)

                // Reading scrim over the backgrounds only, so the buttons and text stay bright.
                Color.clear.scrim(showMoodBg || isEnergy)

                bodyOutline(W: W, H: H)

                // THE hero orb — one instance, positioned per phase.
                let f = orbFrame(W: W, H: H)
                MoodOrbView(reading: reading, beatStrength: beatStrength,
                            recolorStrength: orbRecolorStrength, surge: surge)
                    .frame(width: f.size, height: f.size)
                    .scaleEffect(breathScale * moodScale * (1 + 0.12 * CGFloat(surge)))
                    .animation(.easeInOut(duration: 0.5), value: moodScale)
                    .opacity(f.opacity)
                    .blur(radius: f.blur)
                    .position(x: W / 2 + f.dx, y: f.cy)
                    .allowsHitTesting(false)
                    .animation(.spring(response: 0.9, dampingFraction: 0.82), value: phase)

                energyDots(W: W, H: H)

                chrome(W: W, H: H)

                if showWalkthrough {
                    ScanWalkthrough { withAnimation { showWalkthrough = false }; seenWalkthrough = true }
                        .zIndex(10)
                }
            }
        }
        .preferredColorScheme(.dark)
        .environment(\.colorScheme, .dark)
        .onReceive(tick) { _ in advance() }
        .onAppear { if showWalkthroughAlways || !seenWalkthrough { showWalkthrough = true } }
        .onDisappear { pulse.stop() }
        .onChange(of: reading.energy) { _, _ in moodChanged() }
        .onChange(of: reading.valence) { _, _ in moodChanged() }
        .onChange(of: reading.chosenWord) { _, _ in moodChanged() }
        .onChange(of: reading.bpm) { _, _ in if reading.pulseMeasured { moodChanged() } }
        .task {
            if let load = host.loadCoins, let c = await load() { coins = c }
        }
    }

    // MARK: Timing

    private func advance() {
        // Runs with Reduce Motion too: the timers and pulse read must still progress; only the
        // orb's drift and breathing are switched off (see orbFrame / breathScale).
        elapsed += 0.1
        switch phase {
        case .pulse:
            pulseWait += 0.1
            // Count down only while a fingertip is on the lens; ~15 s of clean signal.
            if pulse.status == .reading { progress = min(1, progress + 0.1 / 15) }
            if let bpm = pulse.bpm {
                // The orb now beats with the measured heart, and its energy starts from it.
                if !reading.pulseMeasured { reading.energy = MoodReading.energy(fromPulse: bpm) }
                reading.bpm = bpm
                reading.pulseMeasured = true
            }
            if progress >= 1 && reading.pulseMeasured { go(.feel) }
            // No usable signal after 45 s: move on without a pulse rather than guess one.
            if pulseWait > 45 { go(.feel) }
        case .eScan:
            progress += 0.1 / 20                                   // 20 s body scan
            if progress >= 1.05 { go(.eResult) }
        default: break
        }
    }

    private func go(_ p: Phase) {
        host.haptic(true)
        if p == .pulse {
            reading.pulseMeasured = false
            pulseWait = 0
            Task { await pulse.start() }
        } else {
            pulse.stop()
        }
        withAnimation(.spring(response: 0.9, dampingFraction: 0.82)) { phase = p }
        progress = 0; elapsed = 0
        if p == .eResult {
            let centers = EnergyCenters.from(reading)
            if let low = centers.min(by: { $0.energy < $1.energy }),
               let high = centers.max(by: { $0.energy < $1.energy }) {
                let short = { (c: EnergyCenter) in c.name.replacingOccurrences(of: " Energy Center", with: "") }
                SoundscapesBetaBridge.remember(
                    "Did an Energy Scan: \(short(high)) was strongest (\(high.energy)%), \(short(low)) needed the most care (\(low.energy)%).",
                    kind: "energy_scan", tags: [short(low).lowercased()])
            }
        }
        if p == .result {
            coinsAwarded = nil; needsConsent = false
            if host.submitCheckIn != nil { submitResult() } else { host.saveCheckIn(reading, words) }
        }
    }

    private func submitResult() {
        guard let submit = host.submitCheckIn else { return }
        let r = reading, w = words
        Task {
            switch await submit(r, w) {
            case .saved(let got): coinsAwarded = got; coins += got; needsConsent = false
            case .needsConsent: needsConsent = true
            case .failed: break
            }
        }
    }

    /// "Allow & save" on the result: record consent, then save the same scan again.
    private func allowAndSave() {
        guard let grant = host.grantMoodConsent else { return }
        Task { if await grant() { submitResult() } }
    }

    /// The mood moved: flare the orb, then let it calm back down once the change stops.
    /// Holding a slider keeps it raised; letting go lets it settle.
    private func moodChanged() {
        guard !reduceMotion else { return }
        surgeToken += 1
        let token = surgeToken
        if surge < 0.99 { withAnimation(.easeOut(duration: 0.25)) { surge = 1 } }
        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(350))
            guard token == surgeToken else { return }
            withAnimation(.spring(response: 1.6, dampingFraction: 0.62)) { surge = 0 }
        }
    }

    /// Guided breathing on the orb during the pulse read: ~5.5 breaths a minute (4.5 s in,
    /// 6.5 s out), the slow pace linked to a calmer heart rhythm. Matches "In as it grows".
    /// While the person tunes their mood the orb keeps a softer idle breath: slow and deep
    /// when energy is low, quicker and shallower when it's high.
    private var breathScale: CGFloat {
        guard !reduceMotion else { return 1 }
        switch phase {
        case .pulse:
            let cycle = 11.0, inhale = 4.5
            let t = elapsed.truncatingRemainder(dividingBy: cycle)
            let x = t < inhale ? t / inhale : 1 - (t - inhale) / (cycle - inhale)
            let eased = 0.5 - 0.5 * cos(x * .pi)
            return 0.9 + 0.18 * CGFloat(eased)
        case .feel, .words, .result:
            let cycle = 9.0 - 4.0 * reading.energy
            let x = elapsed.truncatingRemainder(dividingBy: cycle) / cycle
            return 1 + CGFloat(0.03 * sin(x * 2 * .pi))
        default:
            return 1
        }
    }

    /// The orb grows with energy once the person is tuning their mood: drained is smaller and
    /// still, charged is bigger.
    private var moodScale: CGFloat {
        switch phase {
        case .feel, .words, .result: return 0.92 + 0.14 * CGFloat(reading.energy)
        default: return 1
        }
    }

    private var beatStrength: Double {
        switch phase { case .pulse: return 1; case .eScan: return 0.9; case .result, .eResult: return 0.3; default: return 0.4 }
    }

    /// Start with the same blue-purple Escape orb used by Soundscapes, then
    /// let the scan recolour it as the person tunes and confirms their mood.
    private var orbRecolorStrength: Double {
        switch phase {
        case .start: return 0
        case .pulse: return 0.2
        case .feel, .words: return 0.75
        case .result, .eStart, .eScan, .eResult: return 1
        }
    }

    // MARK: Orb placement (hero path)

    private struct OrbFrame { var size: CGFloat; var cy: CGFloat; var dx: CGFloat; var opacity: Double; var blur: CGFloat }

    private func orbFrame(W: CGFloat, H: CGFloat) -> OrbFrame {
        let driftX = !reduceMotion && (phase == .pulse || phase == .feel || phase == .words)
            ? CGFloat(sin(elapsed) * 7 * (0.5 + reading.energy)) : 0
        switch phase {
        case .start:
            // Sit in the gap between the two-line title and the bottom panel, so the orb never
            // covers "How's your inner weather?" (TF45 feedback) on any screen height.
            let titleBottom: CGFloat = 250, panelTop = H - 330
            let gap = panelTop - titleBottom
            let size = max(140, min(210, gap - 20))
            let cy = max(titleBottom + size / 2 - 10, (titleBottom + panelTop) / 2)
            return OrbFrame(size: size, cy: cy, dx: 0, opacity: 1, blur: 0)
        case .pulse, .feel, .words:
                      return OrbFrame(size: 280, cy: H * 0.46, dx: driftX, opacity: 1, blur: 0)
        case .result: return OrbFrame(size: 168, cy: H * 0.24, dx: 0, opacity: 1, blur: 0)
        case .eStart: return OrbFrame(size: 44, cy: heartY(H), dx: 0, opacity: 1, blur: 0)
        case .eScan:  return OrbFrame(size: 24, cy: heartY(H), dx: 0, opacity: 0.9, blur: 2)
        case .eResult:return OrbFrame(size: 24, cy: heartY(H), dx: 0, opacity: 0, blur: 6)
        }
    }

    private func heartY(_ H: CGFloat) -> CGFloat { H * 0.42 }

    // MARK: Background

    private func nightAware(_ day: URL, _ night: URL?) -> URL { (isNight ? night : nil) ?? day }

    private func background(url: URL) -> some View {
        CachedLoopingVideo(url: url)
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 3), value: isNight)
            .allowsHitTesting(false)
    }

    // MARK: Body outline + energy dots (energy scan)

    @ViewBuilder private func bodyOutline(W: CGFloat, H: CGFloat) -> some View {
        if phase == .eStart || phase == .eScan {
            BodySilhouette()
                .stroke(Esc.lilac.opacity(0.5), style: StrokeStyle(lineWidth: 1.2, lineCap: .round))
                .frame(width: 260, height: 390)
                .position(x: W / 2, y: H * 0.52)
                .transition(.opacity)
            if phase == .eScan {
                Rectangle()
                    .fill(LinearGradient(colors: [.clear, Esc.lilac, .clear], startPoint: .leading, endPoint: .trailing))
                    .frame(height: 2)
                    .shadow(color: Esc.lilac.opacity(0.5), radius: 10)
                    .padding(.horizontal, 40)
                    .position(x: W / 2, y: scanLineY(H))
                    .opacity(progress < 1 ? 1 : 0)
            }
        }
    }

    private func scanLineY(_ H: CGFloat) -> CGFloat {
        let top = H * 0.34, bottom = H * 0.66
        return bottom - (bottom - top) * min(1, progress)
    }

    @ViewBuilder private func energyDots(W: CGFloat, H: CGFloat) -> some View {
        let centers = EnergyCenters.all
        if phase == .eScan || phase == .eResult {
            ForEach(Array(centers.enumerated()), id: \.element.id) { i, c in
                let bodyY = H * 0.36 + CGFloat(i) / CGFloat(centers.count - 1) * (H * 0.3)
                let lit = phase == .eResult || scanLineY(H) <= bodyY + 6
                Circle()
                    .fill(c.color)
                    .frame(width: lit ? 16 : 10, height: lit ? 16 : 10)
                    .shadow(color: lit ? c.color : .clear, radius: 12)
                    .opacity(phase == .eResult ? 0 : (lit ? 1 : 0.35))
                    .position(x: W / 2, y: bodyY)
                    .animation(.easeInOut(duration: 0.4), value: lit)
            }
        }
    }

    // MARK: Chrome per phase

    @ViewBuilder private func chrome(W: CGFloat, H: CGFloat) -> some View {
        switch phase {
        case .start:   MoodStartChrome(coins: coins, start: { go(.pulse) }, skip: { go(.feel) }, close: host.close)
        case .pulse:   MoodPulseChrome(bpm: reading.pulseMeasured ? reading.bpm : nil, status: pulse.status, wave: pulse.wave,
                                       secondsLeft: Int(ceil(15 * (1 - progress))), back: { go(.start) }, skip: { go(.feel) })
        case .feel:    MoodFeelChrome(reading: $reading, next: { go(.words) })
        case .words:   MoodWordsChrome(words: $words, next: { go(.result) })
        case .result:  MoodResultChrome(reading: reading, coins: coins, coinsAwarded: coinsAwarded, needsConsent: needsConsent,
                                        allowAndSave: { allowAndSave() }, level: level, words: words, saveHealth: $saveHealth, host: host,
                                        close: { host.close() }, unlock: { go(.eStart) })
        case .eStart:  EnergyStartChrome(level: level, back: { go(.result) }, begin: { go(.eScan) })
        case .eScan:   EnergyScanChrome(reading: reading, reveal: progress)
        case .eResult: EnergyResultChrome(reading: reading, close: { go(.start) }, host: host)
        }
    }
}

@available(iOS 17.0, *)
private extension ScanFlowView.Phase {
    enum Group { case mood, energy }
    var rawGroup: Group { (self == .eScan || self == .eResult) ? .energy : .mood }
}

// MARK: - Shared bits

/// A simple head-torso-arms-legs outline for the energy scan.
@available(iOS 17.0, *)
struct BodySilhouette: Shape {
    func path(in r: CGRect) -> Path {
        var p = Path()
        let w = r.width, h = r.height, cx = r.midX
        p.addEllipse(in: CGRect(x: cx - w * 0.11, y: h * 0.04, width: w * 0.22, height: w * 0.22))
        p.move(to: CGPoint(x: cx, y: h * 0.24))
        p.addCurve(to: CGPoint(x: cx, y: h * 0.70), control1: CGPoint(x: cx - w * 0.34, y: h * 0.34), control2: CGPoint(x: cx - w * 0.30, y: h * 0.70))
        p.move(to: CGPoint(x: cx, y: h * 0.24))
        p.addCurve(to: CGPoint(x: cx, y: h * 0.70), control1: CGPoint(x: cx + w * 0.34, y: h * 0.34), control2: CGPoint(x: cx + w * 0.30, y: h * 0.70))
        p.move(to: CGPoint(x: cx - w * 0.02, y: h * 0.70)); p.addLine(to: CGPoint(x: cx - w * 0.14, y: h))
        p.move(to: CGPoint(x: cx + w * 0.02, y: h * 0.70)); p.addLine(to: CGPoint(x: cx + w * 0.14, y: h))
        p.move(to: CGPoint(x: cx - w * 0.28, y: h * 0.30)); p.addLine(to: CGPoint(x: cx - w * 0.40, y: h * 0.58))
        p.move(to: CGPoint(x: cx + w * 0.28, y: h * 0.30)); p.addLine(to: CGPoint(x: cx + w * 0.40, y: h * 0.58))
        return p
    }
}

@available(iOS 17.0, *)
extension View {
    /// The player's reading scrim: clear to 45%, then night at the foot.
    func scrim(_ on: Bool) -> some View {
        overlay(alignment: .bottom) {
            if on {
                LinearGradient(stops: [.init(color: Esc.night.opacity(0), location: 0),
                                       .init(color: Esc.night.opacity(0), location: 0.45),
                                       .init(color: Esc.night.opacity(0.85), location: 1)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }
        }
    }
}

/// Downloads the loop once (VideoCache, like the NowPlaying backgrounds), then loops the local
/// file. Shows the poster underneath until the video is ready. Logs "[Scan]" on failure.
@available(iOS 17.0, *)
struct CachedLoopingVideo: View {
    let url: URL
    @State private var local: URL?

    private var posterURL: URL? {
        URL(string: url.absoluteString.replacingOccurrences(of: "_720_hevc.mp4", with: "_poster.webp"))
    }

    var body: some View {
        ZStack {
            Color.clear.overlay {
                AsyncImage(url: posterURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFill()
                    } else if let error = phase.error {
                        let _ = print("[Scan] poster failed: \(error.localizedDescription) \(posterURL?.absoluteString ?? "")")
                        Color.clear
                    } else {
                        Color.clear
                    }
                }
            }
            .clipped()
            if let local {
                LoopingVideoView(fileURL: local)
                    .id(local)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.8), value: local)
        .task(id: url) {
            do {
                local = try await VideoCache.shared.localURL(for: url)
                print("[Scan] background ready: \(local?.lastPathComponent ?? "")")
            } catch {
                print("[Scan] background failed: \(error) \(url.absoluteString)")
            }
        }
    }
}
