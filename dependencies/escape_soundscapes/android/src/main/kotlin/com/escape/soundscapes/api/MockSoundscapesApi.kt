package com.escape.soundscapes.api

import android.content.Context
import android.content.SharedPreferences
import com.escape.soundscapes.SoundscapesBridge
import com.escape.soundscapes.model.AudioSegment
import com.escape.soundscapes.model.BetaFeedbackRequest
import com.escape.soundscapes.model.BrowseCard
import com.escape.soundscapes.model.BrowsePage
import com.escape.soundscapes.model.Brainwave
import com.escape.soundscapes.model.ComposeAccepted
import com.escape.soundscapes.model.CompleteSessionRequest
import com.escape.soundscapes.model.Composition
import com.escape.soundscapes.model.CompositionStatus
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.GradientSpec
import com.escape.soundscapes.model.Home
import com.escape.soundscapes.model.HomeUser
import com.escape.soundscapes.model.InputSetting
import com.escape.soundscapes.model.InputsNow
import com.escape.soundscapes.model.InputsResponse
import com.escape.soundscapes.model.JourneyChip
import com.escape.soundscapes.model.Journey
import com.escape.soundscapes.model.LibraryFilter
import com.escape.soundscapes.model.LibraryItem
import com.escape.soundscapes.model.MadeByYou
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
import com.escape.soundscapes.model.Seed
import com.escape.soundscapes.model.Session
import com.escape.soundscapes.model.SessionResult
import com.escape.soundscapes.model.StartSessionRequest
import com.escape.soundscapes.model.libraryItemOf
import com.escape.soundscapes.model.mapObjects
import com.escape.soundscapes.model.parseContent
import com.escape.soundscapes.model.toJson
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone
import kotlin.math.roundToInt
import org.json.JSONArray
import org.json.JSONObject

/**
 * Answers every endpoint from the bundled figma-seed.json (MockSoundscapesAPI.swift). State lives in
 * memory; onboarding and the Library persist in SharedPreferences (the iOS beta uses UserDefaults),
 * because the module is rebuilt on every open. Main-thread confined.
 */
