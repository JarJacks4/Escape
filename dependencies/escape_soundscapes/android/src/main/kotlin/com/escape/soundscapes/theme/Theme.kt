package com.escape.soundscapes.theme

import android.provider.Settings
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.LinearGradientShader
import androidx.compose.ui.graphics.RadialGradientShader
import androidx.compose.ui.graphics.Shader
import androidx.compose.ui.graphics.ShaderBrush
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.R
import com.escape.soundscapes.model.GradientSpec
import kotlin.math.cos
import kotlin.math.min
import kotlin.math.sin
import kotlin.math.sqrt

// Escape design tokens (ios/Classes/Theme/Theme.swift). A Figma px is a dp here.

fun hex(rgb: Long, alpha: Float = 1f): Color = Color(
    red = ((rgb shr 16) and 0xFF).toInt() / 255f,
    green = ((rgb shr 8) and 0xFF).toInt() / 255f,
    blue = (rgb and 0xFF).toInt() / 255f,
    alpha = alpha,
)

object Esc {
    val night = hex(0x0B1230)
    val sleepNight = hex(0x05081A)
    val ink = hex(0x101E43)
    val surface = hex(0x18224A)
    val raised = hex(0x212C5A)
    val royal = hex(0x39519F)
    val deepBlue = hex(0x164395)
    val ember = hex(0xEF7702)
    val ember2 = hex(0xF08A1D)
    val emberDim = hex(0x9C4F07)
    val lilac = hex(0xB9A3F0)
    val violet = hex(0x8E7CD9)
    val mist = hex(0xE6EAF4)
    val haze = hex(0xA9B3D6)
    val rose = hex(0xC9A3B8)
    val periwinkle = hex(0x8E8FD0)

    val hairline = hex(0xE6EAF4, 0.12f)
    val hairlineSoft = hex(0xE6EAF4, 0.06f)
    val card = hex(0x212C5A, 0.8f)
    val cardSoft = hex(0x212C5A, 0.6f)
    val navBar = hex(0x101E43, 0.95f)
    val sheet = hex(0x18224A, 0.75f)
    /** Below API 31 there is no blur, so sheets get a more opaque fill instead. */
    val sheetNoBlur = hex(0x18224A, 0.94f)
    val dim = Color.Black.copy(alpha = 0.6f)
    val pad = hex(0x101E43, 0.8f)

    val primaryGradient: Brush get() = cssLinear(135.0, listOf(ember, ember2))
    val primaryHorizontal: Brush get() = cssLinear(90.0, listOf(ember, ember2))
    val signature: Brush get() = GradientSpec(listOf("#EF7702", "#C9A3B8", "#8E8FD0", "#164395"), listOf(0.0, 0.35, 0.7, 1.0)).brush()

    object Metrics {
        val screenPadding = 24.dp
        val headerHeight = 52.dp
        val navHeight = 72.dp
        val sheetRadius = 28.dp
        val cardRadius = 20.dp
        val touchTarget = 48.dp
        val nightTouchTarget = 56.dp
    }
}

object EscFont {
    val display = FontFamily(Font(R.font.gilda_display_regular, FontWeight.Normal))
    val ui = FontFamily(
        Font(R.font.work_sans_light, FontWeight.Light),
        Font(R.font.work_sans_regular, FontWeight.Normal),
        Font(R.font.work_sans_medium, FontWeight.Medium),
        Font(R.font.work_sans_semibold, FontWeight.SemiBold),
        Font(R.font.work_sans_bold, FontWeight.Bold),
    )
    val basicons = FontFamily(Font(R.font.basicons_appgenz))
    val iconia = FontFamily(Font(R.font.iconia_regular_appgenz))
    val materialIcons = FontFamily(Font(R.font.material_icons_regular))

    fun display(size: Int, color: Color = Esc.mist) = TextStyle(fontFamily = display, fontSize = size.sp, color = color)

    fun ui(size: Number, weight: FontWeight = FontWeight.Normal, color: Color = Esc.mist) =
        TextStyle(fontFamily = ui, fontSize = size.toFloat().sp, fontWeight = weight, color = color)

    /** Figma "label": 11px, 600, letter-spacing 0.12em, uppercase (apply .uppercase() to the text). */
    fun label(color: Color = Esc.haze) =
        TextStyle(fontFamily = ui, fontSize = 11.sp, fontWeight = FontWeight.SemiBold, color = color, letterSpacing = (11 * 0.12).sp)
}

