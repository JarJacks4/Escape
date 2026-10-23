package com.escape.soundscapes.theme

import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay

// index.css keyframes (Theme.swift `breathe`, `breatheRing`, `pulseOrb`, EqualizerBars).
// Nothing animates when the system animator scale is 0 ("Remove animations").

/**
 * Half-period ease-in-out autoreverse between (1, opacityFrom) and (scale, 1).
 * [delayMillis] = `animation-delay`: un-animated until it ends.
 */
fun Modifier.keyframePulse(
    active: Boolean = true,
    periodMillis: Int,
    scale: Float,
    opacityFrom: Float,
    delayMillis: Long = 0,
): Modifier = composed {
    val reduce = rememberReduceMotion()
    var started by remember { mutableStateOf(delayMillis == 0L) }
    LaunchedEffect(delayMillis) {
        if (delayMillis > 0) { delay(delayMillis); started = true }
    }
    if (!active || reduce || !started) return@composed this
    val transition = rememberInfiniteTransition(label = "keyframe")
    val t by transition.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(tween(periodMillis / 2, easing = FastOutSlowInEasing), RepeatMode.Reverse),
        label = "keyframeT",
    )
    this.graphicsLayer {
        val s = 1f + (scale - 1f) * t
        scaleX = s
        scaleY = s
        alpha = opacityFrom + (1f - opacityFrom) * t
    }
}

/** `.animate-breathe`: 8 s, scale 1 → 1.08, opacity .6 → 1. */
fun Modifier.breathe(active: Boolean = true, delayMillis: Long = 0) =
    keyframePulse(active, 8000, 1.08f, 0.6f, delayMillis)

/** `.animate-breathe-ring`: 8 s, scale 1 → 1.12. */
fun Modifier.breatheRing(active: Boolean = true) = keyframePulse(active, 8000, 1.12f, 1f)

/** `.animate-pulse-orb`: 3 s, scale 1 → 1.06, opacity .7 → 1. */
fun Modifier.pulseOrb(active: Boolean = true) = keyframePulse(active, 3000, 1.06f, 0.7f)

/** The three bouncing equalizer bars (playing rows, MiniPlayer). */
@Composable
fun EqualizerBars(color: Color = Esc.lilac, active: Boolean = true, barWidth: Dp = 3.dp, rowHeight: Dp = 14.dp) {
    val reduce = rememberReduceMotion()
    val animate = active && !reduce
    val transition = rememberInfiniteTransition(label = "eq")
    @Composable
    fun bar(from: Float, to: Float, periodMs: Int) {
        val h = if (animate) {
            transition.animateFloat(from, to, infiniteRepeatable(tween(periodMs / 2, easing = LinearEasing), RepeatMode.Reverse), label = "bar").value
        } else from
        Box(Modifier.width(barWidth).height(h.dp).background(color, RoundedCornerShape(1.5.dp)))
    }
    Row(
        modifier = Modifier.height(rowHeight).clearAndSetSemantics { },
        horizontalArrangement = Arrangement.spacedBy(2.dp),
        verticalAlignment = Alignment.Bottom,
    ) {
        bar(4f, 12f, 800)
        bar(8f, 4f, 600)
        bar(6f, 14f, 1000)
    }
}
