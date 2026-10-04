import SwiftUI

// Ported from SupportingScreens.tsx: SubHeader, AvatarStack, ListeningCircles.
//
// Data: `store.circles` (GET /v1/circles, loaded by `store.openCircles()`, which is how Home gets
// here). While it is nil the Figma literals are shown. "Join circle" drops the user into the live
// session at the shared offset; "Remind me" schedules a local notification through the store.

// MARK: - SubHeader (shared sub-screen header, also used by PlaylistView)

/// 52 pt header: "← Back" (60 pt wide) · centered display title · 60 pt spacer.
/// The prototype's 44 px status-bar spacer is the safe area here.
@available(iOS 17.0, *)
struct SubHeader: View {
    let title: String
    let onBack: () -> Void

    init(title: String, onBack: @escaping () -> Void) {
        self.title = title
        self.onBack = onBack
    }

    var body: some View {
        HStack(spacing: 0) {
            Button(action: onBack) {
                Text("← Back")
                    .font(EscFont.ui(15))
                    .foregroundStyle(Esc.haze)
                    .frame(width: 60, height: 44, alignment: .leading)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .accessibilityLabel("Back")

            Text(title)
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .frame(maxWidth: .infinity)
                .accessibilityAddTraits(.isHeader)

            Color.clear.frame(width: 60, height: 1)
        }
        .padding(.horizontal, 24)
        .frame(height: 52)
    }
}

// MARK: - AvatarStack

/// Overlapping 26 pt listener dots with a 2 px #18224A ring, each overlapping the previous by 8.
@available(iOS 17.0, *)
struct AvatarStack: View {
    let colors: [String]

    init(colors: [String]) {
        self.colors = colors
    }

    var body: some View {
        HStack(spacing: -8) {
            ForEach(Array(colors.enumerated()), id: \.offset) { _, c in
                Circle()
                    .fill(Color(css: c))
                    .overlay(Circle().strokeBorder(Esc.surface, lineWidth: 2))
                    .frame(width: 26, height: 26)
            }
        }
        .accessibilityHidden(true)
    }
}

// MARK: - ListeningCirclesView

@available(iOS 17.0, *)
struct ListeningCirclesView: View {
    @Environment(AppStore.self) private var store

    private var data: Circles { store.circles ?? fallback }

    var body: some View {
        VStack(spacing: 0) {
            SubHeader(title: "Listening Circles") { store.setScreen(.soundscapesHome) }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    intro
                    LiveCircleCard(live: data.live) {
                        Task { await store.joinLiveCircle() }
                    }
                    sectionLabel("Coming up")
                    upcomingList
                    footer
                }
                .padding(.top, 8)
                .padding(.horizontal, 24)
                .padding(.bottom, 96 + (store.showsMiniPlayer ? 72 : 0))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Esc.night.ignoresSafeArea())
    }

    // MARK: Pieces

    private var intro: some View {
        Text(data.intro)
            .font(EscFont.ui(14))
            .foregroundStyle(Esc.haze)
            .lineSpacing(14 * 0.5)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.bottom, 16)
    }

    private var upcomingList: some View {
        VStack(spacing: 12) {
            ForEach(data.upcoming) { u in
                UpcomingCircleRow(circle: u) {
                    Task { await store.toggleReminder(u) }
                }
            }
        }
    }

    private var footer: some View {
        Text(data.footer)
            .font(EscFont.ui(11))
            .foregroundStyle(Esc.haze)
            .lineSpacing(11 * 0.5)
            .multilineTextAlignment(.center)
            .opacity(0.6)
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 24)
    }

    private func sectionLabel(_ text: String) -> some View {
        Text(text)
            .escLabel()
            .padding(.top, 28)
            .padding(.bottom, 12)
            .accessibilityAddTraits(.isHeader)
    }

    // MARK: Figma fallback (shown until GET /v1/circles answers)

    private var fallback: Circles {
        Circles(
            intro: store.content?.circles.intro
                ?? "Listen in sync with others. Everyone hears the same live soundscape, composed by Lucille. No chat, no pressure.",
            live: Circles.Live(id: "live_1", title: "Thursday Drizzle", mode: "Calm", host: "Lucille", minutesLeft: 18, listening: 127,
                               avatarColors: ["#B9A3F0", "#EF7702", "#39519F", "#8E7CD9", "#F08A1D"], compositionId: "daily_drop_thu"),
            upcoming: Self.figmaUpcoming,
            footer: store.content?.circles.footer ?? "All circle audio is generated by Lucille, our AI companion."
        )
    }

    private static let figmaUpcoming: [Circles.Upcoming] = [
        Circles.Upcoming(id: "u1", title: "Sunday Reset", mode: "Calm", when: "Today · 6:30 PM", host: "Lucille", going: 84,
                         gradient: GradientSpec(colors: ["#39519F", "#101E43"]), reminderOn: false),
        Circles.Upcoming(id: "u2", title: "Deep Work Hour", mode: "Focus", when: "Tomorrow · 9:00 AM", host: "Lucille", going: 212,
                         gradient: GradientSpec(colors: ["#EF7702", "#8E7CD9"]), reminderOn: true),
        Circles.Upcoming(id: "u3", title: "Rain for Sleep", mode: "Sleep", when: "Tomorrow · 10:30 PM", host: "Lucille", going: 341,
                         gradient: GradientSpec(colors: ["#164395", "#05081A"]), reminderOn: false),
    ]
}

