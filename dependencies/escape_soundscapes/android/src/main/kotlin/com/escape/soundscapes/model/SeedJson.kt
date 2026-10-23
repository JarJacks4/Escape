package com.escape.soundscapes.model

import org.json.JSONArray
import org.json.JSONObject

// org.json readers for figma-seed.json (ios/Classes/Models/Seed.swift) plus the few writers the
// mock needs to persist the Library between opens.

internal fun JSONObject.str(key: String, fallback: String = ""): String =
    if (has(key) && !isNull(key)) optString(key, fallback) else fallback

internal fun JSONObject.strOrNull(key: String): String? = if (has(key) && !isNull(key)) optString(key) else null

internal fun JSONObject.dbl(key: String, fallback: Double = 0.0): Double =
    if (has(key) && !isNull(key)) optDouble(key, fallback) else fallback

internal fun JSONObject.dblOrNull(key: String): Double? =
    if (has(key) && !isNull(key)) optDouble(key).takeIf { !it.isNaN() } else null

internal fun JSONObject.int(key: String, fallback: Int = 0): Int = if (has(key) && !isNull(key)) optInt(key, fallback) else fallback

internal fun JSONObject.intOrNull(key: String): Int? = if (has(key) && !isNull(key)) optInt(key) else null

internal fun JSONObject.bool(key: String, fallback: Boolean = false): Boolean =
    if (has(key) && !isNull(key)) optBoolean(key, fallback) else fallback

internal fun JSONObject.boolOrNull(key: String): Boolean? = if (has(key) && !isNull(key)) optBoolean(key) else null

internal fun JSONObject.obj(key: String): JSONObject = optJSONObject(key) ?: JSONObject()

internal inline fun <T> JSONArray?.mapObjects(transform: (JSONObject) -> T): List<T> {
    if (this == null) return emptyList()
    val out = ArrayList<T>(length())
    for (i in 0 until length()) optJSONObject(i)?.let { out.add(transform(it)) }
    return out
}

internal fun JSONArray?.strings(): List<String> {
    if (this == null) return emptyList()
    return (0 until length()).mapNotNull { i -> if (isNull(i)) null else optString(i) }
}

internal fun JSONArray?.doubles(): List<Double> {
    if (this == null) return emptyList()
    return (0 until length()).map { optDouble(it, 0.0) }
}

internal fun gradientOf(o: JSONObject?): GradientSpec? {
    if (o == null) return null
    val colors = o.optJSONArray("colors").strings()
    if (colors.isEmpty()) return null
    val stops = o.optJSONArray("stops")?.doubles()
    return GradientSpec(colors, stops, o.dbl("angle", 135.0))
}

internal fun GradientSpec.toJson(): JSONObject = JSONObject().apply {
    put("colors", JSONArray(colors))
    stops?.let { put("stops", JSONArray(it)) }
    put("angle", angle)
}

internal fun moodFieldOf(o: JSONObject?, fallback: MoodField = MoodField.neutral): MoodField =
    if (o == null) fallback else MoodField(o.dbl("energy", fallback.energy), o.dbl("texture", fallback.texture))

internal fun modeOf(o: JSONObject): Mode? {
    val id = ModeId.fromRaw(o.strOrNull("id")) ?: return null
    return Mode(id, o.str("title", id.title), o.str("shortTitle", id.shortTitle), o.str("icon"), o.bool("premium"), o.boolOrNull("locked"))
}

internal fun inputsNowOf(o: JSONObject): InputsNow = InputsNow(
    circadianPhase = o.str("circadianPhase"),
    phaseLabel = o.str("phaseLabel"),
    phaseValue = o.str("phaseValue"),
    nextPhaseInMin = o.intOrNull("nextPhaseInMin"),
    weather = o.optJSONObject("weather")?.let { Weather(it.int("tempF"), it.str("condition"), it.str("city")) },
    mood = o.strOrNull("mood"),
    heartBpm = o.intOrNull("heartBpm"),
    sunrise = o.strOrNull("sunrise"),
    sunset = o.strOrNull("sunset"),
    suggestedMode = ModeId.loose(o.strOrNull("suggestedMode")) ?: ModeId.FOCUS,
    playNowSubtitle = o.str("playNowSubtitle"),
)

