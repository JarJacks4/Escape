package com.escape.soundscapes.scan

import android.content.Context
import android.util.Log
import android.util.Size
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.core.resolutionselector.ResolutionStrategy
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.ui.platform.LocalContext
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.compose.LocalLifecycleOwner
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

/**
 * Runs the FRONT camera while it is in composition and feeds each frame's mean face colour to
 * [reader]. No preview surface and nothing recorded: frames are averaged on the analyser thread
 * and closed immediately (the iOS reader also shows no camera image).
 *
 * Callers must only compose this once the CAMERA permission is granted.
 */
@Composable
internal fun PulseCamera(reader: PulseReader) {
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    DisposableEffect(context, lifecycleOwner, reader) {
        val session = PulseCameraSession(context.applicationContext, lifecycleOwner, reader)
        session.start()
        onDispose { session.stop() }
    }
}

private class PulseCameraSession(
    private val context: Context,
    private val owner: LifecycleOwner,
    private val reader: PulseReader,
) {
    private val executor: ExecutorService = Executors.newSingleThreadExecutor { r -> Thread(r, "escape-pulse") }
    @Volatile private var stopped = false
    private var provider: ProcessCameraProvider? = null
    private var analysis: ImageAnalysis? = null

    fun start() {
        reader.reset(PulseReader.Status.Starting)
        val future = ProcessCameraProvider.getInstance(context)
        future.addListener({
            if (stopped) return@addListener
            try {
                val p = future.get()
                val selector = CameraSelector.DEFAULT_FRONT_CAMERA
                if (!p.hasCamera(selector)) {
                    reader.setStatus(PulseReader.Status.Unavailable)
                    return@addListener
                }
                val a = ImageAnalysis.Builder()
                    .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                    .setOutputImageFormat(ImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888)
                    .setResolutionSelector(
                        ResolutionSelector.Builder()
                            .setResolutionStrategy(
                                ResolutionStrategy(Size(640, 480), ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER),
                            )
                            .build(),
                    )
                    .build()
                a.setAnalyzer(executor) { image -> analyse(image) }
                p.bindToLifecycle(owner, selector, a)
                provider = p
                analysis = a
                reader.setStatus(PulseReader.Status.PlaceFace)
            } catch (e: Exception) {
                Log.w("[Scan]", "front camera failed: ${e.message}")
                reader.setStatus(PulseReader.Status.Unavailable)
            }
        }, ContextCompat.getMainExecutor(context))
    }

    fun stop() {
        stopped = true
        analysis?.let { a ->
            a.clearAnalyzer()
            runCatching { provider?.unbind(a) }
        }
        analysis = null
        provider = null
        executor.shutdown()
    }

    /**
     * Mean R, G, B (0…1) of a centred face region straight from the YUV_420_888 planes, every
     * 4th pixel. The region is ~44% wide x 36% tall of the upright (portrait) frame: forehead and
     * cheeks when the face is centred. Symmetric, so the front camera's mirroring doesn't matter.
     */
    private fun analyse(image: ImageProxy) {
        try {
            if (stopped) return
            val w = image.width
            val h = image.height
            val rotated = image.imageInfo.rotationDegrees % 180 != 0
            val fracW = if (rotated) 0.36 else 0.44     // buffer x is the portrait y when rotated
            val fracH = if (rotated) 0.44 else 0.36
            val x0 = (w * (0.5 - fracW / 2)).toInt()
            val x1 = (w * (0.5 + fracW / 2)).toInt()
            val y0 = (h * (0.5 - fracH / 2)).toInt()
            val y1 = (h * (0.5 + fracH / 2)).toInt()

            val yPlane = image.planes[0]
            val uPlane = image.planes[1]
            val vPlane = image.planes[2]
            val yBuf = yPlane.buffer
            val uBuf = uPlane.buffer
            val vBuf = vPlane.buffer
            val yRow = yPlane.rowStride
            val yPix = yPlane.pixelStride
            val uRow = uPlane.rowStride
            val uPix = uPlane.pixelStride
            val vRow = vPlane.rowStride
            val vPix = vPlane.pixelStride
            val yLimit = yBuf.limit()
            val uLimit = uBuf.limit()
            val vLimit = vBuf.limit()

            var sr = 0.0; var sg = 0.0; var sb = 0.0; var sy = 0.0
            var count = 0
            var y = y0
            while (y < y1) {
                var x = x0
                while (x < x1) {
                    val yi = y * yRow + x * yPix
                    val ui = (y / 2) * uRow + (x / 2) * uPix
                    val vi = (y / 2) * vRow + (x / 2) * vPix
                    if (yi < yLimit && ui < uLimit && vi < vLimit) {
                        val yy = (yBuf.get(yi).toInt() and 0xFF).toDouble()
                        val u = (uBuf.get(ui).toInt() and 0xFF) - 128.0
                        val v = (vBuf.get(vi).toInt() and 0xFF) - 128.0
                        sr += (yy + 1.402 * v).coerceIn(0.0, 255.0)
                        sg += (yy - 0.344136 * u - 0.714136 * v).coerceIn(0.0, 255.0)
                        sb += (yy + 1.772 * u).coerceIn(0.0, 255.0)
                        sy += yy
                        count++
                    }
                    x += 4
                }
                y += 4
            }
            if (count == 0) return
            val d = count * 255.0
            val t = image.imageInfo.timestamp / 1e9
            reader.onFrame(t, sr / d, sg / d, sb / d, sy / d)
        } catch (e: Exception) {
            Log.w("[Scan]", "frame skipped: ${e.message}")
        } finally {
            image.close()
        }
    }
}
