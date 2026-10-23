package com.escape.soundscapes.ui.components

import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.customActions
import androidx.compose.ui.semantics.CustomAccessibilityAction
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.hex

/**
 * The Figma button behaviour (EscPressStyle): no ripple, label drawn as styled, optional press scale
 * and opacity. Pair with a 48dp minimum size where the visual is smaller.
 */
fun Modifier.escClickable(
    enabled: Boolean = true,
    role: Role = Role.Button,
    label: String? = null,
    scale: Float = 1f,
    pressedAlpha: Float = 0.85f,
    onClick: () -> Unit,
): Modifier = composed {
    val source = remember { MutableInteractionSource() }
    val pressed by source.collectIsPressedAsState()
    val s by animateFloatAsState(if (pressed) scale else 1f, tween(150), label = "pressScale")
    val a by animateFloatAsState(if (pressed) pressedAlpha else 1f, tween(150), label = "pressAlpha")
    this
        .graphicsLayer { scaleX = s; scaleY = s; alpha = a }
        .clickable(interactionSource = source, indication = null, enabled = enabled, onClickLabel = label, role = role, onClick = onClick)
}

/** Ember gradient pill, 56dp (PrimaryButton). */
@Composable
fun PrimaryButton(label: String, modifier: Modifier = Modifier, disabled: Boolean = false, onPress: () -> Unit) {
    Box(
        modifier
            .fillMaxWidth()
            .height(56.dp)
            .background(if (disabled) SolidBrush(hex(0xEF7702, 0.3f)) else Esc.primaryHorizontal, CircleShape)
            .escClickable(enabled = !disabled, onClick = onPress),
        contentAlignment = Alignment.Center,
    ) {
        Text(label, style = EscFont.ui(16, FontWeight.SemiBold, Color.White), maxLines = 1)
    }
}

