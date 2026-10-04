import Foundation

/// Answers every endpoint from the bundled Figma seed, so the whole app runs with no
/// backend: SwiftUI previews, unit tests, the simulator with `-mock`, and offline demos.
/// State (likes, saves, prefs, sessions) lives in memory until the app quits.
/// Compositions "render" in `renderSeconds` using the bundled sample audio.
@available(iOS 17.0, *)
public actor MockSoundscapesAPI: SoundscapesAPI {
    private let seed: Seed
    private let contentBundle: ContentBundle
    private let renderSeconds: Double
    private let now: @Sendable () -> Date
    private let samples: [AudioSegment]
    private let visual: VisualPreset?

    private var profile: Profile
    private var prefs: Preferences
    private var inputList: [InputSetting]
    private var compositions: [String: Composition] = [:]
    private var renderStart: [String: Date] = [:]
    private var library: [LibraryItem]
    private var likes: Set<String>
    private var reminders: Set<String>
    private var sessions: [String: Session] = [:]
    private var checkIns: [MoodCheckIn] = []
    private var listening: Int
    private var composesToday = 0
    private var counter = 0
    public var freeComposesPerDay = 3

    public init(seed: Seed, content: ContentBundle, renderSeconds: Double = 6, bundle: Bundle = .soundscapes,
                now: @escaping @Sendable () -> Date = { Date() }) {
        self.seed = seed
        self.contentBundle = content
        self.renderSeconds = renderSeconds
        self.now = now
        func sample(_ name: String, _ ext: String) -> URL {
            bundle.url(forResource: name, withExtension: ext) ?? URL(string: "http://localhost:8080/static/samples/\(name).\(ext)")!
        }
        samples = [
            AudioSegment(role: .intro, url: sample("sample_intro", "m4a"), durationSec: 12.3),
            AudioSegment(role: .body, url: sample("sample_body_1", "m4a"), durationSec: 30.3),
            AudioSegment(role: .body, url: sample("sample_body_2", "m4a"), durationSec: 27.0),
            AudioSegment(role: .outro, url: sample("sample_outro", "m4a"), durationSec: 12.3),
        ]
        visual = VisualPreset(id: "picks_breathing_orb", mode: .picks, name: "Breathing Orb",
                              videoH264: sample("sample_orb_720_h264", "mp4"), videoHevc: sample("sample_orb_720_hevc", "mp4"),
                              poster: sample("sample_poster", "jpg"), loopSec: 20, energy: 0.5, texture: 0.5)

        let u = seed.user
        profile = Profile(uid: u.uid, firstName: u.firstName, isPremium: u.isPremium, streakDays: u.streakDays,
                          totalShards: u.totalShards, lastSessionDate: nil, hasOnboarded: false, experiments: seed.experiments)
        let timerMinutes = Int(content.timer.default) ?? 25
        prefs = Preferences(
            moodField: content.moodField.default, blendOn: false, focusShieldOn: false, layers: seed.layers,
            whisper: .init(enabled: content.whisper.enabled, selectedTopic: content.whisper.selectedTopic),
            timer: .init(minutes: timerMinutes, fadeOut: content.timer.fadeOut, sunriseWake: content.timer.sunriseWake),
            sleep: .init(whisperIntro: content.sleepSetup.whisperIntro, timer: content.sleepSetup.timer,
                         sunriseTime: content.sleepSetup.sunriseTime, breathSync: content.sleepSetup.breathSync),
            hasOnboarded: false)
        inputList = seed.inputs
        library = seed.library.items
        likes = Set(seed.playlists.flatMap { pl in (pl.defaultLiked ?? []).map { "\(pl.id):\($0)" } })
        reminders = Set(seed.circles.defaultReminders)
        listening = seed.circles.live.listening
        let scan = content.moodCheckIn.latestMoodScan
        checkIns = [MoodCheckIn(id: "seed_scan", uid: u.uid, value: 0.3, tags: [scan.mood], source: "moodScan",
                                createdAt: Self.iso(now().addingTimeInterval(Double(-scan.minutesAgo * 60))), word: "Heavy")]
        compositions = Self.catalog(seed: seed, samples: samples, visual: visual, createdAt: Self.iso(now()))
    }

    /// Mock that reads figma-seed.json from the app bundle.
    public static func bundled(renderSeconds: Double = 6, bundle: Bundle = .soundscapes) throws -> MockSoundscapesAPI {
        MockSoundscapesAPI(seed: try Seed.bundled(bundle), content: try ContentBundle.bundled(bundle), renderSeconds: renderSeconds, bundle: bundle)
    }

    // MARK: helpers

    private static func iso(_ d: Date) -> String {
        let f = ISO8601DateFormatter(); f.formatOptions = [.withInternetDateTime, .withFractionalSeconds]; return f.string(from: d)
    }

    private static func catalog(seed: Seed, samples: [AudioSegment], visual: VisualPreset?, createdAt: String) -> [String: Composition] {
        var out: [String: Composition] = [:]
        func add(_ id: String, _ title: String, _ sub: String?, _ mode: ModeId, _ g: GradientSpec?, owner: String?, source: String, duration: String? = nil) {
            if out[id] != nil { if out[id]?.durationLabel == nil { out[id]?.durationLabel = duration }; return }
            out[id] = Composition(compositionId: id, ownerUid: owner, status: .ready, mode: mode, title: title, subtitle: sub,
                                  whyHeadline: nil, whyThisSound: sub, segments: samples, visual: visual, visualPresetId: visual?.id,
                                  gradient: g, artist: "Lucille", source: source, durationLabel: duration ?? "Endless", minutes: nil,
                                  brainwave: nil, moodField: nil, parentId: nil, failReason: nil, prompt: nil, recipe: nil,
                                  createdAt: createdAt, readyAt: createdAt)
        }
        for (key, page) in seed.browse {
            let mode = ModeId(loose: key) ?? .calm
            for c in page.cards { add(c.id, c.title, c.description, mode, c.gradient, owner: nil, source: mode == .realms ? "realm" : "catalog") }
        }
        let dd = seed.dailyDrop
        add(dd.compositionId, dd.title, dd.subtitle, ModeId(loose: dd.mode) ?? .calm, dd.gradient, owner: nil, source: "daily")
        out[dd.compositionId]?.whyHeadline = "Composed at 7:02 AM for your day."
        for m in seed.madeByYou {
            add(m.compositionId, m.title, m.description, ModeId(loose: m.mode) ?? .calm, m.gradient, owner: seed.user.uid, source: "compose")
        }
        for t in seed.playlists.flatMap(\.tracks) {
            add(t.compositionId, t.title, nil, ModeId(loose: t.mode) ?? .calm, t.gradient, owner: nil, source: "catalog", duration: t.duration)
        }
        for i in seed.library.items {
            add(i.compositionId, i.title, nil, ModeId(loose: i.mode) ?? .calm, i.gradient, owner: nil, source: "catalog", duration: i.duration)
        }
        return out
    }

    private func nextId(_ prefix: String) -> String { counter += 1; return "\(prefix)_mock\(counter)" }

    /// Moves a composition along queued → rendering → ready based on elapsed time.
    private func advanced(_ c: Composition) -> Composition {
        guard let start = renderStart[c.compositionId], !c.status.isFinished else { return c }
        var c = c
        let t = now().timeIntervalSince(start)
        if t >= renderSeconds {
            if c.prompt?.contains("#fail") == true {
                c.status = .failed; c.failReason = "Mock failure requested with #fail"
            } else {
                c.status = .ready; c.segments = samples; c.readyAt = Self.iso(now())
            }
        } else if t >= renderSeconds / 3 {
            c.status = .rendering
        }
        compositions[c.compositionId] = c
        return c
    }

    private func modesList() -> [Mode] {
        seed.modes.map { var m = $0; m.locked = m.premium && !profile.isPremium; return m }
    }

    private func requireComposition(_ id: String) throws -> Composition {
        guard let c = compositions[id], c.ownerUid == nil || c.ownerUid == profile.uid else { throw APIError.notFound("Composition not found") }
        return advanced(c)
    }

    // MARK: Home

    public func content() async throws -> ContentBundle { contentBundle }

    public func home(_ q: InputsQuery) async throws -> Home {
        Home(user: .init(firstName: profile.firstName, isPremium: profile.isPremium, streakDays: profile.streakDays, totalShards: profile.totalShards),
             experiments: profile.experiments, inputsNow: try await inputsNow(q), homeTabs: contentBundle.homeTabs, modes: modesList(),
             dailyDrop: try await dailyDrop(),
             journeyChips: seed.journeys.filter { ["deep-work", "exam-prep", "panic-reset", "power-nap"].contains($0.id) }
                .map { JourneyChip(id: $0.id, title: $0.title, chipDuration: $0.chipDuration, mode: $0.mode) },
             featuredCircle: seed.featuredCircle,
             madeByYou: compositions.values.filter { $0.ownerUid == profile.uid && $0.status == .ready }
                .sorted { $0.createdAt > $1.createdAt || ($0.createdAt == $1.createdAt && $0.compositionId < $1.compositionId) }
                .prefix(10)
                .map { MadeByYou(compositionId: $0.compositionId, title: $0.title, description: $0.subtitle ?? "", mode: $0.mode.rawValue, gradient: $0.gradient) },
             betaFeedbackEnabled: profile.experiments.isBetaTester)
    }

    /// Figma values, filtered by which inputs are on.
    public func inputsNow(_ q: InputsQuery) async throws -> InputsNow {
        var n = seed.inputsNow
        let on = { (k: InputSetting.Kind) in self.inputList.first { $0.id == k }?.enabled ?? false }
        if !on(.weather) { n.weather = nil }
        if !on(.mood) || checkIns.isEmpty { n.mood = nil } else { n.mood = checkIns.last?.tags.first ?? n.mood }
        if !on(.heart) { n.heartBpm = nil } else if let bpm = q.heartBpm { n.heartBpm = Int(bpm.rounded()) }
        return n
    }

    // MARK: Me

    public func me() async throws -> Profile { profile }
    public func updateProfile(firstName: String?, tz: String?) async throws -> Profile {
        if let firstName { profile.firstName = firstName }
        return profile
    }
    public func deleteAccount() async throws {}
    public func experiments() async throws -> Experiments { profile.experiments }
    public func preferences() async throws -> Preferences { prefs }

    public func updatePreferences(_ p: PreferencesPatch) async throws -> Preferences {
        if let v = p.moodField { prefs.moodField = v }
        if let v = p.blendOn { prefs.blendOn = v }
        if let v = p.focusShieldOn { prefs.focusShieldOn = v }
        if let v = p.layers { prefs.layers = v }
        if let w = p.whisper {
            if let t = w.selectedTopic, !contentBundle.whisper.topics.contains(where: { $0.id == t }) { throw APIError.invalid("Unknown whisper topic") }
            prefs.whisper.enabled = w.enabled ?? prefs.whisper.enabled
            prefs.whisper.selectedTopic = w.selectedTopic ?? prefs.whisper.selectedTopic
        }
        if let t = p.timer {
            prefs.timer.minutes = t.minutes ?? prefs.timer.minutes
            prefs.timer.fadeOut = t.fadeOut ?? prefs.timer.fadeOut
            prefs.timer.sunriseWake = t.sunriseWake ?? prefs.timer.sunriseWake
        }
        if let s = p.sleep {
            prefs.sleep.whisperIntro = s.whisperIntro ?? prefs.sleep.whisperIntro
            prefs.sleep.timer = s.timer ?? prefs.sleep.timer
            prefs.sleep.sunriseTime = s.sunriseTime ?? prefs.sleep.sunriseTime
            prefs.sleep.breathSync = s.breathSync ?? prefs.sleep.breathSync
        }
        if let v = p.hasOnboarded { prefs.hasOnboarded = v; profile.hasOnboarded = v }
        return prefs
    }

    public func completeOnboarding() async throws { prefs.hasOnboarded = true; profile.hasOnboarded = true }

    // MARK: Inputs

    public func inputs() async throws -> InputsResponse { InputsResponse(inputs: inputList, footer: contentBundle.inputsFooter) }

    public func setInput(_ id: InputSetting.Kind, enabled: Bool) async throws -> InputSetting {
        guard let i = inputList.firstIndex(where: { $0.id == id }) else { throw APIError.notFound("Input not found") }
        if inputList[i].alwaysOn && !enabled { throw APIError.conflict(code: "always_on", message: "\(inputList[i].label) can't be turned off") }
        if inputList[i].comingSoon == true && enabled { throw APIError.conflict(code: "coming_soon", message: "\(inputList[i].label) is coming soon") }
        inputList[i].enabled = enabled
        return inputList[i]
    }

    public func deleteInputHistory() async throws { checkIns.removeAll() }

    public func postMoodCheckIn(value: Double, tags: [String], source: String) async throws -> MoodCheckIn {
        let word = value < 0.33 ? "Heavy" : value < 0.66 ? "Mixed" : "Bright"
        let c = MoodCheckIn(id: nextId("mood"), uid: profile.uid, value: value, tags: tags, source: source, createdAt: Self.iso(now()), word: word)
        checkIns.append(c)
        return c
    }

    public func latestMoodCheckIn() async throws -> MoodCheckIn? { checkIns.last }

    public func latestMoodScan() async throws -> MoodScan? {
        guard let s = checkIns.last(where: { $0.source == "moodScan" }), let at = Date.fromISO(s.createdAt) else { return nil }
        let mins = Int(now().timeIntervalSince(at) / 60)
        let mood = s.tags.first ?? s.word ?? "Mixed"
        let ago = mins < 1 ? "Just now" : mins < 60 ? "\(mins) min ago" : "\(Int((Double(mins) / 60).rounded())) h ago"
        return MoodScan(mood: mood, minutesAgo: mins, label: "\(ago): \(mood)", value: s.value)
    }

    // MARK: Catalog

    public func modes() async throws -> [Mode] { modesList() }

    public func browse(_ mode: ModeId) async throws -> BrowsePage {
        guard let b = seed.browse[mode.rawValue] else { throw APIError.notFound("Browse page for \(mode.rawValue) not found") }
        let ids = Dictionary(seed.journeys.map { ($0.title, $0.id) }, uniquingKeysWith: { a, _ in a })
        return BrowsePage(mode: mode, title: b.title, tagline: b.tagline, background: b.background, chipsLabel: b.chipsLabel,
                          journeys: b.journeys.map { .init(title: $0, journeyId: ids[$0]) },
                          cards: b.cards.map { BrowseCard(id: $0.id, compositionId: $0.id, title: $0.title, description: $0.description, mode: b.title,
                                                          gradient: $0.gradient, isPremium: $0.isPremium, locked: $0.isPremium && !profile.isPremium,
                                                          seasonal: $0.seasonal, isNew: $0.isNew) })
    }

    public func catalog(mode: String) async throws -> [BrowseCard] { try await browse(ModeId(loose: mode) ?? .calm).cards }
    public func journeys() async throws -> [Journey] { seed.journeys }

    public func journey(_ id: String) async throws -> Journey {
        guard var j = seed.journeys.first(where: { $0.id == id }) else { throw APIError.notFound("Journey not found") }
        j.totalMinutes = j.phases.reduce(0) { $0 + $1.minutes }
        return j
    }

    public func startJourney(_ id: String) async throws -> JourneyStart {
        var j = try await journey(id)
        let mode = ModeId(loose: j.mode) ?? .focus
        if !mode.isFree && !profile.isPremium { throw APIError.premiumRequired("This needs Escape Premium") }
        let comp = compositions.values.filter { $0.mode == mode && $0.ownerUid == nil }.sorted { $0.compositionId < $1.compositionId }.first
        guard let comp else { throw APIError.notFound("No composition for \(mode.rawValue)") }
        var at = 0
        let timeline = j.phases.map { p -> Journey.Phase in var p = p; p.startsAtSec = at * 60; at += p.minutes; return p }
        j.totalMinutes = at
        let s = try await startSession(StartSessionRequest(mode: mode, compositionId: comp.compositionId, startedFrom: .journey))
        return JourneyStart(journey: j, timeline: timeline, composition: comp, session: s)
    }

    public func whisperTopics() async throws -> [WhisperTopic] { contentBundle.whisper.topics }
    public func visualPresets(mode: ModeId?) async throws -> [VisualPreset] { visual.map { [$0] } ?? [] }
    public func premiumPlans() async throws -> PremiumPlans {
        PremiumPlans(plans: contentBundle.premium.plans, defaultPlan: contentBundle.premium.defaultPlan)
    }

    // MARK: Compositions

    public func dailyDrop() async throws -> DailyDrop {
        let d = seed.dailyDrop
        return DailyDrop(compositionId: d.compositionId, label: d.label, badge: d.badge, title: d.title, subtitle: d.subtitle,
                         mode: d.mode, gradient: d.gradient, composition: compositions[d.compositionId])
    }

    public func compose(_ req: ComposeRequest) async throws -> ComposeAccepted {
        if !profile.isPremium {
            if !req.mode.isFree { throw APIError.premiumRequired("\(req.mode.title) is part of Escape Premium") }
            if composesToday >= freeComposesPerDay { throw APIError.premiumRequired("Free accounts get \(freeComposesPerDay) compositions a day") }
        }
        composesToday += 1
        let lower = req.prompt.lowercased()
        let scene = ["cabin", "forest", "ocean", "city", "library", "garden", "train"].first { lower.contains($0) }
        let element = ["rain", "drizzle", "storm", "wind", "snow", "waves", "night", "fog"].first { lower.contains($0) }
        let head = [scene, element].compactMap { $0?.capitalized }.joined(separator: " ")
        let hour = Calendar.current.component(.hour, from: now())
        let clock = "\(hour % 12 == 0 ? 12 : hour % 12) \(hour < 12 ? "AM" : "PM")"
        let id = nextId("comp")
        let c = Composition(
            compositionId: id, ownerUid: profile.uid, status: .queued, mode: req.mode,
            title: head.isEmpty ? "\(seed.inputsNow.circadianPhase) \(req.mode.title)" : "\(head), \(clock)",
            subtitle: "Composed by Lucille · \(req.minutes.map { "\($0) min" } ?? "Endless")",
            whyHeadline: contentBundle.nowPlaying.whyHeadline, whyThisSound: contentBundle.nowPlaying.whyBody,
            segments: [], visual: visual, visualPresetId: visual?.id,
            gradient: GradientSpec(colors: req.mode == .sleep ? ["#164395", "#05081A"] : ["#EF7702", "#164395"]),
            artist: "Lucille", source: "compose", durationLabel: req.minutes.map { "\($0) min" } ?? "Endless", minutes: req.minutes,
            brainwave: req.brainwave, moodField: req.moodField, parentId: nil, failReason: nil, prompt: req.prompt, recipe: nil,
            createdAt: Self.iso(now()), readyAt: nil)
        compositions[id] = c
        renderStart[id] = now()
        return ComposeAccepted(compositionId: id, status: .queued, etaSec: Int(renderSeconds), composition: c)
    }

    public func myCompositions(limit: Int) async throws -> [Composition] {
        Array(compositions.values.map { advanced($0) }.filter { $0.ownerUid == profile.uid && $0.status == .ready }
            .sorted { $0.createdAt > $1.createdAt }.prefix(limit))
    }

    public func composition(_ id: String) async throws -> Composition { try requireComposition(id) }

    private func child(of id: String, source: String, moodField: MoodField?) async throws -> ComposeAccepted {
        let parent = try requireComposition(id)
        var accepted = try await compose(ComposeRequest(prompt: parent.prompt ?? parent.title, mode: parent.mode, minutes: parent.minutes,
                                                        brainwave: parent.brainwave ?? .off, moodField: moodField ?? parent.moodField ?? .neutral,
                                                        useInnerWeather: true))
        accepted.composition.source = source
        accepted.composition.parentId = id
        accepted.composition.title = parent.title
        compositions[accepted.compositionId] = accepted.composition
        return accepted
    }

    public func variation(of id: String) async throws -> ComposeAccepted { try await child(of: id, source: "variation", moodField: nil) }
    public func retune(_ id: String, moodField: MoodField) async throws -> ComposeAccepted { try await child(of: id, source: "retune", moodField: moodField) }

    // MARK: Library + playlists

    public func library(_ filter: LibraryFilter?) async throws -> [LibraryItem] {
        switch filter {
        case .saved?: library.filter { $0.kind == .saved }
        case .memory?: library.filter { $0.kind == .memory }
        case .downloads?: library.filter(\.offline)
        case nil: library
        }
    }

    private func item(from c: Composition, kind: LibraryItem.Kind, title: String? = nil, duration: String? = nil) -> LibraryItem {
        LibraryItem(id: nextId(kind == .memory ? "mem" : "lib"), compositionId: c.compositionId, title: title ?? c.title,
                    mode: c.mode.shortTitle, duration: duration ?? c.durationLabel ?? "Endless", offline: false, kind: kind,
                    gradient: c.gradient ?? .fallback, createdAt: Self.iso(now()))
    }

    public func save(compositionId: String, offline: Bool) async throws -> LibraryItem {
        if offline && !profile.isPremium { throw APIError.premiumRequired("Offline downloads are part of Escape Premium") }
        let c = try requireComposition(compositionId)
        guard c.status == .ready else { throw APIError.conflict(code: "not_ready", message: "Only finished compositions can be saved") }
        if let existing = library.first(where: { $0.compositionId == compositionId && $0.kind == .saved }) { return existing }
        var i = item(from: c, kind: .saved); i.offline = offline
        library.insert(i, at: 0)
        return i
    }

    public func setOffline(itemId: String, offline: Bool) async throws -> LibraryItem {
        if offline && !profile.isPremium { throw APIError.premiumRequired("Offline downloads are part of Escape Premium") }
        guard let i = library.firstIndex(where: { $0.id == itemId }) else { throw APIError.notFound("Library item not found") }
        library[i].offline = offline
        return library[i]
    }

    public func removeFromLibrary(itemId: String) async throws {
        guard let i = library.firstIndex(where: { $0.id == itemId }) else { throw APIError.notFound("Library item not found") }
        library.remove(at: i)
    }

    public func saveMemory(sessionId: String, title: String?) async throws -> LibraryItem {
        guard let s = sessions[sessionId], let cid = s.compositionId else { throw APIError.notFound("Session not found") }
        let c = try requireComposition(cid)
        let f = DateFormatter(); f.dateFormat = "EEEE"
        let day = Date.fromISO(s.startedAt).map { f.string(from: $0) } ?? ""
        let i = item(from: c, kind: .memory, title: title ?? "\(s.mode.shortTitle), \(day)", duration: "\(Int(s.minutes ?? 0)) min")
        library.insert(i, at: 0)
        return i
    }

    public func playlists() async throws -> [PlaylistSummary] {
        seed.playlists.map { PlaylistSummary(id: $0.id, title: $0.title, summary: $0.summary, credit: $0.credit, artGradient: $0.artGradient, trackCount: $0.tracks.count) }
    }

    public func playlist(_ id: String) async throws -> Playlist {
        guard let p = seed.playlists.first(where: { $0.id == id }) else { throw APIError.notFound("Playlist not found") }
        return Playlist(id: p.id, title: p.title, summary: p.summary, credit: p.credit, artGradient: p.artGradient,
                        tracks: p.tracks.map { var t = $0; t.liked = likes.contains("\(p.id):\(t.id)"); return t })
    }

    public func setLike(playlistId: String, trackId: String, liked: Bool) async throws {
        let key = "\(playlistId):\(trackId)"
        if liked { likes.insert(key) } else { likes.remove(key) }
    }

    // MARK: Circles

    public func circles() async throws -> Circles {
        var live = seed.circles.live; live.listening = listening
        return Circles(intro: seed.circles.intro, live: live,
                       upcoming: seed.circles.upcoming.map { var u = $0; u.reminderOn = reminders.contains(u.id); return u },
                       footer: seed.circles.footer)
    }

    public func joinCircle(_ id: String) async throws -> CircleJoin {
        guard id == seed.circles.live.id else { throw APIError.notFound("Live circle not found") }
        listening += 1
        let comp = try requireComposition(seed.circles.live.compositionId)
        let s = try await startSession(StartSessionRequest(mode: comp.mode, compositionId: comp.compositionId, startedFrom: .circle))
        let loop = max(1, comp.segments.reduce(0) { $0 + $1.durationSec })
        return CircleJoin(circleId: id, listening: listening, startOffsetSec: Int(now().timeIntervalSince1970.truncatingRemainder(dividingBy: loop)),
                          composition: comp, session: s)
    }

    public func leaveCircle(_ id: String) async throws { listening = max(0, listening - 1) }

    public func setCircleReminder(_ id: String, on: Bool) async throws {
        if on { reminders.insert(id) } else { reminders.remove(id) }
    }

    // MARK: Sessions

    public func startSession(_ req: StartSessionRequest) async throws -> Session {
        let s = Session(sessionId: nextId("ses"), uid: profile.uid, mode: req.mode, compositionId: req.compositionId, startedFrom: req.startedFrom,
                        startedAt: Self.iso(now()), completedAt: nil, minutes: nil,
                        moodBefore: req.moodBefore ?? checkIns.last?.value, moodAfter: nil, moodField: req.moodField)
        sessions[s.sessionId] = s
        return s
    }

    public func completeSession(_ id: String, _ req: CompleteSessionRequest) async throws -> SessionResult {
        guard var s = sessions[id] else { throw APIError.notFound("Session not found") }
        if s.completedAt != nil { throw APIError.conflict(code: "already_completed", message: "This session was already completed") }
        let elapsed = Date.fromISO(s.startedAt).map { now().timeIntervalSince($0) / 60 } ?? 0
        let minutes = Int((req.minutes ?? elapsed).rounded())
        let today = String(Self.iso(now()).prefix(10))
        if profile.lastSessionDate != today { profile.streakDays += 1; profile.lastSessionDate = today }
        let earned = minutes >= 1 ? min(60, 10 + (minutes / 15) * 10) : 0
        profile.totalShards += earned
        s.completedAt = Self.iso(now()); s.minutes = Double(minutes); s.moodAfter = req.moodAfter
        sessions[id] = s
        func word(_ v: Double?) -> String? { v.map { $0 < 0.33 ? "Heavy" : $0 < 0.66 ? "Mixed" : "Bright" } }
        return SessionResult(sessionId: id, minutes: minutes, streakDays: profile.streakDays, shardsEarned: earned,
                             totalShards: profile.totalShards, moodFrom: word(s.moodBefore), moodTo: word(req.moodAfter))
    }

    public func sendBetaFeedback(_ req: BetaFeedbackRequest) async throws {
        guard (1...5).contains(req.calmRating) else { throw APIError.invalid("calmRating must be 1–5") }
    }

    // MARK: Test hooks
    public func setPremium(_ on: Bool) { profile.isPremium = on }
}
