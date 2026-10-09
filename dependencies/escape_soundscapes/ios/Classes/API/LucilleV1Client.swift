import Foundation

// Lucille v1 API (escape_api/ in LucilleLLM): Soundscapes AI, Mood Scan, Journal, Self-Care.
// The uid comes from the Firebase ID token, so there are no user ids in paths.
// LucilleSoundscapesClient (legacy /soundscapes) keeps working; move screens over one at a time.

@available(iOS 17.0, *)
public struct V1Orb: Codable, Hashable, Sendable {
    public var tone: String
    public var accent: String?
    public var orbHevc: String?
    public var orbH264: String?
    public var orbPoster: String?
    public var orbCard: String?
    public var background: String?
    public var bgHevc: String?
    public var bgH264: String?
    public var bgPoster: String?
    public var night: Bool?
}

@available(iOS 17.0, *)
public struct V1Loop: Codable, Hashable, Sendable {
    public var name: String
    public var hevc: String
    public var h264: String
    public var poster: String?
    public var card: String?
    public var offline: String?
}

@available(iOS 17.0, *)
public struct V1MoodField: Codable, Hashable, Sendable {
    public var energy: Double
    public var texture: Double
    public init(energy: Double, texture: Double) { self.energy = energy; self.texture = texture }
}

@available(iOS 17.0, *)
public struct V1Brainwave: Codable, Hashable, Sendable {
    public var type: String?
    public var hz: Double?
}

@available(iOS 17.0, *)
public struct V1TrackAudio: Codable, Hashable, Sendable {
    public var intro: String
    public var bodies: [String]
    public var outro: String
    public var preview: String?
    public var crossfadeSec: Double?
}

@available(iOS 17.0, *)
public struct V1Track: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var title: String
    public var category: String
    public var mode: String
    public var moodField: V1MoodField
    public var bpm: Double?
    public var key: String?
    public var brainwave: V1Brainwave?
    public var frequencyHz: Double?
    public var durationSec: Double?
    public var premium: Bool?
    public var headphones: Bool?
    public var aiLabel: String?
    public var audio: V1TrackAudio
    public var visual: V1Loop
    public var locked: Bool?
    public var disclaimer: String?
}

@available(iOS 17.0, *)
public struct V1Category: Codable, Hashable, Identifiable, Sendable {
    public var id: String
    public var label: String
    public var description: String
    public var icon: String
    public var color: String
    public var modes: [String]
    public var disclaimer: String?
    public var trackCount: Int?
}

@available(iOS 17.0, *)
public struct V1Categories: Codable, Sendable { public var categories: [V1Category] }
@available(iOS 17.0, *)
public struct V1TrackList: Codable, Sendable { public var items: [V1Track]; public var count: Int? }

@available(iOS 17.0, *)
public struct V1Pick: Codable, Sendable {
    public var mode: String
    public var why: String
    public var moodField: V1MoodField
    public var track: V1Track
    public var aiLabel: String?
}

@available(iOS 17.0, *)
public struct V1Deeplink: Codable, Hashable, Sendable {
    public var route: String
    public var path: String
    public var url: String
}

@available(iOS 17.0, *)
public struct V1Suggestion: Codable, Hashable, Sendable {
    public var activityId: String
    public var title: String
    public var kind: String
    public var minutes: Int
    public var deeplink: V1Deeplink
    public var why: String?
}

@available(iOS 17.0, *)
public struct V1Checkin: Codable, Hashable, Sendable {
    public var id: String
    public var word: String
    public var family: String
    public var tone: String
    public var valence: Double
    public var energy: Double
    public var bpm: Double?
    public var createdAt: String
}

@available(iOS 17.0, *)
public struct V1Safety: Codable, Hashable, Sendable {
    public var crisis: Bool
    public var riskLevel: String?
}

@available(iOS 17.0, *)
public struct V1CheckinResult: Codable, Sendable {
    public struct Lucille: Codable, Sendable { public var word: String; public var line: String }
    public var checkin: V1Checkin
    public var lucille: Lucille
    public var orb: V1Orb
    public var suggestions: [V1Suggestion]
    public var safety: V1Safety
    public var streakDays: Int
    public var coinsAwarded: Int
}