internal fun layerOf(o: JSONObject): LayerSetting = LayerSetting(
    id = o.str("id"), label = o.str("label"), glyph = o.str("glyph"), value = o.dbl("value", 0.5),
    muted = o.bool("muted"), chips = o.optJSONArray("chips")?.strings(), selectedChip = o.strOrNull("selectedChip"),
    chipNote = o.strOrNull("chipNote"),
)

internal fun inputOf(o: JSONObject): InputSetting? {
    val kind = InputSetting.Kind.fromRaw(o.strOrNull("id")) ?: return null
    return InputSetting(kind, o.str("label"), o.str("sub"), o.bool("enabled"), o.bool("alwaysOn"),
        o.boolOrNull("comingSoon"), InputSetting.Permission.fromRaw(o.strOrNull("permission")))
}

internal fun libraryItemOf(o: JSONObject): LibraryItem = LibraryItem(
    id = o.str("id"), compositionId = o.str("compositionId"), title = o.str("title"), mode = o.str("mode"),
    duration = o.str("duration"), offline = o.bool("offline"), kind = LibraryItem.Kind.fromRaw(o.strOrNull("kind")),
    gradient = gradientOf(o.optJSONObject("gradient")) ?: GradientSpec.fallback, createdAt = o.strOrNull("createdAt"),
)

internal fun LibraryItem.toJson(): JSONObject = JSONObject().apply {
    put("id", id); put("compositionId", compositionId); put("title", title); put("mode", mode)
    put("duration", duration); put("offline", offline); put("kind", kind.raw); put("gradient", gradient.toJson())
    createdAt?.let { put("createdAt", it) }
}

internal fun trackOf(o: JSONObject): Track = Track(
    id = o.str("id"), compositionId = o.str("compositionId"), title = o.str("title"), mode = o.str("mode"),
    duration = o.str("duration"), gradient = gradientOf(o.optJSONObject("gradient")) ?: GradientSpec.fallback,
    liked = o.boolOrNull("liked"),
)

