package com.escape.soundscapes.scan

import android.provider.Settings
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicText
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.StrokeJoin
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.R

// Escape "frosty" system for the scan, ported from ios/Classes/Screens/Scan/ScanGlass.swift and
// the Esc tokens in ios/Classes/Theme/Theme.swift. Kept inside the scan package so the scan is
// self-contained; values match iOS one for one.

internal object ScanColors {
    val night = Color(0xFF0B1230)       // app background
    val ink = Color(0xFF101E43)
    val surface = Color(0xFF18224A)
    val raised = Color(0xFF212C5A)
    val royal = Color(0xFF39519F)
    val ember = Color(0xFFEF7702)       // primary CTA start
    val ember2 = Color(0xFFF08A1D)      // primary CTA end
    val lilac = Color(0xFFB9A3F0)       // active, Lucille
    val violet = Color(0xFF8E7CD9)
    val mist = Color(0xFFE6EAF4)        // primary text
    val haze = Color(0xFFA9B3D6)        // secondary text
    val cardSoft = Color(0x99212C5A)    // #212C5A @ 0.6
    val hairline = Color(0x1FE6EAF4)    // #E6EAF4 @ 0.12
    val coinLight = Color(0xFFFFD6A3)

    /** iOS .ultraThinMaterial over the dark scan, approximated as a translucent cool fill. */
    val glass = Color(0x59212C5A)       // raised @ 0.35
    val glassTint = Color(0x0FFFFFFF)   // white @ 0.06 sheen on top
    /** iOS .regularMaterial (walkthrough card). */
    val glassStrong = Color(0xD918224A) // surface @ 0.85

    val primaryGradient = Brush.linearGradient(listOf(ember, ember2))
    val rimGradient = Brush.verticalGradient(listOf(Color.White.copy(alpha = 0.35f), Color.White.copy(alpha = 0.05f)))
}

internal object ScanFonts {
    val display = FontFamily(Font(R.font.gilda_display_regular, FontWeight.Normal))
    val ui = FontFamily(
        Font(R.font.work_sans_regular, FontWeight.Normal),
        Font(R.font.work_sans_medium, FontWeight.Medium),
        Font(R.font.work_sans_semibold, FontWeight.SemiBold),
    )

    fun display(size: Int, color: Color = ScanColors.mist, align: TextAlign = TextAlign.Center) = TextStyle(
        fontFamily = display, fontSize = size.sp, lineHeight = (size * 1.18f).sp, color = color, textAlign = align,
    )

    fun ui(
        size: Int,
        weight: FontWeight = FontWeight.Normal,
        color: Color = ScanColors.haze,
        align: TextAlign = TextAlign.Start,
        tracking: TextUnit = TextUnit.Unspecified,
    ) = TextStyle(
        fontFamily = ui, fontWeight = weight, fontSize = size.sp, lineHeight = (size * 1.4f).sp,
        color = color, textAlign = align, letterSpacing = tracking,
    )
}

/**
 * A frosted-glass panel: translucent fill, a bright top hairline, a cool rim, a soft shadow.
 * Android can't blur what is *behind* a view without RenderEffect on the backdrop, so panels are
 * translucent; the flow blurs the orb layer itself (Modifier.blur, API 31+) where iOS frosts most.
 */
internal fun Modifier.glass(radius: Dp = 22.dp, strong: Boolean = false): Modifier {
    val shape = RoundedCornerShape(radius)
    return this
        .shadow(10.dp, shape, clip = false, ambientColor = Color.Black.copy(alpha = 0.25f), spotColor = Color.Black.copy(alpha = 0.25f))
        .clip(shape)
        .background(if (strong) ScanColors.glassStrong else ScanColors.glass)
        .background(ScanColors.glassTint)
        .border(1.dp, ScanColors.rimGradient, shape)
}

/** A small frosted pill (chips, badges). */
internal fun Modifier.glassPill(): Modifier = this.glass(999.dp).padding(horizontal = 13.dp, vertical = 8.dp)

/** True when the person turned animations off (Settings › Accessibility › Remove animations). */
@Composable
internal fun rememberReduceMotion(): Boolean {
    val context = LocalContext.current
    return remember(context) {
        runCatching {
            Settings.Global.getFloat(context.contentResolver, Settings.Global.ANIMATOR_DURATION_SCALE, 1f) == 0f
        }.getOrDefault(false)
    }
}

