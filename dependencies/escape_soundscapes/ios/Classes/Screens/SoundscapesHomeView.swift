import SwiftUI

// Ported from screens/SoundscapesHome.tsx.
//
// Order (Figma, homeVariant .playNow): header, greeting, home tabs, Play Now, Your Inner Weather,
// Lucille's Daily Drop, Endless Soundscapes (mode orbs), Journeys, Listening Circles, Made by You,
// Blend / Focus Shield status line. The `.modes` experiment moves Play Now below the mode orbs.
// The bottom nav is drawn by RootView; the MiniPlayer floats on top of it (bottom: 72 in the TSX).

@available(iOS 17.0, *)
struct SoundscapesHomeView: View {
    @Environment(AppStore.self) private var store
    @State private var activeTab = "Now"

    /// The TSX ends with `marginBottom: 160` under the status line: room for the 72 pt nav and the
    /// floating MiniPlayer (72 pt) with breathing space. Never less than the porting-guide minimum.
    private var bottomInset: CGFloat {
        max(160, Esc.Metrics.navHeight + (store.nowPlaying != nil ? 72 : 0))
    }

    private var playNowBelowModes: Bool { store.home?.experiments.homeVariant == .modes }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                header
                greeting
                homeTabs
                if playNowBelowModes {
                    innerWeather
                    dailyDrop
                    modeOrbs
                    playNow(top: 24)
                } else {
                    playNow(top: 16)
                    innerWeather
                    dailyDrop
                    modeOrbs
                }
                journeys
                listeningCircle
                madeByYou
                statusLine
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, bottomInset)
        }
        .refreshable { await store.refreshHome() }
        .background(Esc.night.ignoresSafeArea())
        .overlay(alignment: .bottom) { miniPlayer }
        .onAppear { activeTab = "Now" }
    }

    // MARK: - Header + greeting

    private var header: some View {
        HStack(spacing: 0) {
            EscapeLogo(size: 36)
            Text("Soundscapes")
                .font(EscFont.display(18))
                .foregroundStyle(Esc.mist)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .accessibilityAddTraits(.isHeader)
            Button { store.setScreen(.lucilleCompose) } label: {
                LucilleOrb(size: 40, pulse: false)
                    .frame(width: 44, height: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .padding(.trailing, -2) // 44 pt hit area around the 40 pt orb, orb stays 24 pt from the edge
            .accessibilityLabel("Open Lucille Compose")
        }
        .padding(.horizontal, 24)
        .frame(height: 52)
    }

    private var greetingText: String {
        let phase = store.inputsNow?.phaseLabel.lowercased() ?? "afternoon"
        let part = ["morning", "afternoon", "evening"].contains(phase) ? phase : "evening"
        let name = store.home?.user.firstName ?? "Jared"
        return name.isEmpty ? "Good \(part)." : "Good \(part), \(name)."
    }

    private var greeting: some View {
        Text(greetingText)
            .font(EscFont.display(28))
            .foregroundStyle(Esc.mist)
            .lineSpacing(28 * 0.2)
            .padding(.top, 8)
            .padding(.horizontal, 24)
            .accessibilityAddTraits(.isHeader)
    }

    // MARK: - Home tabs

    private var tabs: [String] {
        if let t = store.home?.homeTabs, !t.isEmpty { return t }
        if let t = store.content?.homeTabs, !t.isEmpty { return t }
        return ["Now", "Focus", "Calm", "Sleep", "Move", "Realms"]
    }

    private var homeTabs: some View {
        SegmentedTabs(tabs: tabs, active: activeTab) { tab in
            activeTab = tab
            guard tab != "Now", let mode = ModeId(loose: tab) else { return }
            Task { await store.openBrowse(mode) }
        }
        .padding(.top, 16)
        .padding(.horizontal, 24)
    }

    // MARK: - Play Now

    private func playNow(top: CGFloat) -> some View {
        PlayNowButton(
            subtitle: store.inputsNow?.playNowSubtitle ?? "Lucille picks Focus for your afternoon",
            onPress: { Task { await store.playNow() } },
            onLongPress: { store.setScreen(.lucilleCompose) }
        )
        .padding(.top, top)
        .padding(.horizontal, 24)
    }

    // MARK: - Your Inner Weather

    private var innerWeather: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Your Inner Weather")
                .escLabel()
                .padding(.horizontal, 24)
                .padding(.bottom, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    InnerWeatherTile(label: phaseTile.label, value: phaseTile.value, icon: .sun, iconColor: Esc.ember,
                                     onPress: openInputs)
                    InnerWeatherTile(label: "Weather", value: weatherValue, icon: .cloud, iconColor: Esc.violet,
                                     onPress: openInputs)
                    InnerWeatherTile(label: "Mood", value: moodValue, icon: .mood, iconColor: Esc.lilac,
                                     onPress: openInputs)
                    InnerWeatherTile(label: "Heart", value: heartValue, icon: .heart, iconColor: Esc.ember,
                                     onPress: openInputs)
                }
                .padding(.horizontal, 24)
            }
        }
        .padding(.top, 16)
    }

    private func openInputs() { store.setSheet(.yourInputs) }

    private var phaseTile: (label: String, value: String) {
        guard let now = store.inputsNow else { return ("Afternoon", "Peak in 42 min") }
        return (now.phaseLabel, now.phaseValue)
    }

    /// "64° Drizzle · New York". Before the first load: the Figma literal; input off (nil): "Off".
    private var weatherValue: String {
        guard let now = store.inputsNow else { return "64° Drizzle · New York" }
        guard let w = now.weather else { return "Off" }
        let base = "\(w.tempF)° \(w.condition)"
        return w.city.isEmpty ? base : "\(base) · \(w.city)"
    }

    private var moodValue: String {
        guard let now = store.inputsNow else { return "Restless" }
        guard let mood = now.mood, !mood.isEmpty else { return "Off" }
        return mood
    }

    private var heartValue: String {
        guard let now = store.inputsNow else { return "72 bpm" }
        guard let bpm = now.heartBpm else { return "Off" }
        return "\(bpm) bpm"
    }

    // MARK: - Lucille's Daily Drop

    private var dailyDrop: some View {
        let drop = store.home?.dailyDrop
        return Button {
            let id = drop?.compositionId ?? "daily_drop_thu"
            Task { await store.play(compositionId: id, from: .dailyDrop) }
        } label: {
            DailyDropCard(
                label: drop?.label ?? "Lucille's Daily Drop",
                badge: drop?.badge ?? "New every morning",
                title: drop?.title ?? "Thursday Drizzle",
                subtitle: drop?.subtitle ?? "Composed at 7:02 AM for your day",
                gradient: drop?.gradient.linear ?? Esc.signature
            )
        }
        .buttonStyle(EscPressStyle())
        .accessibilityElement(children: .combine)
        .accessibilityHint("Plays today's Daily Drop")
        .padding(.top, 20)
        .padding(.horizontal, 24)
    }

    // MARK: - Endless Soundscapes (mode orbs)

    private var modeItems: [HomeModeItem] {
        if !store.modes.isEmpty {
            return store.modes.map { HomeModeItem(id: $0.id, title: $0.title, locked: store.isLocked($0.id)) }
        }
        return ModeId.allCases.map { HomeModeItem(id: $0, title: $0.title, locked: store.isLocked($0)) }
    }

    private var modeOrbs: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Endless Soundscapes")
                .escLabel()
                .padding(.bottom, 12)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(modeItems) { item in
                        ModeOrb(mode: item.id, label: item.title, active: store.currentMode == item.id,
                                locked: item.locked) { tapMode(item) }
                    }
                }
            }
        }
        .padding(.top, 24)
        .padding(.horizontal, 24)
    }

    private func tapMode(_ item: HomeModeItem) {
        if item.locked {
            store.setSheet(.premium)
        } else {
            Task { await store.play(mode: item.id) }
        }
    }

    // MARK: - Journeys

    private var journeyChips: [JourneyChip] {
        store.home?.journeyChips ?? [
            JourneyChip(id: "deep-work", title: "Deep Work", chipDuration: "50/10", mode: "focus"),
            JourneyChip(id: "exam-prep", title: "Exam Prep", chipDuration: nil, mode: "focus"),
            JourneyChip(id: "panic-reset", title: "Panic Reset", chipDuration: "5 min", mode: "calm"),
            JourneyChip(id: "power-nap", title: "Power Nap", chipDuration: "20 min", mode: "sleep"),
            JourneyChip(id: "wind-down", title: "Wind Down", chipDuration: nil, mode: "calm"),
            JourneyChip(id: "chores", title: "Chores", chipDuration: nil, mode: "move"),
            JourneyChip(id: "breath-sync", title: "Breath Sync", chipDuration: nil, mode: "calm"),
        ]
    }

    @ViewBuilder private var journeys: some View {
        let chips = journeyChips
        if !chips.isEmpty {
            VStack(alignment: .leading, spacing: 0) {
                Text("Journeys")
                    .escLabel()
                    .padding(.bottom, 12)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(chips) { chip in
                            JourneyChipView(chip) { store.openJourney(chip.id) }
                        }
                    }
                }
            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
        }
    }

    // MARK: - Listening Circles

    private var listeningCircle: some View {
        let circle = store.home?.featuredCircle
        return Button { Task { await store.openCircles() } } label: {
            FeaturedCircleCard(
                label: circle?.label ?? "Listening Circles",
                title: circle?.title ?? "Sunday Reset",
                subtitle: circle?.subtitle ?? "1,284 listening now · starts 8:00 PM",
                cta: circle?.cta ?? "Join"
            )
        }
        .buttonStyle(EscPressStyle())
        .accessibilityElement(children: .combine)
        .padding(.top, 24)
        .padding(.horizontal, 24)
    }

    // MARK: - Made by You

    private var madeItems: [MadeByYou] {
        store.home?.madeByYou ?? [
            MadeByYou(compositionId: "mine_1", title: "Cabin Rain, 11 PM", description: "Composed last night", mode: "sleep",
                      gradient: GradientSpec(colors: ["#164395", "#05081A"])),
            MadeByYou(compositionId: "mine_2", title: "Morning Clarity", description: "Your morning ritual", mode: "focus",
                      gradient: GradientSpec(colors: ["#EF7702", "#8E7CD9"])),
            MadeByYou(compositionId: "mine_3", title: "Rainy Sunday", description: "Slow afternoon", mode: "calm",
                      gradient: GradientSpec(colors: ["#39519F", "#101E43"])),
        ]
    }

    private var madeByYou: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Text("Made by You").escLabel()
                Spacer(minLength: 8)
                Button { Task { await store.openLibrary() } } label: {
                    HStack(spacing: 4) {
                        Text("All")
                            .font(EscFont.ui(13))
                            .foregroundStyle(Esc.haze)
                        Icon(.chevronRight, size: 16, color: Esc.haze)
                    }
                    .frame(minHeight: 44)
                    .contentShape(Rectangle())
                }
                .buttonStyle(EscPressStyle())
                .padding(.vertical, -14) // keep the 16 pt row height of the Figma while the hit area stays 44 pt
                .accessibilityLabel("All in Library")
            }
            .padding(.bottom, 12)
            let items = madeItems
            if !items.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(items) { item in
                            SoundscapeCard(title: item.title, description: item.description,
                                           posterGradient: item.gradient ?? .fallback) {
                                Task { await store.play(compositionId: item.compositionId, from: .library) }
                            }
                        }
                    }
                }
            }
        }
        .padding(.top, 24)
        .padding(.horizontal, 24)
    }

    // MARK: - Status line

    private var statusLine: some View {
        Text("Blend: \(store.blendOn ? "On" : "Off") · Focus Shield: \(store.focusShieldOn ? "On" : "Off")")
            .font(EscFont.ui(12))
            .foregroundStyle(Esc.haze)
            .padding(.top, 16)
            .padding(.horizontal, 24)
    }

    // MARK: - MiniPlayer

    @ViewBuilder private var miniPlayer: some View {
        if store.nowPlaying != nil {
            MiniPlayer(
                mode: store.currentMode.title,
                isPlaying: store.isPlaying,
                onPress: { store.setScreen(.nowPlaying) },
                onPlayPause: { store.togglePlay() },
                onTimer: { store.setSheet(.timer) }
            )
            .padding(.bottom, Esc.Metrics.navHeight)
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
    }
}

