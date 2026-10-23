package com.escape.soundscapes.scan

import android.util.Log
import android.view.TextureView
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.State
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.runtime.withFrameNanos
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.lerp
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.layout.layout
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.unit.Constraints
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import coil.compose.AsyncImage
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.exp
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sin

/** Seconds since this composable appeared, advanced every frame; frozen when [paused]. */
@Composable
internal fun rememberFrameSeconds(paused: Boolean): State<Float> {
    val seconds = remember { mutableFloatStateOf(0f) }
    LaunchedEffect(paused) {
        if (paused) return@LaunchedEffect
        val base = seconds.floatValue
        val start = withFrameNanos { it }
        while (true) {
            withFrameNanos { now -> seconds.floatValue = base + (now - start) / 1_000_000_000f }
        }
    }
    return seconds
}

/** A 0…1 heartbeat envelope at [bpm]: a quick "lub", a smaller "dub", then rest (as iOS). */
internal fun beatEnvelope(t: Float, bpm: Int): Float {
    val period = 60f / bpm.coerceIn(40, 180)
    val p = (t % period) / period
    val lub = exp(-((p - 0.06f) / 0.05f).let { it * it })
    val dub = 0.5f * exp(-((p - 0.26f) / 0.06f).let { it * it })
    return min(1f, lub + dub)
}

/**
 * Guided breathing during the pulse read: ~5.5 breaths a minute (4.5 s in, 6.5 s out), eased.
 * Returns the orb scale (0.9…1.08), as iOS ScanFlowView.breathScale.
 */
internal fun breathScale(t: Float): Float {
    val cycle = 11f
    val inhale = 4.5f
    val c = t % cycle
    val x = if (c < inhale) c / inhale else 1f - (c - inhale) / (cycle - inhale)
    val eased = 0.5f - 0.5f * cos(x * PI.toFloat())
    return 0.9f + 0.18f * eased
}

/**
 * The reactive Mood Orb, drawn on a Canvas (Android stand-in for the iOS Metal shader).
 * Recolours to the mood, beats at [MoodReading.bpm] scaled by [beatStrength], breathes when
 * [breathing], drifts gently with energy. Decorative for TalkBack: the screen text says the mood.
 * Time is read only in the draw phase, so animating does not recompose the flow.
 */
@Composable
internal fun MoodOrb(
    reading: MoodReading,
    beatStrength: Float,
    breathing: Boolean,
    drift: Boolean,
    modifier: Modifier = Modifier,
) {
    val reduceMotion = rememberReduceMotion()
    val time = rememberFrameSeconds(paused = reduceMotion)
    val tint by animateColorAsState(reading.tint, tween(600), label = "orbTint")
    val energy by animateFloatAsState(reading.energy, tween(600), label = "orbEnergy")
    val valence by animateFloatAsState(reading.valence, tween(600), label = "orbValence")
    val bpm = reading.bpm

    Canvas(modifier.clearAndSetSemantics { }) {
        val t = if (reduceMotion) 2f else time.value
        val beat = if (reduceMotion) 0f else beatEnvelope(t, bpm) * beatStrength
        val breath = if (breathing && !reduceMotion) breathScale(t) else 1f
        val dx = if (drift && !reduceMotion) sin(t) * 7.dp.toPx() * (0.5f + energy) else 0f
        val c = Offset(size.width / 2 + dx, size.height / 2)
        val r = size.minDimension / 2 * 0.6f * breath * (1f + 0.05f * beat)

        // Outer glow.
        drawCircle(
            Brush.radialGradient(
                0f to tint.copy(alpha = 0.42f + 0.25f * beat),
                0.55f to tint.copy(alpha = 0.14f),
                1f to Color.Transparent,
                center = c, radius = r * 1.65f,
            ),
            radius = r * 1.65f, center = c,
        )
        // Body: lit from the top-left, deepening to night at the rim.
        val deep = lerp(tint, ScanColors.night, 0.65f)
        drawCircle(
            Brush.radialGradient(
                0f to lerp(Color.White, tint, 0.35f),
                0.45f to tint,
                1f to deep,
                center = c + Offset(-0.32f * r, -0.36f * r), radius = r * 1.55f,
            ),
            radius = r, center = c,
        )
        // Slow inner currents: faster when charged, softer and wider when pleasant.
        val speed = 0.15f + 0.55f * energy
        for (i in 0 until 3) {
            val a = t * speed + i * 2.094f
            val off = r * (0.28f + 0.1f * sin(t * 0.7f + i))
            val bc = c + Offset(cos(a) * off, sin(a) * off)
            val br = r * (0.42f + 0.18f * valence)
            drawCircle(
                Brush.radialGradient(
                    listOf(Color.White.copy(alpha = 0.16f + 0.1f * valence), Color.Transparent),
                    center = bc, radius = br,
                ),
                radius = br, center = bc,
            )
        }
        // Glass rim.
        drawCircle(Color.White.copy(alpha = 0.18f), radius = r, center = c, style = Stroke(1.dp.toPx()))
    }
}