/** The parts of figma-seed.json the mock API serves (Seed.swift). */
class Seed(
    val user: Profile,
    val modes: List<Mode>,
    val inputsNow: InputsNow,
    val dailyDrop: DailyDrop,
    val journeys: List<Journey>,
    val featuredCircle: FeaturedCircle?,
    val madeByYou: List<MadeByYou>,
    val browse: Map<String, SeedBrowse>,
    val layers: List<LayerSetting>,
    val inputs: List<InputSetting>,
    val libraryItems: List<LibraryItem>,
    val playlists: List<SeedPlaylist>,
) {
    class SeedBrowse(val title: String, val tagline: String, val background: String, val chipsLabel: String,
                     val journeys: List<String>, val cards: List<SeedCard>)

    class SeedCard(val id: String, val title: String, val description: String, val gradient: GradientSpec,
                   val isPremium: Boolean, val seasonal: Boolean?, val isNew: Boolean?)

    class SeedPlaylist(val id: String, val title: String, val summary: String, val credit: String,
                       val artGradient: GradientSpec, val tracks: List<Track>, val defaultLiked: List<String>)

    companion object {
        fun parse(root: JSONObject): Seed {
            val exp = root.obj("experiments").let { Experiments(it.str("homeVariant", "playNow"), it.str("audioVariant", "adaptive"), it.bool("isBetaTester")) }
            val u = root.obj("user")
            val user = Profile(u.str("uid", "dev"), u.str("firstName"), u.bool("isPremium"), u.int("streakDays"),
                u.int("totalShards"), null, false, exp)
            val dd = root.obj("dailyDrop")
            val browse = LinkedHashMap<String, SeedBrowse>()
            val b = root.obj("browse")
            for (key in b.keys()) {
                val p = b.obj(key)
                browse[key] = SeedBrowse(p.str("title"), p.str("tagline"), p.str("background", "#0B1230"), p.str("chipsLabel"),
                    p.optJSONArray("journeys").strings(),
                    p.optJSONArray("cards").mapObjects { c ->
                        SeedCard(c.str("id"), c.str("title"), c.str("description"),
                            gradientOf(c.optJSONObject("gradient")) ?: GradientSpec.fallback, c.bool("isPremium"),
                            c.boolOrNull("seasonal"), c.boolOrNull("isNew"))
                    })
            }
            return Seed(
                user = user,
                modes = root.optJSONArray("modes").mapObjects { it }.mapNotNull { modeOf(it) },
                inputsNow = inputsNowOf(root.obj("inputsNow")),
                dailyDrop = DailyDrop(dd.str("compositionId"), dd.str("label"), dd.str("badge"), dd.str("title"),
                    dd.str("subtitle"), dd.str("mode", "calm"), gradientOf(dd.optJSONObject("gradient")) ?: GradientSpec.fallback),
                journeys = root.optJSONArray("journeys").mapObjects { j ->
                    Journey(j.str("id"), j.str("title"), j.strOrNull("chipDuration"), j.str("mode"), j.str("sheetTitle"),
                        j.str("summary"), j.optJSONArray("phases").mapObjects { p -> Journey.Phase(p.str("label"), p.int("minutes"), p.dbl("energy")) })
                },
                featuredCircle = root.optJSONObject("featuredCircle")?.let {
                    FeaturedCircle(it.str("circleId"), it.str("label"), it.str("title"), it.str("subtitle"), it.str("cta"))
                },
                madeByYou = root.optJSONArray("madeByYou").mapObjects { m ->
                    MadeByYou(m.str("compositionId"), m.str("title"), m.str("description"), m.str("mode"), gradientOf(m.optJSONObject("gradient")))
                },
                browse = browse,
                layers = root.optJSONArray("layers").mapObjects { layerOf(it) },
                inputs = root.optJSONArray("inputs").mapObjects { it }.mapNotNull { inputOf(it) },
                libraryItems = root.obj("library").optJSONArray("items").mapObjects { libraryItemOf(it) },
                playlists = root.optJSONArray("playlists").mapObjects { p ->
                    SeedPlaylist(p.str("id"), p.str("title"), p.str("summary"), p.str("credit"),
                        gradientOf(p.optJSONObject("artGradient")) ?: GradientSpec.fallback,
                        p.optJSONArray("tracks").mapObjects { trackOf(it) }, p.optJSONArray("defaultLiked").strings())
                },
            )
        }
    }
}

