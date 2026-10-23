package com.escape.soundscapes.store

import android.content.Context
import android.view.HapticFeedbackConstants
import android.view.View

/** Full-screen destinations. Raw values are the Figma Make screen names (Navigation.swift). */
enum class Screen(val raw: String) {
    ONBOARDING("OnboardingSoundscapes"),
    HOME("SoundscapesHome"),
    MODE_BROWSE("ModeBrowse"),
    NOW_PLAYING("NowPlaying"),
    SESSION_COMPLETE("SessionComplete"),
    LIBRARY("Library"),
    SLEEP_SETUP("SleepSetup"),
    PLAYLIST("Playlist"),
    MOOD_SCAN("MoodScan");

    /** Screens that hide the bottom nav (App.tsx `hideNav`). */
    val hidesNav: Boolean get() = this in setOf(NOW_PLAYING, ONBOARDING, SLEEP_SETUP, MOOD_SCAN)

    companion object {
        /** iOS-only screens (Compose, Generating, Listening Circles) map to Home on Android. */
        fun fromRaw(s: String?): Screen? = when (s) {
            null -> null
            "LucilleCompose", "ComposeGenerating", "ListeningCircles" -> HOME
            else -> entries.firstOrNull { it.raw == s }
        }
    }
}

/** Bottom sheets. Raw values are the Figma Make sheet names. */
enum class Sheet(val raw: String) {
    MOOD_FIELD("MoodField"),
    LAYERS("Layers"),
    TIMER("Timer"),
    MOOD_CHECK_IN("MoodCheckIn"),
    YOUR_INPUTS("YourInputs"),
    PERMISSION_PRIMER("PermissionPrimer"),
    LUCILLE_WHISPER("LucilleWhisper");

    companion object {
        /** Journeys and PremiumSheet are hidden by SoundscapesFeatures, so they open nothing. */
        fun fromRaw(s: String?): Sheet? = entries.firstOrNull { it.raw == s }
    }
}

/** Bottom nav tabs, same order as the Escape app's tab bar. `raw` is the name sent to Flutter in onExit. */
enum class NavTab(val raw: String) { HOME("Home"), LUCILLE("Lucille"), EXPLORE("Explore"), SOUNDSCAPES("Sound"), MARKET("Market") }

/**
 * Switches for parts of Soundscapes that aren't backed by the live Lucille API yet
 * (SoundscapesFeatures.swift). Off in this release on iOS, so off here too.
 */
object SoundscapesFeatures {
    const val journeys = false
    const val purchases = false
    const val betaFeedback = false
}

enum class HapticKind { SELECTION, LIGHT, MEDIUM, SUCCESS, WARNING }

/**
 * Platform work the screens need (HostServices.swift). The Android beta matches what the iOS
 * ObjC layer ships: no Health / Calendar, no Screen-Time Focus Shield, no purchases. Location is
 * not requested (the host app doesn't declare a location permission), so the weather input stays
 * on Lucille's server-side defaults.
 */
class HostServices(private val context: Context) {
    /** Set by the activity so haptics come from the real view. */
    var view: View? = null

    fun hasPermission(@Suppress("UNUSED_PARAMETER") p: com.escape.soundscapes.model.InputSetting.Permission): Boolean = false
    suspend fun requestPermission(@Suppress("UNUSED_PARAMETER") p: com.escape.soundscapes.model.InputSetting.Permission): Boolean = false
    suspend fun currentLocation(): Pair<Double, Double>? = null
    suspend fun latestHeartRate(): Double? = null
    /** Focus Shield needs Screen Time on iOS; there is no Android equivalent wired yet. */
    suspend fun setFocusShield(on: Boolean): Boolean = !on
    suspend fun scheduleSunriseWake(@Suppress("UNUSED_PARAMETER") hhmm: String): Boolean = false
    fun cancelSunriseWake() {}

    fun haptic(kind: HapticKind) {
        val v = view ?: return
        val c = when (kind) {
            HapticKind.SELECTION -> HapticFeedbackConstants.CLOCK_TICK
            HapticKind.LIGHT -> HapticFeedbackConstants.KEYBOARD_TAP
            HapticKind.MEDIUM -> HapticFeedbackConstants.VIRTUAL_KEY
            HapticKind.SUCCESS -> if (android.os.Build.VERSION.SDK_INT >= 30) HapticFeedbackConstants.CONFIRM else HapticFeedbackConstants.VIRTUAL_KEY
            HapticKind.WARNING -> if (android.os.Build.VERSION.SDK_INT >= 30) HapticFeedbackConstants.REJECT else HapticFeedbackConstants.LONG_PRESS
        }
        v.performHapticFeedback(c)
    }

    fun track(event: String, props: Map<String, String> = emptyMap()) {
        android.util.Log.d("EscapeSoundscapes", "$event $props")
    }

    val appContext: Context get() = context.applicationContext
}
