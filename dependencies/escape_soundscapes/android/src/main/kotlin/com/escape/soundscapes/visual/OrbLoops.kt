package com.escape.soundscapes.visual

import android.content.Context
import android.net.Uri
import android.util.Log
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.model.VisualPreset
import java.io.File
import java.io.IOException
import java.security.MessageDigest
import kotlin.math.abs
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.async
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import okhttp3.OkHttpClient
import okhttp3.Request

/**
 * Escape Mood Orbs v3 (OrbLoops.swift): 4 modes × a 3×3 Mood Field grid (energy 15/50/85 up,
 * texture 15/50/85 right). The app picks the nearest cell for the current mode and Mood Field.
 * H.264 loops stream from Firebase Storage (visuals/v3/, public read, ?alt=media); posters and the
 * four e50_t50 540p offline loops are bundled in assets/orbs.
 */
object OrbLoops {
    const val STORAGE_BASE = "https://firebasestorage.googleapis.com/v0/b/escape-self-care-505618.firebasestorage.app/o/"
    private const val FOLDER = "visuals/v3/"
    private val levels = listOf(15, 50, 85)
    @Volatile private var bundledNames: Set<String>? = null

    /** Dedicated loops exist for focus, calm, sleep and picks; other modes borrow a grid. */
    fun grid(m: ModeId): String = when (m) {
        ModeId.FOCUS, ModeId.MOVE -> "focus"
        ModeId.CALM, ModeId.NOISE -> "calm"
        ModeId.SLEEP -> "sleep"
        else -> "picks"   // picks, realms and anything new
    }

    fun level(v: Double): Int = levels.minByOrNull { abs(it / 100.0 - v) } ?: 50

    fun name(grid: String, e: Int, t: Int) = "escape_${grid}_e${e}_t${t}_v3"

    /** Firebase Storage object URL: the object path is percent-encoded as one segment. */
    fun remote(file: String): String = STORAGE_BASE + Uri.encode(FOLDER + file) + "?alt=media"

    /** Indexes assets/orbs once (call off the main thread early; falls back to remote posters until then). */
    fun indexBundled(context: Context) {
        if (bundledNames != null) return
        bundledNames = runCatching { context.assets.list("orbs")?.toSet() }.getOrNull() ?: emptySet()
    }

    private fun bundled(file: String): String? =
        if (bundledNames?.contains(file) == true) "file:///android_asset/orbs/$file" else null

    private fun preset(grid: String, e: Int, t: Int): VisualPreset {
        val n = name(grid, e, t)
        return VisualPreset(
            id = n, mode = ModeId.fromRaw(grid) ?: ModeId.PICKS, name = n,
            videoH264 = remote("${n}_720_h264.mp4"), videoHevc = remote("${n}_720_hevc.mp4"),
            poster = bundled("${n}_poster.webp") ?: remote("${n}_poster.webp"),
            loopSec = 20.0, energy = e / 100.0, texture = t / 100.0,
        )
    }

    /** Nearest of the 9 cells. Same cell → same URL, so the player only switches when the cell changes. */
    fun nearest(mode: ModeId, field: MoodField): VisualPreset = preset(grid(mode), level(field.energy), level(field.texture))

    /** The mode's bundled 540p centre loop, used when the streamed loop can't load (offline). */
    fun offlineUri(p: VisualPreset): String? = bundled("escape_${grid(p.mode)}_e50_t50_v3_540_offline.mp4")
        ?.let { it.replace("file:///android_asset/", "asset:///") }

    /** Warms the cache for the up/down/left/right cells, so a switch doesn't show the poster first. */
    fun prefetchNeighbours(context: Context, p: VisualPreset) {
        val g = grid(p.mode)
        val ei = levels.indexOf(level(p.energy))
        val ti = levels.indexOf(level(p.texture))
        if (ei < 0 || ti < 0) return
        listOf(ei - 1 to ti, ei + 1 to ti, ei to ti - 1, ei to ti + 1)
            .filter { (e, t) -> e in levels.indices && t in levels.indices }
            .forEach { (e, t) -> VideoCache.prefetch(context, preset(g, levels[e], levels[t]).preferredVideoUrl) }
    }
}

/** Downloads each loop once into cacheDir/EscapeVisuals and serves the local file after that. */
object VideoCache {
    private val http by lazy { OkHttpClient() }
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val lock = Mutex()
    private val inFlight = HashMap<String, Deferred<File?>>()
    /** URLs that just failed (offline, or the loop isn't published yet): skip them for a while. */
    private val failedAt = java.util.concurrent.ConcurrentHashMap<String, Long>()
    private const val RETRY_AFTER_MS = 5 * 60_000L

    private fun dir(context: Context) = File(context.cacheDir, "EscapeVisuals").apply { mkdirs() }

    private fun fileFor(context: Context, url: String): File {
        val digest = MessageDigest.getInstance("SHA-256").digest(url.toByteArray()).joinToString("") { "%02x".format(it) }
        return File(dir(context), "$digest.mp4")
    }

    /** Local file for [url], downloading it first if needed. Null when offline / failed. */
    suspend fun localFile(context: Context, url: String): File? {
        if (url.startsWith("asset:") || url.startsWith("file:")) return null
        val dest = fileFor(context, url)
        if (dest.exists() && dest.length() > 0) return dest
        failedAt[url]?.let { if (System.currentTimeMillis() - it < RETRY_AFTER_MS) return null }
        val job = lock.withLock {
            inFlight[url] ?: scope.async { download(url, dest) }.also { inFlight[url] = it }
        }
        val file = try { job.await() } finally { lock.withLock { inFlight.remove(url) } }
        if (file == null) failedAt[url] = System.currentTimeMillis() else failedAt.remove(url)
        return file
    }

    fun prefetch(context: Context, url: String) {
        val app = context.applicationContext
        scope.launch { localFile(app, url) }
    }

    private fun download(url: String, dest: File): File? = try {
        http.newCall(Request.Builder().url(url).build()).execute().use { r ->
            if (!r.isSuccessful) throw IOException("HTTP ${r.code}")
            val tmp = File(dest.parentFile, dest.name + ".part")
            r.body?.byteStream()?.use { input -> tmp.outputStream().use { input.copyTo(it) } } ?: throw IOException("empty body")
            if (!tmp.renameTo(dest)) throw IOException("rename failed")
            dest
        }
    } catch (e: Exception) {
        Log.i("EscapeSoundscapes", "orb loop not cached: ${e.message}")
        null
    }
}
