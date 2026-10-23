package com.escape.soundscapes.ui.screens

import androidx.activity.compose.BackHandler
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.R
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.breathe
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.PrimaryButton
import com.escape.soundscapes.ui.components.escClickable

private val figmaSlides = listOf(
    ContentBundle.Slide("Sound that meets your mood", "Every soundscape adapts to how you feel right now — not just what you put on."),
    ContentBundle.Slide("Lucille composes it for you, live", "Your AI companion creates each soundscape in real time. No two sessions are the same."),
    ContentBundle.Slide("Tuned to your time, weather and heartbeat", "Lucille listens to your inner weather and shapes the sound around it."),
)

/** OnboardingSoundscapesView.swift: three slides, breathing head art, dots, Continue / Start listening. */
@Composable
fun OnboardingScreen(store: AppStore) {
    val slides = store.content?.onboarding?.takeIf { it.isNotEmpty() } ?: figmaSlides
    var slide by rememberSaveable { mutableIntStateOf(0) }
    val index = slide.coerceIn(0, slides.size - 1)
    val isLast = index >= slides.size - 1
    BackHandler(enabled = index > 0) { slide = index - 1 }

    Box(Modifier.fillMaxSize().background(Esc.night)) {
        Box(
            Modifier.align(Alignment.TopCenter).offset(y = (-100).dp).size(400.dp)
                .background(cssRadialCircle(listOf(Esc.lilac.copy(alpha = 0.08f), Color.Transparent), listOf(0.0, 0.7)), CircleShape),
        )
        Column(Modifier.fillMaxSize().windowInsetsPadding(WindowInsets.statusBars).windowInsetsPadding(WindowInsets.navigationBars)) {
            Row(Modifier.fillMaxWidth().padding(horizontal = 18.dp, vertical = 8.dp), horizontalArrangement = Arrangement.End) {
                Box(
                    Modifier.height(48.dp).widthIn(min = 48.dp).escClickable(label = "Skips the introduction") { store.finishOnboarding() }
                        .padding(horizontal = 6.dp),
                    contentAlignment = Alignment.Center,
                ) { Text("Skip", style = EscFont.ui(15, color = Esc.haze)) }
            }
            Column(
                Modifier.weight(1f).fillMaxWidth().padding(horizontal = 24.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.Center,
            ) {
                Image(painterResource(R.drawable.head_profile), contentDescription = null, modifier = Modifier.size(200.dp).breathe())
                Spacer(Modifier.height(32.dp))
                Text(slides[index].title, style = EscFont.display(28).copy(textAlign = TextAlign.Center, lineHeight = 35.sp),
                    modifier = Modifier.semantics { heading() })
                Spacer(Modifier.height(16.dp))
                Text(slides[index].body, style = EscFont.ui(16, color = Esc.haze).copy(textAlign = TextAlign.Center, lineHeight = 25.6.sp),
                    modifier = Modifier.widthIn(max = 300.dp))
            }
            Row(Modifier.fillMaxWidth().padding(bottom = 16.dp), horizontalArrangement = Arrangement.Center) {
                slides.indices.forEach { i ->
                    val w by animateDpAsState(if (i == index) 20.dp else 6.dp, tween(200), label = "dot")
                    Box(
                        Modifier.size(width = 32.dp, height = 48.dp)
                            .clickable(remember { MutableInteractionSource() }, null, role = Role.Tab) { slide = i }
                            .semantics { contentDescription = "Slide ${i + 1}"; selected = i == index },
                        contentAlignment = Alignment.Center,
                    ) {
                        Box(Modifier.size(width = w, height = 6.dp).background(if (i == index) Esc.lilac else hex(0xB9A3F0, 0.25f), CircleShape))
                    }
                }
            }
            Box(Modifier.padding(start = 24.dp, end = 24.dp, bottom = 48.dp)) {
                if (isLast) {
                    PrimaryButton("Start listening") { store.finishOnboarding() }
                } else {
                    Box(
                        Modifier.fillMaxWidth().height(56.dp)
                            .background(hex(0x39519F, 0.4f), CircleShape).border(1.5.dp, hex(0x39519F, 0.6f), CircleShape)
                            .escClickable { slide = index + 1 },
                        contentAlignment = Alignment.Center,
                    ) { Text("Continue", style = EscFont.ui(16, FontWeight.SemiBold)) }
                }
            }
        }
    }
}

/** First-visit Home tour (ScanWalkthrough.homeSteps), shown once per install. */
@Composable
fun HomeWalkthrough(onDone: () -> Unit) {
    data class Step(val eyebrow: String, val title: String, val body: String)
    val steps = listOf(
        Step("Welcome", "Your Soundscapes", "Music and nature sound for focus, calm and sleep, tuned to how you feel today."),
        Step("Play now", "One tap to start", "Play Now picks the best match for your mood. Your Inner Weather and Lucille's Daily Drop sit right below it."),
        Step("Modes", "Pick a mode", "Tap Focus, Calm, Sleep or Lucille Picks for an endless soundscape with its own Mood Orb."),
        Step("Make it yours", "Shape the sound", "On Now Playing, Mood Field and Layers reshape what you hear. Close any time to return to Escape."),
    )
    var step by rememberSaveable { mutableIntStateOf(0) }
    BackHandler(onBack = onDone)
    val s = steps[step]
    Box(
        Modifier.fillMaxSize().background(Color.Black.copy(alpha = 0.55f))
            .clickable(remember { MutableInteractionSource() }, null) { },
        contentAlignment = Alignment.BottomCenter,
    ) {
        val shape = RoundedCornerShape(28.dp)
        Column(
            Modifier.windowInsetsPadding(WindowInsets.navigationBars).padding(start = 16.dp, end = 16.dp, bottom = 24.dp)
                .fillMaxWidth().background(hex(0x18224A, 0.97f), shape).border(1.dp, hex(0xE6EAF4, 0.15f), shape).padding(20.dp),
        ) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Box(Modifier.size(44.dp).background(Esc.card, CircleShape).border(1.dp, Esc.hairline, CircleShape), contentAlignment = Alignment.Center) {
                    com.escape.soundscapes.ui.components.LucilleOrb(22.dp)
                }
                Spacer(Modifier.weight(1f))
                Box(Modifier.size(48.dp).escClickable(label = "Skip tour", onClick = onDone).semantics { contentDescription = "Skip tour" },
                    contentAlignment = Alignment.Center) { Text("✕", style = EscFont.ui(15, FontWeight.Medium, Esc.haze)) }
            }
            Row(Modifier.padding(top = 18.dp), horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                steps.indices.forEach { i ->
                    Box(Modifier.weight(1f).height(3.dp).background(
                        when {
                            i == step -> Esc.ember
                            i < step -> Esc.lilac.copy(alpha = 0.5f)
                            else -> Color.White.copy(alpha = 0.2f)
                        }, CircleShape))
                }
            }
            Text(s.eyebrow.uppercase(), style = EscFont.label(Esc.lilac), modifier = Modifier.padding(top = 18.dp))
            Text(s.title, style = EscFont.display(26), modifier = Modifier.padding(top = 6.dp).semantics { heading() })
            Text(s.body, style = EscFont.ui(15, color = Esc.haze).copy(lineHeight = 21.sp), modifier = Modifier.padding(top = 8.dp))
            Row(Modifier.padding(top = 22.dp).fillMaxWidth(), verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("${step + 1} of ${steps.size}", style = EscFont.ui(13, color = Esc.haze), modifier = Modifier.weight(1f))
                if (step > 0) {
                    Box(Modifier.height(48.dp).escClickable { step -= 1 }, contentAlignment = Alignment.Center) {
                        Text("Back", style = EscFont.ui(14, FontWeight.Medium),
                            modifier = Modifier.background(Esc.card, CircleShape).padding(horizontal = 14.dp, vertical = 11.dp))
                    }
                }
                Box(Modifier.height(48.dp).escClickable { if (step < steps.size - 1) step += 1 else onDone() }, contentAlignment = Alignment.Center) {
                    Text(if (step < steps.size - 1) "Next" else "Got it", style = EscFont.ui(14, FontWeight.SemiBold, Color.White),
                        modifier = Modifier.background(Esc.primaryGradient, CircleShape).padding(horizontal = 20.dp, vertical = 11.dp))
                }
            }
        }
    }
}
