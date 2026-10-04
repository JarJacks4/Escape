import SwiftUI

// Ported from screens/OnboardingSoundscapes.tsx.
//
// Three slides (store.content.onboarding), the breathing HeadProfile art (Image("head-profile", bundle: .soundscapes), the
// same SVG as the TSX component), page dots, "Continue" then "Start listening". Skip and Start both
// finish onboarding. No permission prompts here (they come later from Your Inputs).

@available(iOS 17.0, *)
struct OnboardingSoundscapesView: View {
    @Environment(AppStore.self) private var store
    @State private var slide = 0

    private static let figmaSlides: [ContentBundle.Slide] = [
        .init(title: "Sound that meets your mood",
              body: "Every soundscape adapts to how you feel right now — not just what you put on."),
        .init(title: "Lucille composes it for you, live",
              body: "Your AI companion creates each soundscape in real time. No two sessions are the same."),
        .init(title: "Tuned to your time, weather and heartbeat",
              body: "Lucille listens to your inner weather and shapes the sound around it."),
    ]

    private var slides: [ContentBundle.Slide] {
        if let s = store.content?.onboarding, !s.isEmpty { return s }
        return Self.figmaSlides
    }

    private var index: Int { min(max(slide, 0), slides.count - 1) }
    private var isLast: Bool { index >= slides.count - 1 }

    var body: some View {
        VStack(spacing: 0) {
            skipRow
            illustration
            dots
            cta
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // The Figma's bottom 48 px is measured from the bottom of the phone (home-indicator area included).
        .ignoresSafeArea(edges: .bottom)
        .background(alignment: .top) { ambientGlow }
        .background(Esc.night.ignoresSafeArea())
    }

    // MARK: - Pieces

    /// radial-gradient(circle, rgba(185,163,240,0.08), transparent 70%), 400 × 400 at top -100, centred.
    private var ambientGlow: some View {
        Circle()
            .fill(RadialGradient.cssCircle([Esc.lilac.opacity(0.08), .clear], stops: [0, 0.7], box: 400))
            .frame(width: 400, height: 400)
            .offset(y: -100)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
            .allowsHitTesting(false)
            .accessibilityHidden(true)
    }

    private var skipRow: some View {
        HStack {
            Spacer()
            Button { store.finishOnboarding() } label: {
                Text("Skip")
                    .font(EscFont.ui(15))
                    .foregroundStyle(Esc.haze)
                    .padding(.vertical, 8)
                    .frame(minWidth: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .padding(.trailing, -6) // the 44 pt hit area overhangs; the text keeps its 24 pt inset
            .accessibilityHint("Skips the introduction")
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }

    private var illustration: some View {
        let current = slides[index]
        return VStack(spacing: 0) {
            Image("head-profile", bundle: .soundscapes)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .breathe()
                .padding(.bottom, 32)
                .accessibilityHidden(true)
            Text(current.title)
                .font(EscFont.display(28))
                .foregroundStyle(Esc.mist)
                .multilineTextAlignment(.center)
                .lineSpacing(28 * 0.25)
                .padding(.bottom, 16)
                .accessibilityAddTraits(.isHeader)
            Text(current.body)
                .font(EscFont.ui(16))
                .foregroundStyle(Esc.haze)
                .multilineTextAlignment(.center)
                .lineSpacing(16 * 0.6)
                .frame(maxWidth: 300)
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var dots: some View {
        HStack(spacing: 8) {
            ForEach(slides.indices, id: \.self) { i in
                Button { slide = i } label: {
                    Capsule()
                        .fill(i == index ? Esc.lilac : Color(hex: 0xB9A3F0, opacity: 0.25))
                        .frame(width: i == index ? 20 : 6, height: 6)
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                }
                .buttonStyle(EscPressStyle(pressedOpacity: 1))
                .accessibilityLabel("Slide \(i + 1)")
                .accessibilityAddTraits(i == index ? .isSelected : [])
            }
        }
        .animation(.easeOut(duration: 0.2), value: index)
        .padding(.top, -8)
        .padding(.bottom, 24 - 8) // 24 pt in the Figma, minus the dots' enlarged hit area
        .frame(maxWidth: .infinity)
    }

    private var cta: some View {
        Group {
            if isLast {
                PrimaryButton(label: "Start listening") { store.finishOnboarding() }
            } else {
                Button { slide = index + 1 } label: {
                    Text("Continue")
                        .font(EscFont.ui(16, .semibold))
                        .foregroundStyle(Esc.mist)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color(hex: 0x39519F, opacity: 0.4), in: Capsule())
                        .overlay(Capsule().strokeBorder(Color(hex: 0x39519F, opacity: 0.6), lineWidth: 1.5))
                        .contentShape(Capsule())
                }
                .buttonStyle(EscPressStyle())
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 48)
    }
}

// MARK: - Previews