/** "#RRGGBB", "#RRGGBBAA", "#RGB" or "rgba(r,g,b,a)". Falls back to night blue. */
fun cssColor(css: String): Color {
    val s = css.trim()
    if (s.startsWith("rgba(") || s.startsWith("rgb(")) {
        val nums = s.substringAfter('(').substringBefore(')').split(',').mapNotNull { it.trim().toFloatOrNull() }
        if (nums.size >= 3) return Color(nums[0] / 255f, nums[1] / 255f, nums[2] / 255f, if (nums.size > 3) nums[3] else 1f)
    }
    var h = s.removePrefix("#")
    if (h.length == 3) h = h.map { "$it$it" }.joinToString("")
    val v = h.toLongOrNull(16) ?: return Esc.night
    return if (h.length == 8) {
        Color(((v shr 24) and 0xFF) / 255f, ((v shr 16) and 0xFF) / 255f, ((v shr 8) and 0xFF) / 255f, (v and 0xFF) / 255f)
    } else hex(v and 0xFFFFFF)
}

/**
 * `linear-gradient(<angle>deg, …)` with the iOS port's semantics: the line runs between unit points
 * (0.5 ± sin/2, 0.5 ∓ cos/2) of the box, so 135° goes top-left → bottom-right.
 */
fun cssLinear(angle: Double, colors: List<Color>, stops: List<Double>? = null): Brush {
    val safe = if (colors.size == 1) colors + colors else colors
    return object : ShaderBrush() {
        override fun createShader(size: Size): Shader {
            val rad = Math.toRadians(angle)
            val dx = (sin(rad) / 2).toFloat()
            val dy = (-cos(rad) / 2).toFloat()
            val from = Offset((0.5f - dx) * size.width, (0.5f - dy) * size.height)
            val to = Offset((0.5f + dx) * size.width, (0.5f + dy) * size.height)
            val st = stops?.takeIf { it.size == safe.size }?.map { it.toFloat().coerceIn(0f, 1f) }
            return LinearGradientShader(from, to, safe, st)
        }
    }
}

/**
 * `radial-gradient(circle, …)` (farthest-corner): on a square box the 100% stop sits at side/2·√2.
 * [radiusScale] = 1 gives that; pass 1/√2 for a plain "closest-side" circle.
 */
fun cssRadialCircle(colors: List<Color>, stops: List<Double>? = null, radiusScale: Float = 1f): Brush {
    val safe = if (colors.size == 1) colors + colors else colors
    return object : ShaderBrush() {
        override fun createShader(size: Size): Shader {
            val r = (min(size.width, size.height) / 2f * sqrt(2f) * radiusScale).coerceAtLeast(1f)
            val st = stops?.takeIf { it.size == safe.size }?.map { it.toFloat().coerceIn(0f, 1f) }
            return RadialGradientShader(Offset(size.width / 2, size.height / 2), r, safe, st)
        }
    }
}

/** GradientSpec from the API/seed as a brush. A last stop past 100% is cut like CSS does. */
fun GradientSpec.brush(): Brush {
    val cs = colors.map { cssColor(it) }
    val st = stops
    if (st != null && st.size == cs.size && st.size >= 2 && st.last() > 1.0) {
        val prev = st[st.size - 2]
        val last = st.last()
        val t = if (prev < last) ((1 - prev) / (last - prev)).toFloat() else 1f
        val a = cs[cs.size - 2]
        val b = cs.last()
        val mid = Color(a.red + (b.red - a.red) * t, a.green + (b.green - a.green) * t, a.blue + (b.blue - a.blue) * t, 1f)
        return cssLinear(angle, cs.dropLast(1) + mid, st.dropLast(1) + 1.0)
    }
    return cssLinear(angle, cs, st)
}

/**
 * True when the person turned animations off (Developer options / Accessibility "Remove animations"):
 * Settings.Global animator scale 0. The equivalent of iOS Reduce Motion.
 */
@Composable
fun rememberReduceMotion(): Boolean {
    val context = LocalContext.current
    return remember(context) {
        runCatching {
            Settings.Global.getFloat(context.contentResolver, Settings.Global.ANIMATOR_DURATION_SCALE, 1f) == 0f
        }.getOrDefault(false)
    }
}
