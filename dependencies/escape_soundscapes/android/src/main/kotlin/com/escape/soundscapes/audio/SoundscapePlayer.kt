@file:androidx.annotation.OptIn(markerClass = [androidx.media3.common.util.UnstableApi::class])

package com.escape.soundscapes.audio

import android.content.Context
import android.media.AudioAttributes as PlatformAudioAttributes
import android.media.AudioFocusRequest
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.audio.AudioProcessor
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.Renderer
import androidx.media3.exoplayer.RenderersFactory
import androidx.media3.exoplayer.audio.DefaultAudioSink
import androidx.media3.exoplayer.audio.MediaCodecAudioRenderer
import androidx.media3.exoplayer.mediacodec.MediaCodecSelector
import com.escape.soundscapes.model.AudioSegment
import com.escape.soundscapes.model.Composition
import com.escape.soundscapes.model.LayerSetting
import kotlin.math.PI
import kotlin.math.abs
import kotlin.math.cos
import kotlin.math.pow
import kotlin.math.sin
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch

/** What the store needs from audio (AudioEngine.swift). */
interface AudioEngine {
    fun play(composition: Composition, blend: Boolean, startOffsetSec: Double = 0.0)
    fun crossfade(composition: Composition)
    fun pause()
    fun resume()
    fun finishGracefully()
    fun stop()
    fun setBlend(on: Boolean)
    fun setVolume(volume: Float)
    fun setLayers(layers: List<LayerSetting>)
    fun setWhisper(enabled: Boolean, topic: String)
    fun release()
    var onFinished: (() -> Unit)?
    /** Audio focus lost/regained (calls, other apps): the store mirrors isPlaying. */
    var onExternalPause: ((Boolean) -> Unit)?
}

/**
 * Plays a Lucille segment set as one endless soundscape (SoundscapePlayer.swift): intro → shuffled
 * bodies with 4 s equal-power crossfades → outro when the session ends. Two ExoPlayers swap roles
 * at each crossfade. Audio focus is handled here (not by ExoPlayer) because two players in one app
 * would take focus from each other. Blend on = no focus request, so other apps keep playing.
 * Main-thread only.
 */
class SoundscapePlayer(context: Context) : AudioEngine {
    private val app = context.applicationContext
    private val main = Handler(Looper.getMainLooper())
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private val audioManager = app.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    private val gains = LayerGains()
    private val ambient = AmbientSynth()
    private val whisper = WhisperVoice(app)
    private val players: List<ExoPlayer> = listOf(buildPlayer(), buildPlayer())

    var isPlaying = false; private set
    var composition: Composition? = null; private set
    private var current: AudioSegment? = null
    private var isEnding = false
    private var active = 0
    private var scheduler: SegmentScheduler? = null
    private var transitioning = false
    private val ramps = HashMap<Int, Job>()
    private val volumes = floatArrayOf(0f, 0f)
    private var blend = false
    private var duck = 1f
    private var masterVolume = 1f
    private var tickJob: Job? = null
    private var focusRequest: AudioFocusRequest? = null
    private var hasFocus = false
    private var resumeOnFocusGain = false

    /** Seconds of overlap between segments. */
    var crossfadeSec = 4.0
    override var onFinished: (() -> Unit)? = null
    override var onExternalPause: ((Boolean) -> Unit)? = null

    private val effectiveVolume: Float get() = masterVolume * duck

    init {
        whisper.onSpeaking = { speaking -> setDuck(if (speaking) 0.45f else 1f) }
        players.forEachIndexed { index, p ->
            p.addListener(object : Player.Listener {
                override fun onPlayerError(error: PlaybackException) {
                    if (index == active && current != null) advance()
                }

                /** Headphones unplugged: ExoPlayer paused this player; pause the whole soundscape and tell the store. */
                override fun onPlayWhenReadyChanged(playWhenReady: Boolean, reason: Int) {
                    if (!playWhenReady && reason == Player.PLAY_WHEN_READY_CHANGE_REASON_AUDIO_BECOMING_NOISY && index == active && isPlaying) {
                        pause()
                        onExternalPause?.invoke(false)
                    }
                }
            })
        }
    }

    private fun buildPlayer(): ExoPlayer {
        val sink = DefaultAudioSink.Builder(app).setAudioProcessors(arrayOf<AudioProcessor>(LayerEqProcessor(gains))).build()
        val renderers = RenderersFactory { handler, _, audioListener, _, _ ->
            arrayOf<Renderer>(MediaCodecAudioRenderer(app, MediaCodecSelector.DEFAULT, handler, audioListener, sink))
        }
        return ExoPlayer.Builder(app, renderers).build().apply {
            setAudioAttributes(AudioAttributes.Builder().setUsage(C.USAGE_MEDIA).setContentType(C.AUDIO_CONTENT_TYPE_MUSIC).build(), false)
            setHandleAudioBecomingNoisy(true)
            volume = 0f
        }
    }

