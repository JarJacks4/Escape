import Foundation
import Observation

/// The one source of truth for the Soundscapes tab. It mirrors the prototype's zustand
/// store (store.ts) field for field, and adds the data and actions behind every screen.
///
/// Views read state and call actions; they never call the API directly.
/// Foundation + Observation only (no SwiftUI), so it unit-tests anywhere.
@available(iOS 17.0, *)
@MainActor
@Observable
public final class AppStore {
    // MARK: - Mirrors store.ts

    public var screen: Screen = .onboardingSoundscapes
    public var sheet: Sheet?
    public var currentMode: ModeId = .focus
    public var isPlaying = false
    public var moodField: MoodField = .figmaDefault
    public var blendOn = false
    public var focusShieldOn = false
    /// Remaining session time. Figma default 24:51.
    public var timerSeconds = 24 * 60 + 51
    public var activeCompositionId: String?
    public var composePrompt = ""
    public var hasOnboarded = false
    public var browseMode: ModeId = .calm

    // MARK: - Data

    public private(set) var content: ContentBundle?
    public private(set) var home: Home?
    public private(set) var preferences: Preferences?
    public private(set) var inputs: [InputSetting] = []
    public private(set) var inputsFooter = ""
    public private(set) var browsePages: [ModeId: BrowsePage] = [:]
    public private(set) var journeys: [Journey] = []
    public var selectedJourneyId: String = "deep-work"
    public private(set) var libraryItems: [LibraryItem] = []
    public var libraryFilter: LibraryFilter = .saved
    public private(set) var playlist: Playlist?
    public var playlistId = "evening-wind-down"
    public private(set) var circles: Circles?
    public private(set) var moodScan: MoodScan?

    /// What's playing (or last played) — NowPlaying and MiniPlayer.
    public private(set) var nowPlaying: Composition?
    /// The composition Lucille is working on — ComposeGenerating.
    public private(set) var generating: Composition?
    /// 0 reading inner weather · 1 composing · 2 painting visuals · 3 ready (ComposeGenerating steps).
    public private(set) var generationStep = 0
    public private(set) var session: Session?
    public private(set) var lastResult: SessionResult?
    /// Which input's PermissionPrimer is showing.
    public var permissionTarget: InputSetting.Kind = .weather
    public var premiumPlanId = "yearly"
    public private(set) var isBusy = false
    /// One-line message for a toast; views clear it after showing.
    public var toast: String?
    /// The main Escape app tab the user tapped in the bottom nav (placeholder screen).
    public private(set) var hostTab: NavTab = .soundscapes

    // MARK: - Compose draft (LucilleCompose local state, kept here so it survives navigation)

    public var composeMode: ModeId = .focus
    public var composeLength = "30 min"
    public var composeBrainwave: Brainwave = .alpha
    public var composeUseInnerWeather = true

    // MARK: - Dependencies

    public let api: SoundscapesAPI
    public let audio: AudioEngine
    public let host: HostServices
    /// Seconds between status polls while Lucille renders.
    public var pollInterval: TimeInterval = 2
    @ObservationIgnored private var timerTask: Task<Void, Never>?
    @ObservationIgnored private var pollTask: Task<Void, Never>?
    @ObservationIgnored private var sessionStartedAt: Date?
    @ObservationIgnored private var prefsChain: Task<Void, Never>?

    public init(api: SoundscapesAPI, audio: AudioEngine, host: HostServices) {
        self.api = api
        self.audio = audio
        self.host = host
        audio.onFinished = { [weak self] in self?.isPlaying = false }
    }

    // MARK: - Derived

    public var isPremium: Bool { home?.user.isPremium ?? false }
    public var firstName: String { home?.user.firstName ?? "" }
    public var inputsNow: InputsNow? { home?.inputsNow }
    public var modes: [Mode] { home?.modes ?? [] }
    public var browsePage: BrowsePage? { browsePages[browseMode] }
    public var selectedJourney: Journey? { journeys.first { $0.id == selectedJourneyId } }
    public var showsBottomNav: Bool { !screen.hidesNav }
    /// MiniPlayer shows on Home-level screens once something is playing.
    public var showsMiniPlayer: Bool { nowPlaying != nil && !screen.hidesNav && screen != .sessionComplete }
    public var isSleepUI: Bool { currentMode == .sleep }

