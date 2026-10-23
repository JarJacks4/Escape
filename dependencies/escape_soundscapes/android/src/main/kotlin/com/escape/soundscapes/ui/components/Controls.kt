package com.escape.soundscapes.ui.components

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.layout
import androidx.compose.ui.semantics.CustomAccessibilityAction
import androidx.compose.ui.semantics.ProgressBarRangeInfo
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.customActions
import androidx.compose.ui.semantics.disabled
import androidx.compose.ui.semantics.progressBarRangeInfo
import androidx.compose.ui.semantics.setProgress
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.cssColor
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex
import kotlin.math.roundToInt

/**
 * `<input type="range">` look-alike (MoodSlider / MoodAfterSlider / LayerSlider): drag or tap anywhere
 * on it; TalkBack sees a seek bar (volume keys / swipe adjust by [a11yStep]).
 */
@Composable
fun EscSlider(
    value: Float,
    onChange: (Float) -> Unit,
    a11yLabel: String,
    a11yValue: String,
    modifier: Modifier = Modifier,
    trackColor: Color = Esc.mist,
    trackBorder: Color? = null,
    fill: Color = Esc.lilac,
    trackHeight: Dp = 4.dp,
    thumb: Dp = 16.dp,
    enabled: Boolean = true,
    a11yStep: Float = 0.05f,
    onEditingChanged: (Boolean) -> Unit = {},
) {
    val change by rememberUpdatedState(onChange)
    val editing by rememberUpdatedState(onEditingChanged)
    BoxWithConstraints(
        modifier
            .height(48.dp)
            .clearAndSetSemantics {
                contentDescription = a11yLabel
                stateDescription = a11yValue
                progressBarRangeInfo = ProgressBarRangeInfo(value, 0f..1f)
                if (!enabled) disabled()
                setProgress { v -> if (enabled) { change(v.coerceIn(0f, 1f)); editing(false) }; enabled }
            }
            .pointerInput(enabled) {
                if (!enabled) return@pointerInput
                val t = thumb.toPx()
                fun at(x: Float) = ((x - t / 2) / (size.width - t).coerceAtLeast(1f)).coerceIn(0f, 1f)
                detectTapGestures(onTap = { change(at(it.x)); editing(false) })
            }
            .pointerInput(enabled) {
                if (!enabled) return@pointerInput
                val t = thumb.toPx()
                fun at(x: Float) = ((x - t / 2) / (size.width - t).coerceAtLeast(1f)).coerceIn(0f, 1f)
                detectDragGestures(
                    onDragStart = { editing(true); change(at(it.x)) },
                    onDragEnd = { editing(false) },
                    onDragCancel = { editing(false) },
                    onDrag = { c, _ -> change(at(c.position.x)) },
                )
            },
        contentAlignment = Alignment.CenterStart,
    ) {
        val travel = maxWidth - thumb
        val x = travel * value.coerceIn(0f, 1f)
        val alpha = if (enabled) 1f else 0.3f
        Box(
            Modifier.fillMaxWidth().height(trackHeight).background(trackColor.copy(alpha = trackColor.alpha * alpha), CircleShape)
                .then(if (trackBorder != null) Modifier.border(1.dp, trackBorder, CircleShape) else Modifier),
        )
        Box(Modifier.width(x + thumb / 2).height(trackHeight).background(fill.copy(alpha = alpha), CircleShape))
        Box(Modifier.offset(x = x).size(thumb).background(fill.copy(alpha = alpha), CircleShape))
    }
}

/**
 * The Mood Field pad (MoodFieldPad.swift). Follows the axis labels: energy = 1 - y (top = charged),
 * texture = x (left = grounded, right = dreamy).
 */
@Composable
fun MoodFieldPad(value: MoodField, dots: List<ContentBundle.MoodFieldCopy.Dot>, onChange: (MoodField) -> Unit) {
    // 300dp in the Figma; on a 360dp phone the sheet leaves ~312dp, minus the two side labels.
    BoxWithConstraints {
        val padSize = minOf(300.dp, maxWidth - 42.dp).coerceAtLeast(160.dp)
        MoodFieldPadContent(value, dots, padSize, onChange)
    }
}