    // Public controls

    /** Starts a composition from its intro. `startOffsetSec` > 0 skips the intro and seeks into a body. */
    override fun play(composition: Composition, blend: Boolean, startOffsetSec: Double) {
        stopImmediately()
        this.composition = composition
        this.blend = blend
        val s = SegmentScheduler(composition.segments)
        val first = (if (startOffsetSec > 0) s.nextBody() ?: s.first() else s.first()) ?: return
        scheduler = s
        isEnding = false
        requestFocus()
        start(first, active, fadeInSec = 1.5)
        if (startOffsetSec > 0) {
            val into = startOffsetSec % maxOf(1.0, first.durationSec)
            players[active].seekTo((into * 1000).toLong())
        }
        isPlaying = true
        ambient.setPlaying(true)
        whisper.setPlaying(true)
        startTicking()
    }

    /** Crossfades into a different composition (mode switch, retune, variation) without a gap. */
    override fun crossfade(composition: Composition) {
        if (!isPlaying) return play(composition, blend)
        val s = SegmentScheduler(composition.segments)
        val next = s.nextBody() ?: s.first() ?: return
        this.composition = composition
        scheduler = s
        swap(next)
    }

    override fun pause() {
        players.forEach { it.pause() }
        ambient.setPlaying(false)
        whisper.setPlaying(false)
        isPlaying = false
    }

    override fun resume() {
        if (current == null) return
        requestFocus()
        players[active].play()
        isPlaying = true
        ambient.setPlaying(true)
        whisper.setPlaying(true)
        startTicking()
    }

    /** Timer ended or user stopped: crossfade into the outro, then finish. */
    override fun finishGracefully() {
        if (current == null || isEnding) return
        isEnding = true
        ambient.fadeOut(8.0)
        whisper.setPlaying(false)
        val outro = scheduler?.outro
        if (outro != null && current?.role != AudioSegment.Role.OUTRO) {
            swap(outro)
            val index = active
            // Rendered Lucille outros run ~1 min: hold a few seconds, then fade out and finish.
            scope.launch {
                delay(OUTRO_HOLD_MS)
                if (isEnding && current?.role == AudioSegment.Role.OUTRO) fade(index, 0f, 5.0) { finish() }
            }
        } else {
            fade(active, 0f, 5.0) { finish() }
        }
    }

    override fun stop() = stopImmediately()

    /** Timer fade-out (0…1). */
    override fun setVolume(volume: Float) {
        masterVolume = volume.coerceIn(0f, 1f)
        ambient.master = masterVolume
        if (ramps.isEmpty()) setPlayerVolume(active, effectiveVolume)
    }

    override fun setBlend(on: Boolean) {
        blend = on
        if (current == null) return
        if (on) abandonFocus() else requestFocus()
    }

    /** Layers sheet: band gains (slider -6…+6 dB, 0.5 = as rendered), generated Nature/Brainwave, Voice level. */
    override fun setLayers(layers: List<LayerSetting>) {
        fun layer(id: String) = layers.firstOrNull { it.id == id }
        fun band(id: String): Float {
            val l = layer(id) ?: return 1f
            return if (l.muted) 0f else 2.0.pow((l.value.coerceIn(0.0, 1.0) - 0.5) * 2).toFloat()
        }
        gains.low = band("pulse")
        gains.mid = band("melody")
        gains.high = band("ambience")
        val brain = layer("brainwave")
        val beatHz = mapOf("Delta" to 2f, "Theta" to 6f, "Alpha" to 10f, "Beta" to 18f)[brain?.selectedChip ?: ""] ?: 10f
        ambient.set(
            nature = layer("nature")?.let { if (it.muted) 0f else it.value.toFloat() } ?: 0f,
            brainwave = brain?.let { if (it.muted) 0f else it.value.toFloat() } ?: 0f,
            beatHz = beatHz,
        )
        whisper.volume = layer("voice")?.let { 0.4f + 0.6f * it.value.coerceIn(0.0, 1.0).toFloat() } ?: 0.6f
    }

    override fun setWhisper(enabled: Boolean, topic: String) = whisper.configure(enabled, topic)

    override fun release() {
        stopImmediately()
        scope.cancel()
        players.forEach { it.release() }
        ambient.release()
        whisper.release()
    }

    private fun stopImmediately() {
        ramps.values.forEach { it.cancel() }
        ramps.clear()
        tickJob?.cancel()
        players.forEachIndexed { i, p ->
            p.stop()
            p.clearMediaItems()
            setPlayerVolume(i, 0f)
        }
        current = null
        isPlaying = false
        transitioning = false
        ambient.setPlaying(false)
        whisper.setPlaying(false)
        abandonFocus()
    }

