package com.escape.soundscapes.scan

import androidx.compose.runtime.Immutable
import androidx.compose.ui.graphics.Color
import kotlin.math.abs

// Port of ios/Classes/Models/ScanModels.swift (the Mood Scan part) and the loop naming from
// ios/Classes/Visuals/OrbLoops.swift.

/**
 * Everything the Mood Scan knows at a moment. `energy` and `valence` come from the camera pulse
 * plus the person's own input; `bpm` from the pulse read. The orb and the result both derive
 * from this, so the orb the person tuned *is* the mood Lucille names.
 */
@Immutable
internal data class MoodReading(
    /** 0 drained … 1 charged (Mood Field Y). */
    val energy: Float = 0.5f,
    /** 0 unpleasant … 1 pleasant (Mood Field X). */
    val valence: Float = 0.5f,
    /** The orb's rhythm. Only a measurement when [pulseMeasured] is true. */
    val bpm: Int = 72,
    /** A word the person tapped; null means Lucille's first word for the quadrant. */
    val chosenWord: String? = null,
    /** True only when [bpm] came from a camera read with enough quality. Never shown or saved otherwise. */
    val pulseMeasured: Boolean = false,
    /** 0…1 signal quality of the measured pulse (sent to the server as pulse.quality). */
    val pulseQuality: Float? = null,
) {
    enum class Quadrant { Restless, Energized, Foggy, Calm }

    val quadrant: Quadrant
        get() = when {
            energy >= 0.5f && valence < 0.5f -> Quadrant.Restless   // charged + unpleasant
            energy >= 0.5f -> Quadrant.Energized                    // charged + pleasant
            valence < 0.5f -> Quadrant.Foggy                        // drained + unpleasant
            else -> Quadrant.Calm                                    // drained + pleasant
        }

    val words: List<String>
        get() = when (quadrant) {
            Quadrant.Restless -> listOf("Restless", "Wired", "Anxious", "Tense")
            Quadrant.Energized -> listOf("Energized", "Bright", "Hopeful", "Focused")
            Quadrant.Foggy -> listOf("Foggy", "Heavy", "Low", "Drained")
            Quadrant.Calm -> listOf("Calm", "Steady", "Content", "Open")
        }

    val word: String
        get() = chosenWord?.takeIf { it in words } ?: words[0]

    val line: String
        get() = when (quadrant) {
            Quadrant.Restless -> "High energy, a little unpleasant"
            Quadrant.Energized -> "High energy and pleasant"
            Quadrant.Foggy -> "Low energy, a little unpleasant"
            Quadrant.Calm -> "Low energy and pleasant"
        }

    /** The orb's accent: warm for charged/pleasant, cool for drained, hot ember for tension. */
    val tint: Color
        get() = when (quadrant) {
            Quadrant.Restless -> Color(0xFFEF7702)    // ember
            Quadrant.Energized -> Color(0xFFFFC27A)   // warm gold
            Quadrant.Foggy -> Color(0xFF5B6FB0)       // muted blue
            Quadrant.Calm -> Color(0xFFB9A3F0)        // lilac
        }

    /** Title and Soundscapes mode id ("calm" | "focus" | "picks"). */
    val tunedSoundscape: Pair<String, String>
        get() = when (quadrant) {
            Quadrant.Restless -> "Calm · Slow Tide, tuned to settle" to "calm"
            Quadrant.Energized -> "Focus · Deep Work, tuned to ride it" to "focus"
            Quadrant.Foggy -> "Focus · Morning Lift, tuned to lift" to "focus"
            Quadrant.Calm -> "Lucille Picks · Drift, tuned to stay here" to "picks"
        }

    val suggestions: List<ScanSuggestion>
        get() = when (quadrant) {
            Quadrant.Restless -> listOf(
                ScanSuggestion("3 min", "Breath Sync 4-7-8", "Long out-breaths slow a racing pulse.", "escape://breath/478"),
                ScanSuggestion("5 min", "Journey: Panic Reset", "A guided step down when it all feels like too much.", "escape://journey/panic-reset"),
                ScanSuggestion("2 min", "Talk it through with Lucille", "Name what's pulling at you, then set it down.", "escape://lucille"),
            )
            Quadrant.Energized -> listOf(
                ScanSuggestion("25 min", "Journey: Deep Work", "Put this energy into one thing that matters.", "escape://journey/deep-work"),
                ScanSuggestion("10 min", "Move soundscape", "A walk or stretch with a beat to match you.", "escape://mode/move"),
                ScanSuggestion("2 min", "Save this moment", "Write down what's going right so you can come back to it.", "escape://journal/new"),
            )
            Quadrant.Foggy -> listOf(
                ScanSuggestion("5 min", "Move: Gentle Wake", "Light movement and daylight help clear the fog.", "escape://mode/move"),
                ScanSuggestion("3 min", "Visit the Grounding World", "A slow Realms scene to feel steady again.", "escape://realms/grounding"),
                ScanSuggestion("1 min", "Set Sunrise Wake", "Wake gently tomorrow to break the heavy start.", "escape://sleep/sunrise"),
            )
            Quadrant.Calm -> listOf(
                ScanSuggestion("2 min", "Save this moment", "A short note to Lucille so you can come back to it.", "escape://journal/new"),
                ScanSuggestion("10 min", "Stay in this calm", "A Lucille Picks soundscape tuned to how you feel now.", "escape://mode/picks"),
                ScanSuggestion("10 min", "Sleep wind-down", "Carry this calm into tonight with Lucille Whisper.", "escape://sleep"),
            )
        }

    val because: String
        get() {
            val feel = "you set your energy to ${pct(energy)}% and pleasantness to ${pct(valence)}%"
            return if (pulseMeasured) {
                "Your camera pulse estimate was about $bpm bpm, $feel, so Lucille hears ${word.lowercase()}."
            } else {
                "You didn't share a pulse reading this time; $feel, so Lucille hears ${word.lowercase()}."
            }
        }

    /** Nearest of the 9 Mood Orb v3 cells for the tuned mode: escape_{grid}_e{E}_t{T}_v3. */
    val orbName: String
        get() = OrbLoops.name(OrbLoops.grid(tunedSoundscape.second), OrbLoops.level(energy), OrbLoops.level(valence))

    val orbGrid: String
        get() = OrbLoops.grid(tunedSoundscape.second)

    companion object {
        /**
         * Starting point for the Energy slider from a measured resting pulse: ~55 bpm reads as low
         * energy, ~100 bpm as high. The person can always move it.
         */
        fun energyFromPulse(bpm: Int): Float = (0.2f + (bpm - 55f) / 45f * 0.6f).coerceIn(0.1f, 0.9f)

        fun pct(x: Float): Int = (x * 100f).toInt()
    }
}

