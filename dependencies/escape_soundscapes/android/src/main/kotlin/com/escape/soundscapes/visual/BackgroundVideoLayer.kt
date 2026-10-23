@file:androidx.annotation.OptIn(markerClass = [androidx.media3.common.util.UnstableApi::class])

package com.escape.soundscapes.visual

import android.graphics.Matrix
import android.net.Uri
import android.view.TextureView
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clipToBounds
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.viewinterop.AndroidView
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.common.VideoSize
import androidx.media3.exoplayer.ExoPlayer
import coil.compose.AsyncImage
import com.escape.soundscapes.model.VisualPreset
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.rememberReduceMotion
import kotlin.math.max
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

/**
 * The TouchDesigner loop behind Now Playing (BackgroundVideoLayer.swift): night base → poster →
 * cached looping video that fades in on its first frame → bottom scrim. Never makes a sound.
 * With animations removed (animator scale 0) only the poster shows. Sleep "dimmed" fades to 20%.
 */
@Composable
fun BackgroundVideoLayer(preset: VisualPreset?, dimmed: Boolean, modifier: Modifier = Modifier) {
    val context = LocalContext.current
    val reduceMotion = rememberReduceMotion()
    val dimAlpha by animateFloatAsState(if (dimmed) 0.2f else 1f, tween(1200), label = "dim")
    var videoUri by remember { mutableStateOf<String?>(null) }
    var firstFrame by remember { mutableStateOf(false) }
    val videoAlpha by animateFloatAsState(if (firstFrame) 1f else 0f, tween(800), label = "videoFade")

    LaunchedEffect(preset?.preferredVideoUrl) {
        val p = preset
        if (p == null) { firstFrame = false; videoUri = null; return@LaunchedEffect }
        // The offline fallback needs the asset index; the store builds it at open, but don't race it.
        val local = withContext(Dispatchers.IO) {
            OrbLoops.indexBundled(context)
            VideoCache.localFile(context, p.preferredVideoUrl)
        }
        val next = local?.let { Uri.fromFile(it).toString() } ?: OrbLoops.offlineUri(p)   // offline / not published: the mode's bundled loop
        // Same file (e.g. the offline loop for a neighbouring cell): keep it playing. Resetting
        // firstFrame here would hide the video for good, because no new first frame is rendered.
        if (next != videoUri) {
            firstFrame = false
            videoUri = next
        }
        OrbLoops.prefetchNeighbours(context, p)
    }

    Box(
        modifier
            .fillMaxSize()
            .alpha(dimAlpha)
            .background(Esc.night)
            .clipToBounds()
            .clearAndSetSemantics { },
    ) {
        preset?.poster?.let { poster ->
            AsyncImage(model = poster, contentDescription = null, contentScale = ContentScale.Crop, modifier = Modifier.fillMaxSize())
        }
        val uri = videoUri
        if (!reduceMotion && uri != null) {
            LoopingVideo(uri, onFirstFrame = { firstFrame = true }, modifier = Modifier.fillMaxSize().alpha(videoAlpha))
        }
        Box(
            Modifier.fillMaxSize().background(
                Brush.verticalGradient(
                    0f to Esc.night.copy(alpha = 0f),
                    0.45f to Esc.night.copy(alpha = 0f),
                    1f to Esc.night.copy(alpha = 0.85f),
                ),
            ),
        )
    }
}

/** Silent, aspect-fill, looping video on a TextureView (so alpha fades and blur work). */
@Composable
private fun LoopingVideo(uri: String, onFirstFrame: () -> Unit, modifier: Modifier = Modifier) {
    val context = LocalContext.current
    val lifecycle = LocalLifecycleOwner.current.lifecycle
    val holder = remember { arrayOfNulls<TextureView>(1) }
    val videoSize = remember { intArrayOf(0, 0) }
    val player = remember {
        ExoPlayer.Builder(context.applicationContext).build().apply {
            volume = 0f
            repeatMode = Player.REPEAT_MODE_ONE
            trackSelectionParameters = trackSelectionParameters.buildUpon().setTrackTypeDisabled(C.TRACK_TYPE_AUDIO, true).build()
        }
    }

    DisposableEffect(player) {
        val listener = object : Player.Listener {
            override fun onRenderedFirstFrame() = onFirstFrame()
            override fun onVideoSizeChanged(size: VideoSize) {
                videoSize[0] = size.width; videoSize[1] = size.height
                holder[0]?.let { centerCrop(it, size.width, size.height) }
            }
        }
        player.addListener(listener)
        val observer = LifecycleEventObserver { _, event ->
            when (event) {
                Lifecycle.Event.ON_START -> player.play()
                Lifecycle.Event.ON_STOP -> player.pause()
                else -> Unit
            }
        }
        lifecycle.addObserver(observer)
        onDispose {
            lifecycle.removeObserver(observer)
            player.removeListener(listener)
            player.release()
        }
    }

    LaunchedEffect(uri) {
        player.setMediaItem(MediaItem.fromUri(uri))
        player.prepare()
        if (lifecycle.currentState.isAtLeast(Lifecycle.State.STARTED)) player.play()
    }

    AndroidView(
        factory = { ctx ->
            TextureView(ctx).also { tv ->
                holder[0] = tv
                player.setVideoTextureView(tv)
                tv.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                    centerCrop(v as TextureView, videoSize[0], videoSize[1])
                }
            }
        },
        modifier = modifier,
        onRelease = { tv ->
            player.clearVideoTextureView(tv)
            holder[0] = null
        },
    )
}

/** TextureView stretches the frame to its bounds; scale it back so the video fills without distortion. */
private fun centerCrop(tv: TextureView, videoW: Int, videoH: Int) {
    val vw = tv.width.toFloat()
    val vh = tv.height.toFloat()
    if (vw <= 0f || vh <= 0f || videoW <= 0 || videoH <= 0) return
    val scale = max(vw / videoW, vh / videoH)
    val m = Matrix()
    m.setScale(videoW * scale / vw, videoH * scale / vh, vw / 2f, vh / 2f)
    tv.setTransform(m)
}