/** Quiet text button (GhostButton). */
@Composable
fun GhostButton(label: String, modifier: Modifier = Modifier, onPress: () -> Unit) {
    Box(
        modifier
            .height(48.dp)
            .escClickable(onClick = onPress)
            .padding(horizontal = 16.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(label, style = EscFont.ui(15, FontWeight.Medium, Esc.haze))
    }
}

/** "Play for right now" (PlayNowButton); long press = [onLongPress] (also a TalkBack custom action). */
@OptIn(ExperimentalFoundationApi::class)
@Composable
fun PlayNowButton(subtitle: String?, modifier: Modifier = Modifier, onPress: () -> Unit, onLongPress: (() -> Unit)? = null) {
    Row(
        modifier
            .fillMaxWidth()
            .height(64.dp)
            .shadow(10.dp, CircleShape, ambientColor = hex(0xEF7702, 0.35f), spotColor = hex(0xEF7702, 0.35f))
            .background(Esc.primaryHorizontal, CircleShape)
            .combinedClickable(
                interactionSource = remember { MutableInteractionSource() },
                indication = null,
                role = Role.Button,
                onLongClick = onLongPress,
                onClick = onPress,
            )
            .semantics {
                contentDescription = "Play for right now" + (subtitle?.let { ". $it" } ?: "")
                if (onLongPress != null) customActions = listOf(CustomAccessibilityAction("Compose with Lucille") { onLongPress(); true })
            }
            .padding(horizontal = 20.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(12.dp),
    ) {
        Box(Modifier.size(36.dp).background(Color.White.copy(alpha = 0.2f), CircleShape), contentAlignment = Alignment.Center) {
            EscIconView(EscIcon.PLAY, 16.dp, Color.White)
        }
        Column(Modifier.weight(1f)) {
            Text("Play for right now", style = EscFont.ui(16, FontWeight.SemiBold, Color.White), maxLines = 1)
            if (subtitle != null) {
                Text(subtitle, style = EscFont.ui(13, color = Color.White.copy(alpha = 0.8f)), maxLines = 1, overflow = TextOverflow.Ellipsis)
            }
        }
    }
}

/** Small capsule with an icon (ActionPill). */
@Composable
fun ActionPill(label: String, icon: EscIcon, active: Boolean = false, minHeight: Dp = 48.dp, onPress: () -> Unit, stateText: String? = null) {
    Box(
        Modifier
            .height(minHeight)
            .escClickable(label = label, onClick = onPress)
            .semantics {
                selected = active
                if (stateText != null) stateDescription = stateText
            },
        contentAlignment = Alignment.Center,
    ) {
        Row(
            Modifier
                .background(if (active) hex(0x39519F, 0.5f) else hex(0x212C5A, 0.7f), CircleShape)
                .border(1.5.dp, if (active) hex(0x39519F, 0.8f) else Esc.hairline, CircleShape)
                .padding(vertical = 9.5.dp, horizontal = 15.5.dp),
            horizontalArrangement = Arrangement.spacedBy(6.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            EscIconView(icon, 14.dp, Esc.haze)
            Text(label, style = EscFont.ui(13, FontWeight.Medium, if (active) Esc.mist else Esc.haze), maxLines = 1)
        }
    }
}

/** The Figma switch (shared.tsx Toggle): 48×28 track, 20dp knob. */
@Composable
fun EscToggle(on: Boolean, label: String, enabled: Boolean = true, onToggle: () -> Unit) {
    val x by animateDpAsState(if (on) 23.5.dp else 3.5.dp, tween(200), label = "knob")
    Box(
        Modifier
            .size(width = 56.dp, height = 48.dp)
            .escClickable(enabled = enabled, role = Role.Switch, pressedAlpha = 1f, onClick = onToggle)
            .semantics {
                contentDescription = label
                stateDescription = if (on) "On" else "Off"
            },
        contentAlignment = Alignment.Center,
    ) {
        Box(
            Modifier
                .size(width = 48.dp, height = 28.dp)
                .background(if (on) Esc.royal else Esc.card, CircleShape)
                .border(1.5.dp, if (on) Esc.royal else Esc.hairline, CircleShape),
        ) {
            Box(Modifier.offset(x = x, y = 3.5.dp).size(20.dp).background(Esc.mist, CircleShape))
        }
    }
}

/** Scrolling pill tabs (SegmentedTabs). */
@Composable
fun SegmentedTabs(tabs: List<String>, active: String, modifier: Modifier = Modifier, onChange: (String) -> Unit) {
    Row(
        modifier
            .background(Esc.pad, CircleShape)
            .border(1.dp, hex(0xE6EAF4, 0.08f), CircleShape)
            .horizontalScroll(rememberScrollState())
            .padding(5.dp),
        horizontalArrangement = Arrangement.spacedBy(4.dp),
    ) {
        tabs.forEach { tab ->
            val selected = tab == active
            Box(
                Modifier
                    .height(36.dp)
                    .background(if (selected) Esc.royal else Color.Transparent, CircleShape)
                    .escClickable(role = Role.Tab, onClick = { onChange(tab) })
                    .semantics { this.selected = selected }
                    .padding(horizontal = 14.dp),
                contentAlignment = Alignment.Center,
            ) {
                Text(tab, style = EscFont.ui(13, if (selected) FontWeight.SemiBold else FontWeight.Normal, if (selected) Esc.mist else Esc.haze), maxLines = 1)
            }
        }
    }
}

/** Selectable capsule chip used by the sheets (timer lengths, tags, presets, layer chips). */
@Composable
fun ChoiceChip(
    label: String,
    selected: Boolean,
    modifier: Modifier = Modifier,
    a11yLabel: String? = null,
    textSize: Int = 14,
    vertical: Dp = 11.5.dp,
    horizontal: Dp = 19.5.dp,
    onClick: () -> Unit,
) {
    Box(
        modifier
            .height(48.dp)
            .escClickable(onClick = onClick)
            .semantics {
                this.selected = selected
                if (a11yLabel != null) contentDescription = a11yLabel
            },
        contentAlignment = Alignment.Center,
    ) {
        Text(
            label,
            style = EscFont.ui(textSize, if (selected) FontWeight.SemiBold else FontWeight.Normal, if (selected) Esc.mist else Esc.haze),
            maxLines = 1,
            modifier = Modifier
                .background(if (selected) hex(0x39519F, 0.5f) else Esc.card, CircleShape)
                .border(1.5.dp, if (selected) hex(0x39519F, 0.8f) else Esc.hairline, CircleShape)
                .padding(vertical = vertical - 6.dp, horizontal = horizontal),
        )
    }
}

/** "← Back" text button with a 48dp target. */
@Composable
fun BackTextButton(modifier: Modifier = Modifier, onClick: () -> Unit) {
    Box(modifier.height(48.dp).escClickable(label = "Back", onClick = onClick).semantics { contentDescription = "Back" },
        contentAlignment = Alignment.CenterStart) {
        Text("← Back", style = EscFont.ui(15, color = Esc.haze))
    }
}

/** Fixed-width spacer helper. */
@Composable
fun HSpace(width: Dp) = Spacer(Modifier.width(width))

/** Single colour as a Brush (for APIs that take a Brush). */
fun SolidBrush(color: Color): androidx.compose.ui.graphics.Brush = androidx.compose.ui.graphics.SolidColor(color)

/** Rounded rectangle helper. */
fun rounded(r: Dp) = RoundedCornerShape(r)
