package com.escape.soundscapes.ui.screens

import android.content.Intent
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.drawWithContent
import androidx.compose.ui.graphics.BlendMode
import androidx.compose.ui.graphics.CompositingStrategy
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.PointerEventPass
import androidx.compose.ui.input.pointer.PointerEventType
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.Layout
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.Sheet
import com.escape.soundscapes.store.saveCurrent
import com.escape.soundscapes.store.toggleBlend
import com.escape.soundscapes.store.toggleFocusShield
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.theme.rememberReduceMotion
import com.escape.soundscapes.ui.components.ActionPill
import com.escape.soundscapes.ui.components.BreathRing
import com.escape.soundscapes.ui.components.ControlBar
import com.escape.soundscapes.ui.components.IconTarget
import com.escape.soundscapes.ui.components.LucilleOrb
import com.escape.soundscapes.ui.components.ModeOrb
import com.escape.soundscapes.ui.components.RingTimer
import com.escape.soundscapes.ui.components.SheetHandle
import com.escape.soundscapes.ui.components.escClickable
import com.escape.soundscapes.ui.components.glassFill
import com.escape.soundscapes.visual.BackgroundVideoLayer
import com.escape.soundscapes.visual.OrbLoops
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

/** Where the orb's centre sits in the loops, as a fraction of the video height (measured on iOS). */
private const val ORB_CENTER_FRACTION = 0.384f

/**
 * NowPlayingView.swift. Layers: night base → Mood Orb loop (nearest OrbLoops cell for the mode and
 * Mood Field) → content → "Why this sound" pull-up. The timer is centred on the orb; header pinned
 * top, mode switcher + pills + controls pinned bottom; short screens scroll. Sleep (Night UI): no
 * white (content multiplied by haze), 56dp targets, visuals dim to 20% after 60 s without a touch.
 */
@Composable
fun NowPlayingScreen(store: AppStore) {
    val reduce = rememberReduceMotion()
    val isSleep = store.isSleepUI
    var showWhy by remember { mutableStateOf(false) }
    var touches by remember { mutableIntStateOf(0) }
    var idle by remember { mutableStateOf(false) }
    LaunchedEffect(isSleep, touches, store.sheet) {
        idle = false
        if (!isSleep) return@LaunchedEffect
        delay(60_000)
        idle = true
    }
    val preset = store.nowPlaying?.let { OrbLoops.nearest(it.mode, store.moodField) }

    BoxWithConstraints(
        Modifier.fillMaxSize().background(if (isSleep) Esc.sleepNight else Esc.night)
            .pointerInput(Unit) {
                awaitPointerEventScope {
                    while (true) {
                        // Count presses only: counting every move would recompose the screen at frame rate.
                        if (awaitPointerEvent(PointerEventPass.Initial).type == PointerEventType.Press) touches++
                    }
                }
            },
    ) {
        val screenH = maxHeight
        BackgroundVideoLayer(preset, dimmed = isSleep && idle)

        val density = LocalDensity.current
        val statusTop = with(density) { WindowInsets.statusBars.getTop(this).toDp() }
        val navBottom = with(density) { WindowInsets.navigationBars.getBottom(this).toDp() }
        Box(
            Modifier.fillMaxSize()
                .then(
                    if (isSleep) Modifier.graphicsLayer(compositingStrategy = CompositingStrategy.Offscreen)
                        .drawWithContent { drawContent(); drawRect(Esc.haze, blendMode = BlendMode.Modulate) }
                    else Modifier,
                ),
        ) {
            Column(
                Modifier.fillMaxSize().verticalScroll(rememberScrollState())
                    .windowInsetsPadding(WindowInsets.statusBars).windowInsetsPadding(WindowInsets.navigationBars),
            ) {
                OrbCentered(
                    minHeight = screenH - statusTop - navBottom,
                    centerY = screenH * ORB_CENTER_FRACTION - statusTop,
                    top = { Header(store, showWhy, onWhy = { showWhy = !showWhy }) },
                    timer = { TimerView(store) },
                    bottom = { BottomColumn(store) },
                )
            }

            AnimatedVisibility(
                visible = showWhy,
                modifier = Modifier.align(Alignment.BottomCenter),
                enter = if (reduce) fadeIn(tween(0)) else slideInVertically(tween(280)) { it },
                exit = if (reduce) fadeOut(tween(0)) else slideOutVertically(tween(200)) { it },
            ) { WhyPanel(store) { showWhy = false } }
        }
    }
}