@Composable
private fun MoodFieldPadContent(value: MoodField, dots: List<ContentBundle.MoodFieldCopy.Dot>, padSize: Dp, onChange: (MoodField) -> Unit) {
    val change by rememberUpdatedState(onChange)
    val current by rememberUpdatedState(value)
    fun pct(v: Double) = (v * 100).roundToInt()
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(8.dp),
        modifier = Modifier.clearAndSetSemantics {
            contentDescription = "Mood Field"
            stateDescription = "Energy ${pct(value.energy)}%, Texture ${pct(value.texture)}%"
            progressBarRangeInfo = ProgressBarRangeInfo(value.energy.toFloat(), 0f..1f)
            setProgress { v -> change(MoodField(v.toDouble(), current.texture)); true }
            customActions = listOf(
                CustomAccessibilityAction("More dreamy") { change(MoodField(current.energy, current.texture + 0.05)); true },
                CustomAccessibilityAction("More grounded") { change(MoodField(current.energy, current.texture - 0.05)); true },
            )
        },
    ) {
        Text("CHARGED", style = EscFont.label())
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            VerticalLabel("GROUNDED", -90f, padSize)
            Box(
                Modifier
                    .size(padSize)
                    .clip(RoundedCornerShape(20.dp))
                    .background(Esc.pad)
                    .border(1.5.dp, Esc.hairline, RoundedCornerShape(20.dp))
                    .pointerInput(Unit) {
                        fun update(o: Offset) {
                            val x = (o.x / size.width).coerceIn(0f, 1f)
                            val y = (o.y / size.height).coerceIn(0f, 1f)
                            change(MoodField(1.0 - y, x.toDouble()))
                        }
                        detectTapGestures(onPress = { update(it) })
                    }
                    .pointerInput(Unit) {
                        detectDragGestures(
                            onDragStart = { o -> change(MoodField(1.0 - (o.y / size.height).coerceIn(0f, 1f), (o.x / size.width).coerceIn(0f, 1f).toDouble())) },
                            onDrag = { c, _ ->
                                val o = c.position
                                change(MoodField(1.0 - (o.y / size.height).coerceIn(0f, 1f), (o.x / size.width).coerceIn(0f, 1f).toDouble()))
                            },
                        )
                    },
            ) {
                Canvas(Modifier.size(padSize)) {
                    val inset = 1.5.dp.toPx()
                    val inner = size.width - inset * 2
                    for (i in 1..5) {
                        val p = inset + inner * i / 6f
                        drawRect(Esc.hairlineSoft, Offset(p, inset), androidx.compose.ui.geometry.Size(1.dp.toPx(), inner))
                        drawRect(Esc.hairlineSoft, Offset(inset, p), androidx.compose.ui.geometry.Size(inner, 1.dp.toPx()))
                    }
                    dots.forEach { d ->
                        drawCircle(cssColor(d.color).copy(alpha = d.opacity.toFloat()), (d.size / 2).dp.toPx(),
                            Offset(inset + size.width * d.x.toFloat(), inset + size.height * d.y.toFloat()))
                    }
                }
                val kx = padSize * value.texture.toFloat()
                val ky = padSize * (1 - value.energy).toFloat()
                Box(Modifier.offset(x = kx - 60.dp, y = ky - 60.dp).size(120.dp)
                    .background(cssRadialCircle(listOf(hex(0x8E7CD9, 0.25f), hex(0x8E7CD9, 0f)), listOf(0.0, 0.7)), CircleShape))
                Box(
                    Modifier.offset(x = kx - 28.dp, y = ky - 28.dp).size(56.dp)
                        .background(hex(0xE6EAF4, 0.15f), CircleShape).border(1.5.dp, hex(0xE6EAF4, 0.6f), CircleShape),
                    contentAlignment = Alignment.Center,
                ) { Box(Modifier.size(6.dp).background(Esc.mist, CircleShape)) }
            }
            VerticalLabel("DREAMY", 90f, padSize)
        }
        Text("CALM", style = EscFont.label())
    }
}

@Composable
private fun VerticalLabel(text: String, degrees: Float, length: Dp) {
    Box(Modifier.width(13.dp).height(length), contentAlignment = Alignment.Center) {
        Text(
            text,
            style = EscFont.label(),
            softWrap = false,
            modifier = Modifier
                .layout { measurable, constraints ->
                    val p = measurable.measure(constraints.copy(maxWidth = Int.MAX_VALUE, minWidth = 0))
                    layout(p.height, p.width) { p.place((p.height - p.width) / 2, (p.width - p.height) / 2) }
                }
                .rotate(degrees),
        )
    }
}
