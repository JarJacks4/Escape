package com.escape.soundscapes.api

import com.escape.soundscapes.model.AudioSegment
import com.escape.soundscapes.model.BetaFeedbackRequest
import com.escape.soundscapes.model.BrowseCard
import com.escape.soundscapes.model.BrowsePage
import com.escape.soundscapes.model.ComposeAccepted
import com.escape.soundscapes.model.CompleteSessionRequest
import com.escape.soundscapes.model.Composition
import com.escape.soundscapes.model.CompositionStatus
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.DailyDrop
import com.escape.soundscapes.model.GradientSpec
import com.escape.soundscapes.model.Home
import com.escape.soundscapes.model.InputSetting
import com.escape.soundscapes.model.InputsNow
import com.escape.soundscapes.model.InputsResponse
import com.escape.soundscapes.model.Journey
import com.escape.soundscapes.model.LibraryFilter
import com.escape.soundscapes.model.LibraryItem
import com.escape.soundscapes.model.Mode
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.MoodCheckIn
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.model.MoodScan
import com.escape.soundscapes.model.Playlist
import com.escape.soundscapes.model.PlaylistSummary
import com.escape.soundscapes.model.Preferences
import com.escape.soundscapes.model.PreferencesPatch
import com.escape.soundscapes.model.Profile
import com.escape.soundscapes.model.Session
import com.escape.soundscapes.model.SessionResult
import com.escape.soundscapes.model.StartSessionRequest
import com.escape.soundscapes.model.Track
import com.escape.soundscapes.model.Weather
import java.util.Locale
import kotlin.math.roundToInt
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

/**
 * Lucille v1 catalog for Browse and Now Playing; everything else is answered by the bundled mock
 * (LucilleBackedAPI.swift, line for line). Catalog tracks get compositionId "lv1:<trackId>";
 * catalog playlists get id "cat:<categoryId>". Sessions always run on the mock (timer, streak and
 * Session Complete keep working) and are mirrored to v1 when that call succeeds. Main-thread confined.
 */