    public func isLocked(_ mode: ModeId) -> Bool {
        if let m = modes.first(where: { $0.id == mode }) { return m.locked ?? (m.premium && !isPremium) }
        return !mode.isFree && !isPremium
    }

    /// "24:51"
    public var timerLabel: String { String(format: "%d:%02d", timerSeconds / 60, timerSeconds % 60) }

    // MARK: - Boot

    /// Loads everything Home needs. Safe to call again (pull to refresh).
    public func bootstrap() async {
        isBusy = true
        defer { isBusy = false }
        if content == nil {
            content = (try? await api.content()) ?? (try? ContentBundle.bundled())
        }
        do {
            let prefs = try await api.preferences()
            apply(prefs)
            hasOnboarded = prefs.hasOnboarded
            if hasOnboarded && screen == .onboardingSoundscapes { screen = .soundscapesHome }
        } catch { handle(error) }
        await refreshHome()
        async let inputsTask = api.inputs()
        async let journeysTask = api.journeys()
        if let r = try? await inputsTask { inputs = r.inputs; inputsFooter = r.footer }
        if let j = try? await journeysTask { journeys = j }
        moodScan = try? await api.latestMoodScan()
    }

    public func refreshHome() async {
        do { home = try await api.home(await inputsQuery()) } catch { handle(error) }
    }

    private func inputsQuery() async -> InputsQuery {
        var q = InputsQuery()
        let on = { (k: InputSetting.Kind) in self.inputs.first { $0.id == k }?.enabled ?? false }
        if on(.weather), let loc = await host.currentLocation() { q.lat = loc.lat; q.lon = loc.lon }
        if on(.heart) { q.heartBpm = await host.latestHeartRate() }
        return q
    }

    private func apply(_ p: Preferences) {
        preferences = p
        moodField = p.moodField
        blendOn = p.blendOn
        focusShieldOn = p.focusShieldOn
    }

    // MARK: - Navigation (setScreen / setSheet in store.ts)

    public func setScreen(_ s: Screen) {
        screen = s
        host.track("screen_view", ["screen": s.rawValue])
    }

    public func setSheet(_ s: Sheet?) {
        sheet = s
        if let s { host.track("sheet_view", ["sheet": s.rawValue]) }
    }

    public func closeSheet() { sheet = nil }

    /// Debug QuickNav: same (screen, sheet) pairs as the prototype.
    public func quickNav(_ item: QuickNavItem) {
        let d = item.destination
        if let s = d.screen { setScreen(s) }
        if item == .nowPlaying { isPlaying = true }
        setSheet(d.sheet)
    }

    /// Set by the host app: called instead of showing a placeholder for Home/Realms/Lucille/Profile.
    @ObservationIgnored public var onExitToHost: ((NavTab) -> Void)?

    public func selectTab(_ tab: NavTab) {
        if tab != .soundscapes, let exit = onExitToHost {
            exit(tab)
            return
        }
        hostTab = tab
        setScreen(tab == .soundscapes ? .soundscapesHome : .hostTab)
    }

    // MARK: - Onboarding

    public func finishOnboarding() {
        hasOnboarded = true
        setScreen(.soundscapesHome)
        Task { try? await api.completeOnboarding() }
    }

    // MARK: - Playback

    /// "Play for right now": Lucille's pick for this moment, one tap to sound.
    public func playNow() async {
        let mode = inputsNow?.suggestedMode ?? .focus
        if let drop = home?.dailyDrop, ModeId(loose: drop.mode) == mode, let c = drop.composition {
            startPlayback(c, from: .playNow)
            return
        }
        await play(mode: mode, from: .playNow)
    }

    /// Mode orb tap. Locked modes open PremiumSheet (SoundscapesHome.tsx).
    public func play(mode: ModeId, from origin: SessionOrigin = .mode) async {
        if isLocked(mode) { setSheet(.premium); return }
        currentMode = mode
        if mode == .sleep && origin == .mode { setScreen(.sleepSetup); return }
        do {
            let browseMode = ModeId.browsable.contains(mode) ? mode : .calm
            let page = try await loadBrowse(browseMode)
            let pick = page.cards.first { !$0.locked } ?? page.cards.first
            guard let pick else { return }
            await play(compositionId: pick.compositionId, from: origin)
        } catch { handle(error) }
    }

