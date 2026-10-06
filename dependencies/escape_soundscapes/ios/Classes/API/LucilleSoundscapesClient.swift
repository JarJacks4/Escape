import Foundation

/// The Escape app's existing Lucille endpoints (FlutterFlow: LucilleSoundscapesGroup + safety).
/// Same server, paths and JSON fields as the Flutter app, with the path variables filled in.
@available(iOS 17.0, *)
public struct LucilleSoundscape: Codable, Hashable, Identifiable, Sendable {
    public var soundscapeId: String
    public var category: String?
    public var title: String
    public var description: String?
    public var durationSeconds: Int?
    public var targetEmotions: [String]?
    public var targetContexts: [String]?
    public var audioUrl: URL?
    public var icon: String?
    public var id: String { soundscapeId }

    enum CodingKeys: String, CodingKey {
        case soundscapeId = "soundscape_id", category, title, description
        case durationSeconds = "duration_seconds", targetEmotions = "target_emotions"
        case targetContexts = "target_contexts", audioUrl = "audio_url", icon
    }
}

@available(iOS 17.0, *)
public struct LucilleSoundscapeList: Codable, Sendable {
    public var status: String?
    public var count: Int?
    public var soundscapes: [LucilleSoundscape]
}

@available(iOS 17.0, *)
public struct LucilleCategories: Codable, Sendable {
    public var total: Int?
    public var categories: [String: Int]   // music, binaural, meditation, ambient, nature
}

@available(iOS 17.0, *)
public struct LucilleRecommendations: Codable, Sendable {
    public var userId: String?
    public var detectedEmotion: String?
    public var recommendations: [LucilleSoundscape]
    enum CodingKeys: String, CodingKey { case userId = "user_id", detectedEmotion = "detected_emotion", recommendations }
}

@available(iOS 17.0, *)
public struct LucilleSafetyResult: Codable, Sendable {
    public struct Result: Codable, Sendable {
        public var riskLevel: String?
        public var crisisDetected: Bool?
        public var jailbreakDetected: Bool?
        public var helplinesNeeded: Bool?
        enum CodingKeys: String, CodingKey {
            case riskLevel = "risk_level", crisisDetected = "crisis_detected"
            case jailbreakDetected = "jailbreak_detected", helplinesNeeded = "helplines_needed"
        }
    }
    public var result: Result?
    public var isSafe: Bool { !(result?.crisisDetected ?? false) && !(result?.jailbreakDetected ?? false) }
}

@available(iOS 17.0, *)
public final class LucilleSoundscapesClient: @unchecked Sendable {
    /// Same server as FlutterFlow's LucilleSoundscapesGroup (no trailing slash).
    public static let production = URL(string: "https://lucille-861854898360.us-central1.run.app")!

    private let baseURL: URL
    private let userId: @Sendable () -> String?
    private let token: @Sendable () async -> String?
    private let session: URLSession

    /// `userId` is the Firebase uid (FlutterFlow's currentUserUid). `token` is sent as a Bearer
    /// header once the ML team turns on auth; until then the server ignores it.
    public init(baseURL: URL = LucilleSoundscapesClient.production, session: URLSession = .shared,
                userId: @escaping @Sendable () -> String?, token: @escaping @Sendable () async -> String? = { nil }) {
        self.baseURL = baseURL; self.session = session; self.userId = userId; self.token = token
    }

    private func seg(_ s: String) -> String {
        s.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed.subtracting(CharacterSet(charactersIn: "/"))) ?? s
    }

    private func uid() throws -> String {
        guard let u = userId(), !u.isEmpty else { throw APIError.unauthenticated }
        return seg(u)
    }

    private func call<T: Decodable>(_ method: String, _ path: String, query: [URLQueryItem] = [], body: [String: Any]? = nil) async throws -> T {
        var comps = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        comps.percentEncodedPath = "/" + path
        if !query.isEmpty { comps.queryItems = query }
        var req = URLRequest(url: comps.url!)
        req.httpMethod = method
        req.timeoutInterval = 20
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let t = await token() { req.setValue("Bearer \(t)", forHTTPHeaderField: "Authorization") }
        if let body { req.httpBody = try JSONSerialization.data(withJSONObject: body) }
        let (data, response): (Data, URLResponse)
        do { (data, response) = try await session.data(for: req) } catch { throw APIError.transport(error.localizedDescription) }
        let status = (response as? HTTPURLResponse)?.statusCode ?? 0
        guard (200..<300).contains(status) else {
            throw APIError.server(status: status, code: "lucille_\(status)", message: String(decoding: data.prefix(300), as: UTF8.self))
        }
        do { return try JSONDecoder().decode(T.self, from: data) } catch { throw APIError.decoding(String(describing: error)) }
    }

    private struct Raw: Decodable {}  // for endpoints whose body we don't need

    // GET /soundscapes?category=  (FlutterFlow sends "Category"; confirm the name with the ML team)
    public func soundscapes(category: String? = nil) async throws -> [LucilleSoundscape] {
        let list: LucilleSoundscapeList = try await call("GET", "soundscapes", query: category.map { [URLQueryItem(name: "category", value: $0)] } ?? [])
        return list.soundscapes
    }

    // GET /soundscapes/categories
    public func categories() async throws -> LucilleCategories { try await call("GET", "soundscapes/categories") }

    // GET /soundscapes/recommend/{user_id}?emotion=&exercise_id=
    public func recommended(emotion: String?, exerciseId: String? = nil) async throws -> LucilleRecommendations {
        var q: [URLQueryItem] = []
        if let emotion, !emotion.isEmpty { q.append(URLQueryItem(name: "emotion", value: emotion)) }
        if let exerciseId, !exerciseId.isEmpty { q.append(URLQueryItem(name: "exercise_id", value: exerciseId)) }
        return try await call("GET", "soundscapes/recommend/\(try uid())", query: q)
    }

    // GET /soundscapes/{soundscape_id}
    public func details(_ id: String) async throws -> LucilleSoundscape { try await call("GET", "soundscapes/\(seg(id))") }

    // GET /soundscapes/{soundscape_id}/audio  (streamed; hand the URL to AVPlayer)
    public func audioURL(_ id: String) -> URL { baseURL.appendingPathComponent("soundscapes").appendingPathComponent(id).appendingPathComponent("audio") }

    // POST /soundscapes/{user_id}/start  {"soundscape_id": …}  → session_id
    public func start(_ soundscapeId: String) async throws -> String? {
        struct Started: Decodable { var session_id: String? }
        let r: Started = try await call("POST", "soundscapes/\(try uid())/start", body: ["soundscape_id": soundscapeId])
        return r.session_id
    }

    // POST /soundscapes/{user_id}/stop/{session_id}
    public func stop(sessionId: String) async throws {
        let _: Raw = try await call("POST", "soundscapes/\(try uid())/stop/\(seg(sessionId))")
    }

    // GET /soundscapes/{user_id}/history  → Library "Recently played"
    public func history() async throws -> [[String: String]] {
        struct H: Decodable { var sessions: [[String: LooseString]]? }
        let h: H = try await call("GET", "soundscapes/\(try uid())/history")
        return (h.sessions ?? []).map { $0.mapValues(\.value) }
    }

    // POST /safety/check  {"text", "check_type"}  → run on every Compose prompt before sending it
    public func safetyCheck(_ text: String) async throws -> LucilleSafetyResult {
        try await call("POST", "safety/check", body: ["text": text, "check_type": "input"])
    }
}

