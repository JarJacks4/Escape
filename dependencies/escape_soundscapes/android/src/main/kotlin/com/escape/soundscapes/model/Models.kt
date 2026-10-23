package com.escape.soundscapes.model

// Kotlin mirror of ios/Classes/Models/APIModels.swift (shared/openapi.yaml). Only the types the
// Android port uses. Dates stay ISO-8601 strings, as on iOS.

enum class ModeId(val raw: String) {
    PICKS("picks"), FOCUS("focus"), CALM("calm"), SLEEP("sleep"), MOVE("move"), NOISE("noise"), REALMS("realms");

    /** Title used on mode orbs and headers (matches the Figma). */
    val title: String
        get() = when (this) {
            PICKS -> "Lucille Picks"
            FOCUS -> "Focus"
            CALM -> "Calm"
            SLEEP -> "Sleep"
            MOVE -> "Move"
            NOISE -> "Noise"
            REALMS -> "Realms"
        }

    val shortTitle: String get() = if (this == PICKS) "Picks" else title

    /** Free in the beta; the rest need Premium. */
    val isFree: Boolean get() = this in listOf(PICKS, FOCUS, CALM, SLEEP)

    companion object {
        /** Modes that have a Browse page. */
        val browsable = listOf(FOCUS, CALM, SLEEP, MOVE, REALMS)

        fun fromRaw(raw: String?): ModeId? = entries.firstOrNull { it.raw == raw }

        /** Accepts ids and display names ("focus", "Focus", "Lucille Picks", "Energize"). */
        fun loose(value: String?): ModeId? = when (value?.trim()?.lowercase()) {
            "picks", "lucille picks" -> PICKS
            "focus" -> FOCUS
            "calm" -> CALM
            "sleep" -> SLEEP
            "move", "energize" -> MOVE
            "noise" -> NOISE
            "realms", "realm" -> REALMS
            else -> null
        }
    }
}

data class Mode(
    val id: ModeId,
    val title: String,
    val shortTitle: String,
    val icon: String,
    val premium: Boolean,
    val locked: Boolean? = null,
)

data class GradientSpec(val colors: List<String>, val stops: List<Double>? = null, val angle: Double = 135.0) {
    companion object {
        val fallback = GradientSpec(listOf("#39519F", "#101E43"))
    }
}

/** energy: 0 calm → 1 charged (pad bottom → top). texture: 0 grounded → 1 dreamy (left → right). */
class MoodField(energy: Double, texture: Double) {
    val energy: Double = energy.coerceIn(0.0, 1.0)
    val texture: Double = texture.coerceIn(0.0, 1.0)

    override fun equals(other: Any?): Boolean = other is MoodField && other.energy == energy && other.texture == texture
    override fun hashCode(): Int = energy.hashCode() * 31 + texture.hashCode()
    override fun toString(): String = "MoodField(energy=$energy, texture=$texture)"

    fun copy(energy: Double = this.energy, texture: Double = this.texture) = MoodField(energy, texture)

    companion object {
        val figmaDefault = MoodField(0.35, 0.72)
        val neutral = MoodField(0.5, 0.5)
    }
}

enum class Brainwave { OFF, DELTA, THETA, ALPHA, BETA;
    val raw: String get() = name.lowercase()
    companion object { fun loose(s: String?): Brainwave? = entries.firstOrNull { it.raw == s?.lowercase() } }
}

enum class CompositionStatus { QUEUED, RENDERING, READY, FAILED;
    val raw: String get() = name.lowercase()
    val isFinished: Boolean get() = this == READY || this == FAILED
    companion object { fun fromRaw(s: String?): CompositionStatus = entries.firstOrNull { it.raw == s } ?: READY }
}

data class AudioSegment(val role: Role, val url: String, val durationSec: Double) {
    enum class Role { INTRO, BODY, OUTRO;
        val raw: String get() = name.lowercase()
        companion object { fun fromRaw(s: String?): Role = entries.firstOrNull { it.raw == s } ?: BODY }
    }
}

data class VisualPreset(
    val id: String,
    val mode: ModeId,
    val name: String,
    val videoH264: String,
    val videoHevc: String?,
    val poster: String?,
    val loopSec: Double,
    val energy: Double,
    val texture: Double,
) {
    /** Android streams the H.264 loop: every device decodes it in hardware. */
    val preferredVideoUrl: String get() = videoH264
}

