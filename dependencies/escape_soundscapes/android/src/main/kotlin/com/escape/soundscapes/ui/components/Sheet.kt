package com.escape.soundscapes.ui.components

import android.os.Build
import androidx.activity.compose.BackHandler
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.MutableTransitionState
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.liveRegion
import androidx.compose.ui.semantics.paneTitle
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.theme.rememberReduceMotion
import kotlinx.coroutines.delay

/** True on Android 12+, where Modifier.blur (RenderEffect) frosts what's behind sheets. */
val canBlur: Boolean get() = Build.VERSION.SDK_INT >= 31

/** Glass fill: translucent on API 31+ (the content behind is blurred), more opaque below. */
fun glassFill(blurredAlpha: Float = 0.75f): Color = if (canBlur) hex(0x18224A, blurredAlpha) else Esc.sheetNoBlur

/**
 * Bottom sheet overlay (BottomSheet.swift): dim backdrop (tap / back closes), a panel anchored to
 * the bottom that slides up in 280 ms, 28dp top corners, max 90% height (taller content scrolls).
 * The root blurs the screen behind it on API 31+.
 */
@Composable
fun BottomSheet(title: String?, onClose: () -> Unit, content: @Composable () -> Unit) {
    val reduce = rememberReduceMotion()
    val visible = remember { MutableTransitionState(reduce) }
    LaunchedEffect(Unit) { visible.targetState = true }
    BackHandler(onBack = onClose)
    BoxWithConstraints(Modifier.fillMaxSize()) {
        val maxH = maxHeight * 0.9f
        Box(
            Modifier
                .fillMaxSize()
                .background(Esc.dim)
                .clickable(interactionSource = remember { MutableInteractionSource() }, indication = null,
                    onClickLabel = "Close", role = Role.Button, onClick = onClose)
                .semantics { contentDescription = "Close" },
        )
        AnimatedVisibility(
            visibleState = visible,
            modifier = Modifier.align(Alignment.BottomCenter),
            enter = slideInVertically(tween(280)) { it } + fadeIn(tween(200)),
            exit = slideOutVertically(tween(200)) { it } + fadeOut(tween(150)),
        ) {
            val shape = RoundedCornerShape(topStart = Esc.Metrics.sheetRadius, topEnd = Esc.Metrics.sheetRadius)
            Column(
                Modifier
                    .fillMaxWidth()
                    .heightIn(max = maxH)
                    .shadow(16.dp, shape, ambientColor = Color.Black.copy(alpha = 0.4f), spotColor = Color.Black.copy(alpha = 0.4f))
                    .background(glassFill(), shape)
                    .border(1.dp, hex(0xE6EAF4, 0.15f), shape)
                    // Swallow taps so they don't reach the backdrop.
                    .clickable(interactionSource = remember { MutableInteractionSource() }, indication = null, onClick = {})
                    .semantics { paneTitle = title ?: "Sheet" }
                    .windowInsetsPadding(WindowInsets.navigationBars)
                    .verticalScroll(rememberScrollState()),
            ) {
                SheetHandle()
                if (title != null) {
                    Text(
                        title,
                        style = EscFont.display(22),
                        modifier = Modifier.padding(start = 24.dp, end = 24.dp, top = 4.dp, bottom = 16.dp).semantics { heading() },
                    )
                }
                content()
            }
        }
    }
}

@Composable
fun SheetHandle(bottom: Dp = 8.dp) {
    Box(Modifier.fillMaxWidth().padding(top = 12.dp, bottom = bottom), contentAlignment = Alignment.Center) {
        Box(Modifier.size(width = 36.dp, height = 4.dp).background(hex(0xE6EAF4, 0.2f), CircleShape))
    }
}

/** Toast for `store.toast` (ToastView): disappears after 2.5 s and is announced by TalkBack. */
@Composable
fun ToastHost(message: String?, onDone: () -> Unit) {
    if (message == null) return
    LaunchedEffect(message) {
        delay(2_500)
        onDone()
    }
    Box(Modifier.fillMaxSize().padding(bottom = 96.dp).windowInsetsPadding(WindowInsets.navigationBars), contentAlignment = Alignment.BottomCenter) {
        Text(
            message,
            style = EscFont.ui(14, FontWeight.Medium, Esc.mist),
            modifier = Modifier
                .padding(horizontal = 24.dp)
                .background(hex(0x212C5A, 0.95f), CircleShape)
                .border(1.dp, Esc.hairline, CircleShape)
                .padding(horizontal = 18.dp, vertical = 12.dp)
                .semantics { liveRegion = LiveRegionMode.Polite },
        )
    }
}
