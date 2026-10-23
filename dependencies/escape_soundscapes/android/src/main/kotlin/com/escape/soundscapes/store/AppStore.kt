package com.escape.soundscapes.store

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateMapOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import com.escape.soundscapes.api.ApiError
import com.escape.soundscapes.api.InputsQuery
import com.escape.soundscapes.api.SoundscapesApi
import com.escape.soundscapes.audio.AudioEngine
import com.escape.soundscapes.audio.PlaybackControls
import com.escape.soundscapes.audio.PlaybackService
import com.escape.soundscapes.model.BrowseCard
import com.escape.soundscapes.model.BrowsePage
import com.escape.soundscapes.model.CompleteSessionRequest
import com.escape.soundscapes.model.Composition
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.Home
import com.escape.soundscapes.model.InputSetting
import com.escape.soundscapes.model.InputsNow
import com.escape.soundscapes.model.LayerSetting
import com.escape.soundscapes.model.LibraryFilter
import com.escape.soundscapes.model.LibraryItem
import com.escape.soundscapes.model.Mode
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.model.MoodScan
import com.escape.soundscapes.model.Playlist
import com.escape.soundscapes.model.PlaylistSummary
import com.escape.soundscapes.model.Preferences
import com.escape.soundscapes.model.PreferencesPatch
import com.escape.soundscapes.model.Session
import com.escape.soundscapes.model.SessionOrigin
import com.escape.soundscapes.model.SessionResult
import com.escape.soundscapes.model.StartSessionRequest
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch

/**
 * The one source of truth for the Soundscapes module (Store/AppStore.swift, field for field for the
 * ported screens). Views read Compose state and call actions; they never call the API directly.
 * Lives in a ViewModel; [scope] is its main-thread scope. Views launch store actions in [scope]
 * (not a composable's scope), so an action keeps running after the sheet or screen that started it
 * leaves the composition. Library / prefs / inputs actions are in AppStoreActions.kt.
 */
