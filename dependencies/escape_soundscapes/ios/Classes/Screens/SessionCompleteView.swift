import SwiftUI

// Ported from SupportingScreens.tsx `SessionComplete`.
// Headline + subtitle → 2×2 StatTiles → "How do you feel now?" slider → Memory / Keep listening / Done
// → BetaFeedbackCard. Stats come from `store.lastResult` (POST /v1/sessions/{id}/complete), with
// `content.sessionComplete.sample` as the fallback (QuickNav "Session End" without a session).

@available(iOS 17.0, *)
struct SessionCompleteView: View {
    @Environment(AppStore.self) private var store
    @State private var moodAfter = 0.75
    @State private var seededMood = false
    @State private var feedbackSent = false

    private var copy: ContentBundle.SessionCompleteCopy? { store.content?.sessionComplete }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                titles
                    .padding(.bottom, 28)
                statTiles
                    .padding(.bottom, 24)
                moodCheck
                    .padding(.bottom, 24)
                actions
                    .padding(.bottom, 24)
                if (store.home?.betaFeedbackEnabled ?? true) && !feedbackSent {
                    BetaFeedbackCard(copy: store.content?.betaFeedback, onSend: { r, v, n in
                        Task { await store.sendBetaFeedback(calmRating: r, visual: v, note: n) }
                        withAnimation(.easeOut(duration: 0.2)) { feedbackSent = true }
                    })
                    .transition(.opacity)
                }
            }
            .padding(.horizontal, 24)
            // The Figma's 64px top spacer includes the 44px status bar, which is the safe area here.
            .padding(.top, 20)
            // 48px bottom spacer + room for the bottom nav that RootView draws.
            .padding(.bottom, 48 + Esc.Metrics.navHeight)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Esc.night.ignoresSafeArea())
        .onAppear {
            guard !seededMood else { return }
            moodAfter = copy?.moodAfterDefault ?? 0.75
            seededMood = true
        }
    }

    // MARK: Titles

    private var headline: String {
        let name = store.firstName
        let text = (copy?.headline ?? "Nice work, {firstName}.").filling(["firstName": name])
        return name.isEmpty ? text.replacingOccurrences(of: ", .", with: ".") : text
    }

    private var subtitle: String {
        (copy?.subtitleTemplate ?? "{mode} session complete.").filling(["mode": store.currentMode.title])
    }

    private var titles: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(headline)
                .font(EscFont.display(28))
                .foregroundStyle(Esc.mist)
                .accessibilityAddTraits(.isHeader)
            Text(subtitle)
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.haze)
        }
    }

    // MARK: Stats

    private struct Stats {
        var minutes: Int
        var streakDays: Int
        var shardsEarned: Int
        var moodFrom: String
        var moodTo: String
    }

    private var stats: Stats {
        let sample = copy?.sample
        let from = sample?.moodFrom ?? "Heavy"
        let to = sample?.moodTo ?? "Bright"
        if let r = store.lastResult {
            return Stats(minutes: r.minutes, streakDays: r.streakDays, shardsEarned: r.shardsEarned,
                         moodFrom: r.moodFrom ?? from, moodTo: r.moodTo ?? to)
        }
        return Stats(minutes: sample?.minutes ?? 47, streakDays: sample?.streakDays ?? 6,
                     shardsEarned: sample?.shardsEarned ?? 40, moodFrom: from, moodTo: to)
    }

    private var statTiles: some View {
        let s = stats
        return VStack(spacing: 8) {
            HStack(spacing: 8) {
                StatTile(label: "Duration", value: "\(s.minutes) min")
                StatTile(label: "Streak", value: "\(s.streakDays)", sub: s.streakDays == 1 ? "day" : "days")
            }
            .fixedSize(horizontal: false, vertical: true)
            HStack(spacing: 8) {
                StatTile(label: "Mood shift", sub: "\(s.moodFrom) to \(s.moodTo)") { moodShift }
                StatTile(label: "Realm Shards", value: "+\(s.shardsEarned)", sub: "earned today")
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }

    /// Two 18px mood dots (royal → lilac) with a display-font arrow between them.
    private var moodShift: some View {
        HStack(spacing: 8) {
            moodDot(Color(hex: 0x39519F, opacity: 0.8), Color(hex: 0x39519F, opacity: 0.3))
            Text("→")
                .font(EscFont.display(20))
                .foregroundStyle(Esc.haze)
            moodDot(Color(hex: 0xB9A3F0, opacity: 0.8), Color(hex: 0xB9A3F0, opacity: 0.3))
        }
        .accessibilityHidden(true)
    }

    private func moodDot(_ inner: Color, _ outer: Color) -> some View {
        Circle()
            .fill(RadialGradient.cssCircle([inner, outer], box: 18))
            .frame(width: 18, height: 18)
    }

    // MARK: Mood re-check

    private var moodCheck: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("How do you feel now?")
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .padding(.bottom, 10)
            MoodAfterSlider(value: $moodAfter)
            HStack {
                Text("Heavy")
                Spacer()
                Text("Bright")
            }
            .font(EscFont.ui(12))
            .foregroundStyle(Esc.haze)
            .padding(.top, 4)
            .accessibilityHidden(true)
        }
    }

    // MARK: Actions

    private func buttonTitle(_ index: Int, _ fallback: String) -> String {
        guard let buttons = copy?.buttons, buttons.indices.contains(index) else { return fallback }
        return buttons[index]
    }

    private var actions: some View {
        VStack(spacing: 10) {
            pillButton(buttonTitle(0, "Save this as a Memory"),
                       fill: Esc.card, stroke: Esc.hairline) {
                Task { await store.saveMemory() }
            }
            pillButton(buttonTitle(1, "Keep listening"),
                       fill: Color(hex: 0x39519F, opacity: 0.3), stroke: Color(hex: 0x39519F, opacity: 0.6)) {
                store.keepListening()
            }
            Button { store.doneWithSession() } label: {
                Text(buttonTitle(2, "Done"))
                    .font(EscFont.ui(15))
                    .foregroundStyle(Esc.haze)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
        }
    }

    private func pillButton(_ title: String, fill: Color, stroke: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(EscFont.ui(15, .medium))
                .foregroundStyle(Esc.mist)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(fill, in: Capsule())
                .overlay(Capsule().strokeBorder(stroke, lineWidth: 1.5))
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - Mood-after slider (`<input type="range" style={{ accentColor: "#B9A3F0" }}>`)

/// Lilac fill + thumb on a dark track, as the browser draws an accent-colored range input.
@available(iOS 17.0, *)
private struct MoodAfterSlider: View {
    @Binding var value: Double

    private let thumb: CGFloat = 16
    private let track: CGFloat = 8

    var body: some View {
        GeometryReader { geo in
            let travel = max(1, geo.size.width - thumb)
            let x = travel * CGFloat(value)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(hex: 0x3B3B3B))
                    .overlay(Capsule().strokeBorder(Color(hex: 0x8A8A8A), lineWidth: 1))
                    .frame(height: track)
                Capsule()
                    .fill(Esc.lilac)
                    .frame(width: x + thumb / 2, height: track)
                Circle()
                    .fill(Esc.lilac)
                    .frame(width: thumb, height: thumb)
                    .offset(x: x)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0).onChanged { g in
                    let raw = Double((g.location.x - thumb / 2) / travel)
                    value = min(1, max(0, (raw * 100).rounded() / 100)) // step 0.01
                }
            )
        }
        .frame(height: 22)
        .accessibilityElement()
        .accessibilityLabel("How do you feel now?")
        .accessibilityValue(value < 0.34 ? "Heavy" : value > 0.66 ? "Bright" : "In between")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment: value = min(1, value + 0.1)
            case .decrement: value = max(0, value - 0.1)
            default: break
            }
        }
    }
}

// MARK: - Previews