/** Primary action: the brand ember gradient, glassy rim, 56dp tall. */
@Composable
internal fun PrimaryCTA(title: String, modifier: Modifier = Modifier, enabled: Boolean = true, onClick: () -> Unit) {
    val shape = RoundedCornerShape(28.dp)
    Box(
        modifier
            .fillMaxWidth()
            .height(56.dp)
            .shadow(12.dp, shape, clip = false, ambientColor = ScanColors.ember.copy(alpha = 0.35f), spotColor = ScanColors.ember.copy(alpha = 0.35f))
            .clip(shape)
            .background(ScanColors.primaryGradient, alpha = if (enabled) 1f else 0.5f)
            .border(1.dp, Color.White.copy(alpha = 0.3f), shape)
            .clickable(enabled = enabled, role = Role.Button, onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        BasicText(title, style = ScanFonts.ui(16, FontWeight.SemiBold, Color.White, TextAlign.Center))
    }
}

/** Secondary action: frosted glass, no fill. 48dp tall. */
@Composable
internal fun GlassButton(title: String, modifier: Modifier = Modifier, onClick: () -> Unit) {
    Box(
        modifier
            .heightIn(min = 48.dp)
            .glass(24.dp)
            .clickable(role = Role.Button, onClick = onClick)
            .padding(horizontal = 18.dp),
        contentAlignment = Alignment.Center,
    ) {
        BasicText(title, style = ScanFonts.ui(14, FontWeight.Medium, ScanColors.mist, TextAlign.Center))
    }
}

/** A plain text button with a 48dp target (e.g. "Skip the camera"). */
@Composable
internal fun QuietButton(title: String, modifier: Modifier = Modifier, color: Color = ScanColors.mist, onClick: () -> Unit) {
    Box(
        modifier
            .fillMaxWidth()
            .heightIn(min = 48.dp)
            .clip(RoundedCornerShape(24.dp))
            .clickable(role = Role.Button, onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        BasicText(title, style = ScanFonts.ui(14, FontWeight.Medium, color, TextAlign.Center))
    }
}

internal enum class ScanIcon { Close, Back, Heart, Play, Chevron, Sparkles, Pulse, Wind, Sliders, Bubble, Shield, Check }

/** A round frosted icon button (close, back). 48dp minimum target. */
@Composable
internal fun GlassIconButton(icon: ScanIcon, label: String, size: Dp = 48.dp, onClick: () -> Unit) {
    Box(
        Modifier
            .size(size)
            .glass(size / 2)
            .clickable(role = Role.Button, onClickLabel = label, onClick = onClick)
            .semantics { contentDescription = label },
        contentAlignment = Alignment.Center,
    ) {
        ScanIconView(icon, ScanColors.mist, Modifier.size(size * 0.36f))
    }
}

/**
 * Small line icons drawn on a Canvas, so the scan needs no icon font or material-icons artifact.
 * Decorative: buttons carry their own content descriptions.
 */
@Composable
internal fun ScanIconView(icon: ScanIcon, color: Color, modifier: Modifier = Modifier) {
    Canvas(modifier.clearAndSetSemantics { }) { drawScanIcon(icon, color) }
}

private fun DrawScope.drawScanIcon(icon: ScanIcon, color: Color) {
    val w = size.width
    val h = size.height
    val sw = (w * 0.12f).coerceAtLeast(1.5f)
    val stroke = Stroke(width = sw, cap = StrokeCap.Round, join = StrokeJoin.Round)
    fun line(x1: Float, y1: Float, x2: Float, y2: Float) =
        drawLine(color, Offset(x1 * w, y1 * h), Offset(x2 * w, y2 * h), strokeWidth = sw, cap = StrokeCap.Round)
    when (icon) {
        ScanIcon.Close -> { line(0.15f, 0.15f, 0.85f, 0.85f); line(0.85f, 0.15f, 0.15f, 0.85f) }
        ScanIcon.Back -> { line(0.65f, 0.1f, 0.3f, 0.5f); line(0.3f, 0.5f, 0.65f, 0.9f) }
        ScanIcon.Chevron -> { line(0.35f, 0.1f, 0.7f, 0.5f); line(0.7f, 0.5f, 0.35f, 0.9f) }
        ScanIcon.Heart -> {
            val p = Path().apply {
                moveTo(0.5f * w, 0.9f * h)
                cubicTo(0.05f * w, 0.6f * h, 0f, 0.3f * h, 0.22f * w, 0.15f * h)
                cubicTo(0.38f * w, 0.05f * h, 0.5f * w, 0.18f * h, 0.5f * w, 0.28f * h)
                cubicTo(0.5f * w, 0.18f * h, 0.62f * w, 0.05f * h, 0.78f * w, 0.15f * h)
                cubicTo(1f * w, 0.3f * h, 0.95f * w, 0.6f * h, 0.5f * w, 0.9f * h)
                close()
            }
            drawPath(p, color)
        }
        ScanIcon.Play -> {
            val p = Path().apply { moveTo(0.25f * w, 0.12f * h); lineTo(0.88f * w, 0.5f * h); lineTo(0.25f * w, 0.88f * h); close() }
            drawPath(p, color)
        }
        ScanIcon.Sparkles -> {
            val p = Path().apply {
                moveTo(0.5f * w, 0.05f * h); quadraticTo(0.55f * w, 0.45f * h, 0.95f * w, 0.5f * h)
                quadraticTo(0.55f * w, 0.55f * h, 0.5f * w, 0.95f * h); quadraticTo(0.45f * w, 0.55f * h, 0.05f * w, 0.5f * h)
                quadraticTo(0.45f * w, 0.45f * h, 0.5f * w, 0.05f * h); close()
            }
            drawPath(p, color)
        }
        ScanIcon.Pulse -> {
            val p = Path().apply {
                moveTo(0f, 0.55f * h); lineTo(0.25f * w, 0.55f * h); lineTo(0.38f * w, 0.2f * h)
                lineTo(0.55f * w, 0.85f * h); lineTo(0.68f * w, 0.55f * h); lineTo(w, 0.55f * h)
            }
            drawPath(p, color, style = stroke)
        }
        ScanIcon.Wind -> {
            line(0.05f, 0.35f, 0.7f, 0.35f); line(0.05f, 0.55f, 0.9f, 0.55f); line(0.05f, 0.75f, 0.55f, 0.75f)
        }
        ScanIcon.Sliders -> {
            line(0.05f, 0.3f, 0.95f, 0.3f); line(0.05f, 0.7f, 0.95f, 0.7f)
            drawCircle(color, radius = w * 0.11f, center = Offset(0.35f * w, 0.3f * h))
            drawCircle(color, radius = w * 0.11f, center = Offset(0.68f * w, 0.7f * h))
        }
        ScanIcon.Bubble -> {
            drawRoundRect(color, topLeft = Offset(0.05f * w, 0.1f * h), size = androidx.compose.ui.geometry.Size(0.9f * w, 0.6f * h),
                cornerRadius = androidx.compose.ui.geometry.CornerRadius(0.2f * w), style = stroke)
            line(0.3f, 0.7f, 0.22f, 0.92f)
        }
        ScanIcon.Shield -> {
            val p = Path().apply {
                moveTo(0.5f * w, 0.05f * h); lineTo(0.88f * w, 0.2f * h); lineTo(0.85f * w, 0.55f * h)
                quadraticTo(0.75f * w, 0.85f * h, 0.5f * w, 0.95f * h); quadraticTo(0.25f * w, 0.85f * h, 0.15f * w, 0.55f * h)
                lineTo(0.12f * w, 0.2f * h); close()
            }
            drawPath(p, color, style = stroke)
            line(0.35f, 0.5f, 0.47f, 0.62f); line(0.47f, 0.62f, 0.67f, 0.38f)
        }
        ScanIcon.Check -> { line(0.15f, 0.55f, 0.4f, 0.8f); line(0.4f, 0.8f, 0.88f, 0.2f) }
    }
}

/** The coins badge, frosted. Shows the balance, or "+N" right after a scan earned coins. */
@Composable
internal fun CoinBadge(coins: Int, delta: String?) {
    val label = if (delta != null) "$coins Escape Coins, $delta for this scan" else "$coins Escape Coins"
    Row(
        Modifier.glassPill().clearAndSetSemantics { contentDescription = label },
        horizontalArrangement = Arrangement.spacedBy(8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(
            Modifier.size(14.dp).clip(CircleShape)
                .background(Brush.radialGradient(listOf(ScanColors.coinLight, ScanColors.ember), center = Offset.Zero, radius = 40f)),
        )
        BasicText("%,d".format(coins), style = ScanFonts.ui(13, FontWeight.SemiBold, ScanColors.mist))
        if (delta != null) {
            BasicText(delta, style = ScanFonts.ui(13, FontWeight.SemiBold, ScanColors.ember))
        } else {
            BasicText("Escape Coins", style = ScanFonts.ui(13))
        }
    }
}

/** Small uppercase eyebrow label. */
@Composable
internal fun Eyebrow(text: String, color: Color = ScanColors.lilac, modifier: Modifier = Modifier) {
    BasicText(
        text.uppercase(),
        modifier = modifier.semantics { heading() },
        style = ScanFonts.ui(12, FontWeight.SemiBold, color, TextAlign.Center, tracking = 1.6.sp),
    )
}