/// Decodes any JSON scalar as a string (history rows have mixed types).
@available(iOS 17.0, *)
struct LooseString: Decodable {
    var value: String
    init(from d: Decoder) throws {
        let c = try d.singleValueContainer()
        if let s = try? c.decode(String.self) { value = s }
        else if let i = try? c.decode(Int.self) { value = String(i) }
        else if let x = try? c.decode(Double.self) { value = String(x) }
        else if let b = try? c.decode(Bool.self) { value = String(b) }
        else { value = "" }
    }
}

@available(iOS 17.0, *)
extension LucilleSoundscape {
    /// Lucille → the app's Composition model, so NowPlaying, the player and Library work unchanged.
    /// One mixed file = one looping "body" segment (SegmentScheduler already loops a single body).
    public func asComposition(client: LucilleSoundscapesClient) -> Composition {
        let mode = ModeId.fromLucille(category: category, contexts: targetContexts)
        let url = audioUrl ?? client.audioURL(soundscapeId)
        let now = ISO8601DateFormatter().string(from: Date())
        return Composition(compositionId: soundscapeId, ownerUid: nil, status: .ready, mode: mode, title: title,
                           subtitle: description, whyHeadline: nil, whyThisSound: description,
                           segments: [AudioSegment(role: .body, url: url, durationSec: Double(durationSeconds ?? 300))],
                           visual: nil, visualPresetId: nil, gradient: GradientSpec.forLucille(category: category),
                           artist: "Lucille", source: "catalog",
                           durationLabel: durationSeconds.map { "\(max(1, $0 / 60)) min" } ?? "Endless",
                           minutes: durationSeconds.map { $0 / 60 }, brainwave: nil, moodField: nil, parentId: nil,
                           failReason: nil, prompt: nil, recipe: nil, createdAt: now, readyAt: now)
    }
}

@available(iOS 17.0, *)
extension LucilleSoundscape {
    /// Lucille → a Browse card (ModeBrowse, Home rows). Premium gating stays in the app for now.
    public func asBrowseCard(locked: Bool = false) -> BrowseCard {
        BrowseCard(id: soundscapeId, compositionId: soundscapeId, title: title, description: description ?? "",
                   mode: category?.capitalized ?? "", gradient: GradientSpec.forLucille(category: category),
                   isPremium: false, locked: locked, seasonal: nil, isNew: nil)
    }
}

@available(iOS 17.0, *)
extension ModeId {
    /// Figma modes ↔ Lucille categories/contexts. Confirm the context words with the ML team.
    public static func fromLucille(category: String?, contexts: [String]?) -> ModeId {
        let words = Set(([category ?? ""] + (contexts ?? [])).map { $0.lowercased() })
        if words.contains("sleep") { return .sleep }
        if words.contains("focus") || words.contains("binaural") { return .focus }
        if words.contains("movement") || words.contains("exercise") { return .move }
        if words.contains("nature") || words.contains("meditation") || words.contains("calm") { return .calm }
        if words.contains("ambient") { return .noise }
        return .picks
    }

    /// Lucille category to query for a Figma mode's Browse page (nil = all, then filter by contexts).
    public var lucilleCategory: String? {
        switch self {
        case .focus: "binaural"
        case .calm: "meditation"
        case .noise: "ambient"
        case .realms: "nature"
        default: nil
        }
    }
}

@available(iOS 17.0, *)
extension GradientSpec {
    static func forLucille(category: String?) -> GradientSpec {
        switch category?.lowercased() {
        case "nature": GradientSpec(colors: ["#39519F", "#101E43"])
        case "binaural": GradientSpec(colors: ["#EF7702", "#164395"])
        case "meditation": GradientSpec(colors: ["#8E7CD9", "#164395"])
        case "ambient": GradientSpec(colors: ["#B9A3F0", "#39519F"])
        default: GradientSpec(colors: ["#EF7702", "#8E7CD9"])
        }
    }
}
