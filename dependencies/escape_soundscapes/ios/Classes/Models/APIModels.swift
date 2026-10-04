import Foundation

// Codable mirror of shared/openapi.yaml. Foundation only (no SwiftUI) so it type-checks
// anywhere and the Objective-C layer can reuse the same JSON.
//
// Dates stay ISO-8601 strings: the API sends fractional seconds, which
// JSONDecoder's .iso8601 strategy rejects. Use `Date.fromISO(_:)` when you need a Date.

// MARK: - Modes

@available(iOS 17.0, *)
public enum ModeId: String, Codable, CaseIterable, Identifiable, Sendable {
    case picks, focus, calm, sleep, move, noise, realms
    public var id: String { rawValue }

    /// Title used on mode orbs and headers (matches the Figma).
    public var title: String {
        switch self {
        case .picks: "Lucille Picks"
        case .focus: "Focus"
        case .calm: "Calm"
        case .sleep: "Sleep"
        case .move: "Move"
        case .noise: "Noise"
        case .realms: "Realms"
        }
    }

    public var shortTitle: String { self == .picks ? "Picks" : title }

    /// Free in the beta; the rest need Premium.
    public var isFree: Bool { [.picks, .focus, .calm, .sleep].contains(self) }

    /// Modes that have a Browse page.
    public static let browsable: [ModeId] = [.focus, .calm, .sleep, .move, .realms]

    /// Accepts ids and display names ("focus", "Focus", "Lucille Picks", "Energize").
    public init?(loose: String) {
        switch loose.trimmingCharacters(in: .whitespaces).lowercased() {
        case "picks", "lucille picks": self = .picks
        case "focus": self = .focus
        case "calm": self = .calm
        case "sleep": self = .sleep
        case "move", "energize": self = .move
        case "noise": self = .noise
        case "realms", "realm": self = .realms
        default: return nil
        }
    }
}

@available(iOS 17.0, *)
public struct Mode: Codable, Hashable, Identifiable, Sendable {
    public var id: ModeId
    public var title: String
    public var shortTitle: String
    public var icon: String
    public var premium: Bool
    public var locked: Bool?
}

// MARK: - Shared value types

@available(iOS 17.0, *)
public struct GradientSpec: Codable, Hashable, Sendable {
    public var colors: [String]
    public var stops: [Double]?
    public var angle: Double
    public init(colors: [String], stops: [Double]? = nil, angle: Double = 135) {
        self.colors = colors; self.stops = stops; self.angle = angle
    }
    public static let fallback = GradientSpec(colors: ["#39519F", "#101E43"])
}

/// The Mood Field. energy: 0 calm → 1 charged (pad bottom → top).
/// texture: 0 grounded → 1 dreamy (pad left → right). See SCREEN-MAP.md for the Figma note.
@available(iOS 17.0, *)
public struct MoodField: Codable, Hashable, Sendable {
    public var energy: Double
    public var texture: Double
    public init(energy: Double, texture: Double) {
        self.energy = min(1, max(0, energy)); self.texture = min(1, max(0, texture))
    }
    public static let figmaDefault = MoodField(energy: 0.35, texture: 0.72)
    public static let neutral = MoodField(energy: 0.5, texture: 0.5)
}

@available(iOS 17.0, *)
public enum Brainwave: String, Codable, CaseIterable, Sendable {
    case off, delta, theta, alpha, beta
    public init?(loose: String) { self.init(rawValue: loose.lowercased()) }
    public var title: String { rawValue.prefix(1).uppercased() + rawValue.dropFirst() }
}

// MARK: - Compositions

@available(iOS 17.0, *)
public enum CompositionStatus: String, Codable, Sendable {
    case queued, rendering, ready, failed
    public var isFinished: Bool { self == .ready || self == .failed }
}

@available(iOS 17.0, *)
public struct AudioSegment: Codable, Hashable, Sendable {
    public enum Role: String, Codable, Sendable { case intro, body, outro }
    public var role: Role
    public var url: URL
    public var durationSec: Double
    public init(role: Role, url: URL, durationSec: Double) { self.role = role; self.url = url; self.durationSec = durationSec }
}

@available(iOS 17.0, *)
public struct VisualPreset: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var mode: ModeId
    public var name: String
    public var videoH264: URL
    public var videoHevc: URL?
    public var poster: URL?
    public var loopSec: Double
    public var energy: Double
    public var texture: Double
}

