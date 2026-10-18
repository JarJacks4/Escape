import CoreLocation
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
        case .realms, .nature:
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

    // MARK: - Mood Scan

    /// Mood Scan result -> Lucille v1 mood check-in (POST /v1/mood/checkins).
    public func checkIn(word: String, valence: Double, energy: Double, text: String?) async throws {
        _ = try await v1.checkIn(word: word, valence: valence, energy: energy, text: text)
    }

    /// Same, with the measured pulse (nil when skipped). Returns the coins the server awarded.
    public func checkIn(word: String, valence: Double, energy: Double, text: String?, bpm: Int?) async throws -> Int {
        let r = try await v1.checkIn(word: word, valence: valence, energy: energy, text: text,
                                     bpm: bpm.map { Double($0) })
        return r.coinsAwarded
    }

    /// Records GDPR consents (e.g. ["wellbeing_data": true]) with Lucille v1.
    public func grantConsents(_ flags: [String: Bool]) async throws { try await v1.grantConsents(flags) }

    /// Lifetime Escape Coins (they set the Energy Scan level).
    public func lifetimeCoins() async throws -> Int { try await v1.progress().lifetimeCoins }

    // MARK: - Everything else: the mock

    public func content() async throws -> ContentBundle { try await mock.content() }
    /// Home layout from the bundled content, with the person's own data from Lucille v1:
    /// the real Daily Drop (a catalog track), their real streak, and no sample "Made by You"
    /// items (those were seed data, not theirs).
    public func home(_ q: InputsQuery) async throws -> Home {
        await applyName()
        var h = try await mock.home(q)
        h.madeByYou = []
        // The mock's Inner Weather drops the heart rate when its own (seed) Heart input is off;
        // here it's the Mood Scan pulse the store passes in.
        // Inner Weather tiles: the live Lucille v1 values (real weather + city, last mood, scan
        // pulse) instead of the seed's sample "64° Drizzle · New York" and mood.
        if let live = try? await inputsNow(q) {
            h.inputsNow = live
        } else {
            h.inputsNow.weather = nil
            h.inputsNow.mood = Self.lastScanMood()
            h.inputsNow.heartBpm = q.heartBpm.map { Int($0.rounded()) }
        }
        if let p = try? await v1.progress(), let streak = p.streakDays { h.user.streakDays = streak }
        if let d = try? await v1.dailyDrop() {
            tracks[d.track.id] = d.track
            h.dailyDrop = DailyDrop(compositionId: Self.prefix + d.track.id, label: "Lucille's Daily Drop",
                                    badge: "New every morning", title: d.title,
                                    subtitle: "\(d.track.title) · picked for today", mode: d.track.mode,
                                    gradient: gradient(for: d.track), composition: nil)
        }
        return h
    }
    /// Inner Weather from Lucille v1: real day phase, the person's last saved mood and (with
    /// location consent) real weather. No sample city/weather/mood from the seed file.
    public func inputsNow(_ q: InputsQuery) async throws -> InputsNow {
        var n = try await mock.inputsNow(q)
        guard let v = try? await v1.innerWeather(lat: q.lat, lon: q.lon) else {
            if let w = await openMeteo(lat: q.lat, lon: q.lon) {
                n.weather = Weather(tempF: w.tempF, condition: w.condition,
                                    city: await city(lat: q.lat, lon: q.lon) ?? "")
            } else {
                n.weather = nil
            }
            n.mood = Self.lastScanMood(); n.phaseValue = ""
            n.heartBpm = q.heartBpm.map { Int($0.rounded()) }
            return n
        }
        let phase = v.phase.prefix(1).uppercased() + v.phase.dropFirst()
        n.circadianPhase = v.phase
        n.phaseLabel = phase
        n.phaseValue = v.night ? "Night" : phase
        n.nextPhaseInMin = nil
        if let w = v.weather, w.available, let c = w.tempC {
            n.weather = Weather(tempF: Int((c * 9 / 5 + 32).rounded()),
                                condition: (w.bucket ?? "").capitalized,
                                city: await city(lat: q.lat, lon: q.lon) ?? "")
        } else if let w = await openMeteo(lat: q.lat, lon: q.lon) {
            // Lucille has no weather for this spot: use Open-Meteo (free, no key) directly.
            n.weather = Weather(tempF: w.tempF, condition: w.condition,
                                city: await city(lat: q.lat, lon: q.lon) ?? "")
        } else {
            n.weather = nil
        }
        // Last saved check-in from Lucille; the latest Mood Scan word if that isn't saved yet
        // (e.g. consent not given).
        n.mood = v.mood?.word ?? Self.lastScanMood()
        // HealthKit is stripped for the beta: the heart rate is the Mood Scan's camera pulse,
        // passed in by the store when the Heart input is on.
        n.heartBpm = q.heartBpm.map { Int($0.rounded()) }
        return n
    }
    private var cityCache: (key: String, name: String)?

    /// The person's town for the Weather tile, from the location the store already passed in.
    private func city(lat: Double?, lon: Double?) async -> String? {
        guard let lat, let lon else { return nil }
        let key = String(format: "%.2f,%.2f", lat, lon)
        if let c = cityCache, c.key == key { return c.name }
        guard let place = try? await CLGeocoder()
            .reverseGeocodeLocation(CLLocation(latitude: lat, longitude: lon)).first,
              let name = place.locality ?? place.subAdministrativeArea ?? place.administrativeArea
        else { return nil }
        cityCache = (key, name)
        return name
    }

    /// Current temperature (°F) and a short condition from Open-Meteo, for when Lucille's
    /// inputs-now has no weather. nil without a location or on any failure.
    private func openMeteo(lat: Double?, lon: Double?) async -> (tempF: Int, condition: String)? {
        guard let lat, let lon,
              let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&current=temperature_2m,weather_code&temperature_unit=fahrenheit")
        else { return nil }
        struct R: Decodable {
            struct C: Decodable { let temperature_2m: Double; let weather_code: Int }
            let current: C
        }
        guard let (data, resp) = try? await URLSession.shared.data(from: url),
              (resp as? HTTPURLResponse)?.statusCode == 200,
              let r = try? JSONDecoder().decode(R.self, from: data) else { return nil }
        let c = r.current.weather_code
        let condition: String
        switch c {
        case 0: condition = "Clear"
        case 1, 2: condition = "Partly cloudy"
        case 3: condition = "Cloudy"
        case 45, 48: condition = "Fog"
        case 51...57: condition = "Drizzle"
        case 61...67, 80...82: condition = "Rain"
        case 71...77, 85, 86: condition = "Snow"
        case 95...99: condition = "Storm"
        default: condition = "Weather"
        }
        return (Int(r.current.temperature_2m.rounded()), condition)
    }

    /// The word from the latest Mood Scan on this device (12 h), see AppStore.rememberScanMood.
    static func lastScanMood() -> String? {
        let d = UserDefaults.standard
        guard let w = d.string(forKey: "escape.scanMood.word"), !w.isEmpty,
              Date().timeIntervalSince1970 - d.double(forKey: "escape.scanMood.at") < 12 * 3600
        else { return nil }
        return w
    }

    public func me() async throws -> Profile { await applyName(); return try await mock.me() }
    public func updateProfile(firstName: String?, tz: String?) async throws -> Profile { try await mock.updateProfile(firstName: firstName, tz: tz) }
    public func deleteAccount() async throws { try await mock.deleteAccount() }
    public func experiments() async throws -> Experiments { try await mock.experiments() }
    public func preferences() async throws -> Preferences { try await mock.preferences() }
    public func updatePreferences(_ patch: PreferencesPatch) async throws -> Preferences { try await mock.updatePreferences(patch) }
    public func completeOnboarding() async throws { try await mock.completeOnboarding() }
    public func inputs() async throws -> InputsResponse { Self.heartFromScan(try await mock.inputs()) }
    public func setInput(_ id: InputSetting.Kind, enabled: Bool) async throws -> InputSetting {
        var i = try await mock.setInput(id, enabled: enabled)
        if i.id == .heart { Self.heartFromScan(&i) }
        return i
    }

    /// Heart rate comes from the Mood Scan's camera pulse, not HealthKit (stripped for the
    /// beta), so the Heart input needs no Health permission and can be turned on.
    private static func heartFromScan(_ i: inout InputSetting) {
        // Always on: there's nothing to grant, and the seed's toggle state can't block it.
        i.permission = nil
        i.comingSoon = false
        i.alwaysOn = true
        i.enabled = true
        i.sub = "Your pulse from your latest Mood Scan"
    }

    private static func heartFromScan(_ r: InputsResponse) -> InputsResponse {
        var r = r
        for k in r.inputs.indices where r.inputs[k].id == .heart { heartFromScan(&r.inputs[k]) }
        return r
    }
    /// Erases stored mood readings (scans, check-ins, heart rate) on the server, then the local cache.
    public func deleteInputHistory() async throws {
        try await v1.eraseData(scope: "mood")
        try? await mock.deleteInputHistory()
    }
    public func postMoodCheckIn(value: Double, tags: [String], source: String) async throws -> MoodCheckIn { try await mock.postMoodCheckIn(value: value, tags: tags, source: source) }
    public func latestMoodCheckIn() async throws -> MoodCheckIn? { try await mock.latestMoodCheckIn() }
    public func latestMoodScan() async throws -> MoodScan? { try await mock.latestMoodScan() }
    public func journeys() async throws -> [Journey] { try await mock.journeys() }
    public func journey(_ id: String) async throws -> Journey { try await mock.journey(id) }

    /// Timed Journey: the seed's phases set the timeline and total time; the sound is the
    /// Lucille track in the journey's mode closest to its average energy.
    public func startJourney(_ id: String) async throws -> JourneyStart {
        var j = try await mock.journey(id)
        let mode = ModeId(loose: j.mode) ?? .focus
        var at = 0
        let timeline = j.phases.map { p -> Journey.Phase in
            var p = p; p.startsAtSec = at * 60; at += p.minutes; return p
        }
        j.totalMinutes = at
        let energy = j.phases.isEmpty ? 0.5 : j.phases.map(\.energy).reduce(0, +) / Double(j.phases.count)
        guard let pick = await closestTrack(mode: mode, field: MoodField(energy: energy, texture: 0.5)) else {
            return try await mock.startJourney(id)
        }
        let c = try await lucilleComposition(pick.id)
        let s = try await startSession(StartSessionRequest(mode: mode, compositionId: c.compositionId, startedFrom: .journey))
        return JourneyStart(journey: j, timeline: timeline, composition: c, session: s)
    }
    public func whisperTopics() async throws -> [WhisperTopic] { try await mock.whisperTopics() }
    public func visualPresets(mode: ModeId?) async throws -> [VisualPreset] { try await mock.visualPresets(mode: mode) }
    public func premiumPlans() async throws -> PremiumPlans { try await mock.premiumPlans() }
    public func dailyDrop() async throws -> DailyDrop { try await mock.dailyDrop() }
    /// Compose with Lucille. There's no renderer on the live API yet (Jared: existing Lucille
    /// endpoints only), so Lucille picks the catalog track in the chosen mode whose Mood Field is
    /// closest to the person's, and it plays straight away.
    public func compose(_ req: ComposeRequest) async throws -> ComposeAccepted {
        guard let pick = await closestTrack(mode: req.mode, field: req.moodField) else {
            return try await mock.compose(req)
        }
        return try await accepted(pick.id)
    }

    /// The composition id for a Lucille track the host wants to play (Journal V2's "Tuned for
    /// this mood" card): by track id first, then by title in the catalog.
    public func compositionId(trackId: String?, title: String?) async -> String? {
        if let id = trackId?.trimmingCharacters(in: .whitespaces), !id.isEmpty {
            if id.hasPrefix(Self.prefix) { return id }
            if !id.contains(" "), let t = try? await v1.track(id) {
                tracks[t.id] = t
                return Self.prefix + t.id
            }
        }
        guard let title = title?.trimmingCharacters(in: .whitespaces), !title.isEmpty else { return nil }
        let wanted = title.lowercased()
        var pool = (try? await v1.catalog(search: title)) ?? []
        if !pool.contains(where: { $0.title.lowercased() == wanted }) {
            pool += (try? await v1.catalog()) ?? []
        }
        for t in pool { tracks[t.id] = t }
        let hit = pool.first { $0.title.lowercased() == wanted }
            ?? pool.first { $0.title.lowercased().contains(wanted) || wanted.contains($0.title.lowercased()) }
        return hit.map { Self.prefix + $0.id }
    }

    /// The catalog track in `mode` (Calm if that mode is empty) nearest to a Mood Field.
    private func closestTrack(mode: ModeId, field: MoodField) async -> V1Track? {
        var pool = (try? await v1Tracks(for: mode)) ?? []
        if pool.isEmpty { pool = (try? await v1Tracks(for: .calm)) ?? [] }
        for t in pool { tracks[t.id] = t }
        return Self.nearestTrack(in: pool, to: field, avoiding: "")
    }
    public func myCompositions(limit: Int) async throws -> [Composition] { try await mock.myCompositions(limit: limit) }
    /// Only what the person saved from the Lucille catalog: the seed file's sample saves
    /// ("Cabin Rain, 11 PM", "Morning Clarity"…) aren't theirs, so they never show.
    public func library(_ filter: LibraryFilter?) async throws -> [LibraryItem] {
        try await mock.library(filter).filter { $0.compositionId.hasPrefix(Self.prefix) }
    }
    public func setOffline(itemId: String, offline: Bool) async throws -> LibraryItem { try await mock.setOffline(itemId: itemId, offline: offline) }
    public func removeFromLibrary(itemId: String) async throws { try await mock.removeFromLibrary(itemId: itemId) }
    public func saveMemory(sessionId: String, title: String?) async throws -> LibraryItem {
        if let tid = sessionTracks[sessionId] {
            await mock.register(try await lucilleComposition(tid))
        }
        return try await mock.saveMemory(sessionId: sessionId, title: title)
    }
    static let playlistPrefix = "cat:"

    /// Playlists are Lucille's catalog collections: one per category that has tracks.
    public func playlists() async throws -> [PlaylistSummary] {
        let cats = try await v1.categories()
        categoryInfo = Dictionary(cats.map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })
        return cats.filter { ($0.trackCount ?? 1) > 0 }.map { c in
            PlaylistSummary(id: Self.playlistPrefix + c.id, title: c.label, summary: c.description, credit: "Lucille",
                            artGradient: GradientSpec(colors: [c.color.hasPrefix("#") ? c.color : "#2A3A7A", "#101E43"]),
                            trackCount: c.trackCount ?? 0)
        }
    }

    public func playlist(_ id: String) async throws -> Playlist {
        guard id.hasPrefix(Self.playlistPrefix) else { return try await mock.playlist(id) }
        let cid = String(id.dropFirst(Self.playlistPrefix.count))
        await loadCategories()
        let list = try await v1.catalog(category: cid)
        for t in list { tracks[t.id] = t }
        let info = categoryInfo[cid]
        let grad = GradientSpec(colors: [info?.color.hasPrefix("#") == true ? info!.color : "#2A3A7A", "#101E43"])
        let items = list.map { t -> Track in
            let minutes = Int(((t.durationSec ?? 1800) / 60).rounded())
            return Track(id: t.id, compositionId: Self.prefix + t.id, title: t.title, mode: t.mode,
                         duration: "\(minutes) min", gradient: gradient(for: t), liked: false)
        }
        return Playlist(id: id, title: info?.label ?? "Playlist", summary: info?.description ?? "",
                        credit: "Lucille", artGradient: grad, tracks: items)
    }

    public func setLike(playlistId: String, trackId: String, liked: Bool) async throws {
        if playlistId.hasPrefix(Self.playlistPrefix) { return }   // catalog playlists keep likes on the device only
        try await mock.setLike(playlistId: playlistId, trackId: trackId, liked: liked)
    }

    public func circles() async throws -> Circles { try await mock.circles() }
    public func joinCircle(_ id: String) async throws -> CircleJoin { try await mock.joinCircle(id) }
    public func leaveCircle(_ id: String) async throws { try await mock.leaveCircle(id) }
    public func setCircleReminder(_ id: String, on: Bool) async throws { try await mock.setCircleReminder(id, on: on) }
    public func sendBetaFeedback(_ req: BetaFeedbackRequest) async throws { try await mock.sendBetaFeedback(req) }
}