@Composable
private fun OrbCentered(
    minHeight: androidx.compose.ui.unit.Dp,
    centerY: androidx.compose.ui.unit.Dp,
    top: @Composable () -> Unit,
    timer: @Composable () -> Unit,
    bottom: @Composable () -> Unit,
) {
    val spacing = with(LocalDensity.current) { 16.dp.roundToPx() }
    val centerPx = with(LocalDensity.current) { centerY.roundToPx() }
    Layout(
        contents = listOf(top, timer, bottom),
        modifier = Modifier.fillMaxWidth().heightIn(min = minHeight),
    ) { (topM, timerM, bottomM), constraints ->
        val child = constraints.copy(minHeight = 0, maxHeight = androidx.compose.ui.unit.Constraints.Infinity, minWidth = 0)
        val t = topM.first().measure(child)
        val m = timerM.first().measure(child)
        val b = bottomM.first().measure(child)
        val needed = t.height + m.height + b.height + spacing * 2
        val height = maxOf(constraints.minHeight, needed)
        layout(constraints.maxWidth, height) {
            t.place((constraints.maxWidth - t.width) / 2, 0)
            b.place((constraints.maxWidth - b.width) / 2, height - b.height)
            val minY = t.height + spacing
            val maxY = maxOf(minY, height - b.height - spacing - m.height)
            val y = (centerPx - m.height / 2).coerceIn(minY, maxY)
            m.place((constraints.maxWidth - m.width) / 2, y)
        }
    }
}

@Composable
private fun Header(store: AppStore, showWhy: Boolean, onWhy: () -> Unit) {
    val target = if (store.isSleepUI) Esc.Metrics.nightTouchTarget else Esc.Metrics.touchTarget
    val copy = store.content?.nowPlaying
    val np = store.nowPlaying
    var menu by remember { mutableStateOf(false) }
    val saved = store.isSaved(np?.compositionId)
    Column(Modifier.fillMaxWidth().padding(horizontal = 16.dp), verticalArrangement = Arrangement.spacedBy(4.dp)) {
        Row(Modifier.fillMaxWidth().heightIn(min = 52.dp), verticalAlignment = Alignment.CenterVertically) {
            IconTarget(EscIcon.CHEVRON_DOWN, "Close player", color = Esc.mist, iconSize = 24.dp, target = target) { store.minimizePlayer() }
            Spacer(Modifier.weight(1f))
            Box(Modifier.semantics { stateDescription = if (showWhy) "Expanded" else "Collapsed" }) {
                IconTarget(EscIcon.INFO, "Why this sound", iconSize = 24.dp, target = target, onClick = onWhy)
            }
            Box {
                IconTarget(EscIcon.MORE, "More options", iconSize = 24.dp, target = target) { menu = true }
                DropdownMenu(expanded = menu, onDismissRequest = { menu = false }) {
                    DropdownMenuItem(text = { Text("End session", style = EscFont.ui(15, color = hex(0xFF8A80))) },
                        onClick = { menu = false; store.scope.launch { store.endSession() } })
                    DropdownMenuItem(text = { Text(if (saved) "Saved" else "Save to Library", style = EscFont.ui(15)) }, enabled = !saved,
                        onClick = { menu = false; store.scope.launch { store.saveCurrent() } })
                }
            }
        }
        Column(Modifier.fillMaxWidth().clearAndSetSemantics {
            heading()
            contentDescription = listOf(np?.title ?: store.currentMode.title, np?.subtitle ?: copy?.subtitle.orEmpty(),
                np?.creditLine ?: copy?.aiCredit ?: "Composed by Lucille (AI)").filter { it.isNotEmpty() }.joinToString(". ")
        }, horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(2.dp)) {
            Text(np?.title ?: store.currentMode.title, style = EscFont.display(22).copy(textAlign = TextAlign.Center), maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(np?.subtitle ?: copy?.subtitle ?: "Afternoon Lift · composed by Lucille", style = EscFont.ui(13, color = Esc.haze), maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(np?.creditLine ?: copy?.aiCredit ?: "Composed by Lucille (AI)",
                style = EscFont.ui(11, color = hex(0xB9A3F0, 0.8f)).copy(letterSpacing = 0.44.sp), maxLines = 1)
        }
    }
}

@Composable
private fun TimerView(store: AppStore) {
    val breathe = store.timerSeconds <= 0 || (store.isSleepUI && store.preferences?.sleep?.breathSync == true)
    Box(Modifier.escClickable(label = "Opens the timer", pressedAlpha = 0.9f) { store.setSheet(Sheet.TIMER) }) {
        if (breathe) BreathRing()
        else RingTimer(store.timerSeconds, (store.preferences?.timer?.minutes ?: 25) * 60, endsAtCaption(store.timerSeconds))
    }
}

/** The real end time of the session ("Ends at 4:12 PM"), not the prototype's sample caption. */
private fun endsAtCaption(secondsLeft: Int): String {
    val end = java.util.Date(System.currentTimeMillis() + maxOf(0, secondsLeft) * 1000L)
    return "Ends at " + java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT).format(end)
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun BottomColumn(store: AppStore) {
    val context = LocalContext.current
    val isSleep = store.isSleepUI
    val pillHeight = if (isSleep) Esc.Metrics.nightTouchTarget else 48.dp
    val switcher = store.content?.nowPlaying?.switcherModes?.mapNotNull { ModeId.loose(it) }?.takeIf { it.isNotEmpty() }
        ?: listOf(ModeId.PICKS, ModeId.FOCUS, ModeId.CALM, ModeId.SLEEP, ModeId.MOVE)
    val g = store.generating
    val reshaping = g != null && !g.status.isFinished && g.parentId == store.nowPlaying?.compositionId
    val saved = store.isSaved(store.nowPlaying?.compositionId)
    Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(20.dp)) {
        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            switcher.forEach { mode ->
                ModeOrb(mode, mode.shortTitle, active = store.currentMode == mode, locked = store.isLocked(mode)) {
                    store.scope.launch { store.switchMode(mode) }
                }
            }
        }
        FlowRow(
            Modifier.fillMaxWidth().padding(horizontal = 24.dp),
            horizontalArrangement = Arrangement.spacedBy(8.dp, Alignment.CenterHorizontally),
        ) {
            ActionPill("Mood Field", EscIcon.MOOD, minHeight = pillHeight, onPress = { store.setSheet(Sheet.MOOD_FIELD) })
            ActionPill("Layers", EscIcon.LAYERS, minHeight = pillHeight, onPress = { store.setSheet(Sheet.LAYERS) })
            ActionPill("Blend", EscIcon.BLEND, store.blendOn, pillHeight, { store.toggleBlend() }, if (store.blendOn) "On" else "Off")
            ActionPill("Focus Shield", EscIcon.SHIELD, store.focusShieldOn, pillHeight, { store.toggleFocusShield() }, if (store.focusShieldOn) "On" else "Off")
            ActionPill("Lucille Whisper", EscIcon.WHISPER, minHeight = pillHeight, onPress = { store.setSheet(Sheet.LUCILLE_WHISPER) })
        }
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            AnimatedVisibility(visible = reshaping, enter = fadeIn(), exit = fadeOut()) {
                Row(Modifier.padding(bottom = 8.dp).semantics(mergeDescendants = true) { }, horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically) {
                    LucilleOrb(14.dp, pulse = true)
                    Text("Lucille is reshaping…", style = EscFont.ui(12, androidx.compose.ui.text.font.FontWeight.Medium, Esc.haze))
                }
            }
            Box(Modifier.padding(start = 16.dp, end = 16.dp, bottom = 16.dp)) {
                ControlBar(
                    isPlaying = store.isPlaying,
                    isSaved = saved,
                    onPlayPause = { store.togglePlay() },
                    onTimer = { store.setSheet(Sheet.TIMER) },
                    onVariation = { store.scope.launch { store.variation() } },
                    onSave = { store.scope.launch { store.saveCurrent() } },
                    onShare = {
                        val text = "Listening to ${store.nowPlaying?.title ?: store.currentMode.title} on Escape — composed by Lucille (AI)"
                        val send = Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, text)
                        context.startActivity(Intent.createChooser(send, "Share moment"))
                    },
                )
            }
        }
    }
}

