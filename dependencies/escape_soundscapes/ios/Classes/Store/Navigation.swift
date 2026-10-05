import Foundation

/// Full-screen destinations. Raw values are the Figma Make screen names (store.ts `Screen`).
@available(iOS 17.0, *)
public enum Screen: String, CaseIterable, Sendable {
    case onboardingSoundscapes = "OnboardingSoundscapes"
    case soundscapesHome = "SoundscapesHome"
    case modeBrowse = "ModeBrowse"
    case nowPlaying = "NowPlaying"
    case lucilleCompose = "LucilleCompose"
    case composeGenerating = "ComposeGenerating"
    case sessionComplete = "SessionComplete"
    case library = "Library"
    case sleepSetup = "SleepSetup"
    case listeningCircles = "ListeningCircles"
    case playlist = "Playlist"
    /// Bottom-nav tabs that belong to the main Escape app (placeholders in this project).
    case hostTab = "HostTab"

    /// Screens that hide the bottom nav (App.tsx `hideNav`).
    public var hidesNav: Bool {
        [.nowPlaying, .onboardingSoundscapes, .lucilleCompose, .composeGenerating, .sleepSetup].contains(self)
    }
}

/// Bottom sheets. Raw values are the Figma Make sheet names (store.ts `Sheet`).
@available(iOS 17.0, *)
public enum Sheet: String, CaseIterable, Identifiable, Sendable {
    case moodField = "MoodField"
    case layers = "Layers"
    case journeys = "Journeys"
    case timer = "Timer"
    case moodCheckIn = "MoodCheckIn"
    case premium = "PremiumSheet"
    case yourInputs = "YourInputs"
    case permissionPrimer = "PermissionPrimer"
    case lucilleWhisper = "LucilleWhisper"
    public var id: String { rawValue }
}

/// Bottom nav tabs (BottomNavBar in shared.tsx). Only Soundscapes lives in this project.
@available(iOS 17.0, *)
public enum NavTab: String, CaseIterable, Sendable {
    // Same tabs and order as the Escape app's tab bar (lib/main.dart NavBarPage).
    // rawValue is the label and the name sent to Flutter in onExit. .soundscapes is the Sound tab.
    case home = "Home", lucille = "Lucille", explore = "Explore", soundscapes = "Sound", market = "Market"
}

/// Every entry of the prototype's QuickNav, in the same order. Used by the debug menu and UI tests.
@available(iOS 17.0, *)
public enum QuickNavItem: String, CaseIterable, Sendable {
    case onboarding = "Onboarding", home = "Home", nowPlaying = "Now Playing", compose = "Compose", generating = "Generating"
    case browse = "Browse", sleep = "Sleep", library = "Library", sessionEnd = "Session End", moodCheck = "Mood Check"
    case moodField = "Mood Field", layers = "Layers", journeys = "Journeys", timer = "Timer", whisper = "Whisper"
    case playlist = "Playlist", listeningCircles = "Listening Circles", premium = "Premium", yourInputs = "Your Inputs"
    case permission = "Permission"

    /// (screen, sheet) exactly as App.tsx QuickNav sets them. nil screen = keep the current one.
    public var destination: (screen: Screen?, sheet: Sheet?) {
        switch self {
        case .onboarding: (.onboardingSoundscapes, nil)
        case .home: (.soundscapesHome, nil)
        case .nowPlaying: (.nowPlaying, nil)
        case .compose: (.lucilleCompose, nil)
        case .generating: (.composeGenerating, nil)
        case .browse: (.modeBrowse, nil)
        case .sleep: (.sleepSetup, nil)
        case .library: (.library, nil)
        case .sessionEnd: (.sessionComplete, nil)
        case .moodCheck: (.soundscapesHome, .moodCheckIn)
        case .moodField: (.nowPlaying, .moodField)
        case .layers: (.nowPlaying, .layers)
        case .journeys: (.soundscapesHome, .journeys)
        case .timer: (.nowPlaying, .timer)
        case .whisper: (.nowPlaying, .lucilleWhisper)
        case .playlist: (.playlist, nil)
        case .listeningCircles: (.listeningCircles, nil)
        case .premium: (nil, .premium)
        case .yourInputs: (nil, .yourInputs)
        case .permission: (nil, .permissionPrimer)
        }
    }
}
