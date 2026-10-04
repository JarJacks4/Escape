import SwiftUI

/// App.tsx `ScreenContent`: the current screen, the bottom nav, and the sheet overlay.
@available(iOS 17.0, *)
struct RootView: View {
    @Environment(AppStore.self) private var store
    var showQuickNav = false
    @State private var quickNavOpen = false

    var body: some View {
        ZStack {
            (store.isSleepUI && store.screen == .nowPlaying ? Esc.sleepNight : Esc.night).ignoresSafeArea()

            screen
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.opacity)
                .id(store.screen)

        }
        // Nav is an overlay (not a safe-area inset): screens reserve 72 pt for it themselves,
        // exactly like the absolutely-positioned nav in App.tsx.
        .overlay(alignment: .bottom) {
            if store.showsBottomNav {
                BottomNavBar(activeTab: store.screen == .hostTab ? store.hostTab : .soundscapes) { store.selectTab($0) }
            }
        }
        // Sheets cover everything, nav included (App.tsx zIndex 100).
        .overlay {
            if let sheet = store.sheet {
                sheetView(sheet).transition(.opacity)
            }
        }
        .overlay {
            if let message = store.toast {
                ToastView(message: message) { store.toast = nil }
            }
        }
        .overlay(alignment: .topTrailing) {
            if showQuickNav { quickNavButton }
        }
        .animation(.easeOut(duration: 0.2), value: store.screen)
        .animation(.easeOut(duration: 0.2), value: store.sheet)
        .task { await store.bootstrap() }
        .sheet(isPresented: $quickNavOpen) { QuickNavMenu().environment(store).presentationDetents([.medium, .large]) }
    }

    @ViewBuilder private var screen: some View {
        switch store.screen {
        case .onboardingSoundscapes: OnboardingSoundscapesView()
        case .soundscapesHome: SoundscapesHomeView()
        case .modeBrowse: ModeBrowseView()
        case .nowPlaying: NowPlayingView()
        case .lucilleCompose: LucilleComposeView()
        case .composeGenerating: ComposeGeneratingView()
        case .sessionComplete: SessionCompleteView()
        case .library: LibraryView()
        case .sleepSetup: SleepSetupView()
        case .listeningCircles: ListeningCirclesView()
        case .playlist: PlaylistView()
        case .hostTab: HostTabPlaceholderView(tab: store.hostTab)
        }
    }

    @ViewBuilder private func sheetView(_ sheet: Sheet) -> some View {
        switch sheet {
        case .moodField: MoodFieldSheet()
        case .layers: LayersSheet()
        case .journeys: JourneysSheet()
        case .timer: TimerSheet()
        case .moodCheckIn: MoodCheckInSheet()
        case .premium: PremiumSheet()
        case .yourInputs: YourInputsSheet()
        case .permissionPrimer: PermissionPrimerSheet()
        case .lucilleWhisper: LucilleWhisperSheet()
        }
    }

    /// Debug builds only: the prototype's QuickNav row, as a menu (hidden with -noQuickNav).
    private var quickNavButton: some View {
        Button { quickNavOpen = true } label: {
            Image(systemName: "square.grid.2x2")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(Esc.haze)
                .frame(width: 32, height: 32)
                .background(Esc.card, in: Circle())
                .overlay(Circle().stroke(Esc.hairline, lineWidth: 1))
        }
        .padding(.trailing, 8)
        .padding(.top, 2)
        .accessibilityLabel("Prototype screens")
        .accessibilityIdentifier("quickNav")
    }
}

/// The prototype's QuickNav buttons (App.tsx), one row per Figma screen or sheet.
@available(iOS 17.0, *)
struct QuickNavMenu: View {
    @Environment(AppStore.self) private var store
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List(QuickNavItem.allCases, id: \.self) { item in
                Button(item.rawValue) {
                    store.quickNav(item)
                    dismiss()
                }
                .accessibilityIdentifier("quickNav.\(item.rawValue)")
            }
            .navigationTitle("Figma screens")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

/// Toast for `store.toast`. Disappears after 2.5 s.
@available(iOS 17.0, *)
struct ToastView: View {
    let message: String
    let onDone: () -> Void

    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .font(EscFont.ui(14, .medium))
                .foregroundStyle(Esc.mist)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(Color(hex: 0x212C5A, opacity: 0.95), in: Capsule())
                .overlay(Capsule().stroke(Esc.hairline, lineWidth: 1))
                .padding(.bottom, 96)
                .transition(.move(edge: .bottom).combined(with: .opacity))
        }
        .allowsHitTesting(false)
        .accessibilityAddTraits(.isStaticText)
        .task(id: message) {
            UIAccessibility.post(notification: .announcement, argument: message)
            try? await Task.sleep(nanoseconds: 2_500_000_000)
            onDone()
        }
    }
}

/// Home, Realms, Lucille and Profile belong to the main Escape app. When the Soundscapes
/// tab is embedded there, these tabs are the app's own screens.
@available(iOS 17.0, *)
struct HostTabPlaceholderView: View {
    let tab: NavTab

    var body: some View {
        VStack(spacing: 16) {
            EscapeLogo(size: 56)
            Text(tab.rawValue)
                .font(EscFont.display(28))
                .foregroundStyle(Esc.mist)
            Text("This tab lives in the main Escape app.\nSoundscapes is the tab this project builds.")
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Esc.night.ignoresSafeArea())
    }
}


