package com.escape.soundscapes.ui.components

import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.liveRegion
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.EqualizerBars
import com.escape.soundscapes.theme.cssLinear
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex

// shared.tsx: RingTimer, ControlBar, MiniPlayer (Player.swift).

/** 260dp ring with the remaining time. */
@Composable
fun RingTimer(seconds: Int, totalSeconds: Int, caption: String) {
    val progress = if (totalSeconds > 0) (1f - seconds.toFloat() / totalSeconds).coerceIn(0f, 1f) else 0f
    val animated by animateFloatAsState(progress, tween(1000, easing = LinearEasing), label = "ring")
    val mins = maxOf(0, seconds) / 60
    val secs = maxOf(0, seconds) % 60
    Box(
        Modifier.size(260.dp).clearAndSetSemantics { contentDescription = "$mins minutes $secs seconds remaining" },
        contentAlignment = Alignment.Center,
    ) {
        Canvas(Modifier.fillMaxSize()) {
            val stroke = 6.dp.toPx()
            val inset = stroke * 1.5f
            val arcSize = Size(size.width - inset * 2, size.height - inset * 2)
            val topLeft = Offset(inset, inset)
            drawArc(Esc.hairline, 0f, 360f, false, topLeft, arcSize, style = Stroke(stroke))
            drawArc(
                brush = Brush.horizontalGradient(listOf(Esc.ember, Esc.ember2)),
                startAngle = -90f,
                sweepAngle = 360f * maxOf(animated, 0.0001f),
                useCenter = false,
                topLeft = topLeft,
                size = arcSize,
                style = Stroke(stroke, cap = StrokeCap.Round),
            )
        }
        Column(horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(4.dp)) {
            Text("%02d:%02d".format(mins, secs), style = EscFont.display(48))
            Text(caption, style = EscFont.ui(12, color = Esc.haze))
        }
    }
}

/** Variation · Timer · Play/Pause · Save · Share. */
@Composable
fun ControlBar(
    isPlaying: Boolean,
    isSaved: Boolean,
    onPlayPause: () -> Unit,
    onTimer: () -> Unit,
    onVariation: () -> Unit,
    onSave: () -> Unit,
    onShare: () -> Unit,
) {
    Row(Modifier.fillMaxWidth().padding(horizontal = 8.dp), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = Alignment.CenterVertically) {
        IconTarget(EscIcon.SHUFFLE, "New variation", onClick = onVariation)
        IconTarget(EscIcon.TIMER, "Timer", onClick = onTimer)
        Box(
            Modifier
                .size(72.dp)
                .shadow(12.dp, CircleShape, ambientColor = hex(0xEF7702, 0.4f), spotColor = hex(0xEF7702, 0.4f))
                .background(cssLinear(135.0, listOf(Esc.ember, Esc.ember2)), CircleShape)
                .escClickable(label = if (isPlaying) "Pause" else "Play", onClick = onPlayPause)
                .semantics { contentDescription = if (isPlaying) "Pause" else "Play" },
            contentAlignment = Alignment.Center,
        ) { EscIconView(if (isPlaying) EscIcon.PAUSE else EscIcon.PLAY, 26.dp, Color.White) }
        IconTarget(if (isSaved) EscIcon.CHECK else EscIcon.BOOKMARK, if (isSaved) "Saved" else "Save",
            color = if (isSaved) Esc.lilac else Esc.haze, enabled = !isSaved, selected = isSaved, onClick = onSave)
        IconTarget(EscIcon.SHARE, "Share moment", onClick = onShare)
    }
}

/** 48dp icon button. */
@Composable
fun IconTarget(
    icon: EscIcon,
    label: String,
    color: Color = Esc.haze,
    iconSize: androidx.compose.ui.unit.Dp = 22.dp,
    target: androidx.compose.ui.unit.Dp = 48.dp,
    enabled: Boolean = true,
    selected: Boolean = false,
    onClick: () -> Unit,
) {
    Box(
        Modifier.size(target).escClickable(enabled = enabled, label = label, onClick = onClick)
            .semantics { contentDescription = label; this.selected = selected },
        contentAlignment = Alignment.Center,
    ) { EscIconView(icon, iconSize, color) }
}

/** Floating "now playing" bar above the bottom nav. */
@Composable
fun MiniPlayer(mode: String, isPlaying: Boolean, onPress: () -> Unit, onPlayPause: () -> Unit, onTimer: () -> Unit, modifier: Modifier = Modifier) {
    val shape = RoundedCornerShape(16.dp)
    Row(
        modifier
            .padding(horizontal = 16.dp)
            .fillMaxWidth()
            .background(hex(0x212C5A, if (canBlur) 0.92f else 0.97f), shape)
            .border(1.dp, Esc.hairline, shape)
            .padding(vertical = 4.dp, horizontal = 9.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(4.dp),
    ) {
        Row(
            Modifier.weight(1f).escClickable(label = "Open Now Playing", onClick = onPress)
                .semantics(mergeDescendants = true) { }.padding(vertical = 7.dp, horizontal = 8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(10.dp),
        ) {
            Box(
                Modifier.size(36.dp).background(cssRadialCircle(listOf(hex(0xB9A3F0, 0.3f), hex(0x8E7CD9, 0.1f))), CircleShape)
                    .border(1.dp, hex(0xB9A3F0, 0.4f), CircleShape),
                contentAlignment = Alignment.Center,
            ) { EscIconView(EscIcon.SOUNDWAVE, 16.dp, Esc.lilac) }
            Column {
                Row(horizontalArrangement = Arrangement.spacedBy(6.dp), verticalAlignment = Alignment.CenterVertically) {
                    Text((if (isPlaying) "Generating · " else "") + mode, style = EscFont.ui(13, FontWeight.SemiBold), maxLines = 1)
                    if (isPlaying) EqualizerBars(barWidth = 2.dp, rowHeight = 12.dp)
                }
                Text("Composed by Lucille (AI)", style = EscFont.ui(11, color = Esc.haze), maxLines = 1)
            }
        }
        IconTarget(EscIcon.TIMER, "Timer", iconSize = 20.dp, onClick = onTimer)
        Box(
            Modifier.size(48.dp).escClickable(label = if (isPlaying) "Pause" else "Play", onClick = onPlayPause)
                .semantics { contentDescription = if (isPlaying) "Pause" else "Play"; liveRegion = LiveRegionMode.Polite },
            contentAlignment = Alignment.Center,
        ) {
            Box(Modifier.size(36.dp).background(Esc.ember, CircleShape), contentAlignment = Alignment.Center) {
                EscIconView(if (isPlaying) EscIcon.PAUSE else EscIcon.PLAY, 14.dp, Color.White)
            }
        }
    }
}
