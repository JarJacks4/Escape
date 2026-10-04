import Foundation

/// URLSession client for the Escape Soundscapes API (shared/openapi.yaml).
///
///     let api = APIClient(baseURL: URL(string: "https://api.escapeapp.ai")!) {
///         try await Auth.auth().currentUser?.getIDToken()     // Firebase
///     }
///
/// Against `npm run dev` use `APIClient.dev()`; it signs in as the Figma seed user.
@available(iOS 17.0, *)
public final class APIClient: SoundscapesAPI, @unchecked Sendable {
    public typealias TokenProvider = @Sendable () async throws -> String?

    public let baseURL: URL
    private let token: TokenProvider
    private let session: URLSession
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    public init(baseURL: URL, session: URLSession = .shared, token: @escaping TokenProvider) {
        self.baseURL = baseURL
        self.session = session
        self.token = token
    }

    /// Local backend with dev auth ("Bearer dev:<uid>").
    public static func dev(baseURL: URL = URL(string: "http://localhost:8080")!, uid: String = "dev-jared") -> APIClient {
        APIClient(baseURL: baseURL) { "dev:\(uid)" }
    }

    // MARK: Transport

    private struct Empty: Codable {}

    private func request(_ method: String, _ path: String, query: [URLQueryItem] = [], body: Data? = nil) async throws -> (Data, HTTPURLResponse) {
        // `path` segments are already percent-escaped (see esc), so set the encoded path directly.
        var comps = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        let basePath = comps.percentEncodedPath.hasSuffix("/") ? String(comps.percentEncodedPath.dropLast()) : comps.percentEncodedPath
        comps.percentEncodedPath = basePath + "/" + path
        if !query.isEmpty { comps.queryItems = query }
        var req = URLRequest(url: comps.url!)
        req.httpMethod = method
        req.timeoutInterval = 20
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        if let body {
            req.httpBody = body
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        if let t = try await token() { req.setValue("Bearer \(t)", forHTTPHeaderField: "Authorization") }

        let data: Data, response: URLResponse
        do { (data, response) = try await session.data(for: req) }
        catch { throw APIError.transport(error.localizedDescription) }
        guard let http = response as? HTTPURLResponse else { throw APIError.transport("No HTTP response") }
        guard (200..<300).contains(http.statusCode) else { throw Self.mapError(status: http.statusCode, data: data) }
        return (data, http)
    }

    static func mapError(status: Int, data: Data) -> APIError {
        let body = try? JSONDecoder().decode(APIErrorBody.self, from: data)
        let code = body?.error.code ?? "http_\(status)"
        let message = body?.error.message ?? HTTPURLResponse.localizedString(forStatusCode: status)
        switch status {
        case 401: return .unauthenticated
        case 402: return .premiumRequired(message)
        case 404: return .notFound(message)
        case 400: return .invalid(message)
        case 409: return .conflict(code: code, message: message)
        default: return .server(status: status, code: code, message: message)
        }
    }

    private func send<T: Decodable>(_ method: String, _ path: String, query: [URLQueryItem] = [], as: T.Type = T.self) async throws -> T {
        let (data, _) = try await request(method, path, query: query)
        return try decode(data)
    }

    private func send<T: Decodable, B: Encodable>(_ method: String, _ path: String, body: B, as: T.Type = T.self) async throws -> T {
        let (data, _) = try await request(method, path, body: try encoder.encode(body))
        return try decode(data)
    }

    private func sendNoContent<B: Encodable>(_ method: String, _ path: String, body: B) async throws {
        _ = try await request(method, path, body: try encoder.encode(body))
    }

    private func sendNoContent(_ method: String, _ path: String) async throws {
        _ = try await request(method, path)
    }

    private func decode<T: Decodable>(_ data: Data) throws -> T {
        do { return try decoder.decode(T.self, from: data) }
        catch { throw APIError.decoding(String(describing: error)) }
    }

    /// Endpoints that may answer JSON `null`.
    private func sendOptional<T: Decodable>(_ path: String) async throws -> T? {
        let (data, _) = try await request("GET", path)
        if data.isEmpty || String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines) == "null" { return nil }
        return try decode(data) as T
    }