class AppStore(
    val api: SoundscapesApi,
    val audio: AudioEngine,
    val host: HostServices,
    internal val scope: CoroutineScope,
) {
    // Mirrors store.ts
    var screen by mutableStateOf(Screen.ONBOARDING); internal set
    var sheet by mutableStateOf<Sheet?>(null); internal set
    var currentMode by mutableStateOf(ModeId.FOCUS)
    var isPlaying by mutableStateOf(false); internal set
    var moodField by mutableStateOf(MoodField.figmaDefault)
    var blendOn by mutableStateOf(false); internal set
    var focusShieldOn by mutableStateOf(false); internal set
    /** Remaining session time. Figma default 24:51. */
    var timerSeconds by mutableStateOf(24 * 60 + 51); internal set
    var activeCompositionId by mutableStateOf<String?>(null); internal set
    var hasOnboarded by mutableStateOf(false); internal set
    var browseMode by mutableStateOf(ModeId.CALM); internal set

    // Data
    var content by mutableStateOf<ContentBundle?>(null); internal set
    var home by mutableStateOf<Home?>(null); internal set
    var preferences by mutableStateOf<Preferences?>(null); internal set
    val inputs = mutableStateListOf<InputSetting>()
    var inputsFooter by mutableStateOf(""); internal set
    val browsePages = mutableStateMapOf<ModeId, BrowsePage>()
    val libraryItems = mutableStateListOf<LibraryItem>()
    internal val savedCompositionIds = mutableStateMapOf<String, Boolean>()
    var libraryFilter by mutableStateOf(LibraryFilter.SAVED); internal set
    var playlist by mutableStateOf<Playlist?>(null); internal set
    val playlistSummaries = mutableStateListOf<PlaylistSummary>()
    var playlistId by mutableStateOf("evening-wind-down"); internal set
    var moodScan by mutableStateOf<MoodScan?>(null); internal set

    /** What's playing (or last played): Now Playing and MiniPlayer. */
    var nowPlaying by mutableStateOf<Composition?>(null); internal set
    /** The variation / retune Lucille is working on. */
    var generating by mutableStateOf<Composition?>(null); internal set
    var session by mutableStateOf<Session?>(null); internal set
    var lastResult by mutableStateOf<SessionResult?>(null); internal set
    var permissionTarget by mutableStateOf(InputSetting.Kind.WEATHER); internal set
    var isBusy by mutableStateOf(false); internal set
    /** One-line message for a toast; the toast clears it after showing. */
    var toast by mutableStateOf<String?>(null)

    /** Seconds between status polls while Lucille renders. */
    var pollIntervalMs = 2_000L
    private var timerJob: Job? = null
    private var sessionStartedAt: Long? = null
    internal var prefsChain: Job? = null

    // Host hooks (set by the activity)
    var onExitToHost: ((NavTab) -> Unit)? = null
    var onOpenHostRoute: ((String) -> Unit)? = null
    var onCloseToHost: (() -> Unit)? = null
    /** True when the host opened the module straight into the Mood Scan, so closing it returns there. */
    var scanOpenedFromHost = false

    init {
        audio.onFinished = { isPlaying = false; syncService() }
        audio.onExternalPause = { playing ->
            isPlaying = playing
            if (playing) startTimer() else timerJob?.cancel()
            syncService()
        }
        PlaybackControls.onToggle = { togglePlay() }
        PlaybackControls.onEnd = { scope.launch { endSession() } }
    }

    // Derived
    val isPremium: Boolean get() = home?.user?.isPremium ?: false
    val firstName: String get() = home?.user?.firstName ?: ""
    val inputsNow: InputsNow? get() = home?.inputsNow
    val modes: List<Mode> get() = home?.modes ?: emptyList()
    val browsePage: BrowsePage? get() = browsePages[browseMode]
    val showsBottomNav: Boolean get() = !screen.hidesNav
    /** MiniPlayer shows on Home-level screens once something is playing. */
    val showsMiniPlayer: Boolean get() = nowPlaying != null && !screen.hidesNav && screen != Screen.SESSION_COMPLETE
    val isSleepUI: Boolean get() = currentMode == ModeId.SLEEP

    fun isLocked(mode: ModeId): Boolean {
        if (!SoundscapesFeatures.purchases) return false
        modes.firstOrNull { it.id == mode }?.let { return it.locked ?: (it.premium && !isPremium) }
        return !mode.isFree && !isPremium
    }

    fun isSaved(compositionId: String?): Boolean = compositionId != null && savedCompositionIds[compositionId] == true

    // Boot

    /** Loads everything Home needs. Safe to call again. */
    suspend fun bootstrap() {
        isBusy = true
        try {
            if (content == null) content = runCatching { api.content() }.getOrNull()
            try {
                val prefs = api.preferences()
                apply(prefs)
                hasOnboarded = prefs.hasOnboarded
                if (hasOnboarded && screen == Screen.ONBOARDING) screen = Screen.HOME
            } catch (e: Exception) { handle(e) }
            refreshHome()
            runCatching { api.inputs() }.getOrNull()?.let { r ->
                inputs.clear(); inputs.addAll(r.inputs); inputsFooter = r.footer
            }
            moodScan = runCatching { api.latestMoodScan() }.getOrNull()
        } finally {
            isBusy = false
        }
    }

    suspend fun refreshHome() {
        try { home = api.home(inputsQuery()) } catch (e: Exception) { handle(e) }
    }

    private suspend fun inputsQuery(): InputsQuery {
        fun on(k: InputSetting.Kind) = inputs.firstOrNull { it.id == k }?.enabled ?: false
        var q = InputsQuery()
        if (on(InputSetting.Kind.WEATHER)) host.currentLocation()?.let { (lat, lon) -> q = q.copy(lat = lat, lon = lon) }
        if (on(InputSetting.Kind.HEART)) q = q.copy(heartBpm = host.latestHeartRate())
        return q
    }

    private fun apply(p: Preferences) {
        preferences = p
        moodField = p.moodField
        blendOn = p.blendOn
        focusShieldOn = p.focusShieldOn
        // Whisper speaks only when the Lucille's Voice layer is on too (both start off).
        if (p.whisper.enabled && !voiceOn(p.layers)) {
            preferences = p.copy(whisper = p.whisper.copy(enabled = false))
            savePreferences(PreferencesPatch(whisper = PreferencesPatch.WhisperPatch(enabled = false)))
        }
        pushAudioPrefs()
    }

    internal fun voiceOn(layers: List<LayerSetting>): Boolean = layers.firstOrNull { it.id == "voice" }?.let { !it.muted } ?: true

    internal fun pushAudioPrefs() {
        val p = preferences ?: return
        audio.setLayers(p.layers)
        pushWhisper()
    }

    internal fun pushWhisper() {
        val p = preferences ?: return
        audio.setWhisper(p.whisper.enabled, p.whisper.selectedTopic)
    }

    // Navigation

    fun setScreen(s: Screen) {
        screen = s
        host.track("screen_view", mapOf("screen" to s.raw))
    }

    fun setSheet(s: Sheet?) {
        sheet = s
        if (s != null) host.track("sheet_view", mapOf("sheet" to s.raw))
    }

    fun closeSheet() { sheet = null }

    fun selectTab(tab: NavTab) {
        val exit = onExitToHost
        if (tab != NavTab.SOUNDSCAPES && exit != null) { exit(tab); return }
        setScreen(Screen.HOME)
    }

    /** Opened from Flutter with a Figma screen / sheet name. */
    fun openFromHost(screenName: String?, sheetName: String?) {
        Screen.fromRaw(screenName)?.let {
            scanOpenedFromHost = it == Screen.MOOD_SCAN
            setScreen(it)
        }
        setSheet(Sheet.fromRaw(sheetName))
    }

    fun finishOnboarding() {
        hasOnboarded = true
        setScreen(Screen.HOME)
        scope.launch { runCatching { api.completeOnboarding() } }
    }

    /** Home "Mood" tile and the host app's Mood Scan entry. */
    fun openMoodScan() {
        setSheet(null)
        setScreen(Screen.MOOD_SCAN)
    }

    /** Close: back to the host page if the host opened the scan, else Soundscapes Home. */
    fun closeMoodScan() {
        val close = onCloseToHost
        if (scanOpenedFromHost && close != null) {
            scanOpenedFromHost = false
            close()
            return
        }
        setScreen(if (hasOnboarded) Screen.HOME else Screen.ONBOARDING)
    }

    // Playback

    /** "Play for right now": Lucille's pick for this moment, one tap to sound. */
    suspend fun playNow() {
        val mode = inputsNow?.suggestedMode ?: ModeId.FOCUS
        val drop = home?.dailyDrop
        val c = drop?.composition
        if (drop != null && ModeId.loose(drop.mode) == mode && c != null) {
            startPlayback(c, SessionOrigin.PLAY_NOW)
            return
        }
        play(mode, SessionOrigin.PLAY_NOW)
    }

    /** Mode orb tap. */
    suspend fun play(mode: ModeId, origin: SessionOrigin = SessionOrigin.MODE) {
        if (isLocked(mode)) { toast = "${mode.title} is part of Escape Premium"; return }
        currentMode = mode
        if (mode == ModeId.SLEEP && origin == SessionOrigin.MODE) { setScreen(Screen.SLEEP_SETUP); return }
        try {
            val page = loadBrowse(if (mode in ModeId.browsable) mode else ModeId.CALM)
            val pick = page.cards.firstOrNull { !it.locked } ?: page.cards.firstOrNull() ?: return
            play(pick.compositionId, origin)
        } catch (e: Exception) { handle(e) }
    }

    suspend fun play(compositionId: String, origin: SessionOrigin, startOffsetSec: Double = 0.0) {
        try {
            startPlayback(api.composition(compositionId), origin, startOffsetSec)
        } catch (e: Exception) { handle(e) }
    }

    suspend fun play(card: BrowseCard) {
        if (card.locked && SoundscapesFeatures.purchases) { toast = "This needs Escape Premium"; return }
        play(card.compositionId, SessionOrigin.MODE)
    }

    /** Starts sound and opens Now Playing. */
    fun startPlayback(c: Composition, origin: SessionOrigin, startOffsetSec: Double = 0.0, existing: Session? = null) {
        val switching = nowPlaying != null && isPlaying
        nowPlaying = c
        activeCompositionId = c.compositionId
        currentMode = c.mode
        if (switching) audio.crossfade(c) else audio.play(c, blendOn, startOffsetSec)
        isPlaying = true
        sheet = null
        setScreen(Screen.NOW_PLAYING)
        host.haptic(HapticKind.LIGHT)
        if (existing != null) {
            session = existing
            sessionStartedAt = System.currentTimeMillis()
        } else if (session == null || !switching) {
            scope.launch { beginSession(c, origin) }
        }
        startTimer()
        syncService()
    }

    private suspend fun beginSession(c: Composition, origin: SessionOrigin) {
        try {
            session = api.startSession(StartSessionRequest(c.mode, c.compositionId, origin, moodField = moodField))
            sessionStartedAt = System.currentTimeMillis()
            host.track("session_start", mapOf("mode" to c.mode.raw, "from" to origin.raw))
        } catch (e: Exception) { handle(e) }
    }

    /** Play/pause (ControlBar, MiniPlayer, notification). */
    fun togglePlay() {
        if (nowPlaying == null) { scope.launch { playNow() }; return }
        if (isPlaying) { audio.pause(); timerJob?.cancel() } else { audio.resume(); startTimer() }
        isPlaying = !isPlaying
        host.haptic(HapticKind.SELECTION)
        syncService()
    }

    /** Now Playing mode switcher: crossfade into the new mode without leaving the screen. */
    suspend fun switchMode(mode: ModeId) {
        if (mode == currentMode) return
        val open = onOpenHostRoute
        if (mode == ModeId.MOVE && open != null) { open("Body"); return }
        if (isLocked(mode)) { toast = "${mode.title} is part of Escape Premium"; return }
        currentMode = mode
        try {
            val page = loadBrowse(if (mode in ModeId.browsable) mode else ModeId.CALM)
            val pick = page.cards.firstOrNull { !it.locked } ?: return
            val c = api.composition(pick.compositionId)
            // A new mode is a new session: fresh timer, full volume.
            timerSeconds = (preferences?.timer?.minutes ?: 25) * 60
            audio.setVolume(1f)
            startPlayback(c, SessionOrigin.MODE)
        } catch (e: Exception) { handle(e) }
    }

    /** Now Playing chevron: back to Home, music keeps going (MiniPlayer). */
    fun minimizePlayer() = setScreen(Screen.HOME)

    // Timer

    /** TimerSheet "Set timer". */
    fun setTimer(minutes: Int, fadeOut: Boolean? = null, sunriseWake: Boolean? = null) {
        timerSeconds = minutes * 60
        sheet = null
        savePreferences(PreferencesPatch(timer = PreferencesPatch.TimerPatch(minutes, fadeOut, sunriseWake)))
        val t = preferences?.sleep?.sunriseTime
        if (sunriseWake == true && t != null) scope.launch {
            if (!host.scheduleSunriseWake(t)) toast = "Sunrise Wake isn't available on Android yet."
        }
        if (sunriseWake == false) host.cancelSunriseWake()
        if (isPlaying) startTimer()
    }

    private fun startTimer() {
        timerJob?.cancel()
        timerJob = scope.launch {
            while (isActive) {
                delay(1_000)
                tick()
            }
        }
    }

    /** One second of session time. */
    fun tick() {
        if (!isPlaying || timerSeconds <= 0) return
        timerSeconds -= 1
        val fadeOut = preferences?.timer?.fadeOut ?: true
        if (fadeOut && timerSeconds <= 300) audio.setVolume(timerSeconds / 300f)
        if (timerSeconds == 0) scope.launch { endSession() }
    }

    // Session end

    /** Ends the session: outro, then Session Complete with streak and shards. */
    suspend fun endSession(moodAfter: Double? = null) {
        timerJob?.cancel()
        audio.finishGracefully()
        audio.setVolume(1f)
        isPlaying = false
        syncService()
        lastResult = null   // never show the previous session's stats for this one
        val s = session
        if (s == null) { setScreen(Screen.SESSION_COMPLETE); return }
        val minutes = sessionStartedAt?.let { (System.currentTimeMillis() - it) / 60_000.0 }
        try {
            lastResult = api.completeSession(s.sessionId, CompleteSessionRequest(minutes, moodAfter))
            host.track("session_complete", mapOf("mode" to s.mode.raw, "minutes" to (lastResult?.minutes ?: 0).toString()))
            host.haptic(HapticKind.SUCCESS)
        } catch (e: Exception) { handle(e) }
        setScreen(Screen.SESSION_COMPLETE)
        refreshHome()
    }

    /** "Save this as a Memory". */
    suspend fun saveMemory() {
        val s = session ?: return
        try {
            api.saveMemory(s.sessionId, null)
            toast = "Saved to Memories"
            host.haptic(HapticKind.SUCCESS)
        } catch (e: Exception) { handle(e) }
    }

    /** "Keep listening": restart the same composition as a new session. */
    fun keepListening() {
        val c = nowPlaying ?: run { setScreen(Screen.HOME); return }
        val origin = session?.startedFrom ?: SessionOrigin.MODE
        session = null
        timerSeconds = (preferences?.timer?.minutes ?: 25) * 60
        isPlaying = false
        startPlayback(c, origin)
    }

    /** "Done". */
    fun doneWithSession() {
        session = null
        nowPlaying = null
        activeCompositionId = null
        syncService()
        setScreen(Screen.HOME)
    }

    // Variation / retune (Lucille track → nearest same-mode track, crossfaded in)

    /** Now Playing "New variation". */
    suspend fun variation() {
        val id = nowPlaying?.compositionId ?: return
        try {
            val accepted = api.variation(id)
            generating = accepted.composition
            toast = "Lucille is composing a variation…"
            crossfadeWhenReady(accepted.compositionId)
        } catch (e: Exception) { handle(e) }
    }

    /** MoodFieldSheet "Update soundscape". */
    suspend fun applyMoodField() {
        sheet = null
        savePreferences(PreferencesPatch(moodField = moodField))
        val id = nowPlaying?.compositionId ?: return
        try {
            val accepted = api.retune(id, moodField)
            generating = accepted.composition
            toast = "Reshaping your soundscape…"
            crossfadeWhenReady(accepted.compositionId)
        } catch (e: Exception) { handle(e) }
    }

    private suspend fun crossfadeWhenReady(id: String) {
        repeat(90) {
            delay(pollIntervalMs)
            val c = runCatching { api.composition(id) }.getOrNull() ?: return@repeat
            generating = c
            if (c.status == com.escape.soundscapes.model.CompositionStatus.READY) {
                nowPlaying = c
                activeCompositionId = c.compositionId
                if (isPlaying) audio.crossfade(c)
                syncService()
                return
            }
            if (c.status == com.escape.soundscapes.model.CompositionStatus.FAILED) { toast = c.failReason; return }
        }
    }

    // Browse

    suspend fun loadBrowse(mode: ModeId): BrowsePage {
        browsePages[mode]?.let { return it }
        val p = api.browse(mode)
        browsePages[mode] = p
        return p
    }

    /** Home tab chip (Focus/Calm/Sleep/Move/Realms). */
    suspend fun openBrowse(mode: ModeId) {
        val open = onOpenHostRoute
        if (mode == ModeId.MOVE && open != null) { open("Body"); return }
        browseMode = mode
        setScreen(Screen.MODE_BROWSE)
        try { loadBrowse(mode) } catch (e: Exception) { handle(e) }
    }

    // Preferences chain

    /** Saves run one after another so responses can't arrive out of order and undo a newer change. */
    internal fun savePreferences(patch: PreferencesPatch) {
        val previous = prefsChain
        prefsChain = scope.launch {
            previous?.join()
            try { preferences = api.updatePreferences(patch) } catch (e: Exception) { handle(e) }
        }
    }

    // Foreground service + notification

    internal fun syncService() {
        val c = nowPlaying
        val ctx = host.appContext
        if (c == null) { PlaybackService.stop(ctx); return }
        if (!isPlaying && !PlaybackService.running) return
        PlaybackService.update(ctx, c.title, c.creditLine, isPlaying)
    }

    /** Called when the module closes for good. */
    fun shutdown() {
        timerJob?.cancel()
        audio.release()
        PlaybackService.stop(host.appContext)
        if (PlaybackControls.onToggle != null) { PlaybackControls.onToggle = null; PlaybackControls.onEnd = null }
    }

    // Errors

    fun handle(e: Throwable) {
        if (e is kotlinx.coroutines.CancellationException) throw e
        toast = when (e) {
            is ApiError -> e.userMessage.ifEmpty { null }
            else -> e.message
        }
    }
}
