import SwiftUI

/// First-run tour for the Mood & Energy Scan. Shown once (gated by @AppStorage in ScanFlowView),
/// over a live, blurred orb so newcomers see what the scan is before they start. Frosted glass,
/// skippable, with progress dots. Ported in spirit from the Figma Make Tutorial.
@available(iOS 17.0, *)
struct ScanWalkthrough: View {
    var onDone: () -> Void

    @State private var step = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private struct Step { var eyebrow: String; var title: String; var body: String; var icon: String }
    private let steps: [Step] = [
        .init(eyebrow: "Welcome", title: "Meet your Mood Orb",
              body: "This living orb is you, right now. It changes colour, shape and rhythm with how you feel. Let's take a quick look.", icon: "sparkles"),
        .init(eyebrow: "Step 1 · Pulse", title: "Breathe with it",
              body: "The camera reads your pulse while you breathe with the orb. It beats in time with your heart. Your video never leaves your phone.", icon: "heart.fill"),
        .init(eyebrow: "Step 2 · Feel", title: "Tune how it feels",
              body: "Slide energy and pleasantness, or tap a word. The orb warms, speeds up and softens as you do, so it matches your mood.", icon: "slider.horizontal.3"),
        .init(eyebrow: "Step 3 · Lucille", title: "Get your soundscape",
              body: "Lucille names your mood and suggests a tuned soundscape and a few small things to lift it, each worth Escape Coins.", icon: "waveform"),
        .init(eyebrow: "Energy Scan", title: "Unlocks with coins",
              body: "Every 1,000 Escape Coins lifts you one energy centre, root to crown, and unlocks a full body Energy Scan.", icon: "figure.stand"),
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
                            Text(step < steps.count - 1 ? "Next" : "Start")
                                .font(EscFont.ui(14, .semibold)).foregroundStyle(.white)
                                .padding(.horizontal, 20).frame(height: 42)
                                .background(Esc.primaryGradient, in: Capsule())
                        }.buttonStyle(.plain)
                    }.padding(.top, 22)
                }
                .padding(20).glass(28, strong: true).padding(.horizontal, 16).padding(.bottom, 24)
            }
        }
        .transition(.opacity)
    }
}
