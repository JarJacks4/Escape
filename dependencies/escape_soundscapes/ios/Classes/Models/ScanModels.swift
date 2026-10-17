import SwiftUI

// MARK: - Mood reading

/// Everything the Mood Scan knows at a moment. `energy` and `valence` come from the camera
/// pulse + the person's own input; `bpm` from the pulse read. The orb and the result are
/// both derived from this, so the orb the person tuned *is* the mood Lucille names.
@available(iOS 17.0, *)
public struct MoodReading: Equatable, Sendable {
    public var energy: Double     // 0 drained … 1 charged  (Mood Field Y)
    public var valence: Double    // 0 unpleasant … 1 pleasant (Mood Field X)
    public var bpm: Int
    /// A word the person tapped. nil → Lucille's first word for the quadrant.
    public var chosenWord: String?
    /// True only when `bpm` came from the camera pulse read. Otherwise `bpm` is just the orb's
    /// resting rhythm and is never shown or saved as a measurement.
    public var pulseMeasured: Bool

    public init(energy: Double = 0.5, valence: Double = 0.5, bpm: Int = 72, chosenWord: String? = nil,
                pulseMeasured: Bool = false) {
        self.energy = energy; self.valence = valence; self.bpm = bpm; self.chosenWord = chosenWord
        self.pulseMeasured = pulseMeasured
    }

    /// Starting point for the Energy slider from a measured resting pulse: ~55 bpm reads as
    /// low energy, ~100 bpm as high. The person can always move it.
    public static func energy(fromPulse bpm: Int) -> Double {
        max(0.1, min(0.9, 0.2 + (Double(bpm) - 55) / 45 * 0.6))
    }

    public var moodField: MoodField { MoodField(energy: energy, texture: valence) }

    /// The four Mood Field quadrants, each with its words, one-liner, tuned soundscape and
    /// the orb's accent colour. This is the single source of the mood → everything mapping.
    public enum Quadrant: Sendable {
        case restless, energized, foggy, calm
    }

    public var quadrant: Quadrant {
        switch (energy >= 0.5, valence >= 0.5) {
        case (true, false):  return .restless    // charged + unpleasant
        case (true, true):   return .energized    // charged + pleasant
        case (false, false): return .foggy        // drained + unpleasant
        case (false, true):  return .calm          // drained + pleasant
        }
    }

    public var words: [String] {
        switch quadrant {
        case .restless:  return ["Restless", "Wired", "Anxious", "Tense"]
        case .energized: return ["Energized", "Bright", "Hopeful", "Focused"]
        case .foggy:     return ["Foggy", "Heavy", "Low", "Drained"]
        case .calm:      return ["Calm", "Steady", "Content", "Open"]
        }
    }

    public var word: String {
        if let w = chosenWord, words.contains(w) { return w }
        return words[0]
    }

    public var line: String {
        switch quadrant {
        case .restless:  return "High energy, a little unpleasant"
        case .energized: return "High energy and pleasant"
        case .foggy:     return "Low energy, a little unpleasant"
        case .calm:      return "Low energy and pleasant"
        }
    }

    /// The orb's accent — passed to the shader as `tint`. Escape palette, warm for charged/
    /// pleasant, cool for drained, hot ember for restless tension.
    public var tint: Color {
        switch quadrant {
        case .restless:  return Color(hex: 0xEF7702)   // ember
        case .energized: return Color(hex: 0xFFC27A)   // warm gold
        case .foggy:     return Color(hex: 0x5B6FB0)   // muted blue
        case .calm:      return Color(hex: 0xB9A3F0)   // lilac
        }
    }

    /// Apple Health State of Mind valence is −1…1; our valence is 0…1.
    public var healthKitValence: Double { valence * 2 - 1 }
}

// MARK: - Suggestions

