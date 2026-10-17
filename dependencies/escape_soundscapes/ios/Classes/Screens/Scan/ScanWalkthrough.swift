import SwiftUI

/// First-run tour for the Mood & Energy Scan. Shown once (gated by @AppStorage in ScanFlowView),
/// over a live, blurred orb so newcomers see what the scan is before they start. Frosted glass,
/// skippable, with progress dots. Ported in spirit from the Figma Make Tutorial.
@available(iOS 17.0, *)
struct ScanWalkthrough: View {
    var onDone: () -> Void
    private let steps: [Step]
    private let doneLabel: String

    @State private var step = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    /// Defaults to the Scan tour. Pass `steps` to reuse the same look for another screen's tour.
    init(steps: [Step]? = nil, doneLabel: String = "Start", onDone: @escaping () -> Void) {
        self.steps = steps ?? Self.scanSteps
        self.doneLabel = doneLabel
        self.onDone = onDone
    }

    struct Step { var eyebrow: String; var title: String; var body: String; var icon: String }

    /// First-visit tour for the Soundscapes home.
    static let homeSteps: [Step] = [
        .init(eyebrow: "Welcome", title: "Your Soundscapes",
              body: "Music and nature sound for focus, calm and sleep, tuned to how you feel today.", icon: "waveform"),
        .init(eyebrow: "Play now", title: "One tap to start",
              body: "Play Now picks the best match for your mood. Your Inner Weather and Lucille's Daily Drop sit right below it.", icon: "play.fill"),
        .init(eyebrow: "Modes", title: "Pick a mode",
              body: "Tap Focus, Calm, Sleep or Lucille Picks for an endless soundscape with its own Mood Orb.", icon: "circle.hexagongrid.fill"),
        .init(eyebrow: "Your library", title: "Keep what you love",
              body: "Save a soundscape to your Library to come back to it. Close any time to return to Escape.", icon: "heart"),
    ]

    static let scanSteps: [Step] = [
        .init(eyebrow: "Welcome", title: "Meet your Mood Orb",
              body: "This living orb is you, right now. It beats with the pulse the camera reads, breathes with you and changes colour with how you feel. Here's how the scan works, and the science behind it.", icon: "sparkles"),
        .init(eyebrow: "Step 1 · Pulse", title: "Your finger, the camera, the flash",
              body: "Lay a finger flat over the back camera and the flash. The flash shines through it, and each heartbeat pushes a little more blood into your finger, which absorbs a little more light. The camera sees that tiny change as a pulse wave. This is photoplethysmography (PPG), the same basic idea many fitness wearables use. A phone reading is an estimate: movement, finger pressure and light can throw it off. Only the average colour of each frame is used; no photo or video is kept.", icon: "heart.fill"),
        .init(eyebrow: "Why breathe slowly", title: "Breathe with the orb",
              body: "While it reads, the orb guides you to about 5 to 6 breaths a minute. Slow breathing at this pace is linked in research to a calmer heart rhythm and higher heart-rate variability, through the vagus nerve. It also steadies your hand for a cleaner reading.", icon: "wind"),
        .init(eyebrow: "Step 2 · Feel", title: "Two dials: energy and pleasantness",
              body: "Psychologists often describe moods on two dimensions: how energised you feel and how pleasant it feels (Russell's circumplex model of affect). Your pulse sets a starting point for energy; you tune both. The orb warms, speeds up and softens as you do.", icon: "slider.horizontal.3"),
        .init(eyebrow: "Step 3 · Name it", title: "Put a word to it",
              body: "Choosing a word for a feeling isn't just a label. Studies of \"affect labeling\" (Lieberman and colleagues, UCLA, 2007) found that naming an emotion can ease its intensity in the brain. Lucille then suggests a soundscape and a few small steps for that mood.", icon: "text.bubble"),
        .init(eyebrow: "Good to know", title: "Wellness, not medicine",
              body: "The Mood Scan is for self-reflection and wellbeing, not a medical device or diagnosis. Your mood check-ins are saved to your Escape history only with your OK, and you can delete them any time.", icon: "checkmark.shield"),
        .init(eyebrow: "Energy Scan", title: "Unlocks with coins",
              body: "Every 1,000 Escape Coins lifts you one energy centre, root to crown, and unlocks an Energy Scan that maps today's scan onto your seven centres.", icon: "figure.stand"),
    ]

    var body: some View {
        ZStack {
            // Dim + frost the whole app behind the tour.
            Color.black.opacity(0.4).ignoresSafeArea()
            Rectangle().fill(.ultraThinMaterial).ignoresSafeArea().opacity(0.6)

            VStack {
                Spacer()
                let s = steps[step]
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image(systemName: s.icon).font(.system(size: 20, weight: .medium)).foregroundStyle(Esc.lilac)
                            .frame(width: 44, height: 44).glass(22)
                        Spacer()
                        Button(action: onDone) { Image(systemName: "xmark").font(.system(size: 15, weight: .medium)).foregroundStyle(Esc.haze) }
                            .buttonStyle(.plain).accessibilityLabel("Skip tour")
                    }
                    HStack(spacing: 6) {
                        ForEach(steps.indices, id: \.self) { i in
                            Capsule().fill(i == step ? AnyShapeStyle(Esc.primaryGradient)
                                           : AnyShapeStyle(i < step ? Esc.lilac.opacity(0.5) : Color.white.opacity(0.2)))
                                .frame(height: 3).frame(maxWidth: .infinity)
                        }
                    }.padding(.top, 18)
                    Eyebrow(text: s.eyebrow).padding(.top, 18)
                    Text(s.title).font(EscFont.display(26)).foregroundStyle(Esc.mist).padding(.top, 6)
                    Text(s.body).font(EscFont.ui(15)).foregroundStyle(Esc.haze).lineSpacing(3).padding(.top, 8)
                    HStack {
                        Text("\(step + 1) of \(steps.count)").font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                        Spacer()
                        if step > 0 {
                            Button { withAnimation { step -= 1 } } label: {
                                Label("Back", systemImage: "chevron.left").font(EscFont.ui(14, .medium)).foregroundStyle(Esc.mist)
                                    .padding(.horizontal, 14).frame(height: 42).glass(21)
                            }.buttonStyle(.plain)
                        }
                        Button {
                            if step < steps.count - 1 { withAnimation { step += 1 } } else { onDone() }
                        } label: {
                            Text(step < steps.count - 1 ? "Next" : doneLabel)
                                .font(EscFont.ui(14, .semibold)).foregroundStyle(.white)
                                .padding(.horizontal, 20).frame(height: 42)
                                .background(Esc.primaryGradient, in: Capsule())
                        }.buttonStyle(.plain)
                    }.padding(.top, 22)
                }
                .padding(20).glass(28, strong: true).padding(.horizontal, 16).padding(.bottom, 24)
            }
        }
        .environment(\.colorScheme, .dark)   // dark frosted card: white text stays readable
        .transition(.opacity)
    }
}
