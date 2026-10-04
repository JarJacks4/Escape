import Foundation

/// Everything the app asks the backend. `APIClient` talks to the real server;
/// `MockSoundscapesAPI` answers from the bundled Figma seed (previews, tests, offline demos).
/// One method per endpoint in shared/openapi.yaml, in the same order.
@available(iOS 17.0, *)
public protocol SoundscapesAPI: Sendable {
    // Home
    func content() async throws -> ContentBundle
    func home(_ q: InputsQuery) async throws -> Home
    func inputsNow(_ q: InputsQuery) async throws -> InputsNow
    // Me
    func me() async throws -> Profile
    func updateProfile(firstName: String?, tz: String?) async throws -> Profile
    func deleteAccount() async throws
    func experiments() async throws -> Experiments
    func preferences() async throws -> Preferences
    func updatePreferences(_ patch: PreferencesPatch) async throws -> Preferences
    func completeOnboarding() async throws
    // Inputs
    func inputs() async throws -> InputsResponse
    func setInput(_ id: InputSetting.Kind, enabled: Bool) async throws -> InputSetting
    func deleteInputHistory() async throws
    func postMoodCheckIn(value: Double, tags: [String], source: String) async throws -> MoodCheckIn
    func latestMoodCheckIn() async throws -> MoodCheckIn?
    func latestMoodScan() async throws -> MoodScan?
    // Catalog
    func modes() async throws -> [Mode]
    func browse(_ mode: ModeId) async throws -> BrowsePage
    func catalog(mode: String) async throws -> [BrowseCard]
    func journeys() async throws -> [Journey]
    func journey(_ id: String) async throws -> Journey
    func startJourney(_ id: String) async throws -> JourneyStart
    func whisperTopics() async throws -> [WhisperTopic]
    func visualPresets(mode: ModeId?) async throws -> [VisualPreset]
    func premiumPlans() async throws -> PremiumPlans
    // Compositions
    func dailyDrop() async throws -> DailyDrop
    func compose(_ req: ComposeRequest) async throws -> ComposeAccepted
    func myCompositions(limit: Int) async throws -> [Composition]
    func composition(_ id: String) async throws -> Composition
    func variation(of id: String) async throws -> ComposeAccepted
    func retune(_ id: String, moodField: MoodField) async throws -> ComposeAccepted
    // Library + playlists
    func library(_ filter: LibraryFilter?) async throws -> [LibraryItem]
    func save(compositionId: String, offline: Bool) async throws -> LibraryItem
    func setOffline(itemId: String, offline: Bool) async throws -> LibraryItem
    func removeFromLibrary(itemId: String) async throws
    func saveMemory(sessionId: String, title: String?) async throws -> LibraryItem
    func playlists() async throws -> [PlaylistSummary]
    func playlist(_ id: String) async throws -> Playlist
    func setLike(playlistId: String, trackId: String, liked: Bool) async throws
    // Circles
    func circles() async throws -> Circles
    func joinCircle(_ id: String) async throws -> CircleJoin
    func leaveCircle(_ id: String) async throws
    func setCircleReminder(_ id: String, on: Bool) async throws
    // Sessions
    func startSession(_ req: StartSessionRequest) async throws -> Session
    func completeSession(_ id: String, _ req: CompleteSessionRequest) async throws -> SessionResult
    func sendBetaFeedback(_ req: BetaFeedbackRequest) async throws
}

/// Query for /v1/home and /v1/inputs/now. Location and heart rate are only sent
/// when the matching input is on and permission was granted.
@available(iOS 17.0, *)
public struct InputsQuery: Hashable, Sendable {
    public var tz: String?
    public var lat: Double?
    public var lon: Double?
    public var heartBpm: Double?
    public init(tz: String? = TimeZone.current.identifier, lat: Double? = nil, lon: Double? = nil, heartBpm: Double? = nil) {
        self.tz = tz; self.lat = lat; self.lon = lon; self.heartBpm = heartBpm
    }
    var queryItems: [URLQueryItem] {
        var q: [URLQueryItem] = []
        if let tz { q.append(.init(name: "tz", value: tz)) }
        if let lat { q.append(.init(name: "lat", value: String(lat))) }
        if let lon { q.append(.init(name: "lon", value: String(lon))) }
        if let heartBpm { q.append(.init(name: "heartBpm", value: String(heartBpm))) }
        return q
    }
}

@available(iOS 17.0, *)
public enum APIError: Error, Equatable, Sendable {
    case unauthenticated
    /// 402: show PremiumSheet.
    case premiumRequired(String)
    case notFound(String)
    case invalid(String)
    case conflict(code: String, message: String)
    case server(status: Int, code: String, message: String)
    case transport(String)
    case decoding(String)

    /// Text that is safe to show in the UI.
    public var userMessage: String {
        switch self {
        case .unauthenticated: "Please sign in again."
        case .premiumRequired(let m), .notFound(let m), .invalid(let m): m
        case .conflict(_, let m): m
        case .server: "Something went wrong. Try again in a moment."
        case .transport: "You're offline. Check your connection."
        case .decoding: "The app needs an update to show this."
        }
    }
}