/** What Lucille offers after a scan: a few in-app actions chosen for the mood. */
@Immutable
internal data class ScanSuggestion(
    val minutes: String,
    val title: String,
    val why: String,
    val deeplink: String,
    val coins: Int = 10,
)

/** Escape Mood Orbs v3 naming and URLs (see ios OrbLoops.swift). */
internal object OrbLoops {
    private const val STORAGE_BASE =
        "https://firebasestorage.googleapis.com/v0/b/escape-self-care-505618.firebasestorage.app/o/"
    private val levels = intArrayOf(15, 50, 85)

    fun grid(mode: String): String = when (mode) {
        "focus", "move" -> "focus"
        "calm", "noise" -> "calm"
        "sleep" -> "sleep"
        else -> "picks"
    }

    fun level(v: Float): Int = levels.minByOrNull { abs(it / 100f - v) } ?: 50

    fun name(grid: String, e: Int, t: Int) = "escape_${grid}_e${e}_t${t}_v3"

    /** Streamed H.264 loop (720p, 9:16). */
    fun videoUrl(name: String) = "${STORAGE_BASE}visuals%2Fv3%2F${name}_720_h264.mp4?alt=media"

    /** Poster bundled in assets/orbs (Coil reads file:///android_asset/ URIs). */
    fun posterAsset(name: String) = "file:///android_asset/orbs/${name}_poster.webp"

    /** Remote poster, used if the bundled one is missing. */
    fun posterUrl(name: String) = "${STORAGE_BASE}visuals%2Fv3%2F${name}_poster.webp?alt=media"

    /** The mode's bundled 540p centre loop, for when the stream can't load (offline). ExoPlayer reads asset:/// URIs. */
    fun offlineAsset(grid: String) = "asset:///orbs/escape_${grid}_e50_t50_v3_540_offline.mp4"
}

/** Outcome of saving a scan as a mood check-in. */
internal sealed interface ScanSaveResult {
    data class Saved(val coinsAwarded: Int, val crisis: Boolean) : ScanSaveResult
    /** The server needs the person's OK (GDPR purpose, e.g. "wellbeing_data" or "camera_scan"). */
    data class NeedsConsent(val purpose: String) : ScanSaveResult
    object Failed : ScanSaveResult
}