/** ContentBundle from figma-seed.json (the seed has the same keys as GET /v1/content). */
fun parseContent(root: JSONObject): ContentBundle {
    val np = root.obj("nowPlaying")
    val mf = root.obj("moodField")
    val mc = root.obj("moodCheckIn")
    val wh = root.obj("whisper")
    val tm = root.obj("timer")
    val ss = root.obj("sleepSetup")
    val sc = root.obj("sessionComplete")
    val bf = root.obj("betaFeedback")
    val scan = mc.obj("latestMoodScan")
    val rows = LinkedHashMap<String, ContentBundle.SleepSetupCopy.Row>()
    ss.obj("rows").let { r -> for (k in r.keys()) r.obj(k).let { rows[k] = ContentBundle.SleepSetupCopy.Row(it.str("label"), it.str("sub")) } }
    val primers = LinkedHashMap<String, ContentBundle.PrimerCopy>()
    root.obj("permissionPrimer").let { p ->
        for (k in p.keys()) p.obj(k).let { primers[k] = ContentBundle.PrimerCopy(it.str("title"), it.str("body"), it.boolOrNull("placeholder")) }
    }
    val sample = sc.obj("sample")
    return ContentBundle(
        version = root.int("version", 1),
        onboarding = root.optJSONArray("onboarding").mapObjects { ContentBundle.Slide(it.str("title"), it.str("body")) },
        homeTabs = root.optJSONArray("homeTabs").strings(),
        nowPlaying = ContentBundle.NowPlayingCopy(np.str("subtitle"), np.str("aiCredit"), np.str("whyHeadline"), np.str("whyBody"),
            np.optJSONArray("switcherModes").strings(), np.int("defaultTimerSeconds", 1491), np.str("timerCaption")),
        moodField = ContentBundle.MoodFieldCopy(
            default = moodFieldOf(mf.optJSONObject("default"), MoodField.figmaDefault),
            helper = mf.str("helper"),
            presets = mf.optJSONArray("presets").mapObjects { ContentBundle.MoodFieldCopy.Preset(it.str("label"), it.dbl("energy"), it.dbl("texture")) },
            padDots = mf.optJSONArray("padDots").mapObjects {
                ContentBundle.MoodFieldCopy.Dot(it.dbl("x"), it.dbl("y"), it.dbl("size", 6.0), it.str("color", "#8E7CD9"), it.dbl("opacity", 1.0))
            },
            cta = mf.str("cta", "Update soundscape"),
        ),
        moodCheckIn = ContentBundle.MoodCheckInCopy(mc.str("title"), mc.optJSONArray("tags").strings(), mc.dbl("defaultValue", 0.4),
            mc.optJSONArray("defaultTags").strings(),
            MoodScan(scan.str("mood"), scan.int("minutesAgo"), scan.str("label"), scan.dblOrNull("value")), mc.str("cta")),
        whisper = ContentBundle.WhisperCopy(wh.bool("enabled"), wh.str("selectedTopic", "affirmations"), wh.str("onTitle"), wh.str("offTitle"),
            wh.str("onBody"), wh.str("offBody"),
            wh.optJSONArray("topics").mapObjects { WhisperTopic(it.str("id"), it.str("label"), it.str("description")) }),
        timer = ContentBundle.TimerCopy(tm.optJSONArray("options").strings(), tm.str("default", "25"), tm.int("customMax", 240),
            tm.bool("fadeOut", true), tm.str("fadeOutLabel"), tm.str("fadeOutSub"), tm.bool("sunriseWake"), tm.str("sunriseLabel"), tm.str("sunriseSub")),
        sleepSetup = ContentBundle.SleepSetupCopy(ss.bool("whisperIntro", true), ss.optJSONArray("timerOptions").strings(), ss.str("timer", "45 min"),
            ss.str("sunriseTime", "07:00"), ss.bool("breathSync"), rows, ss.str("cta", "Start sleep")),
        libraryTabs = root.obj("library").optJSONArray("tabs").strings(),
        sessionComplete = ContentBundle.SessionCompleteCopy(sc.str("headline"), sc.str("subtitleTemplate"),
            ContentBundle.SessionCompleteCopy.Sample(sample.int("minutes", 47), sample.int("streakDays", 6), sample.int("shardsEarned", 40),
                sample.str("moodFrom", "Heavy"), sample.str("moodTo", "Bright")),
            sc.dbl("moodAfterDefault", 0.75), sc.optJSONArray("buttons").strings()),
        betaFeedback = ContentBundle.BetaFeedbackCopy(bf.str("title"), bf.str("calmQuestion"), bf.str("visualQuestion"),
            bf.optJSONArray("visualOptions").strings(), bf.str("notePlaceholder"), bf.str("cta")),
        inputsFooter = root.str("inputsFooter"),
        permissionPrimer = primers,
    )
}