// MARK: - Pieces

@available(iOS 17.0, *)
private struct HomeModeItem: Identifiable {
    let id: ModeId
    let title: String
    let locked: Bool
}

/// The Daily Drop hero: data gradient under a rgba(5,8,26,0.35) veil, label + badge, title, subtitle, Play pill.
@available(iOS 17.0, *)
private struct DailyDropCard: View {
    let label: String
    let badge: String
    let title: String
    let subtitle: String
    let gradient: LinearGradient

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 8) {
                Text(label)
                    .font(EscFont.ui(11, .semibold))
                    .tracking(11 * 0.12)
                    .textCase(.uppercase)
                    .foregroundStyle(Color.white.opacity(0.7))
                    .lineLimit(1)
                Spacer(minLength: 0)
                Text(badge)
                    .font(EscFont.ui(11))
                    .foregroundStyle(Color.white.opacity(0.8))
                    .lineLimit(1)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 10)
                    .background(Color.black.opacity(0.3), in: Capsule())
            }
            .padding(.bottom, 4)
            Text(title)
                .font(EscFont.display(26))
                .foregroundStyle(Color.white)
                .padding(.bottom, 4)
            Text(subtitle)
                .font(EscFont.ui(13))
                .foregroundStyle(Color.white.opacity(0.7))
                .padding(.bottom, 16)
            playPill
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background {
            ZStack {
                gradient
                Color(hex: 0x05081A, opacity: 0.35)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }

    private var playPill: some View {
        HStack(spacing: 8) {
            Icon(.play, size: 14, color: .white)
            Text("Play")
                .font(EscFont.ui(14, .semibold))
                .foregroundStyle(Color.white)
        }
        .padding(.vertical, 11)   // 10 + 1 px border
        .padding(.horizontal, 21) // 20 + 1 px border
        .background(Color.white.opacity(0.2), in: Capsule())
        .background(.ultraThinMaterial, in: Capsule())
        .overlay(Capsule().strokeBorder(Color.white.opacity(0.3), lineWidth: 1))
    }
}

/// Listening Circles card with its "Join" pill (the whole card opens Listening Circles, as in the TSX).
@available(iOS 17.0, *)
private struct FeaturedCircleCard: View {
    let label: String
    let title: String
    let subtitle: String
    let cta: String

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 0) {
                Text(label)
                    .font(EscFont.ui(11, .semibold))
                    .tracking(11 * 0.1)
                    .textCase(.uppercase)
                    .foregroundStyle(Esc.haze)
                    .padding(.bottom, 4)
                Text(title)
                    .font(EscFont.display(18))
                    .foregroundStyle(Esc.mist)
                    .padding(.bottom, 2)
                Text(subtitle)
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.haze)
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(cta)
                .font(EscFont.ui(13, .semibold))
                .foregroundStyle(Esc.mist)
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 11.5)   // 10 + 1.5 px border
                .padding(.horizontal, 19.5) // 18 + 1.5 px border
                .background(Color(hex: 0x39519F, opacity: 0.4), in: Capsule())
                .overlay(Capsule().strokeBorder(Color(hex: 0x39519F, opacity: 0.6), lineWidth: 1.5))
        }
        .padding(17.5) // 16 + 1.5 px border
        .background(Esc.card, in: RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1.5))
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - Previews




