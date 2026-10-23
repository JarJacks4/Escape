@file:androidx.annotation.OptIn(markerClass = [androidx.media3.common.util.UnstableApi::class])

package com.escape.soundscapes.audio

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioTrack
import android.os.Bundle
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.util.Log
import androidx.media3.common.C
import androidx.media3.common.audio.AudioProcessor
import androidx.media3.common.audio.BaseAudioProcessor
import java.nio.ByteBuffer
import java.util.Locale
import kotlin.math.PI
import kotlin.math.exp
import kotlin.math.sin
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch

// Layers + Whisper audio (ios/Classes/Audio/LayerAudio.swift), driven by SoundscapePlayer.
//  * LayerEqProcessor: 3-band gains on the playing track (Ambience = high, Melody = mid, Pulse = low),
//    a Media3 AudioProcessor in each ExoPlayer's audio sink.
//  * AmbientSynth: Nature (filtered pink noise) and Brainwave (binaural tone) on their own AudioTrack.
//  * WhisperVoice: Lucille Whisper spoken cues (Android TextToSpeech), ducking the music while speaking.

/** Band gains for the track (1 = as rendered). Written on the main thread, read on the audio thread. */
class LayerGains {
    @Volatile var low = 1f
    @Volatile var mid = 1f
    @Volatile var high = 1f
}

/**
 * 3-band split at about 250 Hz and 3.5 kHz (two cascaded one-pole filters each). mid = x - low - high,
 * so at unity gains the output equals the input. 16-bit PCM only (ExoPlayer's default output).
 */
class LayerEqProcessor(private val gains: LayerGains) : BaseAudioProcessor() {
    private var channels = 2
    private var aLow = 0.035f
    private var aHigh = 0.4f
    private var lowA = FloatArray(8); private var lowB = FloatArray(8)
    private var highA = FloatArray(8); private var highB = FloatArray(8)
    private var gl = 1f; private var gm = 1f; private var gh = 1f

    override fun onConfigure(inputAudioFormat: AudioProcessor.AudioFormat): AudioProcessor.AudioFormat {
        if (inputAudioFormat.encoding != C.ENCODING_PCM_16BIT) throw AudioProcessor.UnhandledAudioFormatException(inputAudioFormat)
        channels = inputAudioFormat.channelCount.coerceIn(1, 8)
        val sr = if (inputAudioFormat.sampleRate > 0) inputAudioFormat.sampleRate.toDouble() else 44_100.0
        aLow = (1 - exp(-2 * PI * 250 / sr)).toFloat()
        aHigh = (1 - exp(-2 * PI * 3_500 / sr)).toFloat()
        return inputAudioFormat
    }

    override fun queueInput(inputBuffer: ByteBuffer) {
        val remaining = inputBuffer.remaining()
        if (remaining == 0) return
        val out = replaceOutputBuffer(remaining)
        val tl = gains.low; val tm = gains.mid; val th = gains.high
        val k = 0.001f
        var c = 0
        while (inputBuffer.remaining() >= 2) {
            val x = inputBuffer.getShort() / 32768f
            var la = lowA[c]; var lb = lowB[c]; var ha = highA[c]; var hb = highB[c]
            la += (x - la) * aLow; lb += (la - lb) * aLow
            ha += (x - ha) * aHigh; hb += (ha - hb) * aHigh
            lowA[c] = la; lowB[c] = lb; highA[c] = ha; highB[c] = hb
            if (c == 0) { gl += (tl - gl) * k; gm += (tm - gm) * k; gh += (th - gh) * k }
            val low = lb
            val high = x - hb
            val y = low * gl + (x - low - high) * gm + high * gh
            out.putShort((y * 32767f).coerceIn(-32768f, 32767f).toInt().toShort())
            c = (c + 1) % channels
        }
        out.flip()
    }

    override fun onReset() {
        lowA.fill(0f); lowB.fill(0f); highA.fill(0f); highB.fill(0f)
    }
}

/** Nature + Brainwave, generated live on a background thread while needed. */
class AmbientSynth {
    @Volatile private var nature = 0f
    @Volatile private var beat = 0f
    @Volatile private var beatHz = 10f
    @Volatile var master = 1f
    @Volatile private var fade = 1f
    @Volatile private var playing = false
    private var thread: Thread? = null
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private var fadeJob: Job? = null

    private val needed: Boolean get() = playing && (nature > 0.0001f || beat > 0.0001f)

    /** Levels 0…1 (0 = off). */
    fun set(nature: Float, brainwave: Float, beatHz: Float) {
        this.nature = nature * 0.8f
        this.beat = brainwave * 0.12f
        this.beatHz = beatHz
        update()
    }