    public func play(compositionId: String, from origin: SessionOrigin, startOffset: TimeInterval = 0) async {
        do {
            let c = try await api.composition(compositionId)
            startPlayback(c, from: origin, startOffset: startOffset)
        } catch { handle(error) }
    }

    /// Browse card tap: locked cards open PremiumSheet.
    public func play(card: BrowseCard) async {
        if card.locked { setSheet(.premium); return }
        await play(compositionId: card.compositionId, from: .mode)
    }

    /// Starts sound and opens NowPlaying. Pass `existing` when the server already opened the session (journeys, circles).
    public func startPlayback(_ c: Composition, from origin: SessionOrigin, startOffset: TimeInterval = 0, existing: Session? = nil) {
        let switching = nowPlaying != nil && isPlaying
        nowPlaying = c
        activeCompositionId = c.compositionId
        currentMode = c.mode
        if switching { audio.crossfade(to: c) } else { audio.play(c, blend: blendOn, startOffset: startOffset) }
        isPlaying = true
        sheet = nil
        setScreen(.nowPlaying)
        host.haptic(.light)
        if let existing {
            session = existing
            sessionStartedAt = Date()
        } else if session == nil || !switching {
            Task { await beginSession(c, origin: origin) }
        }
        startTimer()
    }

    private func beginSession(_ c: Composition, origin: SessionOrigin) async {
        do {
            session = try await api.startSession(StartSessionRequest(mode: c.mode, compositionId: c.compositionId, startedFrom: origin, moodField: moodField))
            sessionStartedAt = Date()
            host.track("session_start", ["mode": c.mode.rawValue, "from": origin.rawValue])
        } catch { handle(error) }
    }

    /// Play/pause (ControlBar, MiniPlayer). setPlaying(!isPlaying) in the prototype.
    public func togglePlay() {
        guard nowPlaying != nil else { Task { await playNow() }; return }
        if isPlaying { audio.pause(); timerTask?.cancel() } else { audio.resume(); startTimer() }
        isPlaying.toggle()
        host.haptic(.selection)
    }

    /// NowPlaying mode switcher: crossfade into the new mode without leaving the screen.
    public func switchMode(_ mode: ModeId) async {
        guard mode != currentMode else { return }
        if isLocked(mode) { setSheet(.premium); return }
        currentMode = mode
        do {
            let page = try await loadBrowse(ModeId.browsable.contains(mode) ? mode : .calm)
            guard let pick = page.cards.first(where: { !$0.locked }) else { return }
            let c = try await api.composition(pick.compositionId)
            nowPlaying = c
            activeCompositionId = c.compositionId
            audio.crossfade(to: c)
            isPlaying = true
        } catch { handle(error) }
    }

    /// NowPlaying chevron: back to Home, music keeps going (MiniPlayer).
    public func minimizePlayer() { setScreen(.soundscapesHome) }

    // MARK: - Timer

    /// TimerSheet "Start": setTimerSeconds(mins * 60).
    public func setTimer(minutes: Int, fadeOut: Bool? = nil, sunriseWake: Bool? = nil) {
        timerSeconds = minutes * 60
        sheet = nil
        savePreferences(PreferencesPatch(timer: .init(minutes: minutes, fadeOut: fadeOut, sunriseWake: sunriseWake)))
        if sunriseWake == true, let t = preferences?.sleep.sunriseTime { Task { _ = await host.scheduleSunriseWake(at: t) } }
        if sunriseWake == false { host.cancelSunriseWake() }
        if isPlaying { startTimer() }
    }