data class Composition(
    val compositionId: String,
    val ownerUid: String? = null,
    val status: CompositionStatus,
    val mode: ModeId,
    val title: String,
    val subtitle: String? = null,
    val whyHeadline: String? = null,
    val whyThisSound: String? = null,
    val segments: List<AudioSegment>,
    val gradient: GradientSpec? = null,
    val artist: String? = null,
    val source: String,
    val durationLabel: String? = null,
    val minutes: Int? = null,
    val brainwave: Brainwave? = null,
    val moodField: MoodField? = null,
    val parentId: String? = null,
    val failReason: String? = null,
    val prompt: String? = null,
    val createdAt: String,
    val readyAt: String? = null,
) {
    /** "Composed by Lucille (AI)" or "Lucille × Artist". Always shown with generated audio. */
    val creditLine: String
        get() = if (!artist.isNullOrEmpty() && artist != "Lucille") "Lucille × $artist" else "Composed by Lucille (AI)"
}

data class ComposeAccepted(val compositionId: String, val status: CompositionStatus, val etaSec: Int?, val composition: Composition)

data class Weather(val tempF: Int, val condition: String, val city: String)

data class InputsNow(
    val circadianPhase: String,
    val phaseLabel: String,
    val phaseValue: String,
    val nextPhaseInMin: Int?,
    val weather: Weather?,
    val mood: String?,
    val heartBpm: Int?,
    val sunrise: String?,
    val sunset: String?,
    val suggestedMode: ModeId,
    val playNowSubtitle: String,
)

data class Experiments(val homeVariant: String, val audioVariant: String, val isBetaTester: Boolean)

data class DailyDrop(
    val compositionId: String,
    val label: String,
    val badge: String,
    val title: String,
    val subtitle: String,
    val mode: String,
    val gradient: GradientSpec,
    val composition: Composition? = null,
)

data class JourneyChip(val id: String, val title: String, val chipDuration: String?, val mode: String)

data class FeaturedCircle(val circleId: String, val label: String, val title: String, val subtitle: String, val cta: String)

data class MadeByYou(val compositionId: String, val title: String, val description: String, val mode: String, val gradient: GradientSpec?)

data class HomeUser(val firstName: String, val isPremium: Boolean, val streakDays: Int, val totalShards: Int)

data class Home(
    val user: HomeUser,
    val experiments: Experiments,
    val inputsNow: InputsNow,
    val homeTabs: List<String>,
    val modes: List<Mode>,
    val dailyDrop: DailyDrop,
    val journeyChips: List<JourneyChip>,
    val featuredCircle: FeaturedCircle?,
    val madeByYou: List<MadeByYou>,
    val betaFeedbackEnabled: Boolean,
)

data class Profile(
    val uid: String,
    val firstName: String,
    val isPremium: Boolean,
    val streakDays: Int,
    val totalShards: Int,
    val lastSessionDate: String?,
    val hasOnboarded: Boolean,
    val experiments: Experiments,
)

data class LayerSetting(
    val id: String,
    val label: String,
    val glyph: String,
    val value: Double,
    val muted: Boolean,
    val chips: List<String>? = null,
    val selectedChip: String? = null,
    val chipNote: String? = null,
)

data class Preferences(
    val moodField: MoodField,
    val blendOn: Boolean,
    val focusShieldOn: Boolean,
    val layers: List<LayerSetting>,
    val whisper: Whisper,
    val timer: Timer,
    val sleep: Sleep,
    val hasOnboarded: Boolean,
) {
    data class Whisper(val enabled: Boolean, val selectedTopic: String)
    data class Timer(val minutes: Int, val fadeOut: Boolean, val sunriseWake: Boolean)
    data class Sleep(val whisperIntro: Boolean, val timer: String, val sunriseTime: String, val breathSync: Boolean)
}

/** PATCH /v1/me/preferences. null fields are left alone. */
data class PreferencesPatch(
    val moodField: MoodField? = null,
    val blendOn: Boolean? = null,
    val focusShieldOn: Boolean? = null,
    val layers: List<LayerSetting>? = null,
    val whisper: WhisperPatch? = null,
    val timer: TimerPatch? = null,
    val sleep: SleepPatch? = null,
    val hasOnboarded: Boolean? = null,
) {
    data class WhisperPatch(val enabled: Boolean? = null, val selectedTopic: String? = null)
    data class TimerPatch(val minutes: Int? = null, val fadeOut: Boolean? = null, val sunriseWake: Boolean? = null)
    data class SleepPatch(val whisperIntro: Boolean? = null, val timer: String? = null, val sunriseTime: String? = null, val breathSync: Boolean? = null)
}