class LucilleBackedApi(
    private val mock: MockSoundscapesApi,
    private val v1: LucilleV1Client,
    firstName: String? = null,
) : SoundscapesApi {

    companion object {
        const val PREFIX = "lv1:"
        const val PLAYLIST_PREFIX = "cat:"

        fun trackId(compositionId: String): String? =
            if (compositionId.startsWith(PREFIX)) compositionId.removePrefix(PREFIX) else null

        private fun minutesOf(t: V1Track): Int = ((t.durationSec ?: 1800.0) / 60.0).roundToInt()

        private fun prettyCategory(c: String): String =
            c.replace('_', ' ').split(' ').joinToString(" ") { w -> w.replaceFirstChar { it.titlecase(Locale.getDefault()) } }

        /** Durations are estimates (intro ~45 s, bodies ~2.7 min, outro ~1 min); the player moves on when each item ends. */
        fun composition(t: V1Track, subtitle: String?, gradient: GradientSpec): Composition {
            val segments = buildList {
                add(AudioSegment(AudioSegment.Role.INTRO, t.audio.intro, 45.0))
                t.audio.bodies.forEach { add(AudioSegment(AudioSegment.Role.BODY, it, 160.0)) }
                add(AudioSegment(AudioSegment.Role.OUTRO, t.audio.outro, 60.0))
            }.filter { it.url.isNotEmpty() }
            val minutes = minutesOf(t)
            val now = MockSoundscapesApi.iso()
            return Composition(
                compositionId = PREFIX + t.id, status = CompositionStatus.READY,
                mode = ModeId.fromRaw(t.mode) ?: ModeId.CALM, title = t.title,
                subtitle = "${subtitle ?: prettyCategory(t.category)} · $minutes min",
                segments = segments, gradient = gradient, artist = "Lucille", source = "lucille_v1",
                durationLabel = "$minutes min", minutes = minutes, moodField = MoodField(t.moodField.energy, t.moodField.texture),
                createdAt = now, readyAt = now,
            )
        }

        /** Closest by Mood Field distance; skips the current track unless it's the only one. */
        fun nearestTrack(pool: List<V1Track>, f: MoodField, avoiding: String): V1Track? {
            fun d(t: V1Track): Double {
                val de = t.moodField.energy - f.energy
                val dt = t.moodField.texture - f.texture
                return de * de + dt * dt
            }
            val others = pool.filter { it.id != avoiding }
            return (others.ifEmpty { pool }).minByOrNull { d(it) }
        }
    }

    private val tracks = HashMap<String, V1Track>()
    private var categoryInfo: Map<String, V1Category> = emptyMap()
    private val v1Sessions = HashMap<String, String>()   // mock session id -> v1 session id
    private val sessionTracks = HashMap<String, String>() // mock session id -> Lucille track id
    private val firstName: String = firstName?.trim().orEmpty().ifEmpty { "friend" }
    private var nameApplied = false
    private val background = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    /** The mock's seed user is "Jared": swap in the tester's name before anything reads it. */
    private suspend fun applyName() {
        if (nameApplied) return
        nameApplied = true
        runCatching { mock.updateProfile(firstName) }
    }

    // Catalog (v1)

    /** Every mode open: no Lucille or Epidemic track sits behind a paywall in the beta. */
    override suspend fun modes(): List<Mode> = mock.modes().map { it.copy(premium = false, locked = false) }

    override suspend fun browse(mode: ModeId): BrowsePage {
        val base = runCatching { mock.browse(mode) }.getOrNull()
        val list = try {
            v1Tracks(mode)
        } catch (e: Exception) {
            if (base != null) return base   // offline / server error: keep the bundled page
            throw e
        }
        loadCategories()
        list.forEach { tracks[it.id] = it }
        val title = base?.title ?: mode.title
        val cards = list.map { t ->
            BrowseCard(t.id, PREFIX + t.id, t.title, description(t), title, gradient(t), isPremium = false, locked = false)
        }
        return BrowsePage(mode, title, base?.tagline ?: "", base?.background ?: "", base?.chipsLabel ?: "", emptyList(), cards)
    }

    override suspend fun composition(id: String): Composition {
        val tid = trackId(id) ?: return mock.composition(id)
        return lucilleComposition(tid)
    }

    /** v1 catalog modes are focus / calm / sleep / move. The module's other modes map to categories. */
    private suspend fun v1Tracks(mode: ModeId): List<V1Track> = when (mode) {
        ModeId.FOCUS, ModeId.CALM, ModeId.SLEEP, ModeId.MOVE -> v1.catalog(mode = mode.raw)
        ModeId.PICKS -> v1.catalog()
        ModeId.NOISE -> listOf("binaural_beats", "brainwave_music", "raw_frequencies").flatMap { v1.catalog(category = it) }
        ModeId.REALMS -> v1.catalog(category = "nature")
    }

    private suspend fun loadCategories() {
        if (categoryInfo.isNotEmpty()) return
        val list = runCatching { v1.categories() }.getOrNull() ?: return
        categoryInfo = list.associateBy({ it.id }, { it })
    }

    private fun description(t: V1Track): String {
        val label = categoryInfo[t.category]?.label ?: prettyCategory(t.category)
        return "$label · ${minutesOf(t)} min"
    }

    private fun gradient(t: V1Track): GradientSpec {
        val c = categoryInfo[t.category]?.color
        return if (c != null && c.startsWith("#")) GradientSpec(listOf(c, "#101E43")) else GradientSpec.fallback
    }

    private suspend fun lucilleComposition(tid: String): Composition {
        val t = tracks[tid] ?: v1.track(tid).also { tracks[tid] = it }
        loadCategories()
        return composition(t, categoryInfo[t.category]?.label, gradient(t))
    }

    // Sessions (mock, mirrored to v1)

    override suspend fun startSession(req: StartSessionRequest): Session {
        val s = mock.startSession(req)
        val tid = req.compositionId?.let { trackId(it) }
        if (tid != null) {
            sessionTracks[s.sessionId] = tid
            val mode = tracks[tid]?.mode ?: req.mode.raw
            runCatching { v1.startSession(tid, mode) }.getOrNull()?.let { v1Sessions[s.sessionId] = it.id }
        }
        return s
    }

    override suspend fun completeSession(id: String, req: CompleteSessionRequest): SessionResult {
        var r = mock.completeSession(id, req)
        val vid = v1Sessions.remove(id)
        if (vid != null) {
            runCatching { v1.completeSession(vid, req.minutes ?: r.minutes.toDouble()) }.getOrNull()?.let { done ->
                r = r.copy(streakDays = done.streakDays, shardsEarned = done.coinsAwarded)
            }
        }
        return r
    }

    // Library

    override suspend fun save(compositionId: String, offline: Boolean): LibraryItem {
        val tid = trackId(compositionId)
        if (tid != null) {
            mock.register(lucilleComposition(tid))
            background.launch { runCatching { v1.save(tid) } }   // mirrors to v1 once per-user writes work
        }
        return mock.save(compositionId, offline)
    }

    /** Variation on a Lucille track: another track in the same mode. */
    override suspend fun variation(id: String): ComposeAccepted {
        val tid = trackId(id) ?: return mock.variation(id)
        val pool = sameModeTracks(tid).filter { it.id != tid }
        val next = pool.randomOrNull() ?: return accepted(tid)
        return accepted(next.id)
    }

    /** Mood Field "Update soundscape" on a Lucille track: the same-mode track closest to the chosen field. */
    override suspend fun retune(id: String, moodField: MoodField): ComposeAccepted {
        val tid = trackId(id) ?: return mock.retune(id, moodField)
        val best = nearestTrack(sameModeTracks(tid), moodField, tid) ?: return accepted(tid)
        return accepted(best.id)
    }

    private suspend fun sameModeTracks(tid: String): List<V1Track> {
        val current = tracks[tid] ?: v1.track(tid).also { tracks[tid] = it }
        val list = v1.catalog(mode = current.mode)
        list.forEach { tracks[it.id] = it }
        return list
    }

    private suspend fun accepted(tid: String): ComposeAccepted {
        val c = lucilleComposition(tid)
        return ComposeAccepted(c.compositionId, CompositionStatus.READY, 0, c)
    }

    // Mood Scan helpers (the Android Mood Scan talks to Lucille itself; kept for parity)

    suspend fun grantConsents(flags: Map<String, Boolean>) = v1.grantConsents(flags)
    suspend fun lifetimeCoins(): Int = v1.progress().lifetimeCoins

    // Everything else: the mock

    override suspend fun content(): ContentBundle = mock.content()

    /** Home layout from the bundled content, with the person's real Daily Drop and streak from v1. */
    override suspend fun home(q: InputsQuery): Home {
        applyName()
        var h = mock.home(q).copy(madeByYou = emptyList())
        // The seed's streak / shards are sample numbers: show the person's real streak, or 0.
        val progress = runCatching { v1.progress() }.getOrNull()
        h = h.copy(user = h.user.copy(streakDays = progress?.streakDays ?: 0, totalShards = progress?.lifetimeCoins ?: 0))
        runCatching { v1.dailyDrop() }.getOrNull()?.let { d ->
            tracks[d.track.id] = d.track
            loadCategories()
            h = h.copy(dailyDrop = DailyDrop(PREFIX + d.track.id, "Lucille's Daily Drop", "New every morning", d.title,
                "${d.track.title} · picked for today", d.track.mode, gradient(d.track), null))
        }
        // Inner Weather from v1 (the mock's sample weather/mood is replaced).
        return h.copy(inputsNow = inputsNow(q))
    }

    /** Inner Weather from Lucille v1: real day phase, last saved mood and (with location) real weather. */
    override suspend fun inputsNow(q: InputsQuery): InputsNow {
        val n = mock.inputsNow(q)
        val v = runCatching { v1.innerWeather(q.lat, q.lon) }.getOrNull()
        if (v == null) {
            // Offline: the seed's "Afternoon Lift" would be wrong most of the day; use the clock.
            val local = localPhase()
            return n.copy(circadianPhase = local.lowercase(), phaseLabel = local, phaseValue = "", nextPhaseInMin = null,
                weather = null, mood = null, heartBpm = null,
                playNowSubtitle = "Lucille picks ${n.suggestedMode.title} for your ${local.lowercase()}")
        }
        val phase = v.phase.replaceFirstChar { it.titlecase(Locale.getDefault()) }
        val c = v.tempC
        return n.copy(
            playNowSubtitle = "Lucille picks ${n.suggestedMode.title} for your ${if (v.night) "night" else phase.lowercase()}",
            circadianPhase = v.phase,
            phaseLabel = phase,
            phaseValue = if (v.night) "Night" else phase,
            nextPhaseInMin = null,
            weather = if (v.weatherAvailable && c != null)
                Weather((c * 9 / 5 + 32).roundToInt(), (v.bucket ?: "").replaceFirstChar { it.titlecase(Locale.getDefault()) }, "") else null,
            mood = v.moodWord,
            heartBpm = null,   // no live heart source; the Mood Scan measures it on demand
        )
    }

    override suspend fun me(): Profile { applyName(); return mock.me() }
    override suspend fun updateProfile(firstName: String?): Profile = mock.updateProfile(firstName)
    override suspend fun preferences(): Preferences = mock.preferences()
    override suspend fun updatePreferences(patch: PreferencesPatch): Preferences = mock.updatePreferences(patch)
    override suspend fun completeOnboarding() = mock.completeOnboarding()
    override suspend fun inputs(): InputsResponse = mock.inputs()
    override suspend fun setInput(id: InputSetting.Kind, enabled: Boolean): InputSetting = mock.setInput(id, enabled)

    /** Erases stored mood readings on the server, then the local cache. */
    override suspend fun deleteInputHistory() {
        v1.eraseData("mood")
        runCatching { mock.deleteInputHistory() }
    }

    override suspend fun postMoodCheckIn(value: Double, tags: List<String>, source: String): MoodCheckIn = mock.postMoodCheckIn(value, tags, source)
    /** The mock's only scan is the seed sample; the real Mood Scan saves straight to Lucille v1. */
    override suspend fun latestMoodScan(): MoodScan? = null

    private fun localPhase(): String = when (java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY)) {
        in 5..11 -> "Morning"
        in 12..16 -> "Afternoon"
        else -> "Evening"
    }
    override suspend fun journeys(): List<Journey> = mock.journeys()

    /** Only what the person saved from the Lucille catalog (the seed's sample saves aren't theirs). */
    override suspend fun library(filter: LibraryFilter?): List<LibraryItem> =
        mock.library(filter).filter { it.compositionId.startsWith(PREFIX) }

    override suspend fun setOffline(itemId: String, offline: Boolean): LibraryItem = mock.setOffline(itemId, offline)
    override suspend fun removeFromLibrary(itemId: String) = mock.removeFromLibrary(itemId)

    override suspend fun saveMemory(sessionId: String, title: String?): LibraryItem {
        sessionTracks[sessionId]?.let { mock.register(lucilleComposition(it)) }
        return mock.saveMemory(sessionId, title)
    }

    /** Playlists are Lucille's catalog collections: one per category that has tracks. */
    override suspend fun playlists(): List<PlaylistSummary> {
        val cats = v1.categories()
        categoryInfo = cats.associateBy({ it.id }, { it })
        return cats.filter { (it.trackCount ?: 1) > 0 }.map { c ->
            PlaylistSummary(PLAYLIST_PREFIX + c.id, c.label, c.description, "Lucille",
                GradientSpec(listOf(if (c.color.startsWith("#")) c.color else "#2A3A7A", "#101E43")), c.trackCount ?: 0)
        }
    }

    override suspend fun playlist(id: String): Playlist {
        if (!id.startsWith(PLAYLIST_PREFIX)) return mock.playlist(id)
        val cid = id.removePrefix(PLAYLIST_PREFIX)
        loadCategories()
        val list = v1.catalog(category = cid)
        list.forEach { tracks[it.id] = it }
        val info = categoryInfo[cid]
        val color = info?.color?.takeIf { it.startsWith("#") } ?: "#2A3A7A"
        val items = list.map { t -> Track(t.id, PREFIX + t.id, t.title, t.mode, "${minutesOf(t)} min", gradient(t), false) }
        return Playlist(id, info?.label ?: "Playlist", info?.description ?: "", "Lucille", GradientSpec(listOf(color, "#101E43")), items)
    }

    override suspend fun setLike(playlistId: String, trackId: String, liked: Boolean) {
        if (playlistId.startsWith(PLAYLIST_PREFIX)) return   // catalog playlists keep likes on the device only
        mock.setLike(playlistId, trackId, liked)
    }

    override suspend fun sendBetaFeedback(req: BetaFeedbackRequest) = mock.sendBetaFeedback(req)
}