/**
 * The result's Mood Orb: the v3 poster (bundled asset, remote fallback) with the looping H.264
 * video crossfading in on its first frame. Muted, no controls. If the stream fails it falls back
 * to the bundled 540p offline loop; if that fails too, the poster stays.
 *
 * The loops are 9:16 full-frame renders with the orb near the middle, so this crops a circle
 * around the orb (orb centre at ~47% of the height, ~70% of the width visible).
 */
@Composable
internal fun VideoMoodOrb(reading: MoodReading, modifier: Modifier = Modifier) {
    val name = reading.orbName
    val grid = reading.orbGrid
    var posterModel by remember(name) { mutableStateOf<Any>(OrbLoops.posterAsset(name)) }
    var videoReady by remember(name) { mutableStateOf(false) }
    val videoAlpha by animateFloatAsState(if (videoReady) 1f else 0f, tween(800), label = "orbVideo")

    Box(modifier.clip(CircleShape).clearAndSetSemantics { }) {
        // A live orb underneath, so there's never an empty circle while the poster loads.
        MoodOrb(reading, beatStrength = 0.3f, breathing = false, drift = false, modifier = Modifier.fillMaxSize())
        AsyncImage(
            model = posterModel,
            contentDescription = null,
            contentScale = ContentScale.FillBounds,
            onError = {
                val remote = OrbLoops.posterUrl(name)
                if (posterModel != remote) posterModel = remote
            },
            modifier = Modifier.orbCrop(),
        )
        OrbVideo(
            primaryUrl = OrbLoops.videoUrl(name),
            fallbackUrl = OrbLoops.offlineAsset(grid),
            onFirstFrame = { videoReady = true },
            modifier = Modifier.orbCrop().alpha(videoAlpha),
        )
        // Soft vignette so the square video edges melt into the night.
        Box(
            Modifier.fillMaxSize().background(
                Brush.radialGradient(
                    0f to Color.Transparent,
                    0.72f to Color.Transparent,
                    1f to ScanColors.night,
                ),
            ),
        )
    }
}

/**
 * Measures this element at the 9:16 video size that puts the orb centre in the middle of the
 * (square) parent with ~70% of the frame width visible, and reports the parent's size; the
 * parent clips to a circle.
 */
private fun Modifier.orbCrop(): Modifier = this.layout { measurable, constraints ->
    val s = min(constraints.maxWidth, constraints.maxHeight)
    val w = max(1, (s / 0.7f).roundToInt())
    val h = max(1, (w * 16f / 9f).roundToInt())
    val placeable = measurable.measure(Constraints.fixed(w, h))
    layout(s, s) { placeable.place(s / 2 - w / 2, (s / 2f - 0.47f * h).roundToInt()) }
}

/**
 * Muted looping ExoPlayer on a TextureView (a SurfaceView would ignore the circular clip).
 * Pauses with the lifecycle and releases on dispose.
 */
@Composable
private fun OrbVideo(primaryUrl: String, fallbackUrl: String, onFirstFrame: () -> Unit, modifier: Modifier) {
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    val player = remember(primaryUrl) {
        ExoPlayer.Builder(context).build().apply {
            volume = 0f
            repeatMode = Player.REPEAT_MODE_ONE
            playWhenReady = true
            setMediaItem(MediaItem.fromUri(primaryUrl))
            prepare()
        }
    }
    DisposableEffect(player, lifecycleOwner) {
        var triedFallback = false
        val listener = object : Player.Listener {
            override fun onRenderedFirstFrame() = onFirstFrame()
            override fun onPlayerError(error: PlaybackException) {
                Log.w("[Scan]", "orb loop failed: ${error.errorCodeName} $primaryUrl")
                if (!triedFallback) {
                    triedFallback = true
                    player.setMediaItem(MediaItem.fromUri(fallbackUrl))
                    player.prepare()
                }
            }
        }
        player.addListener(listener)
        val observer = LifecycleEventObserver { _, event ->
            when (event) {
                Lifecycle.Event.ON_START -> player.playWhenReady = true
                Lifecycle.Event.ON_STOP -> player.playWhenReady = false
                else -> Unit
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose {
            lifecycleOwner.lifecycle.removeObserver(observer)
            player.removeListener(listener)
            player.release()
        }
    }
    AndroidView(
        factory = { ctx -> TextureView(ctx).also { player.setVideoTextureView(it) } },
        modifier = modifier,
        // A new orb cell builds a new player; the factory doesn't run again, so attach it here.
        update = { player.setVideoTextureView(it) },
        onRelease = { player.clearVideoTextureView(it) },
    )
}