    private func esc(_ s: String) -> String { s.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed.subtracting(CharacterSet(charactersIn: "/"))) ?? s }

    // MARK: Home
    public func content() async throws -> ContentBundle { try await send("GET", "v1/content") }
    public func home(_ q: InputsQuery) async throws -> Home { try await send("GET", "v1/home", query: q.queryItems) }
    public func inputsNow(_ q: InputsQuery) async throws -> InputsNow { try await send("GET", "v1/inputs/now", query: q.queryItems) }

    // MARK: Me
    private struct ProfilePatch: Encodable { var firstName: String?; var tz: String? }
    public func me() async throws -> Profile { try await send("GET", "v1/me") }
    public func updateProfile(firstName: String?, tz: String?) async throws -> Profile {
        try await send("PATCH", "v1/me", body: ProfilePatch(firstName: firstName, tz: tz))
    }
    public func deleteAccount() async throws { try await sendNoContent("DELETE", "v1/me") }
    public func experiments() async throws -> Experiments { try await send("GET", "v1/experiments") }
    public func preferences() async throws -> Preferences { try await send("GET", "v1/me/preferences") }
    public func updatePreferences(_ patch: PreferencesPatch) async throws -> Preferences { try await send("PATCH", "v1/me/preferences", body: patch) }
    public func completeOnboarding() async throws { try await sendNoContent("POST", "v1/me/onboarding/complete", body: Empty()) }

    // MARK: Inputs
    private struct Enabled: Encodable { var enabled: Bool }
    private struct CheckInBody: Encodable { var value: Double; var tags: [String]; var source: String }
    public func inputs() async throws -> InputsResponse { try await send("GET", "v1/me/inputs") }
    public func setInput(_ id: InputSetting.Kind, enabled: Bool) async throws -> InputSetting {
        try await send("PUT", "v1/me/inputs/\(id.rawValue)", body: Enabled(enabled: enabled))
    }
    public func deleteInputHistory() async throws { try await sendNoContent("DELETE", "v1/me/inputs/history") }
    public func postMoodCheckIn(value: Double, tags: [String], source: String) async throws -> MoodCheckIn {
        try await send("POST", "v1/me/mood-checkins", body: CheckInBody(value: value, tags: tags, source: source))
    }
    public func latestMoodCheckIn() async throws -> MoodCheckIn? { try await sendOptional("v1/me/mood-checkins/latest") }
    public func latestMoodScan() async throws -> MoodScan? { try await sendOptional("v1/me/mood-scan/latest") }

    // MARK: Catalog
    public func modes() async throws -> [Mode] { try await send("GET", "v1/modes") }
    public func browse(_ mode: ModeId) async throws -> BrowsePage { try await send("GET", "v1/browse/\(mode.rawValue)") }
    public func catalog(mode: String) async throws -> [BrowseCard] { try await send("GET", "v1/catalog", query: [.init(name: "mode", value: mode)]) }
    public func journeys() async throws -> [Journey] { try await send("GET", "v1/journeys") }
    public func journey(_ id: String) async throws -> Journey { try await send("GET", "v1/journeys/\(esc(id))") }
    public func startJourney(_ id: String) async throws -> JourneyStart { try await send("POST", "v1/journeys/\(esc(id))/start", body: Empty()) }
    public func whisperTopics() async throws -> [WhisperTopic] { try await send("GET", "v1/whisper/topics") }
    public func visualPresets(mode: ModeId?) async throws -> [VisualPreset] {
        try await send("GET", "v1/visual-presets", query: mode.map { [.init(name: "mode", value: $0.rawValue)] } ?? [])
    }
    public func premiumPlans() async throws -> PremiumPlans { try await send("GET", "v1/premium/plans") }

    // MARK: Compositions
    private struct RetuneBody: Encodable { var moodField: MoodField }
    public func dailyDrop() async throws -> DailyDrop { try await send("GET", "v1/daily-drop") }
    public func compose(_ req: ComposeRequest) async throws -> ComposeAccepted { try await send("POST", "v1/compose", body: req) }
    public func myCompositions(limit: Int) async throws -> [Composition] {
        try await send("GET", "v1/compositions", query: [.init(name: "limit", value: String(limit))])
    }
    public func composition(_ id: String) async throws -> Composition { try await send("GET", "v1/compositions/\(esc(id))") }
    public func variation(of id: String) async throws -> ComposeAccepted { try await send("POST", "v1/compositions/\(esc(id))/variation", body: Empty()) }
    public func retune(_ id: String, moodField: MoodField) async throws -> ComposeAccepted {
        try await send("POST", "v1/compositions/\(esc(id))/retune", body: RetuneBody(moodField: moodField))
    }

    // MARK: Library + playlists
    private struct SaveBody: Encodable { var compositionId: String; var kind = "saved"; var offline: Bool }
    private struct OfflineBody: Encodable { var offline: Bool }
    private struct MemoryBody: Encodable { var sessionId: String; var title: String? }
    private struct LikeBody: Encodable { var liked: Bool }
    public func library(_ filter: LibraryFilter?) async throws -> [LibraryItem] {
        try await send("GET", "v1/library", query: filter.map { [.init(name: "kind", value: $0.rawValue)] } ?? [])
    }
    public func save(compositionId: String, offline: Bool) async throws -> LibraryItem {
        try await send("POST", "v1/library", body: SaveBody(compositionId: compositionId, offline: offline))
    }
    public func setOffline(itemId: String, offline: Bool) async throws -> LibraryItem {
        try await send("PATCH", "v1/library/\(esc(itemId))", body: OfflineBody(offline: offline))
    }
    public func removeFromLibrary(itemId: String) async throws { try await sendNoContent("DELETE", "v1/library/\(esc(itemId))") }
    public func saveMemory(sessionId: String, title: String?) async throws -> LibraryItem {
        try await send("POST", "v1/memories", body: MemoryBody(sessionId: sessionId, title: title))
    }
    public func playlists() async throws -> [PlaylistSummary] { try await send("GET", "v1/playlists") }
    public func playlist(_ id: String) async throws -> Playlist { try await send("GET", "v1/playlists/\(esc(id))") }
    public func setLike(playlistId: String, trackId: String, liked: Bool) async throws {
        try await sendNoContent("PUT", "v1/playlists/\(esc(playlistId))/tracks/\(esc(trackId))/like", body: LikeBody(liked: liked))
    }

    // MARK: Circles
    private struct ReminderBody: Encodable { var on: Bool }
    public func circles() async throws -> Circles { try await send("GET", "v1/circles") }
    public func joinCircle(_ id: String) async throws -> CircleJoin { try await send("POST", "v1/circles/\(esc(id))/join", body: Empty()) }
    public func leaveCircle(_ id: String) async throws { try await sendNoContent("POST", "v1/circles/\(esc(id))/leave", body: Empty()) }
    public func setCircleReminder(_ id: String, on: Bool) async throws {
        try await sendNoContent("PUT", "v1/circles/\(esc(id))/reminder", body: ReminderBody(on: on))
    }

    // MARK: Sessions
    public func startSession(_ req: StartSessionRequest) async throws -> Session { try await send("POST", "v1/sessions/start", body: req) }
    public func completeSession(_ id: String, _ req: CompleteSessionRequest) async throws -> SessionResult {
        try await send("POST", "v1/sessions/\(esc(id))/complete", body: req)
    }
    public func sendBetaFeedback(_ req: BetaFeedbackRequest) async throws { try await sendNoContent("POST", "v1/beta-feedback", body: req) }
}