data class InputSetting(
    val id: Kind,
    val label: String,
    val sub: String,
    val enabled: Boolean,
    val alwaysOn: Boolean,
    val comingSoon: Boolean? = null,
    val permission: Permission? = null,
) {
    enum class Kind { TIME, WEATHER, HEART, MOOD, CALENDAR;
        val raw: String get() = name.lowercase()
        companion object { fun fromRaw(s: String?): Kind? = entries.firstOrNull { it.raw == s } }
    }
    enum class Permission { LOCATION, HEALTH, CALENDAR;
        val raw: String get() = name.lowercase()
        companion object { fun fromRaw(s: String?): Permission? = entries.firstOrNull { it.raw == s } }
    }
}

data class InputsResponse(val inputs: List<InputSetting>, val footer: String)

data class MoodCheckIn(
    val id: String,
    val uid: String,
    val value: Double,
    val tags: List<String>,
    val source: String,
    val createdAt: String,
    val word: String?,
)

data class MoodScan(val mood: String, val minutesAgo: Int, val label: String, val value: Double?)

data class BrowseCard(
    val id: String,
    val compositionId: String,
    val title: String,
    val description: String,
    val mode: String,
    val gradient: GradientSpec,
    val isPremium: Boolean,
    val locked: Boolean,
    val seasonal: Boolean? = null,
    val isNew: Boolean? = null,
)

data class BrowsePage(
    val mode: ModeId,
    val title: String,
    val tagline: String,
    val background: String,
    val chipsLabel: String,
    val journeys: List<JourneyLink>,
    val cards: List<BrowseCard>,
) {
    data class JourneyLink(val title: String, val journeyId: String?)
}

data class Journey(
    val id: String,
    val title: String,
    val chipDuration: String?,
    val mode: String,
    val sheetTitle: String,
    val summary: String,
    val phases: List<Phase>,
) {
    data class Phase(val label: String, val minutes: Int, val energy: Double)
}

enum class SessionOrigin(val raw: String) {
    PLAY_NOW("playNow"), MODE("mode"), COMPOSE("compose"), DAILY_DROP("dailyDrop"),
    JOURNEY("journey"), CIRCLE("circle"), PLAYLIST("playlist"), LIBRARY("library")
}

data class Session(
    val sessionId: String,
    val uid: String,
    val mode: ModeId,
    val compositionId: String?,
    val startedFrom: SessionOrigin,
    val startedAt: String,
    val completedAt: String? = null,
    val minutes: Double? = null,
    val moodBefore: Double? = null,
    val moodAfter: Double? = null,
    val moodField: MoodField? = null,
)

data class StartSessionRequest(
    val mode: ModeId,
    val compositionId: String?,
    val startedFrom: SessionOrigin,
    val moodBefore: Double? = null,
    val moodField: MoodField? = null,
)

data class CompleteSessionRequest(val minutes: Double?, val moodAfter: Double?, val tz: String? = java.util.TimeZone.getDefault().id)

data class SessionResult(
    val sessionId: String,
    val minutes: Int,
    val streakDays: Int,
    val shardsEarned: Int,
    val totalShards: Int,
    val moodFrom: String?,
    val moodTo: String?,
)

data class BetaFeedbackRequest(val sessionId: String?, val mode: String?, val calmRating: Int, val visual: String?, val note: String?)

data class LibraryItem(
    val id: String,
    val compositionId: String,
    val title: String,
    val mode: String,
    val duration: String,
    val offline: Boolean,
    val kind: Kind,
    val gradient: GradientSpec,
    val createdAt: String? = null,
) {
    enum class Kind { SAVED, MEMORY;
        val raw: String get() = name.lowercase()
        companion object { fun fromRaw(s: String?): Kind = if (s == "memory") MEMORY else SAVED }
    }
}

enum class LibraryFilter { SAVED, DOWNLOADS, MEMORY;
    /** Tab titles in the Figma: Saved / Downloads / Memories. */
    val title: String get() = when (this) { SAVED -> "Saved"; DOWNLOADS -> "Downloads"; MEMORY -> "Memories" }
}

data class Track(
    val id: String,
    val compositionId: String,
    val title: String,
    val mode: String,
    val duration: String,
    val gradient: GradientSpec,
    val liked: Boolean? = null,
)

data class Playlist(
    val id: String,
    val title: String,
    val summary: String,
    val credit: String,
    val artGradient: GradientSpec,
    val tracks: List<Track>,
)

data class PlaylistSummary(
    val id: String,
    val title: String,
    val summary: String,
    val credit: String,
    val artGradient: GradientSpec,
    val trackCount: Int,
)

data class WhisperTopic(val id: String, val label: String, val description: String)

/** Fills "{firstName}" style placeholders. */
fun String.filling(values: Map<String, String>): String =
    values.entries.fold(this) { acc, (k, v) -> acc.replace("{$k}", v) }