@available(iOS 17.0, *)
public struct SoundRecipe: Codable, Hashable, Sendable {
    public struct Wave: Codable, Hashable, Sendable { public var type: Brainwave; public var hz: Double? }
    public struct Layers: Codable, Hashable, Sendable { public var ambience: String; public var melody: String; public var pulse: String }
    public var tempoBpm: Int
    public var key: String
    public var scale: String
    public var evolution: String
    public var brightness: Double
    public var reverb: Double
    public var stereoWidth: Double
    public var pulse: Double
    public var brainwave: Wave
    public var layers: Layers
    public var loudnessLufs: Double
}

@available(iOS 17.0, *)
public struct Composition: Codable, Hashable, Identifiable, Sendable {
    public var compositionId: String
    public var ownerUid: String?
    public var status: CompositionStatus
    public var mode: ModeId
    public var title: String
    public var subtitle: String?
    public var whyHeadline: String?
    public var whyThisSound: String?
    public var segments: [AudioSegment]
    public var visual: VisualPreset?
    public var visualPresetId: String?
    public var gradient: GradientSpec?
    public var artist: String?
    public var source: String
    public var durationLabel: String?
    public var minutes: Int?
    public var brainwave: Brainwave?
    public var moodField: MoodField?
    public var parentId: String?
    public var failReason: String?
    public var prompt: String?
    public var recipe: SoundRecipe?
    public var createdAt: String
    public var readyAt: String?

    public var id: String { compositionId }

    /// "Composed by Lucille (AI)" or "Lucille × Artist". Always shown with generated audio.
    public var creditLine: String {
        if let artist, artist != "Lucille", !artist.isEmpty { return "Lucille × \(artist)" }
        return "Composed by Lucille (AI)"
    }
}

@available(iOS 17.0, *)
public struct ComposeRequest: Codable, Hashable, Sendable {
    public var prompt: String
    public var mode: ModeId
    public var minutes: Int?
    public var brainwave: Brainwave
    public var moodField: MoodField
    public var useInnerWeather: Bool
    public var lat: Double?
    public var lon: Double?
    public var tz: String?

    public init(prompt: String, mode: ModeId, minutes: Int?, brainwave: Brainwave, moodField: MoodField,
                useInnerWeather: Bool, lat: Double? = nil, lon: Double? = nil, tz: String? = TimeZone.current.identifier) {
        self.prompt = prompt; self.mode = mode; self.minutes = minutes; self.brainwave = brainwave
        self.moodField = moodField; self.useInnerWeather = useInnerWeather; self.lat = lat; self.lon = lon; self.tz = tz
    }

    // minutes is always sent (null = endless) so the server never guesses.
    enum CodingKeys: String, CodingKey { case prompt, mode, minutes, brainwave, moodField, useInnerWeather, lat, lon, tz }
    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(prompt, forKey: .prompt)
        try c.encode(mode, forKey: .mode)
        try c.encode(minutes, forKey: .minutes)
        try c.encode(brainwave, forKey: .brainwave)
        try c.encode(moodField, forKey: .moodField)
        try c.encode(useInnerWeather, forKey: .useInnerWeather)
        try c.encodeIfPresent(lat, forKey: .lat)
        try c.encodeIfPresent(lon, forKey: .lon)
        try c.encodeIfPresent(tz, forKey: .tz)
    }
}

@available(iOS 17.0, *)
public struct ComposeAccepted: Codable, Hashable, Sendable {
    public var compositionId: String
    public var status: CompositionStatus
    public var etaSec: Int?
    public var composition: Composition
}

// MARK: - Home + inner weather

@available(iOS 17.0, *)
public struct Weather: Codable, Hashable, Sendable {
    public var tempF: Int
    public var condition: String
    public var city: String
}

@available(iOS 17.0, *)
public struct InputsNow: Codable, Hashable, Sendable {
    public var circadianPhase: String
    public var phaseLabel: String
    public var phaseValue: String
    public var nextPhaseInMin: Int?
    public var weather: Weather?
    public var mood: String?
    public var heartBpm: Int?
    public var sunrise: String?
    public var sunset: String?
    public var suggestedMode: ModeId
    public var playNowSubtitle: String
}

@available(iOS 17.0, *)
public struct Experiments: Codable, Hashable, Sendable {
    public enum HomeVariant: String, Codable, Sendable { case playNow, modes }
    public enum AudioVariant: String, Codable, Sendable { case adaptive, `static` }
    public var homeVariant: HomeVariant
    public var audioVariant: AudioVariant
    public var isBetaTester: Bool
}

