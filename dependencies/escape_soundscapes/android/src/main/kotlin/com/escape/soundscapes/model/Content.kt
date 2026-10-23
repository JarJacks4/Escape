package com.escape.soundscapes.model

// All screen copy, from the bundled figma-seed.json (GET /v1/content on a live backend).
// Mirrors ios/Classes/Models/Content.swift for the sections the Android port shows.

data class ContentBundle(
    val version: Int,
    val onboarding: List<Slide>,
    val homeTabs: List<String>,
    val nowPlaying: NowPlayingCopy,
    val moodField: MoodFieldCopy,
    val moodCheckIn: MoodCheckInCopy,
    val whisper: WhisperCopy,
    val timer: TimerCopy,
    val sleepSetup: SleepSetupCopy,
    val libraryTabs: List<String>,
    val sessionComplete: SessionCompleteCopy,
    val betaFeedback: BetaFeedbackCopy,
    val inputsFooter: String,
    val permissionPrimer: Map<String, PrimerCopy>,
) {
    data class Slide(val title: String, val body: String)

    data class NowPlayingCopy(
        val subtitle: String,
        val aiCredit: String,
        val whyHeadline: String,
        val whyBody: String,
        val switcherModes: List<String>,
        val defaultTimerSeconds: Int,
        val timerCaption: String,
    )

    data class MoodFieldCopy(
        val default: MoodField,
        val helper: String,
        val presets: List<Preset>,
        val padDots: List<Dot>,
        val cta: String,
    ) {
        data class Preset(val label: String, val energy: Double, val texture: Double)
        data class Dot(val x: Double, val y: Double, val size: Double, val color: String, val opacity: Double)
    }

    data class MoodCheckInCopy(
        val title: String,
        val tags: List<String>,
        val defaultValue: Double,
        val defaultTags: List<String>,
        val latestMoodScan: MoodScan,
        val cta: String,
    )

    data class WhisperCopy(
        val enabled: Boolean,
        val selectedTopic: String,
        val onTitle: String,
        val offTitle: String,
        val onBody: String,
        val offBody: String,
        val topics: List<WhisperTopic>,
    )

    data class TimerCopy(
        val options: List<String>,
        val default: String,
        val customMax: Int,
        val fadeOut: Boolean,
        val fadeOutLabel: String,
        val fadeOutSub: String,
        val sunriseWake: Boolean,
        val sunriseLabel: String,
        val sunriseSub: String,
    )

    data class SleepSetupCopy(
        val whisperIntro: Boolean,
        val timerOptions: List<String>,
        val timer: String,
        val sunriseTime: String,
        val breathSync: Boolean,
        val rows: Map<String, Row>,
        val cta: String,
    ) {
        data class Row(val label: String, val sub: String)
    }

    data class SessionCompleteCopy(
        val headline: String,
        val subtitleTemplate: String,
        val sample: Sample,
        val moodAfterDefault: Double,
        val buttons: List<String>,
    ) {
        data class Sample(val minutes: Int, val streakDays: Int, val shardsEarned: Int, val moodFrom: String, val moodTo: String)
    }

    data class BetaFeedbackCopy(
        val title: String,
        val calmQuestion: String,
        val visualQuestion: String,
        val visualOptions: List<String>,
        val notePlaceholder: String,
        val cta: String,
    )

    data class PrimerCopy(val title: String, val body: String, val placeholder: Boolean?)
}