    fun setPlaying(on: Boolean) {
        fadeJob?.cancel()
        playing = on
        if (on) fade = 1f
        update()
    }

    /** Session end: fade along with the outro. */
    fun fadeOut(seconds: Double) {
        fadeJob?.cancel()
        val steps = maxOf(1, (seconds * 20).toInt())
        fadeJob = scope.launch {
            for (i in 1..steps) { delay(50); fade = 1f - i.toFloat() / steps }
        }
    }

    fun release() {
        playing = false
        scope.cancel()
        thread?.interrupt()
        thread = null
    }

    private fun update() {
        if (needed && thread?.isAlive != true) {
            thread = Thread({ render() }, "EscapeAmbientSynth").also { it.start() }
        }
        // The render loop ramps down and exits by itself when no longer needed.
    }

    private fun render() {
        val rate = 44_100
        val minBuf = AudioTrack.getMinBufferSize(rate, AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.ENCODING_PCM_16BIT)
        val track = try {
            AudioTrack.Builder()
                .setAudioAttributes(AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA)
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build())
                .setAudioFormat(AudioFormat.Builder().setSampleRate(rate).setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                    .setChannelMask(AudioFormat.CHANNEL_OUT_STEREO).build())
                .setBufferSizeInBytes(maxOf(minBuf, 4096) * 2)
                .setTransferMode(AudioTrack.MODE_STREAM)
                .build()
        } catch (e: Exception) {
            Log.w("EscapeSoundscapes", "ambient synth unavailable", e)
            return
        }
        val frames = 1024
        val buf = ShortArray(frames * 2)
        var n = 0f; var b = 0f; var hz = beatHz; var level = 0f
        var phaseL = 0f; var phaseR = 0f
        var seed = 0x9E3779B9.toInt()
        var b0L = 0f; var b1L = 0f; var b2L = 0f; var b0R = 0f; var b1R = 0f; var b2R = 0f
        var lpL = 0f; var lpR = 0f
        val k = 0.0008f
        val step = (2 * PI / rate).toFloat()
        val twoPi = (2 * PI).toFloat()
        val carrier = 200f
        fun white(): Float {
            seed = seed xor (seed shl 13); seed = seed xor (seed ushr 17); seed = seed xor (seed shl 5)
            return (seed.toLong() and 0xFFFFFFFFL).toFloat() * (2f / 4294967295f) - 1f
        }
        track.play()
        try {
            var silentBlocks = 0
            while (!Thread.currentThread().isInterrupted) {
                val nt = nature; val bt = beat; val ht = beatHz
                val lt = if (playing) master * fade else 0f
                for (i in 0 until frames) {
                    n += (nt - n) * k; b += (bt - b) * k; hz += (ht - hz) * k; level += (lt - level) * k
                    var l = 0f; var r = 0f
                    if (n > 0.0001f) {
                        val wl = white(); val wr = white()
                        b0L = 0.99765f * b0L + wl * 0.0990460f; b1L = 0.96300f * b1L + wl * 0.2965164f; b2L = 0.57000f * b2L + wl * 1.0526913f
                        b0R = 0.99765f * b0R + wr * 0.0990460f; b1R = 0.96300f * b1R + wr * 0.2965164f; b2R = 0.57000f * b2R + wr * 1.0526913f
                        val pl = (b0L + b1L + b2L + wl * 0.1848f) * 0.12f
                        val pr = (b0R + b1R + b2R + wr * 0.1848f) * 0.12f
                        lpL += (pl - lpL) * 0.35f; lpR += (pr - lpR) * 0.35f
                        l += lpL * n; r += lpR * n
                    }
                    if (b > 0.0001f) {
                        phaseL += carrier * step; if (phaseL > twoPi) phaseL -= twoPi
                        phaseR += (carrier + hz) * step; if (phaseR > twoPi) phaseR -= twoPi
                        l += sin(phaseL) * b; r += sin(phaseR) * b
                    }
                    buf[i * 2] = (l * level * 32767f).coerceIn(-32768f, 32767f).toInt().toShort()
                    buf[i * 2 + 1] = (r * level * 32767f).coerceIn(-32768f, 32767f).toInt().toShort()
                }
                track.write(buf, 0, buf.size)
                // Let the level ramp down (~0.4 s), then stop using CPU.
                silentBlocks = if (!needed && level < 0.001f) silentBlocks + 1 else 0
                if (silentBlocks > 16) break
            }
        } finally {
            runCatching { track.stop() }
            track.release()
        }
    }
}