@available(iOS 17.0, *)
public struct DailyDrop: Codable, Hashable, Sendable {
    public var compositionId: String
    public var label: String
    public var badge: String
    public var title: String
    public var subtitle: String
    public var mode: String
    public var gradient: GradientSpec
    public var composition: Composition?
}

@available(iOS 17.0, *)
public struct JourneyChip: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var title: String
    public var chipDuration: String?
    public var mode: String
}

@available(iOS 17.0, *)
public struct FeaturedCircle: Codable, Hashable, Sendable {
    public var circleId: String
    public var label: String
    public var title: String
    public var subtitle: String
    public var cta: String
}

@available(iOS 17.0, *)
public struct MadeByYou: Codable, Hashable, Identifiable, Sendable {
    public var compositionId: String
    public var title: String
    public var description: String
    public var mode: String
    public var gradient: GradientSpec?
    public var id: String { compositionId }
}

@available(iOS 17.0, *)
public struct Home: Codable, Hashable, Sendable {
    public struct User: Codable, Hashable, Sendable {
        public var firstName: String
        public var isPremium: Bool
        public var streakDays: Int
        public var totalShards: Int
    }
    public var user: User
    public var experiments: Experiments
    public var inputsNow: InputsNow
    public var homeTabs: [String]
    public var modes: [Mode]
    public var dailyDrop: DailyDrop
    public var journeyChips: [JourneyChip]
    public var featuredCircle: FeaturedCircle
    public var madeByYou: [MadeByYou]
    public var betaFeedbackEnabled: Bool
}

// MARK: - Me

@available(iOS 17.0, *)
public struct Profile: Codable, Hashable, Sendable {
    public var uid: String
    public var firstName: String
    public var isPremium: Bool
    public var streakDays: Int
    public var totalShards: Int
    public var lastSessionDate: String?
    public var hasOnboarded: Bool
    public var experiments: Experiments
}

@available(iOS 17.0, *)
public struct LayerSetting: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var label: String
    public var glyph: String
    public var value: Double
    public var muted: Bool
    public var chips: [String]?
    public var selectedChip: String?
    public var chipNote: String?
}

@available(iOS 17.0, *)
public struct Preferences: Codable, Hashable, Sendable {
    public struct Whisper: Codable, Hashable, Sendable { public var enabled: Bool; public var selectedTopic: String }
    public struct Timer: Codable, Hashable, Sendable { public var minutes: Int; public var fadeOut: Bool; public var sunriseWake: Bool }
    public struct Sleep: Codable, Hashable, Sendable {
        public var whisperIntro: Bool; public var timer: String; public var sunriseTime: String; public var breathSync: Bool
    }
    public var moodField: MoodField
    public var blendOn: Bool
    public var focusShieldOn: Bool
    public var layers: [LayerSetting]
    public var whisper: Whisper
    public var timer: Timer
    public var sleep: Sleep
    public var hasOnboarded: Bool
}

/// PATCH /v1/me/preferences. nil fields are left out of the JSON.
@available(iOS 17.0, *)
public struct PreferencesPatch: Codable, Hashable, Sendable {
    public struct WhisperPatch: Codable, Hashable, Sendable { public var enabled: Bool?; public var selectedTopic: String?
        public init(enabled: Bool? = nil, selectedTopic: String? = nil) { self.enabled = enabled; self.selectedTopic = selectedTopic } }
    public struct TimerPatch: Codable, Hashable, Sendable { public var minutes: Int?; public var fadeOut: Bool?; public var sunriseWake: Bool?
        public init(minutes: Int? = nil, fadeOut: Bool? = nil, sunriseWake: Bool? = nil) { self.minutes = minutes; self.fadeOut = fadeOut; self.sunriseWake = sunriseWake } }
    public struct SleepPatch: Codable, Hashable, Sendable { public var whisperIntro: Bool?; public var timer: String?; public var sunriseTime: String?; public var breathSync: Bool?
        public init(whisperIntro: Bool? = nil, timer: String? = nil, sunriseTime: String? = nil, breathSync: Bool? = nil) {
            self.whisperIntro = whisperIntro; self.timer = timer; self.sunriseTime = sunriseTime; self.breathSync = breathSync } }
    public var moodField: MoodField?
    public var blendOn: Bool?
    public var focusShieldOn: Bool?
    public var layers: [LayerSetting]?
    public var whisper: WhisperPatch?
    public var timer: TimerPatch?
    public var sleep: SleepPatch?
    public var hasOnboarded: Bool?
    public init(moodField: MoodField? = nil, blendOn: Bool? = nil, focusShieldOn: Bool? = nil, layers: [LayerSetting]? = nil,
                whisper: WhisperPatch? = nil, timer: TimerPatch? = nil, sleep: SleepPatch? = nil, hasOnboarded: Bool? = nil) {
        self.moodField = moodField; self.blendOn = blendOn; self.focusShieldOn = focusShieldOn; self.layers = layers
        self.whisper = whisper; self.timer = timer; self.sleep = sleep; self.hasOnboarded = hasOnboarded
    }
}