/// What Lucille offers after a scan: a tuned soundscape plus a few in-app actions chosen for
/// the mood. `deeplink` is the in-app destination; `coins` is the reward for doing it.
@available(iOS 17.0, *)
public struct Suggestion: Identifiable, Sendable {
    public var id = UUID()
    public var minutes: String
    public var title: String
    public var why: String
    public var deeplink: String
    public var coins: Int
    public init(minutes: String, title: String, why: String, deeplink: String, coins: Int = 10) {
        self.minutes = minutes; self.title = title; self.why = why; self.deeplink = deeplink; self.coins = coins
    }
}

@available(iOS 17.0, *)
public extension MoodReading {
    var tunedSoundscape: (title: String, mode: ModeId) {
        switch quadrant {
        case .restless:  return ("Calm · Slow Tide, tuned to settle", .calm)
        case .energized: return ("Focus · Deep Work, tuned to ride it", .focus)
        case .foggy:     return ("Focus · Morning Lift, tuned to lift", .focus)
        case .calm:      return ("Lucille Picks · Drift, tuned to stay here", .picks)
        }
    }

    var suggestions: [Suggestion] {
        switch quadrant {
        case .restless:
            return [Suggestion(minutes: "3 min", title: "Breath Sync 4-7-8", why: "Long out-breaths slow a racing pulse.", deeplink: "escape://breath/478"),
                    Suggestion(minutes: "5 min", title: "Calm soundscape", why: "A slow, steady sound to help you step down.", deeplink: "escape://mode/calm"),
                    Suggestion(minutes: "2 min", title: "Talk it through with Lucille", why: "Name what's pulling at you, then set it down.", deeplink: "escape://lucille")]
        case .energized:
            return [Suggestion(minutes: "25 min", title: "Focus soundscape", why: "Put this energy into one thing that matters.", deeplink: "escape://mode/focus"),
                    Suggestion(minutes: "10 min", title: "Move soundscape", why: "A walk or stretch with a beat to match you.", deeplink: "escape://mode/move"),
                    Suggestion(minutes: "2 min", title: "Save this moment", why: "Write down what's going right so you can come back to it.", deeplink: "escape://journal/new")]
        case .foggy:
            return [Suggestion(minutes: "5 min", title: "Move: Gentle Wake", why: "Light movement and daylight help clear the fog.", deeplink: "escape://mode/move"),
                    Suggestion(minutes: "3 min", title: "Visit the Grounding World", why: "A slow Realms scene to feel steady again.", deeplink: "escape://realms/grounding"),
                    Suggestion(minutes: "1 min", title: "Set Sunrise Wake", why: "Wake gently tomorrow to break the heavy start.", deeplink: "escape://sleep/sunrise")]
        case .calm:
            return [Suggestion(minutes: "2 min", title: "Save this moment", why: "A short note to Lucille so you can come back to it.", deeplink: "escape://journal/new"),
                    Suggestion(minutes: "10 min", title: "Stay in this calm", why: "A Lucille Picks soundscape tuned to how you feel now.", deeplink: "escape://mode/picks"),
                    Suggestion(minutes: "10 min", title: "Sleep wind-down", why: "Carry this calm into tonight with Lucille Whisper.", deeplink: "escape://sleep")]
        }
    }

    var because: String {
        let feel = "you set your energy to \(Int(energy * 100))% and pleasantness to \(Int(valence * 100))%"
        if pulseMeasured {
            return "Your camera pulse estimate was about \(bpm) bpm, \(feel), so Lucille hears \(word.lowercased())."
        }
        return "You skipped the pulse read; \(feel), so Lucille hears \(word.lowercased())."
    }
}

// MARK: - Energy centres (chakras)

/// The seven energy centres, root to crown. Level 1 = Grounding; every 1,000 Escape Coins
/// lifts the user to the next. The result screen reuses the Figma Make Energy Centre Scan.
@available(iOS 17.0, *)
public struct EnergyCenter: Identifiable, Sendable {
    public var id: String { name }
    public var name: String
    public var color: Color
    public var status: String
    public var energy: Int         // 0…100
    public var note: String
    public init(_ name: String, _ hex: UInt32, _ status: String, _ energy: Int, _ note: String) {
        self.name = name; self.color = Color(hex: hex); self.status = status; self.energy = energy; self.note = note
    }
}