    private fun setDuck(d: Float) {
        duck = d
        if (current == null || transitioning || isEnding) return
        fade(active, effectiveVolume, 0.8)
    }

    // Segments

    private fun start(segment: AudioSegment, index: Int, fadeInSec: Double) {
        val p = players[index]
        p.setMediaItem(MediaItem.fromUri(segment.url))
        p.prepare()
        setPlayerVolume(index, 0f)
        p.play()
        fade(index, effectiveVolume, fadeInSec)
        current = segment
    }

    private fun swap(next: AudioSegment) {
        val old = active
        active = 1 - active
        transitioning = true
        start(next, active, crossfadeSec)
        fade(old, 0f, crossfadeSec) {
            players[old].stop()
            players[old].clearMediaItems()
            transitioning = false
        }
    }

    /** 4 Hz position check (the iOS periodic time observer). */
    private fun startTicking() {
        tickJob?.cancel()
        tickJob = scope.launch {
            while (isActive) {
                delay(250)
                tick()
            }
        }
    }

    private fun tick() {
        val segment = current ?: return
        if (transitioning) return
        // Catch up with a duck change that landed mid-crossfade.
        if (ramps.isEmpty() && !isEnding && abs(volumes[active] - effectiveVolume) > 0.02f) fade(active, effectiveVolume, 0.8)
        val p = players[active]
        if (p.playbackState == Player.STATE_IDLE && p.playerError != null) { advance(); return }
        val duration = p.duration.takeIf { it != C.TIME_UNSET && it > 0 }?.div(1000.0) ?: segment.durationSec
        val remaining = duration - p.currentPosition / 1000.0
        if (segment.role == AudioSegment.Role.OUTRO) {
            if (remaining <= 0.3 || p.playbackState == Player.STATE_ENDED) finish()
            return
        }
        if (remaining <= crossfadeSec || p.playbackState == Player.STATE_ENDED) advance()
    }

    private fun advance() {
        val outro = scheduler?.outro
        val next = when {
            isEnding && outro != null -> outro
            else -> scheduler?.nextBody() ?: current   // single-segment set: loop it
        } ?: return
        swap(next)
    }

    private fun finish() {
        stopImmediately()
        isEnding = false
        onFinished?.invoke()
    }

    // Volume ramps (equal-power curve, 30 steps a second)

    private fun setPlayerVolume(index: Int, v: Float) {
        volumes[index] = v
        players[index].volume = v
    }

    private fun fade(index: Int, target: Float, seconds: Double, done: (() -> Unit)? = null) {
        ramps.remove(index)?.cancel()
        val start = volumes[index]
        val steps = maxOf(1, (seconds * 30).toInt())
        ramps[index] = scope.launch {
            for (i in 1..steps) {
                val x = i.toFloat() / steps
                val curve = if (target > start) sin(x * PI.toFloat() / 2) else cos((1 - x) * PI.toFloat() / 2)
                setPlayerVolume(index, start + (target - start) * curve)
                delay(33)
            }
            setPlayerVolume(index, target)
            ramps.remove(index)
            done?.invoke()
        }
    }

    // Audio focus

    private val focusListener = AudioManager.OnAudioFocusChangeListener { change ->
        main.post {
            when (change) {
                AudioManager.AUDIOFOCUS_LOSS -> { hasFocus = false; resumeOnFocusGain = false; if (isPlaying) { pause(); onExternalPause?.invoke(false) } }
                AudioManager.AUDIOFOCUS_LOSS_TRANSIENT -> { if (isPlaying) { resumeOnFocusGain = true; pause(); onExternalPause?.invoke(false) } }
                AudioManager.AUDIOFOCUS_GAIN -> {
                    hasFocus = true
                    if (resumeOnFocusGain) { resumeOnFocusGain = false; resume(); onExternalPause?.invoke(true) }
                }
                // AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK: the system ducks for us (API 26+).
            }
        }
    }

    private fun requestFocus() {
        if (blend || hasFocus || Build.VERSION.SDK_INT < 26) return
        val req = focusRequest ?: AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
            .setAudioAttributes(PlatformAudioAttributes.Builder().setUsage(PlatformAudioAttributes.USAGE_MEDIA)
                .setContentType(PlatformAudioAttributes.CONTENT_TYPE_MUSIC).build())
            .setOnAudioFocusChangeListener(focusListener, main)
            .setWillPauseWhenDucked(false)
            .build().also { focusRequest = it }
        hasFocus = audioManager.requestAudioFocus(req) == AudioManager.AUDIOFOCUS_REQUEST_GRANTED
    }

    private fun abandonFocus() {
        if (Build.VERSION.SDK_INT < 26) return
        focusRequest?.let { audioManager.abandonAudioFocusRequest(it) }
        hasFocus = false
    }

    private companion object {
        const val OUTRO_HOLD_MS = 6_000L
    }
}