@available(iOS 17.0, *)
public struct InputSetting: Codable, Hashable, Identifiable, Sendable {
    public enum Kind: String, Codable, Sendable { case time, weather, heart, mood, calendar }
    public enum Permission: String, Codable, Sendable { case location, health, calendar }
    public var id: Kind
    public var label: String
    public var sub: String
    public var enabled: Bool
    public var alwaysOn: Bool
    public var comingSoon: Bool?
    public var permission: Permission?
}

@available(iOS 17.0, *)
public struct InputsResponse: Codable, Hashable, Sendable {
    public var inputs: [InputSetting]
    public var footer: String
}

@available(iOS 17.0, *)
public struct MoodCheckIn: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var uid: String
    public var value: Double
    public var tags: [String]
    public var source: String
    public var createdAt: String
    public var word: String?
}

@available(iOS 17.0, *)
public struct MoodScan: Codable, Hashable, Sendable {
    public var mood: String
    public var minutesAgo: Int
    public var label: String
    public var value: Double?
}

// MARK: - Catalog

@available(iOS 17.0, *)
public struct BrowseCard: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var compositionId: String
    public var title: String
    public var description: String
    public var mode: String
    public var gradient: GradientSpec
    public var isPremium: Bool
    public var locked: Bool
    public var seasonal: Bool?
    public var isNew: Bool?
}

@available(iOS 17.0, *)
public struct BrowsePage: Codable, Hashable, Sendable {
    public struct JourneyLink: Codable, Hashable, Sendable { public var title: String; public var journeyId: String? }
    public var mode: ModeId
    public var title: String
    public var tagline: String
    public var background: String
    public var chipsLabel: String
    public var journeys: [JourneyLink]
    public var cards: [BrowseCard]
}

@available(iOS 17.0, *)
public struct Journey: Codable, Hashable, Identifiable, Sendable {
    public struct Phase: Codable, Hashable, Sendable {
        public var label: String
        public var minutes: Int
        public var energy: Double
        public var startsAtSec: Int?
    }
    public var id: String
    public var title: String
    public var chipDuration: String?
    public var mode: String
    public var placeholder: Bool?
    public var sheetTitle: String
    public var summary: String
    public var phases: [Phase]
    public var totalMinutes: Int?
}

@available(iOS 17.0, *)
public struct JourneyStart: Codable, Hashable, Sendable {
    public var journey: Journey
    public var timeline: [Journey.Phase]
    public var composition: Composition
    public var session: Session
}

@available(iOS 17.0, *)
public struct WhisperTopic: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var label: String
    public var description: String
}

@available(iOS 17.0, *)
public struct PremiumPlan: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var label: String
    public var price: String
    public var description: String
    public var recommended: Bool
    public var productId: String
}

@available(iOS 17.0, *)
public struct PremiumPlans: Codable, Hashable, Sendable {
    public var plans: [PremiumPlan]
    public var defaultPlan: String
}

// MARK: - Sessions

@available(iOS 17.0, *)
public enum SessionOrigin: String, Codable, Sendable {
    case playNow, mode, compose, dailyDrop, journey, circle, playlist, library
}

@available(iOS 17.0, *)
public struct Session: Codable, Hashable, Sendable {
    public var sessionId: String
    public var uid: String
    public var mode: ModeId
    public var compositionId: String?
    public var startedFrom: SessionOrigin
    public var startedAt: String
    public var completedAt: String?
    public var minutes: Double?
    public var moodBefore: Double?
    public var moodAfter: Double?
    public var moodField: MoodField?
}