@Composable
private fun WhyPanel(store: AppStore, onClose: () -> Unit) {
    val np = store.nowPlaying
    // The seed's why-copy describes a sample afternoon (drizzle, restless mood): show only real reasons.
    val modeTitle = (np?.mode ?: store.currentMode).title
    val headline = np?.whyHeadline ?: "Picked for $modeTitle right now."
    val body = np?.whyThisSound?.takeIf { it.isNotBlank() }
        ?: "Lucille chose this $modeTitle soundscape from her catalog to match your Mood Field. Open Mood Field or Layers to reshape it."
    val shape = RoundedCornerShape(topStart = 28.dp, topEnd = 28.dp)
    Column(
        Modifier.fillMaxWidth().background(glassFill(0.97f), shape).border(1.dp, hex(0xE6EAF4, 0.1f), shape)
            .escClickable(label = "Close", pressedAlpha = 1f, onClick = onClose)
            .clearAndSetSemantics { contentDescription = "Why this sound. $headline $body. Double-tap to close" }
            .windowInsetsPadding(WindowInsets.navigationBars)
            .padding(start = 24.dp, end = 24.dp, bottom = 14.dp),
    ) {
        SheetHandle(bottom = 16.dp)
        Text("WHY THIS SOUND", style = EscFont.label(), modifier = Modifier.padding(bottom = 12.dp))
        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            LucilleOrb(36.dp)
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(headline, style = EscFont.display(18))
                Text(body, style = EscFont.ui(15, color = Esc.haze).copy(lineHeight = 21.sp))
            }
        }
    }
}