@available(iOS 17.0, *)
public struct V1MoodSummary: Codable, Sendable {
    public struct Mix: Codable, Hashable, Sendable { public var label: String; public var pct: Int; public var color: String }
    public struct Bar: Codable, Hashable, Sendable { public var label: String; public var h: Int; public var empty: Bool; public var c: String }
    public var period: String
    public var word: String
    public var tone: String
    public var size: Double
    public var big: Double
    public var caption: String
    public var sub: String
    public var entries: Int
    public var activeDays: Int
    public var pleasantPct: Int
    public var mix: [Mix]
    public var trend: [Bar]
    public var orb: V1Orb
}

@available(iOS 17.0, *)
public struct V1Session: Codable, Sendable {
    public struct Word: Codable, Sendable { public var word: String }
    public var id: String
    public var mode: String?
    public var trackId: String?
    public var startedAt: String?
    public var moodBefore: Word?
}

@available(iOS 17.0, *)
public struct V1SessionDone: Codable, Sendable {
    public var streakDays: Int
    public var coinsAwarded: Int
    public var moodBefore: V1Session.Word?
    public var moodAfter: V1Session.Word?
    public var showFeedbackCard: Bool?
}

@available(iOS 17.0, *)
public struct V1Inner: Codable, Sendable {
    public struct Weather: Codable, Sendable { public var available: Bool; public var tempC: Double?; public var bucket: String? }
    public var phase: String
    public var night: Bool
    public var weather: Weather?
}

@available(iOS 17.0, *)
public struct V1Composition: Codable, Sendable {
    public struct Segment: Codable, Sendable { public var role: String; public var url: String; public var durationSec: Double? }
    public var id: String
    public var status: String
    public var title: String?
    public var whyThisSound: String?
    public var segments: [Segment]?
    public var visual: V1Loop?
}

@available(iOS 17.0, *)
public final class LucilleV1Client: @unchecked Sendable {
    public static let production = URL(string: "https://lucille-861854898360.us-central1.run.app")!

    private let baseURL: URL
    private let token: @Sendable () async -> String?
    private let session: URLSession

    /// `token` returns the Firebase ID token (Auth.auth().currentUser?.getIDToken()). Required for v1.
    public init(baseURL: URL = LucilleV1Client.production, session: URLSession = .shared,
                token: @escaping @Sendable () async -> String?) {
        self.baseURL = baseURL; self.session = session; self.token = token
    }

    private func call<T: Decodable>(_ method: String, _ path: String, query: [URLQueryItem] = [],
                                    body: [String: Any]? = nil) async throws -> T {
        var comps = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        comps.percentEncodedPath = "/" + path
        if !query.isEmpty { comps.queryItems = query }
        var req = URLRequest(url: comps.url!)
        req.httpMethod = method
        req.timeoutInterval = 30
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue(TimeZone.current.identifier, forHTTPHeaderField: "X-Timezone")
        guard let t = await token(), !t.isEmpty else { throw APIError.unauthenticated }
        req.setValue("Bearer \(t)", forHTTPHeaderField: "Authorization")
        if let body { req.httpBody = try JSONSerialization.data(withJSONObject: body) }
        let (data, response): (Data, URLResponse)
        do { (data, response) = try await session.data(for: req) } catch { throw APIError.transport(error.localizedDescription) }
        let status = (response as? HTTPURLResponse)?.statusCode ?? 0
        guard (200..<300).contains(status) else {
            var code = "lucille_\(status)"
            if let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let detail = obj["detail"] as? [String: Any], let c = detail["code"] as? String {
                code = c == "consent_required" ? "consent_required:\(detail["purpose"] as? String ?? "")" : c
            }
            throw APIError.server(status: status, code: code, message: String(decoding: data.prefix(300), as: UTF8.self))
        }
        if T.self == Empty.self, data.isEmpty { return Empty() as! T }
        do { return try JSONDecoder().decode(T.self, from: data) } catch { throw APIError.decoding(String(describing: error)) }
    }

    public struct Empty: Decodable {}

    // MARK: Soundscapes

    public func categories() async throws -> [V1Category] {
        let r: V1Categories = try await call("GET", "v1/soundscapes/categories")
        return r.categories
    }