/** Lucille Whisper scripts (WhisperScript in LayerAudio.swift). */
internal class WhisperScript(val firstDelay: Double, val cues: List<Pair<String, Double>>) {
    companion object {
        fun forTopic(topic: String): WhisperScript {
            val t = topic.lowercase()
            return when {
                "breath" in t -> breathing
                "sleep" in t || "story" in t -> sleep
                "focus" in t -> focus
                else -> affirmations
            }
        }

        private fun spaced(lines: List<String>, every: Double, first: Double) = WhisperScript(first, lines.map { it to every })

        val focus = spaced(listOf(
            "Settle in. One thing at a time.",
            "If your mind wandered, that's okay. Come back to the next small step.",
            "Soften your shoulders, and keep going.",
            "You're doing the work. Stay with it.",
            "Notice one breath, then return to the task.",
            "Progress, not perfection.",
            "Unclench your jaw. Stay with this one thing.",
            "Nice and steady. You've got this.",
        ), 75.0, 15.0)

        val affirmations = spaced(listOf(
            "You are allowed to take up space.",
            "You are doing better than you think.",
            "This moment is enough, and so are you.",
            "You can be gentle with yourself today.",
            "Your pace is the right pace.",
            "You've handled hard things before. You can handle this.",
            "Rest isn't a reward. It's something you deserve.",
            "You are safe to slow down here.",
        ), 70.0, 15.0)

        val breathing = WhisperScript(8.0, buildList {
            repeat(5) { add("Breathe in…" to 4.5); add("and slowly out." to 6.5) }
            add("Let your breath find its own rhythm." to 60.0)
        })

        val sleep = WhisperScript(12.0, listOf(
            "Imagine a quiet cabin at the edge of a pine forest.",
            "Rain taps softly on the roof, slow and even.",
            "Inside, a small fire glows, and the room is warm.",
            "You sink a little deeper into a soft, heavy blanket.",
            "Outside, the trees sway, unhurried, in the dark.",
            "There is nowhere you need to be, and nothing left to do tonight.",
            "Each sound of the rain carries you a little further down.",
            "Your hands are heavy. Your breathing is slow.",
            "The fire settles into embers, and the cabin grows still.",
        ).map { it to 20.0 } + ("Let yourself drift." to 240.0))
    }
}

/** Speaks the selected topic's cues while a soundscape plays. [onSpeaking] lets the player duck. */
class WhisperVoice(context: Context) {
    var onSpeaking: ((Boolean) -> Unit)? = null
    /** 0…1, from the Lucille's Voice layer. */
    var volume = 0.6f

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private var tts: TextToSpeech? = null
    private var ready = false
    private var enabled = false
    private var playing = false
    private var topic = ""
    private var loop: Job? = null

    init {
        tts = TextToSpeech(context.applicationContext) { status ->
            scope.launch {
                ready = status == TextToSpeech.SUCCESS
                if (ready) {
                    tts?.setLanguage(Locale.US)
                    tts?.setSpeechRate(0.85f)
                    tts?.setPitch(0.95f)
                    tts?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                        override fun onStart(utteranceId: String?) { scope.launch { onSpeaking?.invoke(true) } }
                        override fun onDone(utteranceId: String?) { scope.launch { onSpeaking?.invoke(false) } }
                        @Deprecated("Deprecated in Java")
                        override fun onError(utteranceId: String?) { scope.launch { onSpeaking?.invoke(false) } }
                        // tts.stop() (pause, topic change) ends an utterance here, not in onDone: un-duck the music.
                        override fun onStop(utteranceId: String?, interrupted: Boolean) { scope.launch { onSpeaking?.invoke(false) } }
                    })
                    restart()
                }
            }
        }
    }

    fun configure(enabled: Boolean, topic: String) {
        if (enabled == this.enabled && topic == this.topic) return
        this.enabled = enabled
        this.topic = topic
        restart()
    }

    fun setPlaying(on: Boolean) {
        if (on == playing) return
        playing = on
        restart()
    }

    fun release() {
        loop?.cancel()
        scope.cancel()
        tts?.stop()
        tts?.shutdown()
        tts = null
    }

    private fun restart() {
        loop?.cancel()
        loop = null
        tts?.stop()
        if (!enabled || !playing || !ready) return
        val script = WhisperScript.forTopic(topic)
        loop = scope.launch {
            delay((script.firstDelay * 1000).toLong())
            var i = 0
            while (isActive) {
                val (text, pause) = script.cues[i % script.cues.size]
                speak(text)
                delay((pause * 1000).toLong())
                i += 1
            }
        }
    }

    private fun speak(text: String) {
        val params = Bundle().apply { putFloat(TextToSpeech.Engine.KEY_PARAM_VOLUME, volume) }
        tts?.speak(text, TextToSpeech.QUEUE_FLUSH, params, "whisper-${System.nanoTime()}")
    }
}
