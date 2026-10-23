package com.escape.soundscapes.scan

import android.os.Build
import androidx.activity.compose.BackHandler
import androidx.compose.animation.AnimatedContent
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.togetherWith
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicText
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

/**
 * First-run tour for the Mood Scan (ios ScanWalkthrough.swift), shown once per install over the
 * live orb. Frosted glass, skippable, with progress dots. The pulse step describes the Android
 * reader (face on the front camera) instead of the iOS fingertip-and-flash read; the Energy
 * Scan step is left out because the Energy Scan isn't part of the Android port yet.
 */
internal object ScanTour {
    data class Step(val eyebrow: String, val title: String, val body: String, val icon: ScanIcon)

    val steps = listOf(
        Step(
            "Welcome", "Meet your Mood Orb",
            "This living orb is you, right now. It beats with the pulse the camera reads, breathes with you and changes colour with how you feel. Here's how the scan works, and the science behind it.",
            ScanIcon.Sparkles,
        ),
        Step(
            "Step 1 · Pulse", "Your face and the front camera",
            "Hold the phone at eye level with your face in the circle. Each heartbeat sends a little more blood through the skin of your face, which absorbs a touch more green light. The front camera can see that tiny colour change as a pulse wave. This is remote photoplethysmography (rPPG), a cousin of what many fitness wearables use. A phone reading is an estimate: movement, talking and changing light can throw it off, and if the signal isn't clear we won't show a number. Only the average colour of the centre of each frame is used; no photo or video is kept or sent.",
            ScanIcon.Heart,
        ),
        Step(
            "Why breathe slowly", "Breathe with the orb",
            "While it reads, the orb guides you to about 5 to 6 breaths a minute. Slow breathing at this pace is linked in research to a calmer heart rhythm and higher heart-rate variability, through the vagus nerve. It also helps you keep still for a cleaner reading.",
            ScanIcon.Wind,
        ),
        Step(
            "Step 2 · Feel", "Two dials: energy and pleasantness",
            "Psychologists often describe moods on two dimensions: how energised you feel and how pleasant it feels (Russell's circumplex model of affect). Your pulse sets a starting point for energy; you tune both. The orb warms, speeds up and softens as you do.",
            ScanIcon.Sliders,
        ),
        Step(
            "Step 3 · Name it", "Put a word to it",
            "Choosing a word for a feeling isn't just a label. Studies of \"affect labeling\" (Lieberman and colleagues, UCLA, 2007) found that naming an emotion can ease its intensity in the brain. Lucille then suggests a soundscape and a few small steps for that mood.",
            ScanIcon.Bubble,
        ),
        Step(
            "Good to know", "Wellness, not medicine",
            "The Mood Scan is for self-reflection and wellbeing, not a medical device or diagnosis. Your mood check-ins are saved to your Escape history only with your OK, and you can delete them any time.",
            ScanIcon.Shield,
        ),
    )
}

@Composable
internal fun ScanWalkthrough(onDone: () -> Unit, doneLabel: String = "Start") {
    val steps = ScanTour.steps
    var step by rememberSaveable { mutableIntStateOf(0) }
    val canBlur = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
    // System back closes the tour, not the whole scan underneath it.
    BackHandler(onBack = onDone)

    Box(
        Modifier
            .fillMaxSize()
            // The flow blurs the orb behind this on API 31+; below that, dim a little more instead.
            .background(Color.Black.copy(alpha = if (canBlur) 0.4f else 0.62f))
            // Swallow taps so the scan underneath can't be pressed through the tour.
            .clickable(interactionSource = remember { MutableInteractionSource() }, indication = null) { },
    ) {
        Column(
            Modifier
                .align(Alignment.BottomCenter)
                .statusBarsPadding()
                .navigationBarsPadding()
                .padding(top = 24.dp)
                .verticalScroll(rememberScrollState()),
        ) {
            AnimatedContent(
                targetState = step,
                transitionSpec = { fadeIn() togetherWith fadeOut() },
                label = "tourStep",
            ) { i ->
                val s = steps[i]
                Column(
                    Modifier
                        .padding(horizontal = 16.dp)
                        .padding(bottom = 24.dp)
                        .fillMaxWidth()
                        .glass(28.dp, strong = true)
                        .padding(20.dp),
                ) {
                    Row(Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
                        Box(Modifier.size(44.dp).glass(22.dp), contentAlignment = Alignment.Center) {
                            ScanIconView(s.icon, ScanColors.lilac, Modifier.size(20.dp))
                        }
                        Spacer(Modifier.weight(1f))
                        Box(
                            Modifier
                                .size(48.dp)
                                .clip(CircleShape)
                                .clickable(role = Role.Button, onClick = onDone)
                                .semantics { contentDescription = "Skip tour" },
                            contentAlignment = Alignment.Center,
                        ) { ScanIconView(ScanIcon.Close, ScanColors.haze, Modifier.size(14.dp)) }
                    }
                    Row(
                        Modifier.fillMaxWidth().padding(top = 18.dp).clearAndSetSemantics { },
                        horizontalArrangement = Arrangement.spacedBy(6.dp),
                    ) {
                        steps.indices.forEach { d ->
                            val m = Modifier.weight(1f).height(3.dp).clip(RoundedCornerShape(2.dp))
                            Box(
                                if (d == i) m.background(ScanColors.primaryGradient)
                                else m.background(if (d < i) ScanColors.lilac.copy(alpha = 0.5f) else Color.White.copy(alpha = 0.2f)),
                            )
                        }
                    }
                    Eyebrow(s.eyebrow, modifier = Modifier.padding(top = 18.dp))
                    BasicText(
                        s.title,
                        Modifier.padding(top = 6.dp).semantics { heading() },
                        style = ScanFonts.display(26, align = TextAlign.Start),
                    )
                    BasicText(s.body, Modifier.padding(top = 8.dp), style = ScanFonts.ui(15))
                    Row(
                        Modifier.fillMaxWidth().padding(top = 22.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                    ) {
                        BasicText("${i + 1} of ${steps.size}", Modifier.weight(1f), style = ScanFonts.ui(13))
                        if (i > 0) {
                            Box(
                                Modifier.heightIn(min = 48.dp).glass(24.dp).clickable(role = Role.Button) { step = i - 1 }
                                    .padding(horizontal = 16.dp),
                                contentAlignment = Alignment.Center,
                            ) { BasicText("Back", style = ScanFonts.ui(14, FontWeight.Medium, ScanColors.mist)) }
                        }
                        SmallGradientButton(if (i < steps.size - 1) "Next" else doneLabel) {
                            if (i < steps.size - 1) step = i + 1 else onDone()
                        }
                    }
                }
            }
        }
    }
}