class MockSoundscapesApi private constructor(
    private val seed: Seed,
    private val contentBundle: ContentBundle,
    private val store: SharedPreferences,
    private val renderSeconds: Double = 6.0,
) : SoundscapesApi {

    companion object {
        private const val PREFS = "escape_soundscapes.beta"
        private const val ONBOARDED_KEY = "hasOnboarded"
        private const val LIBRARY_KEY = "library"
        private const val COUNTER_KEY = "counter"
        const val LUCILLE_PREFIX = "lv1:"

        /** Reads assets/figma-seed.json. Call off the main thread. */
        fun bundled(context: Context): MockSoundscapesApi {
            val text = context.assets.open("figma-seed.json").bufferedReader().use { it.readText() }
            val root = JSONObject(text)
            return MockSoundscapesApi(Seed.parse(root), parseContent(root),
                context.applicationContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE))
        }

        fun iso(d: Date = Date()): String = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US)
            .apply { timeZone = TimeZone.getTimeZone("UTC") }.format(d)

        fun parseIso(s: String): Date? = listOf("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "yyyy-MM-dd'T'HH:mm:ss'Z'").firstNotNullOfOrNull { f ->
            runCatching { SimpleDateFormat(f, Locale.US).apply { timeZone = TimeZone.getTimeZone("UTC") }.parse(s) }.getOrNull()
        }

        private fun word(v: Double?): String? = v?.let { if (it < 0.33) "Heavy" else if (it < 0.66) "Mixed" else "Bright" }
    }

    private val samples = listOf(
        AudioSegment(AudioSegment.Role.INTRO, "asset:///samples/sample_intro.m4a", 12.3),
        AudioSegment(AudioSegment.Role.BODY, "asset:///samples/sample_body_1.m4a", 30.3),
        AudioSegment(AudioSegment.Role.BODY, "asset:///samples/sample_body_2.m4a", 27.0),
        AudioSegment(AudioSegment.Role.OUTRO, "asset:///samples/sample_outro.m4a", 12.3),
    )

    private var profile: Profile = seed.user
    private var prefs: Preferences
    private var inputList = seed.inputs.toMutableList()
    private val compositions = LinkedHashMap<String, Composition>()
    private val renderStart = HashMap<String, Long>()
    private var library = seed.libraryItems.toMutableList()
    private val likes = HashSet<String>()
    private val sessions = HashMap<String, Session>()
    private val checkIns = ArrayList<MoodCheckIn>()
    private var counter = 0

    init {
        val c = contentBundle
        prefs = Preferences(
            moodField = c.moodField.default,
            blendOn = false,
            focusShieldOn = false,
            layers = seed.layers.map { l ->
                var x = l
                if (x.id in listOf("nature", "brainwave")) x = x.copy(muted = true)     // generated layers start off
                if (x.id in listOf("ambience", "melody", "pulse")) x = x.copy(value = 0.5) // 0.5 = track as rendered
                x
            },
            whisper = Preferences.Whisper(c.whisper.enabled, c.whisper.selectedTopic),
            timer = Preferences.Timer(c.timer.default.toIntOrNull() ?: 25, c.timer.fadeOut, c.timer.sunriseWake),
            sleep = Preferences.Sleep(c.sleepSetup.whisperIntro, c.sleepSetup.timer, c.sleepSetup.sunriseTime, c.sleepSetup.breathSync),
            hasOnboarded = false,
        )
        seed.playlists.forEach { pl -> pl.defaultLiked.forEach { likes.add("${pl.id}:$it") } }
        val scan = c.moodCheckIn.latestMoodScan
        checkIns.add(MoodCheckIn("seed_scan", profile.uid, 0.3, listOf(scan.mood), "moodScan",
            iso(Date(System.currentTimeMillis() - scan.minutesAgo * 60_000L)), "Heavy"))
        buildCatalog()

        // Beta: restore what the tester did last time.
        if (store.getBoolean(ONBOARDED_KEY, false)) {
            profile = profile.copy(hasOnboarded = true)
            prefs = prefs.copy(hasOnboarded = true)
        }
        store.getString(LIBRARY_KEY, null)?.let { raw ->
            runCatching { JSONArray(raw).mapObjects { libraryItemOf(it) } }.getOrNull()?.let { stored ->
                library = stored.filter { compositions.containsKey(it.compositionId) || it.compositionId.startsWith(LUCILLE_PREFIX) }.toMutableList()
            }
        }
        counter = maxOf(counter, store.getInt(COUNTER_KEY, 0))
    }

    private fun buildCatalog() {
        val now = iso()
        fun add(id: String, title: String, sub: String?, mode: ModeId, g: GradientSpec?, owner: String?, source: String, duration: String? = null) {
            val existing = compositions[id]
            if (existing != null) {
                if (existing.durationLabel == null) compositions[id] = existing.copy(durationLabel = duration)
                return
            }
            compositions[id] = Composition(compositionId = id, ownerUid = owner, status = CompositionStatus.READY, mode = mode,
                title = title, subtitle = sub, whyThisSound = sub, segments = samples, gradient = g, artist = "Lucille",
                source = source, durationLabel = duration ?: "Endless", createdAt = now, readyAt = now)
        }
        for ((key, page) in seed.browse) {
            val mode = ModeId.loose(key) ?: ModeId.CALM
            page.cards.forEach { add(it.id, it.title, it.description, mode, it.gradient, null, if (mode == ModeId.REALMS) "realm" else "catalog") }
        }
        val dd = seed.dailyDrop
        add(dd.compositionId, dd.title, dd.subtitle, ModeId.loose(dd.mode) ?: ModeId.CALM, dd.gradient, null, "daily")
        compositions[dd.compositionId]?.let { compositions[dd.compositionId] = it.copy(whyHeadline = "Composed at 7:02 AM for your day.") }
        seed.madeByYou.forEach { add(it.compositionId, it.title, it.description, ModeId.loose(it.mode) ?: ModeId.CALM, it.gradient, seed.user.uid, "compose") }
        seed.playlists.flatMap { it.tracks }.forEach {
            add(it.compositionId, it.title, null, ModeId.loose(it.mode) ?: ModeId.CALM, it.gradient, null, "catalog", it.duration)
        }
        seed.libraryItems.forEach {
            add(it.compositionId, it.title, null, ModeId.loose(it.mode) ?: ModeId.CALM, it.gradient, null, "catalog", it.duration)
        }
    }

    private fun nextId(prefix: String): String { counter += 1; return "${prefix}_mock$counter" }

    /** Moves a composition along queued → rendering → ready based on elapsed time. */
    private fun advanced(c: Composition): Composition {
        val start = renderStart[c.compositionId] ?: return c
        if (c.status.isFinished) return c
        val t = (System.currentTimeMillis() - start) / 1000.0
        val next = when {
            t >= renderSeconds -> if (c.prompt?.contains("#fail") == true) c.copy(status = CompositionStatus.FAILED, failReason = "Mock failure requested with #fail")
                else c.copy(status = CompositionStatus.READY, segments = samples, readyAt = iso())
            t >= renderSeconds / 3 -> c.copy(status = CompositionStatus.RENDERING)
            else -> c
        }
        compositions[c.compositionId] = next
        return next
    }

    private fun modesList(): List<Mode> = seed.modes.map { it.copy(locked = it.premium && !profile.isPremium) }

    private fun requireComposition(id: String): Composition {
        val c = compositions[id]
        if (c == null || (c.ownerUid != null && c.ownerUid != profile.uid)) throw ApiError.NotFound("Composition not found")
        return advanced(c)
    }

    /** Lucille v1 tracks (LucilleBackedApi): lets the Library save and replay them. */
    fun register(c: Composition) { compositions[c.compositionId] = c }

    // Home

    override suspend fun content(): ContentBundle = contentBundle

    override suspend fun home(q: InputsQuery): Home = Home(
        user = HomeUser(profile.firstName, profile.isPremium, profile.streakDays, profile.totalShards),
        experiments = profile.experiments,
        inputsNow = inputsNow(q),
        homeTabs = contentBundle.homeTabs,
        modes = modesList(),
        dailyDrop = seed.dailyDrop.copy(composition = compositions[seed.dailyDrop.compositionId]),
        journeyChips = seed.journeys.filter { it.id in listOf("deep-work", "exam-prep", "panic-reset", "power-nap") }
            .map { JourneyChip(it.id, it.title, it.chipDuration, it.mode) },
        featuredCircle = seed.featuredCircle,
        madeByYou = compositions.values.filter { it.ownerUid == profile.uid && it.status == CompositionStatus.READY }
            .sortedWith(compareByDescending<Composition> { it.createdAt }.thenBy { it.compositionId })
            .take(10)
            .map { MadeByYou(it.compositionId, it.title, it.subtitle ?: "", it.mode.raw, it.gradient) },
        betaFeedbackEnabled = profile.experiments.isBetaTester,
    )

    /** Figma values, filtered by which inputs are on. */
    override suspend fun inputsNow(q: InputsQuery): InputsNow {
        fun on(k: InputSetting.Kind) = inputList.firstOrNull { it.id == k }?.enabled ?: false
        var n = seed.inputsNow
        if (!on(InputSetting.Kind.WEATHER)) n = n.copy(weather = null)
        n = if (!on(InputSetting.Kind.MOOD) || checkIns.isEmpty()) n.copy(mood = null) else n.copy(mood = checkIns.last().tags.firstOrNull() ?: n.mood)
        n = if (!on(InputSetting.Kind.HEART)) n.copy(heartBpm = null) else q.heartBpm?.let { n.copy(heartBpm = it.roundToInt()) } ?: n
        return n
    }

    // Me

    override suspend fun me(): Profile = profile

    override suspend fun updateProfile(firstName: String?): Profile {
        if (firstName != null) profile = profile.copy(firstName = firstName)
        return profile
    }

    override suspend fun preferences(): Preferences = prefs

    override suspend fun updatePreferences(patch: PreferencesPatch): Preferences {
        var p = prefs
        patch.moodField?.let { p = p.copy(moodField = it) }
        patch.blendOn?.let { p = p.copy(blendOn = it) }
        patch.focusShieldOn?.let { p = p.copy(focusShieldOn = it) }
        patch.layers?.let { p = p.copy(layers = it) }
        patch.whisper?.let { w ->
            val t = w.selectedTopic
            if (t != null && contentBundle.whisper.topics.none { it.id == t }) throw ApiError.Invalid("Unknown whisper topic")
            p = p.copy(whisper = Preferences.Whisper(w.enabled ?: p.whisper.enabled, t ?: p.whisper.selectedTopic))
        }
        patch.timer?.let { t ->
            p = p.copy(timer = Preferences.Timer(t.minutes ?: p.timer.minutes, t.fadeOut ?: p.timer.fadeOut, t.sunriseWake ?: p.timer.sunriseWake))
        }
        patch.sleep?.let { s ->
            p = p.copy(sleep = Preferences.Sleep(s.whisperIntro ?: p.sleep.whisperIntro, s.timer ?: p.sleep.timer,
                s.sunriseTime ?: p.sleep.sunriseTime, s.breathSync ?: p.sleep.breathSync))
        }
        patch.hasOnboarded?.let { v ->
            p = p.copy(hasOnboarded = v); profile = profile.copy(hasOnboarded = v)
            store.edit().putBoolean(ONBOARDED_KEY, v).apply()
        }
        prefs = p
        return prefs
    }

    override suspend fun completeOnboarding() {
        prefs = prefs.copy(hasOnboarded = true)
        profile = profile.copy(hasOnboarded = true)
        store.edit().putBoolean(ONBOARDED_KEY, true).apply()
    }

    // Inputs

    override suspend fun inputs(): InputsResponse = InputsResponse(inputList.toList(), contentBundle.inputsFooter)

    override suspend fun setInput(id: InputSetting.Kind, enabled: Boolean): InputSetting {
        val i = inputList.indexOfFirst { it.id == id }
        if (i < 0) throw ApiError.NotFound("Input not found")
        val input = inputList[i]
        if (input.alwaysOn && !enabled) throw ApiError.Conflict("always_on", "${input.label} can't be turned off")
        if (input.comingSoon == true && enabled) throw ApiError.Conflict("coming_soon", "${input.label} is coming soon")
        inputList[i] = input.copy(enabled = enabled)
        return inputList[i]
    }

    override suspend fun deleteInputHistory() { checkIns.clear() }

    override suspend fun postMoodCheckIn(value: Double, tags: List<String>, source: String): MoodCheckIn {
        val c = MoodCheckIn(nextId("mood"), profile.uid, value, tags, source, iso(), word(value))
        checkIns.add(c)
        return c
    }

    override suspend fun latestMoodScan(): MoodScan? {
        val s = checkIns.lastOrNull { it.source == "moodScan" } ?: return null
        val at = parseIso(s.createdAt) ?: return null
        val mins = ((System.currentTimeMillis() - at.time) / 60_000L).toInt()
        val mood = s.tags.firstOrNull() ?: s.word ?: "Mixed"
        val ago = when {
            mins < 1 -> "Just now"
            mins < 60 -> "$mins min ago"
            else -> "${(mins / 60.0).roundToInt()} h ago"
        }
        return MoodScan(mood, mins, "$ago: $mood", s.value)
    }

    // Catalog

    override suspend fun modes(): List<Mode> = modesList()

    override suspend fun browse(mode: ModeId): BrowsePage {
        val b = seed.browse[mode.raw] ?: throw ApiError.NotFound("Browse page for ${mode.raw} not found")
        val ids = seed.journeys.associate { it.title to it.id }
        return BrowsePage(mode, b.title, b.tagline, b.background, b.chipsLabel,
            b.journeys.map { BrowsePage.JourneyLink(it, ids[it]) },
            b.cards.map {
                BrowseCard(it.id, it.id, it.title, it.description, b.title, it.gradient, it.isPremium,
                    it.isPremium && !profile.isPremium, it.seasonal, it.isNew)
            })
    }

    override suspend fun journeys(): List<Journey> = seed.journeys

    // Compositions

    override suspend fun composition(id: String): Composition = requireComposition(id)

    private fun child(id: String, source: String, moodField: MoodField?): ComposeAccepted {
        val parent = requireComposition(id)
        val newId = nextId("comp")
        val c = parent.copy(compositionId = newId, ownerUid = profile.uid, status = CompositionStatus.QUEUED, segments = emptyList(),
            source = source, parentId = id, moodField = moodField ?: parent.moodField ?: MoodField.neutral,
            brainwave = parent.brainwave ?: Brainwave.OFF, prompt = parent.prompt ?: parent.title, createdAt = iso(), readyAt = null)
        compositions[newId] = c
        renderStart[newId] = System.currentTimeMillis()
        return ComposeAccepted(newId, CompositionStatus.QUEUED, renderSeconds.toInt(), c)
    }

    override suspend fun variation(id: String): ComposeAccepted = child(id, "variation", null)
    override suspend fun retune(id: String, moodField: MoodField): ComposeAccepted = child(id, "retune", moodField)

    // Library + playlists

    override suspend fun library(filter: LibraryFilter?): List<LibraryItem> = when (filter) {
        LibraryFilter.SAVED -> library.filter { it.kind == LibraryItem.Kind.SAVED }
        LibraryFilter.MEMORY -> library.filter { it.kind == LibraryItem.Kind.MEMORY }
        LibraryFilter.DOWNLOADS -> library.filter { it.offline }
        null -> library.toList()
    }

    private fun item(c: Composition, kind: LibraryItem.Kind, title: String? = null, duration: String? = null) = LibraryItem(
        id = nextId(if (kind == LibraryItem.Kind.MEMORY) "mem" else "lib"), compositionId = c.compositionId, title = title ?: c.title,
        mode = c.mode.shortTitle, duration = duration ?: c.durationLabel ?: "Endless", offline = false, kind = kind,
        gradient = c.gradient ?: GradientSpec.fallback, createdAt = iso())

    private fun persistLibrary() {
        val arr = JSONArray()
        library.forEach { arr.put(it.toJson()) }
        store.edit().putString(LIBRARY_KEY, arr.toString()).putInt(COUNTER_KEY, counter).apply()
    }

    override suspend fun save(compositionId: String, offline: Boolean): LibraryItem {
        if (offline && !profile.isPremium) throw ApiError.PremiumRequired("Offline downloads are part of Escape Premium")
        val c = requireComposition(compositionId)
        if (c.status != CompositionStatus.READY) throw ApiError.Conflict("not_ready", "Only finished compositions can be saved")
        library.firstOrNull { it.compositionId == compositionId && it.kind == LibraryItem.Kind.SAVED }?.let { return it }
        val i = item(c, LibraryItem.Kind.SAVED).copy(offline = offline)
        library.add(0, i)
        persistLibrary()
        return i
    }

    override suspend fun setOffline(itemId: String, offline: Boolean): LibraryItem {
        if (offline && !profile.isPremium) throw ApiError.PremiumRequired("Offline downloads are part of Escape Premium")
        val i = library.indexOfFirst { it.id == itemId }
        if (i < 0) throw ApiError.NotFound("Library item not found")
        library[i] = library[i].copy(offline = offline)
        persistLibrary()
        return library[i]
    }

    override suspend fun removeFromLibrary(itemId: String) {
        val i = library.indexOfFirst { it.id == itemId }
        if (i < 0) throw ApiError.NotFound("Library item not found")
        library.removeAt(i)
        persistLibrary()
    }

    override suspend fun saveMemory(sessionId: String, title: String?): LibraryItem {
        val s = sessions[sessionId] ?: throw ApiError.NotFound("Session not found")
        val cid = s.compositionId ?: throw ApiError.NotFound("Session not found")
        val c = requireComposition(cid)
        val day = parseIso(s.startedAt)?.let { SimpleDateFormat("EEEE", Locale.getDefault()).format(it) } ?: ""
        val i = item(c, LibraryItem.Kind.MEMORY, title ?: "${s.mode.shortTitle}, $day", "${(s.minutes ?: 0.0).toInt()} min")
        library.add(0, i)
        persistLibrary()
        return i
    }

    override suspend fun playlists(): List<PlaylistSummary> =
        seed.playlists.map { PlaylistSummary(it.id, it.title, it.summary, it.credit, it.artGradient, it.tracks.size) }

    override suspend fun playlist(id: String): Playlist {
        val p = seed.playlists.firstOrNull { it.id == id } ?: throw ApiError.NotFound("Playlist not found")
        return Playlist(p.id, p.title, p.summary, p.credit, p.artGradient, p.tracks.map { it.copy(liked = likes.contains("${p.id}:${it.id}")) })
    }

    override suspend fun setLike(playlistId: String, trackId: String, liked: Boolean) {
        val key = "$playlistId:$trackId"
        if (liked) likes.add(key) else likes.remove(key)
    }

    // Sessions

    override suspend fun startSession(req: StartSessionRequest): Session {
        val s = Session(nextId("ses"), profile.uid, req.mode, req.compositionId, req.startedFrom, iso(),
            moodBefore = req.moodBefore ?: checkIns.lastOrNull()?.value, moodField = req.moodField)
        sessions[s.sessionId] = s
        return s
    }

    override suspend fun completeSession(id: String, req: CompleteSessionRequest): SessionResult {
        val s = sessions[id] ?: throw ApiError.NotFound("Session not found")
        if (s.completedAt != null) throw ApiError.Conflict("already_completed", "This session was already completed")
        val elapsed = parseIso(s.startedAt)?.let { (System.currentTimeMillis() - it.time) / 60_000.0 } ?: 0.0
        val minutes = (req.minutes ?: elapsed).roundToInt()
        val today = iso().take(10)
        if (profile.lastSessionDate != today) profile = profile.copy(streakDays = profile.streakDays + 1, lastSessionDate = today)
        val earned = if (minutes >= 1) minOf(60, 10 + (minutes / 15) * 10) else 0
        profile = profile.copy(totalShards = profile.totalShards + earned)
        sessions[id] = s.copy(completedAt = iso(), minutes = minutes.toDouble(), moodAfter = req.moodAfter)
        return SessionResult(id, minutes, profile.streakDays, earned, profile.totalShards, word(s.moodBefore), word(req.moodAfter))
    }

    override suspend fun sendBetaFeedback(req: BetaFeedbackRequest) {
        if (req.calmRating !in 1..5) throw ApiError.Invalid("calmRating must be 1–5")
        val payload = HashMap<String, Any>()
        payload["calmRating"] = req.calmRating
        req.sessionId?.let { payload["sessionId"] = it }
        req.mode?.let { payload["mode"] = it }
        req.visual?.let { payload["visual"] = it }
        req.note?.let { payload["note"] = it }
        if (!SoundscapesBridge.sendFeedback(payload)) throw ApiError.Server(0, "feedback", "Couldn't send feedback")
    }
}