    public func catalog(category: String? = nil, mode: String? = nil, search: String? = nil) async throws -> [V1Track] {
        var q: [URLQueryItem] = []
        if let category { q.append(.init(name: "category", value: category)) }
        if let mode { q.append(.init(name: "mode", value: mode)) }
        if let search { q.append(.init(name: "q", value: search)) }
        let r: V1TrackList = try await call("GET", "v1/soundscapes/catalog", query: q)
        return r.items
    }

    public func track(_ id: String) async throws -> V1Track { try await call("GET", "v1/soundscapes/tracks/\(id)") }

    /// Play for right now (mode "picks") or the best match for a mode + Mood Field.
    public func pick(mode: String = "picks", field: V1MoodField? = nil, lat: Double? = nil, lon: Double? = nil) async throws -> V1Pick {
        var body: [String: Any] = ["mode": mode]
        if let field { body["moodField"] = ["energy": field.energy, "texture": field.texture] }
        if let lat, let lon { body["lat"] = lat; body["lon"] = lon }
        return try await call("POST", "v1/soundscapes/pick", body: body)
    }

    public func innerWeather(lat: Double? = nil, lon: Double? = nil) async throws -> V1Inner {
        var q: [URLQueryItem] = []
        if let lat, let lon { q = [.init(name: "lat", value: String(lat)), .init(name: "lon", value: String(lon))] }
        return try await call("GET", "v1/soundscapes/inputs-now", query: q)
    }

    public func visual(mode: String, field: V1MoodField) async throws -> V1Loop {
        try await call("GET", "v1/soundscapes/visual", query: [.init(name: "mode", value: mode),
                                                                .init(name: "energy", value: String(field.energy)),
                                                                .init(name: "texture", value: String(field.texture))])
    }

    public func startSession(trackId: String, mode: String, from: String = "mode", moodBefore: String? = nil) async throws -> V1Session {
        struct R: Decodable { var session: V1Session }
        var body: [String: Any] = ["trackId": trackId, "mode": mode, "startedFrom": from]
        if let moodBefore { body["moodBefore"] = moodBefore }
        let r: R = try await call("POST", "v1/soundscapes/sessions", body: body)
        return r.session
    }

    public func completeSession(_ id: String, minutes: Double, moodAfter: String? = nil) async throws -> V1SessionDone {
        var body: [String: Any] = ["minutes": minutes, "completed": true]
        if let moodAfter { body["moodAfter"] = moodAfter }
        return try await call("POST", "v1/soundscapes/sessions/\(id)/complete", body: body)
    }

    public func compose(prompt: String, mode: String, minutes: Int, brainwave: String?, field: V1MoodField) async throws -> String {
        struct R: Decodable { var compositionId: String }
        var body: [String: Any] = ["prompt": prompt, "mode": mode, "minutes": minutes,
                                   "moodField": ["energy": field.energy, "texture": field.texture]]
        if let brainwave { body["brainwave"] = brainwave }
        let r: R = try await call("POST", "v1/soundscapes/compose", body: body)
        return r.compositionId
    }

    public func composition(_ id: String) async throws -> V1Composition { try await call("GET", "v1/soundscapes/compositions/\(id)") }

    public func save(_ id: String) async throws { let _: Empty = try await call("PUT", "v1/soundscapes/library/\(id)") }

    // MARK: Mood

    /// Mood Scan result: any mix of tapped word / Mood Field, voice text and pulse.
    public func checkIn(word: String? = nil, valence: Double? = nil, energy: Double? = nil, text: String? = nil,
                        bpm: Double? = nil, source: String = "scan") async throws -> V1CheckinResult {
        var body: [String: Any] = ["source": source]
        if let word { body["word"] = word }
        if let valence, let energy { body["valence"] = valence; body["energy"] = energy }
        if let text { body["text"] = text }
        if let bpm { body["pulse"] = ["bpm": bpm] }
        return try await call("POST", "v1/mood/checkins", body: body)
    }

    public func moodSummary(period: String = "week") async throws -> V1MoodSummary {
        try await call("GET", "v1/mood/summary", query: [.init(name: "period", value: period)])
    }

    public func grantConsents(_ flags: [String: Bool]) async throws {
        let _: Empty = try await call("PUT", "v1/privacy/consents", body: ["flags": flags])
    }
}
