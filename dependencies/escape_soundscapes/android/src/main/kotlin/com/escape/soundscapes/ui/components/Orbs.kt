package com.escape.soundscapes.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.breathe
import com.escape.soundscapes.theme.breatheRing
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.theme.pulseOrb

// shared.tsx: VisualLayer, ModeOrb, BreathRing, LucilleOrb (Orbs.swift).

/** Full-screen decorative background: base colour, breathing glow + rings, bottom scrim. */
@Composable
fun VisualLayer(isSleep: Boolean = false, showsBase: Boolean = true) {
    Box(
        Modifier.fillMaxSize().then(if (showsBase) Modifier.background(if (isSleep) Esc.sleepNight else Esc.night) else Modifier)
            .clearAndSetSemantics { },
        contentAlignment = Alignment.Center,
    ) {
        Box(Modifier.breathe(), contentAlignment = Alignment.Center) {
            val glow = if (isSleep) cssRadialCircle(listOf(hex(0x0E1432, 0.9f), hex(0x05081A, 0f)), listOf(0.0, 0.7))
            else cssRadialCircle(listOf(hex(0x8E7CD9, 0.18f), hex(0xB9A3F0, 0.06f), hex(0x0B1230, 0f)), listOf(0.0, 0.4, 0.7))
            Box(Modifier.size(320.dp).background(glow, CircleShape))
            Box(Modifier.size(280.dp).breatheRing().border(1.dp, if (isSleep) hex(0x9C4F07, 0.15f) else hex(0xB9A3F0, 0.25f), CircleShape))
            Box(Modifier.size(200.dp).breathe(delayMillis = 2000).border(1.dp, if (isSleep) hex(0x9C4F07, 0.08f) else hex(0xB9A3F0, 0.12f), CircleShape))
        }
        if (showsBase) {
            Box(Modifier.fillMaxSize().background(Brush.verticalGradient(listOf(hex(0x0B1230, 0f), hex(0x0B1230, 0.85f)))))
        }
    }
}

/** Mode orb with label (ModeOrb). Picks uses a lilac icon. */
@Composable
fun ModeOrb(mode: ModeId, label: String, active: Boolean, locked: Boolean = false, size: Dp = 64.dp, onPress: () -> Unit) {
    Column(
        Modifier
            .widthIn(min = 64.dp)
            .escClickable(scale = 0.96f, pressedAlpha = 1f, onClick = onPress)
            .semantics {
                contentDescription = label
                selected = active
                if (locked) stateDescription = "Locked"
            },
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(8.dp),
    ) {
        Box(
            Modifier
                .size(size)
                .background(
                    if (active) cssRadialCircle(listOf(hex(0xB9A3F0, 0.25f), hex(0x8E7CD9, 0.1f))) else androidx.compose.ui.graphics.SolidColor(Esc.card),
                    CircleShape,
                )
                .border(1.5.dp, if (active) hex(0xB9A3F0, 0.6f) else Esc.hairline, CircleShape),
            contentAlignment = Alignment.Center,
        ) {
            EscIconView(EscIcon.mode(mode), 22.dp, if (mode == ModeId.PICKS) Esc.lilac else Esc.mist)
            if (locked) {
                Box(
                    Modifier.align(Alignment.BottomEnd).padding(1.5.dp).size(18.dp)
                        .background(Esc.night, CircleShape).border(1.dp, hex(0xE6EAF4, 0.2f), CircleShape),
                    contentAlignment = Alignment.Center,
                ) { EscIconView(EscIcon.LOCK, 10.dp, Esc.haze) }
            }
        }
        Text(
            label,
            style = EscFont.ui(11, FontWeight.Medium, if (active) Esc.mist else Esc.haze).copy(letterSpacing = 0.55.sp, textAlign = TextAlign.Center),
            modifier = Modifier.width(maxOf(size, 64.dp)),
        )
    }
}

/** "Breathe" ring shown when the timer is done (or Sleep Breath Sync is on). */
@Composable
fun BreathRing() {
    Box(Modifier.size(260.dp).clearAndSetSemantics { contentDescription = "Breathe" }, contentAlignment = Alignment.Center) {
        Box(Modifier.size(200.dp).breatheRing().border(1.5.dp, hex(0xB9A3F0, 0.5f), CircleShape))
        Box(
            Modifier.size(160.dp).breathe(delayMillis = 1000)
                .background(cssRadialCircle(listOf(hex(0xB9A3F0, 0.2f), hex(0x8E7CD9, 0.05f))), CircleShape),
            contentAlignment = Alignment.Center,
        ) { Text("Breathe", style = EscFont.ui(13, color = Esc.haze)) }
    }
}

/** Lucille's little glowing orb. */
@Composable
fun LucilleOrb(size: Dp = 40.dp, pulse: Boolean = false) {
    Box(
        Modifier.size(size).pulseOrb(pulse)
            .background(cssRadialCircle(listOf(hex(0xB9A3F0, 0.5f), hex(0x8E7CD9, 0.2f), hex(0x8E7CD9, 0f)), listOf(0.0, 0.6, 1.0)), CircleShape)
            .border(1.5.dp, hex(0xB9A3F0, 0.4f), CircleShape)
            .clearAndSetSemantics { },
        contentAlignment = Alignment.Center,
    ) {
        Box(Modifier.size(size * 0.5f).background(cssRadialCircle(listOf(hex(0xB9A3F0, 0.8f), hex(0x8E7CD9, 0.4f))), CircleShape))
    }
}

/** Solid colour circle helper. */
@Composable
fun Dot(color: Color, size: Dp) = Box(Modifier.size(size).background(color, CircleShape))