@available(iOS 17.0, *)
public enum EnergyCenters {
    /// Crown → root (top of the body to the base), the order the result list shows.
    public static let all: [EnergyCenter] = [
        EnergyCenter("Purpose Energy Center",    0xAF52DE, "Dominant Today", 88, "Strong reflective language this week."),
        EnergyCenter("Awareness Energy Center",  0x5856D6, "Balanced",       70, "Intuition is clear and present."),
        EnergyCenter("Expression Energy Center", 0x32ADE6, "Blocked",        52, "Seeking more expression."),
        EnergyCenter("Connection Energy Center", 0x34C759, "Blocked",        45, "Holding emotions inward."),
        EnergyCenter("Strength Energy Center",   0xFFD60A, "Overactive",     92, "Carrying responsibility lately."),
        EnergyCenter("Creative Energy Center",   0xFF9500, "Soft",           85, "Gentle and flowing."),
        EnergyCenter("Grounding Energy Center",  0xFF3B30, "Balanced",       78, "Steady sleep and routines."),
    ]
    /// The seven centres for *this* scan, worked out from what the person measured and chose:
    /// pulse (if read), energy, pleasantness and the word. A reflective guide, not a diagnosis.
    public static func from(_ r: MoodReading) -> [EnergyCenter] {
        let e = r.energy, v = r.valence
        let calmPulse: Double = r.pulseMeasured ? max(0, min(1, (100 - Double(r.bpm)) / 45)) : 0.5
        func pct(_ x: Double) -> Int { Int((max(0.05, min(1, x)) * 100).rounded()) }
        func status(_ p: Int) -> String { p >= 85 ? "Strong" : p >= 65 ? "Balanced" : p >= 45 ? "Soft" : "Needs care" }
        let rows: [(String, UInt32, Double, String)] = [
            ("Purpose Energy Center",    0xAF52DE, 0.45 * v + 0.35 * e + 0.2, "Meaning grows with pleasant energy."),
            ("Awareness Energy Center",  0x5856D6, 0.5 * v + 0.3 * calmPulse + 0.2, "Clearer when the body is settled."),
            ("Expression Energy Center", 0x32ADE6, 0.4 * v + 0.4 * e + 0.15, "Lifted by energy and a good mood."),
            ("Connection Energy Center", 0x34C759, 0.65 * v + 0.25, "Follows how pleasant you feel."),
            ("Strength Energy Center",   0xFFD60A, 0.7 * e + 0.2, "Follows your energy level."),
            ("Creative Energy Center",   0xFF9500, 0.4 * e + 0.4 * v + 0.15, "Flows with energy and ease."),
            ("Grounding Energy Center",  0xFF3B30, 0.6 * calmPulse + 0.3 * (1 - abs(e - 0.5) * 2) + 0.15, "Steadier with a calm pulse."),
        ]
        return rows.map { row in
            let p = pct(row.2)
            return EnergyCenter(row.0, row.1, status(p), p, row.3)
        }
    }

    /// Level names, root → crown, for the progression (Level N = index N-1).
    public static let levelNames = ["Grounding", "Creative", "Strength", "Connection", "Expression", "Awareness", "Purpose"]
}

/// Progress toward the next Energy Scan. Each level costs 1,000 Escape Coins.
@available(iOS 17.0, *)
public struct CoinLevel: Sendable {
    public var coins: Int
    public init(coins: Int) { self.coins = coins }
    public var level: Int { max(1, coins / 1000 + 1) }
    public var intoLevel: Int { coins % 1000 }
    public var toNext: Int { 1000 - intoLevel }
    public var unlockedEnergyScan: Bool { coins >= 1000 }
    public var levelName: String { EnergyCenters.levelNames[min(level, EnergyCenters.levelNames.count) - 1] }
}