// MARK: - Live card

@available(iOS 17.0, *)
private struct LiveCircleCard: View {
    let live: Circles.Live
    let onJoin: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            VStack(alignment: .leading, spacing: 6) {
                Text(live.title)
                    .font(EscFont.display(28))
                    .foregroundStyle(Esc.mist)
                    .fixedSize(horizontal: false, vertical: true)
                Text("\(live.mode) · Hosted by \(live.host) · \(live.minutesLeft) min left")
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.haze)
            }
            HStack(spacing: 12) {
                AvatarStack(colors: live.avatarColors)
                Text("\(live.listening) listening")
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.mist)
            }
            PrimaryButton(label: "Join circle", onPress: onJoin)
                .accessibilityHint("Joins \(live.title), live now")
        }
        .padding(21) // 20 px + 1 px border (border-box)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(cardFill, in: .rect(cornerRadius: 24))
        .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.28), lineWidth: 1))
    }

    /// linear-gradient(160deg, rgba(142,124,217,0.35) 0%, rgba(24,34,74,0.9) 55%, rgba(16,30,67,0.95) 100%)
    private var cardFill: LinearGradient {
        LinearGradient.css(160, [Color(hex: 0x8E7CD9, opacity: 0.35), Color(hex: 0x18224A, opacity: 0.9), Color(hex: 0x101E43, opacity: 0.95)],
                           stops: [0, 0.55, 1])
    }

    private var header: some View {
        HStack(spacing: 8) {
            LiveDot()
            Text("LIVE NOW")
                .font(EscFont.ui(11, .bold))
                .tracking(11 * 0.12)
                .foregroundStyle(Esc.ember2)
            Spacer(minLength: 0)
            AITagPill(label: "AI-composed")
        }
    }
}

/// 8 pt ember dot with a 10 px glow, breathing on a 2 s cycle (CSS `breathe 2s ease-in-out infinite`).
@available(iOS 17.0, *)
private struct LiveDot: View {
    @State private var on = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        Circle()
            .fill(Esc.ember)
            .frame(width: 8, height: 8)
            .shadow(color: Esc.ember, radius: 5)
            .scaleEffect(on ? 1.08 : 1)
            .opacity(reduceMotion ? 1 : (on ? 1 : 0.6))
            .onAppear {
                guard !reduceMotion else { return }
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) { on = true }
            }
            .accessibilityHidden(true)
    }
}

// MARK: - Upcoming row

@available(iOS 17.0, *)
private struct UpcomingCircleRow: View {
    let circle: Circles.Upcoming
    let onRemind: () -> Void

    private var on: Bool { circle.reminderOn ?? false }

    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 14)
                .fill(circle.gradient.linear)
                .frame(width: 52, height: 52)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 0) {
                Text(circle.title)
                    .font(EscFont.ui(15, .medium))
                    .foregroundStyle(Esc.mist)
                    .padding(.bottom, 2)
                Text(circle.when)
                    .font(EscFont.ui(12))
                    .foregroundStyle(Esc.haze)
                Text("\(circle.mode) · \(circle.going) going")
                    .font(EscFont.ui(11))
                    .foregroundStyle(Esc.haze)
                    .opacity(0.7)
                    .padding(.top, 2)
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityElement(children: .combine)
            remindButton
        }
        .padding(15) // 14 px + 1 px border
        .background(Color(hex: 0x18224A, opacity: 0.7), in: .rect(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.08), lineWidth: 1))
    }

    private var remindButton: some View {
        Button(action: onRemind) {
            Text(on ? "Reminder set" : "Remind me")
                .font(EscFont.ui(12, .semibold))
                .foregroundStyle(on ? Esc.lilac : Esc.mist)
                .lineLimit(1)
                .padding(.vertical, 9)
                .padding(.horizontal, 15)
                .background(on ? Color(hex: 0xB9A3F0, opacity: 0.18) : Color.clear, in: Capsule())
                .overlay(Capsule().strokeBorder(on ? Color(hex: 0xB9A3F0, opacity: 0.5) : Color(hex: 0xE6EAF4, opacity: 0.2), lineWidth: 1))
                .contentShape(Capsule().inset(by: -6))
                .fixedSize()
        }
        .buttonStyle(EscPressStyle())
        .animation(.cssEase(0.2), value: on)
        .accessibilityLabel(on ? "Reminder set for \(circle.title)" : "Remind me about \(circle.title)")
        .accessibilityValue(on ? "On" : "Off")
    }
}

// MARK: - AI tag (`aiTag` in the TSX)

@available(iOS 17.0, *)
private struct AITagPill: View {
    let label: String

    var body: some View {
        Text(label)
            .font(EscFont.ui(10, .semibold))
            .tracking(10 * 0.06)
            .foregroundStyle(Esc.lilac)
            .padding(.vertical, 3)
            .padding(.horizontal, 9)
            .background(Color(hex: 0xB9A3F0, opacity: 0.14), in: Capsule())
            .overlay(Capsule().strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.28), lineWidth: 1))
            .fixedSize()
    }
}

// MARK: - Previews




