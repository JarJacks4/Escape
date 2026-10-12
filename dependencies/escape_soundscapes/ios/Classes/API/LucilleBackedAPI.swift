import Foundation

/// Lucille v1 catalog for Browse and Now Playing; everything else is answered by the bundled mock
/// (Home, inputs, Library list, preferences…), so the beta keeps working while the rest moves over.
///
/// Catalog tracks get compositionId "lv1:<trackId>". Sessions always run on the mock (so the timer,
/// streak and Session Complete keep working) and are mirrored to v1 when that call succeeds.
@available(iOS 17.0, *)
public actor LucilleBackedAPI: SoundscapesAPI {
    static let prefix = "lv1:"

    private let mock: MockSoundscapesAPI
    private let v1: LucilleV1Client
    private var tracks: [String: V1Track] = [:]
    private var categoryInfo: [String: V1Category] = [:]
    private var v1Sessions: [String: String] = [:]   // mock session id -> v1 session id
    private var sessionTracks: [String: String] = [:] // mock session id -> Lucille track id
    private let firstName: String
    private var nameApplied = false

    public init(mock: MockSoundscapesAPI, client: LucilleV1Client, firstName: String? = nil) {
        self.mock = mock
        self.v1 = client
        let trimmed = firstName?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        self.firstName = trimmed.isEmpty ? "friend" : trimmed
    }

    /// The mock's seed user is "Jared": swap in the tester's name before anything reads it.
    private func applyName() async {
        guard !nameApplied else { return }
        nameApplied = true
        _ = try? await mock.updateProfile(firstName: firstName, tz: nil)
    }

    static func trackId(_ compositionId: String) -> String? {
        compositionId.hasPrefix(prefix) ? String(compositionId.dropFirst(prefix.count)) : nil
    }

    // MARK: - Catalog (v1)

    /// Every mode open: no Lucille or Epidemic track sits behind a paywall in the beta.
    public func modes() async throws -> [Mode] {
        try await mock.modes().map { m in
            var m = m
            m.premium = false
            m.locked = false
            return m
        }
    }

    public func browse(_ mode: ModeId) async throws -> BrowsePage {
        let base = try? await mock.browse(mode)
        let list: [V1Track]
        do {
            list = try await v1Tracks(for: mode)
        } catch {
            if let base { return base }   // offline / server error: keep the bundled page
            throw error
        }
        await loadCategories()
        for t in list { tracks[t.id] = t }
        let title = base?.title ?? mode.title
        let cards = list.map { t in
            BrowseCard(id: t.id, compositionId: Self.prefix + t.id, title: t.title,
                       description: description(of: t), mode: title, gradient: gradient(for: t),
                       isPremium: false, locked: false, seasonal: nil, isNew: nil)
        }
        return BrowsePage(mode: mode, title: title, tagline: base?.tagline ?? "",
                          background: base?.background ?? "", chipsLabel: base?.chipsLabel ?? "",
                          journeys: [], cards: cards)
    }

    public func catalog(mode: String) async throws -> [BrowseCard] {
        try await browse(ModeId(loose: mode) ?? .calm).cards
    }

    public func composition(_ id: String) async throws -> Composition {
        guard let tid = Self.trackId(id) else { return try await mock.composition(id) }
        return try await lucilleComposition(tid)
    }

    /// v1 catalog modes are focus / calm / sleep / move. The module's other modes map to categories.
    private func v1Tracks(for mode: ModeId) async throws -> [V1Track] {
        switch mode {
        case .focus, .calm, .sleep, .move:
            return try await v1.catalog(mode: mode.rawValue)
        case .picks:
            return try await v1.catalog()
        case .noise:
            var out: [V1Track] = []
            for c in ["binaural_beats", "brainwave_music", "raw_frequencies"] {
                out += try await v1.catalog(category: c)
            }
            return out
        case .realms:
            return try await v1.catalog(category: "nature")
        }
    }

    private func loadCategories() async {
        guard categoryInfo.isEmpty, let list = try? await v1.categories() else { return }
        categoryInfo = Dictionary(list.map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })
    }

    private func description(of t: V1Track) -> String {
        let label = categoryInfo[t.category]?.label ?? t.category.replacingOccurrences(of: "_", with: " ").capitalized
        let minutes = Int(((t.durationSec ?? 1800) / 60).rounded())
        return "\(label) · \(minutes) min"
    }

    private func gradient(for t: V1Track) -> GradientSpec {
        guard let c = categoryInfo[t.category]?.color, c.hasPrefix("#") else { return .fallback }
        return GradientSpec(colors: [c, "#101E43"])
    }

    private func lucilleComposition(_ tid: String) async throws -> Composition {
        let t: V1Track
        if let cached = tracks[tid] {
            t = cached
        } else {
            t = try await v1.track(tid)
            tracks[tid] = t
        }
        await loadCategories()
        return try Self.composition(from: t, subtitle: categoryInfo[t.category]?.label, gradient: gradient(for: t))
    }

    /// Built through JSON so it doesn't depend on Composition's memberwise init.
    /// Durations are estimates (intro ~45 s, bodies ~2.7 min, outro ~1 min at 160 kb/s);
    /// the player moves on when each item actually ends.
    static func composition(from t: V1Track, subtitle: String?, gradient: GradientSpec) throws -> Composition {
        func seg(_ role: String, _ url: String, _ sec: Double) -> [String: Any] {
            ["role": role, "url": url, "durationSec": sec]
        }
        var segments = [seg("intro", t.audio.intro, 45)]
        segments += t.audio.bodies.map { seg("body", $0, 160) }
        segments.append(seg("outro", t.audio.outro, 60))
        let minutes = Int(((t.durationSec ?? 1800) / 60).rounded())
        let now = ISO8601DateFormatter().string(from: Date())
        var d: [String: Any] = [
            "compositionId": prefix + t.id,
            "status": "ready",
            "mode": (ModeId(rawValue: t.mode) ?? .calm).rawValue,
            "title": t.title,
            "segments": segments,
            "artist": "Lucille",
            "source": "lucille_v1",
            "durationLabel": "\(minutes) min",
            "minutes": minutes,
            "moodField": ["energy": t.moodField.energy, "texture": t.moodField.texture],
            "gradient": ["colors": gradient.colors, "angle": gradient.angle],
            "createdAt": now,
            "readyAt": now,
        ]
        d["subtitle"] = "\(subtitle ?? t.category.replacingOccurrences(of: "_", with: " ").capitalized) · \(minutes) min"
        let data = try JSONSerialization.data(withJSONObject: d)
        do {
            return try JSONDecoder().decode(Composition.self, from: data)
        } catch {
            throw APIError.decoding("Lucille track \(t.id): \(error)")
        }
    }

    // MARK: - Sessions (mock, mirrored to v1)

    public func startSession(_ req: StartSessionRequest) async throws -> Session {
        let s = try await mock.startSession(req)
        if let cid = req.compositionId, let tid = Self.trackId(cid) {
            sessionTracks[s.sessionId] = tid
            let mode = tracks[tid]?.mode ?? req.mode.rawValue
            if let v = try? await v1.startSession(trackId: tid, mode: mode) {
                v1Sessions[s.sessionId] = v.id
            }
        }
        return s
    }

    public func completeSession(_ id: String, _ req: CompleteSessionRequest) async throws -> SessionResult {
        var r = try await mock.completeSession(id, req)
        if let vid = v1Sessions.removeValue(forKey: id),
           let done = try? await v1.completeSession(vid, minutes: req.minutes ?? Double(r.minutes)) {
            r.streakDays = done.streakDays
            r.shardsEarned = done.coinsAwarded
        }
        return r
    }

    // MARK: - Library

    public func save(compositionId: String, offline: Bool) async throws -> LibraryItem {
        if let tid = Self.trackId(compositionId) {
            await mock.register(try await lucilleComposition(tid))
            let client = v1
            Task { try? await client.save(tid) }   // mirrors to v1 once per-user writes work
        }
        return try await mock.save(compositionId: compositionId, offline: offline)
    }

    // MARK: - Not available for Lucille tracks yet

    /// Variation on a Lucille track: another track in the same mode.
    public func variation(of id: String) async throws -> ComposeAccepted {
        guard let tid = Self.trackId(id) else { return try await mock.variation(of: id) }
        let pool = try await sameModeTracks(as: tid).filter { $0.id != tid }
        guard let next = pool.randomElement() else { return try await accepted(tid) }
        return try await accepted(next.id)
    }

    /// Mood Field "Update soundscape" on a Lucille track: the same-mode track whose Mood Field is
    /// closest to the one chosen (v1 tracks carry energy/texture), crossfaded in by the store.
    public func retune(_ id: String, moodField: MoodField) async throws -> ComposeAccepted {
        guard let tid = Self.trackId(id) else { return try await mock.retune(id, moodField: moodField) }
        let pool = try await sameModeTracks(as: tid)
        guard let best = Self.nearestTrack(in: pool, to: moodField, avoiding: tid) else { return try await accepted(tid) }
        return try await accepted(best.id)
    }

    private func sameModeTracks(as tid: String) async throws -> [V1Track] {
        let current: V1Track
        if let t = tracks[tid] { current = t } else { current = try await v1.track(tid); tracks[tid] = current }
        let list = try await v1.catalog(mode: current.mode)
        for t in list { tracks[t.id] = t }
        return list
    }

    /// Closest by Mood Field distance; skips the current track unless it's the only one.
    static func nearestTrack(in pool: [V1Track], to f: MoodField, avoiding tid: String) -> V1Track? {
        func d(_ t: V1Track) -> Double {
            let de = t.moodField.energy - f.energy, dt = t.moodField.texture - f.texture
            return de * de + dt * dt
        }
        let others = pool.filter { $0.id != tid }
        return (others.isEmpty ? pool : others).min { d($0) < d($1) }
    }

    private func accepted(_ tid: String) async throws -> ComposeAccepted {
        let c = try await lucilleComposition(tid)
        return ComposeAccepted(compositionId: c.compositionId, status: .ready, etaSec: 0, composition: c)
    }

    // MARK: - Everything else: the mock

    public func content() async throws -> ContentBundle { try await mock.content() }
    public func home(_ q: InputsQuery) async throws -> Home { await applyName(); return try await mock.home(q) }
    public func inputsNow(_ q: InputsQuery) async throws -> InputsNow { try await mock.inputsNow(q) }
    public func me() async throws -> Profile { await applyName(); return try await mock.me() }
    public func updateProfile(firstName: String?, tz: String?) async throws -> Profile { try await mock.updateProfile(firstName: firstName, tz: tz) }
    public func deleteAccount() async throws { try await mock.deleteAccount() }
    public func experiments() async throws -> Experiments { try await mock.experiments() }
    public func preferences() async throws -> Preferences { try await mock.preferences() }
    public func updatePreferences(_ patch: PreferencesPatch) async throws -> Preferences { try await mock.updatePreferences(patch) }
    public func completeOnboarding() async throws { try await mock.completeOnboarding() }
    public func inputs() async throws -> InputsResponse { try await mock.inputs() }
    public func setInput(_ id: InputSetting.Kind, enabled: Bool) async throws -> InputSetting { try await mock.setInput(id, enabled: enabled) }
    public func deleteInputHistory() async throws { try await mock.deleteInputHistory() }
    public func postMoodCheckIn(value: Double, tags: [String], source: String) async throws -> MoodCheckIn { try await mock.postMoodCheckIn(value: value, tags: tags, source: source) }
    public func latestMoodCheckIn() async throws -> MoodCheckIn? { try await mock.latestMoodCheckIn() }
    public func latestMoodScan() async throws -> MoodScan? { try await mock.latestMoodScan() }
    public func journeys() async throws -> [Journey] { try await mock.journeys() }
    public func journey(_ id: String) async throws -> Journey { try await mock.journey(id) }
    public func startJourney(_ id: String) async throws -> JourneyStart { try await mock.startJourney(id) }
    public func whisperTopics() async throws -> [WhisperTopic] { try await mock.whisperTopics() }
    public func visualPresets(mode: ModeId?) async throws -> [VisualPreset] { try await mock.visualPresets(mode: mode) }
    public func premiumPlans() async throws -> PremiumPlans { try await mock.premiumPlans() }
    public func dailyDrop() async throws -> DailyDrop { try await mock.dailyDrop() }
    public func compose(_ req: ComposeRequest) async throws -> ComposeAccepted { try await mock.compose(req) }
    public func myCompositions(limit: Int) async throws -> [Composition] { try await mock.myCompositions(limit: limit) }
    public func library(_ filter: LibraryFilter?) async throws -> [LibraryItem] { try await mock.library(filter) }
    public func setOffline(itemId: String, offline: Bool) async throws -> LibraryItem { try await mock.setOffline(itemId: itemId, offline: offline) }
    public func removeFromLibrary(itemId: String) async throws { try await mock.removeFromLibrary(itemId: itemId) }
    public func saveMemory(sessionId: String, title: String?) async throws -> LibraryItem {
        if let tid = sessionTracks[sessionId] {
            await mock.register(try await lucilleComposition(tid))
        }
        return try await mock.saveMemory(sessionId: sessionId, title: title)
    }
    public func playlists() async throws -> [PlaylistSummary] { try await mock.playlists() }
    public func playlist(_ id: String) async throws -> Playlist { try await mock.playlist(id) }
    public func setLike(playlistId: String, trackId: String, liked: Bool) async throws { try await mock.setLike(playlistId: playlistId, trackId: trackId, liked: liked) }
    public func circles() async throws -> Circles { try await mock.circles() }
    public func joinCircle(_ id: String) async throws -> CircleJoin { try await mock.joinCircle(id) }
    public func leaveCircle(_ id: String) async throws { try await mock.leaveCircle(id) }
    public func setCircleReminder(_ id: String, on: Bool) async throws { try await mock.setCircleReminder(id, on: on) }
    public func sendBetaFeedback(_ req: BetaFeedbackRequest) async throws { try await mock.sendBetaFeedback(req) }
}