    private func startTimer() {
        timerTask?.cancel()
        timerTask = Task { [weak self] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                guard let self, !Task.isCancelled else { return }
                self.tick()
            }
        }
    }

    /// One second of session time. Public for tests.
    public func tick() {
        guard isPlaying, timerSeconds > 0 else { return }
        timerSeconds -= 1
        let fadeOut = preferences?.timer.fadeOut ?? true
        if fadeOut, timerSeconds <= 300 { audio.setVolume(Float(timerSeconds) / 300) }
        if timerSeconds == 0 { Task { await endSession() } }
    }

    // MARK: - Session end

    /// Ends the session: outro, then SessionComplete with streak and shards.
    public func endSession(moodAfter: Double? = nil) async {
        timerTask?.cancel()
        audio.finishGracefully()
        audio.setVolume(1)
        isPlaying = false
        guard let s = session else { setScreen(.sessionComplete); return }
        let minutes = sessionStartedAt.map { Date().timeIntervalSince($0) / 60 }
        do {
            lastResult = try await api.completeSession(s.sessionId, CompleteSessionRequest(minutes: minutes, moodAfter: moodAfter))
            host.track("session_complete", ["mode": s.mode.rawValue, "minutes": String(lastResult?.minutes ?? 0)])
            host.haptic(.success)
        } catch { handle(error) }
        setScreen(.sessionComplete)
        await refreshHome()
    }

    /// "Save this as a Memory".
    public func saveMemory() async {
        guard let s = session else { return }
        do {
            _ = try await api.saveMemory(sessionId: s.sessionId, title: nil)
            toast = "Saved to Memories"
            host.haptic(.success)
        } catch { handle(error) }
    }

    /// "Keep listening": restart the same composition as a new session.
    public func keepListening() {
        guard let c = nowPlaying else { setScreen(.soundscapesHome); return }
        let origin = session?.startedFrom ?? .mode
        session = nil
        timerSeconds = (preferences?.timer.minutes ?? 25) * 60
        isPlaying = false
        startPlayback(c, from: origin)
    }

    /// "Done".
    public func doneWithSession() {
        session = nil
        nowPlaying = nil
        activeCompositionId = nil
        setScreen(.soundscapesHome)
    }

    public func sendBetaFeedback(calmRating: Int, visual: String?, note: String?) async {
        do {
            try await api.sendBetaFeedback(BetaFeedbackRequest(sessionId: session?.sessionId ?? lastResult?.sessionId, mode: currentMode.rawValue,
                                                               calmRating: calmRating, visual: visual?.lowercased(), note: note?.isEmpty == true ? nil : note))
            toast = "Thanks! Sent to the team."
        } catch { handle(error) }
    }

    // MARK: - Compose (LucilleCompose → ComposeGenerating → NowPlaying)

    public var composeMinutes: Int? {
        composeLength.lowercased() == "endless" ? nil : Int(composeLength.split(separator: " ").first ?? "")
    }

    public func compose() async {
        isBusy = true
        defer { isBusy = false }
        let req = ComposeRequest(prompt: composePrompt, mode: composeMode, minutes: composeMinutes, brainwave: composeBrainwave,
                                 moodField: moodField, useInnerWeather: composeUseInnerWeather)
        do {
            let accepted = try await api.compose(req)
            generating = accepted.composition
            activeCompositionId = accepted.compositionId
            generationStep = 0
            setScreen(.composeGenerating)
            host.track("compose", ["mode": composeMode.rawValue])
            watch(accepted.compositionId, thenPlay: true)
        } catch { handle(error) }
    }

    /// Polls until Lucille finishes. Steps follow the status; "Painting the visuals" shows briefly at the end.
    private func watch(_ id: String, thenPlay: Bool) {
        pollTask?.cancel()
        pollTask = Task { [weak self] in
            guard let self else { return }
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: UInt64(self.pollInterval * 1_000_000_000))
                guard let c = try? await self.api.composition(id) else { continue }
                self.generating = c
                switch c.status {
                case .queued: self.generationStep = 0
                case .rendering: self.generationStep = 1
                case .failed:
                    self.toast = c.failReason ?? "Lucille couldn't finish this one."
                    return
                case .ready:
                    self.generationStep = 2
                    try? await Task.sleep(nanoseconds: 800_000_000)
                    self.generationStep = 3
                    if self.screen != .composeGenerating { self.host.notifyCompositionReady(title: c.title) }
                    return
                }
            }
        }
    }

    /// ComposeGenerating "Play now".
    public func playGenerated() {
        guard let c = generating, c.status == .ready else { return }
        startPlayback(c, from: .compose)
    }

    /// ComposeGenerating "Save for later".
    public func saveGenerated() async {
        guard let c = generating, c.status == .ready else { return }
        do { _ = try await api.save(compositionId: c.compositionId, offline: false); toast = "Saved to your Library" } catch { handle(error) }
    }

    /// NowPlaying "Variation".
    public func variation() async {
        guard let id = nowPlaying?.compositionId else { return }
        do {
            let accepted = try await api.variation(of: id)
            generating = accepted.composition
            toast = "Lucille is composing a variation…"
            await crossfadeWhenReady(accepted.compositionId)
        } catch { handle(error) }
    }

    /// MoodFieldSheet "Update soundscape".
    public func applyMoodField() async {
        sheet = nil
        savePreferences(PreferencesPatch(moodField: moodField))
        guard let id = nowPlaying?.compositionId else { return }
        do {
            let accepted = try await api.retune(id, moodField: moodField)
            generating = accepted.composition
            toast = "Reshaping your soundscape…"
            await crossfadeWhenReady(accepted.compositionId)
        } catch { handle(error) }
    }

    private func crossfadeWhenReady(_ id: String) async {
        for _ in 0..<90 {
            try? await Task.sleep(nanoseconds: UInt64(pollInterval * 1_000_000_000))
            guard let c = try? await api.composition(id) else { continue }
            generating = c
            if c.status == .ready {
                nowPlaying = c
                activeCompositionId = c.compositionId
                if isPlaying { audio.crossfade(to: c) }
                return
            }
            if c.status == .failed { toast = c.failReason; return }
        }
    }

    // MARK: - Preferences (Blend, Focus Shield, Layers, Whisper, Sleep)

    public func setMoodField(_ f: MoodField) { moodField = f }

    public func toggleBlend() {
        blendOn.toggle()
        audio.setBlend(blendOn)
        savePreferences(PreferencesPatch(blendOn: blendOn))
    }

    public func toggleFocusShield() {
        focusShieldOn.toggle()
        let on = focusShieldOn
        Task {
            if await !host.setFocusShield(on) { focusShieldOn = false; toast = "Focus Shield needs Screen Time access." }
        }
        savePreferences(PreferencesPatch(focusShieldOn: on))
    }

    public func updateLayers(_ layers: [LayerSetting]) {
        preferences?.layers = layers
        savePreferences(PreferencesPatch(layers: layers))
    }

    public func setWhisper(enabled: Bool? = nil, topic: String? = nil) {
        if let enabled { preferences?.whisper.enabled = enabled }
        if let topic { preferences?.whisper.selectedTopic = topic }
        savePreferences(PreferencesPatch(whisper: .init(enabled: enabled, selectedTopic: topic)))
    }

    public func updateSleep(_ patch: PreferencesPatch.SleepPatch) {
        if let v = patch.whisperIntro { preferences?.sleep.whisperIntro = v }
        if let v = patch.timer { preferences?.sleep.timer = v }
        if let v = patch.sunriseTime { preferences?.sleep.sunriseTime = v }
        if let v = patch.breathSync { preferences?.sleep.breathSync = v }
        savePreferences(PreferencesPatch(sleep: patch))
    }

    /// SleepSetup "Start sleep": sleep timer, Sunrise Wake, then play Sleep.
    public func startSleep() async {
        let sleep = preferences?.sleep
        let minutes = Int((sleep?.timer ?? "45 min").split(separator: " ").first ?? "45") ?? 45
        timerSeconds = minutes * 60
        if let t = sleep?.sunriseTime, preferences?.timer.sunriseWake == true { _ = await host.scheduleSunriseWake(at: t) }
        currentMode = .sleep
        do {
            let page = try await loadBrowse(.sleep)
            if let pick = page.cards.first(where: { !$0.locked }) { await play(compositionId: pick.compositionId, from: .mode) }
        } catch { handle(error) }
    }

    /// Saves run one after another so responses can't arrive out of order and undo a newer change.
    /// The live Mood Field isn't overwritten by the echo (the user may still be dragging).
    private func savePreferences(_ patch: PreferencesPatch) {
        let previous = prefsChain
        prefsChain = Task { [weak self] in
            await previous?.value
            guard let self else { return }
            do { self.preferences = try await self.api.updatePreferences(patch) } catch { self.handle(error) }
        }
    }

    /// Waits for pending preference saves (tests, and before the app goes to the background).
    public func flushPreferences() async { await prefsChain?.value }

    // MARK: - Inputs, permissions, mood

    /// YourInputsSheet toggle. Turning on an input that needs a permission shows the
    /// PermissionPrimer first; the system dialog only follows "Allow".
    public func toggleInput(_ kind: InputSetting.Kind) async {
        guard let input = inputs.first(where: { $0.id == kind }) else { return }
        if input.alwaysOn || input.comingSoon == true { return }
        if !input.enabled, let p = input.permission, !host.hasPermission(p) {
            permissionTarget = kind
            setSheet(.permissionPrimer)
            return
        }
        await setInput(kind, enabled: !input.enabled)
    }

    private func setInput(_ kind: InputSetting.Kind, enabled: Bool) async {
        do {
            let updated = try await api.setInput(kind, enabled: enabled)
            if let i = inputs.firstIndex(where: { $0.id == kind }) { inputs[i] = updated }
            await refreshHome()
        } catch { handle(error) }
    }

    /// PermissionPrimer "Allow".
    public func allowPermission() async {
        let kind = permissionTarget
        guard let p = inputs.first(where: { $0.id == kind })?.permission else { setSheet(.yourInputs); return }
        let granted = await host.requestPermission(p)
        host.track("permission", ["input": kind.rawValue, "granted": String(granted)])
        if granted { await setInput(kind, enabled: true) } else { toast = "You can turn this on later in Settings." }
        setSheet(.yourInputs)
    }

    /// PermissionPrimer "Not now".
    public func declinePermission() { setSheet(.yourInputs) }

    public func deleteInputHistory() async {
        do { try await api.deleteInputHistory(); moodScan = nil; toast = "Input history deleted"; await refreshHome() } catch { handle(error) }
    }

    /// MoodCheckIn "Tune my soundscape": record, nudge the Mood Field, open NowPlaying.
    public func submitMoodCheckIn(value: Double, tags: [String]) async {
        do {
            _ = try await api.postMoodCheckIn(value: value, tags: tags, source: "manual")
            // Heavy → calmer and more grounded; bright → more energy.
            moodField = MoodField(energy: 0.3 + 0.5 * value, texture: moodField.texture)
            sheet = nil
            if nowPlaying == nil { await playNow() } else { setScreen(.nowPlaying) }
            await refreshHome()
        } catch { handle(error) }
    }

    // MARK: - Browse, journeys

    @discardableResult
    public func loadBrowse(_ mode: ModeId) async throws -> BrowsePage {
        if let p = browsePages[mode] { return p }
        let p = try await api.browse(mode)
        browsePages[mode] = p
        return p
    }

    /// Home tab chip (Focus/Calm/Sleep/Move/Realms): setBrowseMode + ModeBrowse.
    public func openBrowse(_ mode: ModeId) async {
        browseMode = mode
        setScreen(.modeBrowse)
        do { try await loadBrowse(mode) } catch { handle(error) }
    }

    public func openJourney(_ id: String) {
        selectedJourneyId = id
        setSheet(.journeys)
    }

    /// JourneysSheet "Start".
    public func startJourney() async {
        do {
            let start = try await api.startJourney(selectedJourneyId)
            timerSeconds = (start.journey.totalMinutes ?? 40) * 60
            startPlayback(start.composition, from: .journey, existing: start.session)
        } catch { handle(error) }
    }

    // MARK: - Library + playlist

    public func openLibrary() async {
        setScreen(.library)
        await loadLibrary(libraryFilter)
    }

    public func loadLibrary(_ filter: LibraryFilter) async {
        libraryFilter = filter
        do { libraryItems = try await api.library(filter) } catch { handle(error) }
    }

    /// NowPlaying bookmark.
    public func saveCurrent() async {
        guard let c = nowPlaying else { return }
        do { _ = try await api.save(compositionId: c.compositionId, offline: false); toast = "Saved to your Library"; host.haptic(.success) }
        catch { handle(error) }
    }

    public func toggleOffline(_ item: LibraryItem) async {
        do {
            let updated = try await api.setOffline(itemId: item.id, offline: !item.offline)
            if let i = libraryItems.firstIndex(where: { $0.id == item.id }) { libraryItems[i] = updated }
        } catch { handle(error) }
    }

    public func remove(_ item: LibraryItem) async {
        do { try await api.removeFromLibrary(itemId: item.id); libraryItems.removeAll { $0.id == item.id } } catch { handle(error) }
    }

    public func play(_ item: LibraryItem) async { await play(compositionId: item.compositionId, from: .library) }

    public func openPlaylist(_ id: String) async {
        playlistId = id
        setScreen(.playlist)
        do { playlist = try await api.playlist(id) } catch { handle(error) }
    }

    public func toggleLike(_ track: Track) async {
        guard let pl = playlist, let i = pl.tracks.firstIndex(where: { $0.id == track.id }) else { return }
        let liked = !(pl.tracks[i].liked ?? false)
        playlist?.tracks[i].liked = liked
        host.haptic(.selection)
        do { try await api.setLike(playlistId: pl.id, trackId: track.id, liked: liked) }
        catch { playlist?.tracks[i].liked = !liked; handle(error) }
    }

    public func play(_ track: Track) async { await play(compositionId: track.compositionId, from: .playlist) }

    /// Playlist "Play all": first track.
    public func playPlaylist() async {
        if let first = playlist?.tracks.first { await play(first) }
    }

    // MARK: - Listening Circles

    public func openCircles() async {
        setScreen(.listeningCircles)
        do { circles = try await api.circles() } catch { handle(error) }
    }

    /// "Join": everyone hears the same moment, so seek to the server's offset.
    public func joinLiveCircle() async {
        let id = circles?.live.id ?? "live_1"
        do {
            let j = try await api.joinCircle(id)
            circles?.live.listening = j.listening
            startPlayback(j.composition, from: .circle, startOffset: TimeInterval(j.startOffsetSec), existing: j.session)
        } catch { handle(error) }
    }

    public func toggleReminder(_ circle: Circles.Upcoming) async {
        let on = !(circle.reminderOn ?? false)
        if let i = circles?.upcoming.firstIndex(where: { $0.id == circle.id }) { circles?.upcoming[i].reminderOn = on }
        do {
            try await api.setCircleReminder(circle.id, on: on)
            if on { _ = await host.scheduleCircleReminder(id: circle.id, title: circle.title, when: circle.when) }
            else { host.cancelCircleReminder(id: circle.id) }
        } catch { handle(error) }
    }

    // MARK: - Premium

    public func purchase() async {
        isBusy = true
        defer { isBusy = false }
        let plans = content?.premium.plans ?? []
        guard let plan = plans.first(where: { $0.id == premiumPlanId }) ?? plans.first else { return }
        do {
            if try await host.purchase(productId: plan.productId) {
                sheet = nil
                toast = "Welcome to Escape Premium"
                browsePages = [:]
                await refreshHome()
            }
        } catch { toast = "Purchase didn't go through." }
    }

    public func restorePurchases() async {
        do {
            if try await host.restorePurchases() { sheet = nil; await refreshHome() } else { toast = "No purchases to restore." }
        } catch { toast = "Couldn't reach the App Store." }
    }

    // MARK: - Previews and tests

    /// Loads screen copy from the bundled figma-seed.json right away (no network).
    public func useBundledContent(_ bundle: Bundle = .main) {
        if content == nil { content = try? ContentBundle.bundled(bundle) }
    }

    /// A store wired to the mock API, silent audio and preview host, already on `screen`.
    /// Use in every #Preview:  `.environment(AppStore.preview(.nowPlaying))` then `.task { await store.bootstrap() }`.
    public static func preview(_ screen: Screen = .soundscapesHome, sheet: Sheet? = nil, renderSeconds: Double = 4) -> AppStore {
        let api: SoundscapesAPI = (try? MockSoundscapesAPI.bundled(renderSeconds: renderSeconds)) ?? APIClient.dev()
        let store = AppStore(api: api, audio: SilentAudioEngine(), host: PreviewHostServices())
        store.useBundledContent()
        store.hasOnboarded = screen != .onboardingSoundscapes
        store.screen = screen
        store.sheet = sheet
        store.pollInterval = 1
        return store
    }

    // MARK: - Errors

    public func handle(_ error: Error) {
        if let e = error as? APIError {
            if case .premiumRequired = e { setSheet(.premium); return }
            toast = e.userMessage
        } else {
            toast = error.localizedDescription
        }
    }
}
