import Foundation

/// shared/seed/figma-seed.json: every piece of content in the Figma Make prototype.
/// Bundled in the app for mock mode, SwiftUI previews and tests. The backend seeds from the same file.
@available(iOS 17.0, *)
public struct Seed: Codable, Sendable {
    public struct SeedUser: Codable, Sendable {
        public var uid: String; public var firstName: String; public var isPremium: Bool; public var streakDays: Int; public var totalShards: Int
    }
    public struct SeedDailyDrop: Codable, Sendable {
        public var compositionId: String; public var label: String; public var badge: String; public var title: String
        public var subtitle: String; public var mode: String; public var gradient: GradientSpec
    }
    public struct SeedCard: Codable, Sendable {
        public var id: String; public var title: String; public var description: String; public var gradient: GradientSpec
        public var isPremium: Bool; public var seasonal: Bool?; public var isNew: Bool?
    }
    public struct SeedBrowse: Codable, Sendable {
        public var title: String; public var tagline: String; public var background: String; public var chipsLabel: String
        public var journeys: [String]; public var cards: [SeedCard]
    }
    public struct SeedLibrary: Codable, Sendable { public var tabs: [String]; public var items: [LibraryItem] }
    public struct SeedPlaylist: Codable, Sendable {
        public var id: String; public var title: String; public var summary: String; public var credit: String
        public var artGradient: GradientSpec; public var tracks: [Track]; public var defaultLiked: [String]?
    }
    public struct SeedCircles: Codable, Sendable {
        public var intro: String; public var live: Circles.Live; public var upcoming: [Circles.Upcoming]
        public var defaultReminders: [String]; public var footer: String
    }

    public var version: Int
    public var user: SeedUser
    public var modes: [Mode]
    public var inputsNow: InputsNow
    public var dailyDrop: SeedDailyDrop
    public var journeys: [Journey]
    public var featuredCircle: FeaturedCircle
    public var madeByYou: [MadeByYou]
    public var browse: [String: SeedBrowse]
    public var layers: [LayerSetting]
    public var inputs: [InputSetting]
    public var library: SeedLibrary
    public var playlists: [SeedPlaylist]
    public var circles: SeedCircles
    public var experiments: Experiments

    public static func load(from url: URL) throws -> Seed {
        try JSONDecoder().decode(Seed.self, from: Data(contentsOf: url))
    }

    /// The copy of figma-seed.json bundled with the app.
    public static func bundled(_ bundle: Bundle = .soundscapes) throws -> Seed {
        guard let url = bundle.url(forResource: "figma-seed", withExtension: "json") else { throw CocoaError(.fileNoSuchFile) }
        return try load(from: url)
    }
}

@available(iOS 17.0, *)
extension ContentBundle {
    /// The seed file has the same keys as GET /v1/content (plus extras, which are ignored).
    public static func bundled(_ bundle: Bundle = .soundscapes) throws -> ContentBundle {
        guard let url = bundle.url(forResource: "figma-seed", withExtension: "json") else { throw CocoaError(.fileNoSuchFile) }
        return try JSONDecoder().decode(ContentBundle.self, from: Data(contentsOf: url))
    }
}
