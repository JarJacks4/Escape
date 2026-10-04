import Foundation

// All screen copy, from GET /v1/content (or the bundled figma-seed.json in mock mode).
// Every string a screen shows should come from here so design changes don't need a release.

@available(iOS 17.0, *)
public struct ContentBundle: Codable, Hashable, Sendable {
    public struct Slide: Codable, Hashable, Sendable { public var title: String; public var body: String }

    public struct NowPlayingCopy: Codable, Hashable, Sendable {
        public var subtitle: String
        public var aiCredit: String
        public var whyHeadline: String
        public var whyBody: String
        public var switcherModes: [String]
        public var defaultTimerSeconds: Int
        public var timerCaption: String
    }

    public struct ComposeCopy: Codable, Hashable, Sendable {
        public struct Defaults: Codable, Hashable, Sendable {
            public var mode: String; public var length: String; public var brainwave: String; public var useInnerWeather: Bool
        }
        public var prompt: String
        public var placeholder: String
        public var modes: [String]
        public var lengths: [String]
        public var brainwaves: [String]
        public var defaults: Defaults
        public var innerWeatherLabel: String
        public var innerWeatherSub: String
        public var cta: String
        public var ctaBusy: String
        public var eta: String
        public var steps: [String]
        public var leaveNote: String
    }

    public struct MoodFieldCopy: Codable, Hashable, Sendable {
        public struct Preset: Codable, Hashable, Sendable { public var label: String; public var energy: Double; public var texture: Double }
        public struct Dot: Codable, Hashable, Sendable {
            public var x: Double; public var y: Double; public var size: Double; public var color: String; public var opacity: Double
        }
        public var `default`: MoodField
        public var helper: String
        public var presets: [Preset]
        public var padDots: [Dot]
        public var cta: String
    }

    public struct MoodCheckInCopy: Codable, Hashable, Sendable {
        public var title: String
        public var tags: [String]
        public var defaultValue: Double
        public var defaultTags: [String]
        public var latestMoodScan: MoodScan
        public var cta: String
    }

    public struct WhisperCopy: Codable, Hashable, Sendable {
        public var enabled: Bool
        public var selectedTopic: String
        public var onTitle: String
        public var offTitle: String
        public var onBody: String
        public var offBody: String
        public var topics: [WhisperTopic]
    }

    public struct TimerCopy: Codable, Hashable, Sendable {
        public var options: [String]
        public var `default`: String
        public var customMax: Int
        public var fadeOut: Bool
        public var fadeOutLabel: String
        public var fadeOutSub: String
        public var sunriseWake: Bool
        public var sunriseLabel: String
        public var sunriseSub: String
    }

    public struct SleepSetupCopy: Codable, Hashable, Sendable {
        public struct Row: Codable, Hashable, Sendable { public var label: String; public var sub: String }
        public struct Rows: Codable, Hashable, Sendable { public var whisper: Row; public var timer: Row; public var sunrise: Row; public var breath: Row }
        public var whisperIntro: Bool
        public var timerOptions: [String]
        public var timer: String
        public var sunriseTime: String
        public var breathSync: Bool
        public var rows: Rows
        public var cta: String
    }

    public struct LibraryCopy: Codable, Hashable, Sendable { public var tabs: [String] }

    public struct SessionCompleteCopy: Codable, Hashable, Sendable {
        public struct Sample: Codable, Hashable, Sendable {
            public var minutes: Int; public var streakDays: Int; public var shardsEarned: Int; public var moodFrom: String; public var moodTo: String
        }
        public var headline: String          // "Nice work, {firstName}."
        public var subtitleTemplate: String  // "{mode} session complete."
        public var sample: Sample
        public var moodAfterDefault: Double
        public var buttons: [String]
    }

    public struct BetaFeedbackCopy: Codable, Hashable, Sendable {
        public var title: String
        public var calmQuestion: String
        public var visualQuestion: String
        public var visualOptions: [String]
        public var notePlaceholder: String
        public var cta: String
    }

    public struct PremiumCopy: Codable, Hashable, Sendable {
        public var title: String
        public var body: String
        public var plans: [PremiumPlan]
        public var defaultPlan: String
        public var cta: String
        public var restore: String
        public var legal: String
    }

    public struct PrimerCopy: Codable, Hashable, Sendable { public var title: String; public var body: String; public var placeholder: Bool? }

    public struct CirclesCopy: Codable, Hashable, Sendable { public var intro: String; public var footer: String }

    public var version: Int
    public var onboarding: [Slide]
    public var homeTabs: [String]
    public var nowPlaying: NowPlayingCopy
    public var compose: ComposeCopy
    public var moodField: MoodFieldCopy
    public var moodCheckIn: MoodCheckInCopy
    public var whisper: WhisperCopy
    public var timer: TimerCopy
    public var sleepSetup: SleepSetupCopy
    public var library: LibraryCopy
    public var sessionComplete: SessionCompleteCopy
    public var betaFeedback: BetaFeedbackCopy
    public var premium: PremiumCopy
    public var inputsFooter: String
    public var permissionPrimer: [String: PrimerCopy]
    public var circles: CirclesCopy
}

@available(iOS 17.0, *)
extension String {
    /// Fills "{firstName}" style placeholders.
    public func filling(_ values: [String: String]) -> String {
        values.reduce(self) { $0.replacingOccurrences(of: "{\($1.key)}", with: $1.value) }
    }
}
