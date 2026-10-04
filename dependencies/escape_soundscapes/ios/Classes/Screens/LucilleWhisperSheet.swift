import SwiftUI

// Ported from LucilleWhisperSheet.tsx.
//
// Enabled + topic come from store.preferences.whisper (content.whisper defaults before bootstrap).
// Taps update a local override at once and persist through store.setWhisper(enabled:/topic:).

@available(iOS 17.0, *)
struct LucilleWhisperSheet: View {
    @Environment(AppStore.self) private var store
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var localEnabled: Bool?
    @State private var localTopic: String?

    private var copy: ContentBundle.WhisperCopy? { store.content?.whisper }

    private var enabled: Bool {
        localEnabled ?? store.preferences?.whisper.enabled ?? copy?.enabled ?? false
    }

    private var selectedTopic: String {
        localTopic ?? store.preferences?.whisper.selectedTopic ?? copy?.selectedTopic ?? "affirmations"
    }

    private var topics: [WhisperTopic] {
        if let t = copy?.topics, !t.isEmpty { return t }
        return [
            WhisperTopic(id: "focus", label: "Focus Guidance", description: "Gentle prompts to keep you on task."),
            WhisperTopic(id: "affirmations", label: "Affirmations", description: "Positive thoughts spoken softly."),
            WhisperTopic(id: "breathing", label: "Breathing Cues", description: "Inhale and exhale pacing."),
            WhisperTopic(id: "sleep", label: "Sleep Story", description: "A calming narrative to drift off."),
        ]
    }

    private var title: String {
        enabled ? (copy?.onTitle ?? "Lucille is whispering...") : (copy?.offTitle ?? "Voice disabled")
    }

    private var bodyCopy: String {
        enabled
            ? (copy?.onBody ?? "An AI-guided voice layer that softly blends into your soundscape.")
            : (copy?.offBody ?? "Turn on Lucille Whisper to add a gentle, guided voice layer.")
    }

    var body: some View {
        BottomSheet(title: "Lucille Whisper", onClose: { store.closeSheet() }) {
            VStack(spacing: 24) {
                centralVisual
                textBlock
                toggleCard
                if enabled {
                    topicList
                        .transition(.opacity)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
            .frame(maxWidth: .infinity)
            .background(alignment: .top) {
                // The TSX blurs sit in the whole panel (inset 0, overflow hidden): extend up behind the
                // handle + title (~72 pt) and down under the home indicator, clipped to the panel shape.
                WhisperGlow()
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 28, topTrailingRadius: 28, style: .circular))
                    .padding(.top, -72)
                    .padding(.bottom, -34)
            }
        }
    }

    // MARK: Pieces

    private var centralVisual: some View {
        ZStack {
            if enabled {
                WhisperHalo()
                    .transition(.opacity)
            }
            LucilleOrb(size: enabled ? 100 : 80)
        }
        .frame(width: 140, height: 140)
        .padding(.vertical, 8)
        .accessibilityHidden(true)
    }

    private var textBlock: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist)
                .accessibilityAddTraits(.isHeader)
            Text(bodyCopy)
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .lineSpacing(4.5)
                .frame(maxWidth: 280)
                .fixedSize(horizontal: false, vertical: true)
        }
        .multilineTextAlignment(.center)
        .padding(.bottom, 8)
    }

    private var toggleCard: some View {
        HStack(spacing: 12) {
            Text("Enable Whisper")
                .font(EscFont.ui(16, .medium))
                .foregroundStyle(Esc.mist)
            Spacer(minLength: 0)
            EscToggle(on: enabled) { toggleEnabled() }
                .accessibilityLabel("Enable Whisper")
        }
        .padding(17) // 16 + 1 border
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .shadow(color: Color.black.opacity(0.1), radius: 12, y: 4)
        }
        .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color.white.opacity(0.1), lineWidth: 1))
    }

    private var topicList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Whisper Topic")
                .font(EscFont.ui(12, .semibold))
                .tracking(12 * 0.1)
                .textCase(.uppercase)
                .foregroundStyle(Esc.haze)
                .padding(.bottom, 4)
                .accessibilityAddTraits(.isHeader)
            ForEach(topics) { topic in
                topicButton(topic)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
    }

    private func topicButton(_ topic: WhisperTopic) -> some View {
        let selected = topic.id == selectedTopic
        return Button { selectTopic(topic.id) } label: {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    Text(topic.label)
                        .font(EscFont.ui(15, .medium))
                        .foregroundStyle(selected ? Esc.mist : Esc.haze)
                    Spacer(minLength: 0)
                    if selected {
                        Circle()
                            .fill(Esc.lilac)
                            .frame(width: 8, height: 8)
                    }
                }
                Text(topic.description)
                    .font(EscFont.ui(13))
                    .foregroundStyle(Color(hex: 0xA9B3D6, opacity: 0.7))
            }
            .multilineTextAlignment(.leading)
            .padding(.vertical, 15)   // 14 + 1 border
            .padding(.horizontal, 17) // 16 + 1 border
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(selected ? Color(hex: 0xB9A3F0, opacity: 0.15) : Color.white.opacity(0.03),
                        in: RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16)
                .strokeBorder(selected ? Color(hex: 0xB9A3F0, opacity: 0.4) : Color.white.opacity(0.08), lineWidth: 1))
            .contentShape(RoundedRectangle(cornerRadius: 16))
            .animation(.easeOut(duration: 0.2), value: selected)
        }
        .buttonStyle(EscPressStyle())
        .accessibilityAddTraits(selected ? .isSelected : [])
    }

    // MARK: Actions

    private func toggleEnabled() {
        let next = !enabled
        withAnimation(reduceMotion ? nil : .easeOut(duration: 0.28)) { localEnabled = next }
        store.setWhisper(enabled: next)
    }

    private func selectTopic(_ id: String) {
        localTopic = id
        store.setWhisper(topic: id)
    }
}

// MARK: - Halo (`pulse-slow`: 4 s ease-in-out alternate, scale .9 → 1.1, opacity .5 → .8)

@available(iOS 17.0, *)
private struct WhisperHalo: View {
    @State private var on = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        Circle()
            .fill(RadialGradient.cssCircle([Color(hex: 0xB9A3F0, opacity: 0.4), Color(hex: 0xB9A3F0, opacity: 0)],
                                           stops: [0, 0.7], box: 180))
            .frame(width: 180, height: 180)
            .scaleEffect(reduceMotion ? 1 : (on ? 1.1 : 0.9))
            .opacity(reduceMotion ? 0.65 : (on ? 0.8 : 0.5))
            .onAppear {
                guard !reduceMotion else { return }
                withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) { on = true }
            }
            .allowsHitTesting(false)
    }
}

// MARK: - Background blurs

@available(iOS 17.0, *)
private struct WhisperGlow: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(RadialGradient.cssCircle([Color(hex: 0xB9A3F0, opacity: 0.2), Color(hex: 0xB9A3F0, opacity: 0)],
                                               stops: [0, 0.7], box: 300))
                .frame(width: 300, height: 300)
                .blur(radius: 40)
                .offset(x: -50, y: -100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            Circle()
                .fill(RadialGradient.cssCircle([Color(hex: 0xFF8C69, opacity: 0.1), Color(hex: 0xFF8C69, opacity: 0)],
                                               stops: [0, 0.7], box: 250))
                .frame(width: 250, height: 250)
                .blur(radius: 50)
                .offset(x: 100, y: -100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

// MARK: - Previews