@available(iOS 17.0, *)
public struct StartSessionRequest: Codable, Hashable, Sendable {
    public var mode: ModeId
    public var compositionId: String?
    public var startedFrom: SessionOrigin
    public var moodBefore: Double?
    public var moodField: MoodField?
    public init(mode: ModeId, compositionId: String?, startedFrom: SessionOrigin, moodBefore: Double? = nil, moodField: MoodField? = nil) {
        self.mode = mode; self.compositionId = compositionId; self.startedFrom = startedFrom; self.moodBefore = moodBefore; self.moodField = moodField
    }
}

@available(iOS 17.0, *)
public struct CompleteSessionRequest: Codable, Hashable, Sendable {
    public var minutes: Double?
    public var moodAfter: Double?
    public var tz: String?
    public init(minutes: Double?, moodAfter: Double?, tz: String? = TimeZone.current.identifier) {
        self.minutes = minutes; self.moodAfter = moodAfter; self.tz = tz
    }
}

@available(iOS 17.0, *)
public struct SessionResult: Codable, Hashable, Sendable {
    public var sessionId: String
    public var minutes: Int
    public var streakDays: Int
    public var shardsEarned: Int
    public var totalShards: Int
    public var moodFrom: String?
    public var moodTo: String?
}

@available(iOS 17.0, *)
public struct BetaFeedbackRequest: Codable, Hashable, Sendable {
    public var sessionId: String?
    public var mode: String?
    public var calmRating: Int
    public var visual: String?
    public var note: String?
    public init(sessionId: String?, mode: String?, calmRating: Int, visual: String?, note: String?) {
        self.sessionId = sessionId; self.mode = mode; self.calmRating = calmRating; self.visual = visual; self.note = note
    }
}

@available(iOS 17.0, *)
public struct BetaFeedback: Codable, Hashable, Sendable {
    public var id: String
    public var calmRating: Int
    public var visual: String?
    public var note: String?
    public var createdAt: String
}

// MARK: - Library, playlists, circles

@available(iOS 17.0, *)
public struct LibraryItem: Codable, Hashable, Identifiable, Sendable {
    public enum Kind: String, Codable, Sendable { case saved, memory }
    public var id: String
    public var compositionId: String
    public var title: String
    public var mode: String
    public var duration: String
    public var offline: Bool
    public var kind: Kind
    public var gradient: GradientSpec
    public var createdAt: String?
}

@available(iOS 17.0, *)
public enum LibraryFilter: String, CaseIterable, Sendable {
    case saved, downloads, memory
    /// Tab titles in the Figma: Saved / Downloads / Memories.
    public var title: String { self == .memory ? "Memories" : rawValue.capitalized }
}

@available(iOS 17.0, *)
public struct Track: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var compositionId: String
    public var title: String
    public var mode: String
    public var duration: String
    public var gradient: GradientSpec
    public var liked: Bool?
}

@available(iOS 17.0, *)
public struct Playlist: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var title: String
    public var summary: String
    public var credit: String
    public var artGradient: GradientSpec
    public var tracks: [Track]
}

@available(iOS 17.0, *)
public struct PlaylistSummary: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var title: String
    public var summary: String
    public var credit: String
    public var artGradient: GradientSpec
    public var trackCount: Int
}

@available(iOS 17.0, *)
public struct Circles: Codable, Hashable, Sendable {
    public struct Live: Codable, Hashable, Sendable {
        public var id: String
        public var title: String
        public var mode: String
        public var host: String
        public var minutesLeft: Int
        public var listening: Int
        public var avatarColors: [String]
        public var compositionId: String
    }
    public struct Upcoming: Codable, Hashable, Identifiable, Sendable {
        public var id: String
        public var title: String
        public var mode: String
        public var when: String
        public var host: String
        public var going: Int
        public var gradient: GradientSpec
        public var reminderOn: Bool?
    }
    public var intro: String
    public var live: Live
    public var upcoming: [Upcoming]
    public var footer: String
}

@available(iOS 17.0, *)
public struct CircleJoin: Codable, Hashable, Sendable {
    public var circleId: String
    public var listening: Int
    public var startOffsetSec: Int
    public var composition: Composition
    public var session: Session
}

// MARK: - Errors

@available(iOS 17.0, *)
public struct APIErrorBody: Codable, Sendable {
    public struct Inner: Codable, Sendable { public var code: String; public var message: String }
    public var error: Inner
}

@available(iOS 17.0, *)
extension Date {
    /// Parses the API's ISO-8601 timestamps (with or without fractional seconds).
    public static func fromISO(_ s: String) -> Date? {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        if let d = f.date(from: s) { return d }
        f.formatOptions = [.withInternetDateTime]
        return f.date(from: s)
    }
}
