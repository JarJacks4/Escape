package com.escape.soundscapes.ui.components

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
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.GradientSpec
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.brush
import com.escape.soundscapes.theme.hex

// shared.tsx: SoundscapeCard, InnerWeatherTile, StatTile (Cards.swift). BetaFeedbackCard is not
// ported: SoundscapesFeatures.betaFeedback is off on iOS too.

/** 240×320 poster card. */
@Composable
fun SoundscapeCard(
    title: String,
    description: String,
    gradient: GradientSpec,
    isPremium: Boolean = false,
    seasonal: Boolean = false,
    lockedNote: String? = null,
    onPress: () -> Unit,
) {
    val shape = RoundedCornerShape(20.dp)
    Box(
        Modifier
            .size(width = 240.dp, height = 320.dp)
            .clip(shape)
            .background(gradient.brush())
            .escClickable(onClick = onPress)
            .clearAndSetSemantics {
                contentDescription = "$title. $description"
                if (lockedNote != null) stateDescription = lockedNote
            },
    ) {
        Box(Modifier.fillMaxSize().background(Brush.verticalGradient(0.4f to hex(0x0B1230, 0f), 1f to hex(0x0B1230, 0.85f))))
        if (isPremium || seasonal) {
            Row(Modifier.align(Alignment.TopEnd).padding(top = 48.dp, end = 48.dp), horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                if (isPremium) Badge("Premium", hex(0x0B1230, 0.7f), hex(0xE6EAF4, 0.2f), Esc.mist)
                if (seasonal) Badge("Limited", hex(0xEF7702, 0.15f), hex(0xEF7702, 0.4f), Esc.ember2)
            }
        }
        Column(Modifier.align(Alignment.BottomStart).padding(start = 16.dp, end = 16.dp, bottom = 16.dp), verticalArrangement = Arrangement.spacedBy(4.dp)) {
            Text(title, style = EscFont.display(20))
            Text(description, style = EscFont.ui(13, color = Esc.haze).copy(lineHeight = 19.sp))
        }
    }
}

@Composable
private fun Badge(label: String, fill: Color, border: Color, color: Color) {
    Text(
        label,
        style = EscFont.ui(10, FontWeight.SemiBold, color).copy(letterSpacing = 0.8.sp),
        modifier = Modifier.background(fill, CircleShape).border(1.dp, border, CircleShape).padding(vertical = 4.dp, horizontal = 9.dp),
    )
}

/** "Your Inner Weather" tile. */
@Composable
fun InnerWeatherTile(label: String, value: String, icon: EscIcon, iconColor: Color, onPress: () -> Unit) {
    val shape = RoundedCornerShape(16.dp)
    Column(
        Modifier
            .widthIn(min = 140.dp)
            .background(Esc.card, shape)
            .border(1.5.dp, Esc.hairline, shape)
            .escClickable(onClick = onPress)
            .clearAndSetSemantics { contentDescription = "$label: $value" }
            .padding(vertical = 13.5.dp, horizontal = 15.5.dp),
        verticalArrangement = Arrangement.spacedBy(6.dp),
    ) {
        Row(horizontalArrangement = Arrangement.spacedBy(6.dp), verticalAlignment = Alignment.CenterVertically) {
            EscIconView(icon, 14.dp, iconColor)
            Text(label.uppercase(), style = EscFont.label(), maxLines = 1)
        }
        Text(value, style = EscFont.ui(14, FontWeight.Medium), maxLines = 1)
    }
}

/** Session Complete stat. */
@Composable
fun StatTile(label: String, modifier: Modifier = Modifier, sub: String? = null, value: @Composable () -> Unit) {
    val shape = RoundedCornerShape(16.dp)
    Column(
        modifier
            .background(Esc.card, shape)
            .border(1.5.dp, hex(0xE6EAF4, 0.1f), shape)
            .semantics(mergeDescendants = true) { }
            .padding(17.5.dp)
            .fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(4.dp),
    ) {
        Text(label.uppercase(), style = EscFont.label())
        value()
        if (sub != null) Text(sub, style = EscFont.ui(12, color = Esc.haze))
    }
}

@Composable
fun StatValue(text: String) = Text(text, style = EscFont.display(28))
