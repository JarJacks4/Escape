package com.escape.soundscapes.scan

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlin.math.PI
import kotlin.math.abs
import kotlin.math.cos
import kotlin.math.floor
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sin
import kotlin.math.sqrt

/**
 * Reads the heart rate from the face on the FRONT camera (remote photoplethysmography, rPPG).
 *
 * How it works: each heartbeat pushes a little more blood through the skin of the face, which
 * absorbs a little more green light. We average the colour of a centred face region in every
 * frame, use green / red (so overall brightness changes cancel out), remove the slow drift,
 * band-pass 0.7–3.5 Hz (42–210 bpm), find the beat peaks and turn the median time between them
 * into beats per minute, exactly like the iOS CameraPulseReader (median interval → bpm, spread of
 * intervals → quality). An FFT-style spectral peak must agree with the beat count before a
 * value is published. Only these averages are kept: no image or video is stored or sent.
 *
 * Thread model: [onFrame] runs on the camera analyser thread; [state] is a thread-safe StateFlow
 * the UI collects. [reset] and [setStatus] may be called from the main thread.
 */
internal class PulseReader {
    enum class Status {
        Idle,          // not started
        Starting,      // turning the camera on
        Denied,        // camera permission refused
        Unavailable,   // no front camera / camera failed to open
        PlaceFace,     // camera on, no face in the circle yet
        Reading,       // face detected, collecting beats
    }

    data class State(
        val status: Status = Status.Idle,
        /** Latest heart rate, only while the signal quality is good enough. null otherwise. */
        val bpm: Int? = null,
        /** 0…1: how steady the beat-to-beat timing is (higher = more trustworthy). */
        val quality: Float = 0f,
        /** Seconds of clean face signal collected so far (resets if the face leaves the circle). */
        val secondsOfSignal: Float = 0f,
        /** The last ~4 s of the normalised pulse wave (-1…1), for the live trace. */
        val wave: List<Float> = emptyList(),
    )

    private val _state = MutableStateFlow(State())
    val state: StateFlow<State> = _state.asStateFlow()

    private val processor = PulseProcessor()
    private var misses = 0
    private var frameCount = 0

    @Synchronized
    fun reset(status: Status = Status.Idle) {
        processor.reset()
        misses = 0
        frameCount = 0
        _state.value = State(status = status)
    }

    @Synchronized
    fun setStatus(status: Status) {
        _state.value = _state.value.copy(status = status)
    }

    /**
     * One frame's mean colour (0…1) over the face region, at [t] seconds.
     * [luma] is the region's mean Y (0…1), used for the "is a face there" check.
     */
    @Synchronized
    fun onFrame(t: Double, r: Double, g: Double, b: Double, luma: Double) {
        val current = _state.value.status
        if (current != Status.PlaceFace && current != Status.Reading) return

        // A face filling the circle reads as skin: lit (not black, not blown out) and warmer
        // than it is blue/green. Loose on purpose: lighting varies a lot.
        val faceOn = luma in 0.12..0.92 && r > 0.12 && r >= g && r >= b * 0.95
        if (!faceOn) {
            // Allow brief blips (a blink, a head turn) before starting over.
            misses++
            if (misses > 10 && (current == Status.Reading || processor.size > 0)) {
                processor.reset()
                _state.value = State(status = Status.PlaceFace)
            }
            return
        }
        misses = 0
        if (g <= 1e-4 || r <= 1e-4) return

        processor.add(t, g / r)
        frameCount++
        // Analysis is cheap (≈360 samples), but every second frame is plenty for the UI.
        if (frameCount % 2 != 0 && current == Status.Reading) return
        val result = processor.analyse()
        _state.value = State(
            status = Status.Reading,
            bpm = result.bpm,
            quality = result.quality,
            secondsOfSignal = result.seconds,
            wave = result.wave ?: _state.value.wave,
        )
    }
}

/**
 * The pure signal-processing half, free of Android types so it can be unit-tested.
 */
internal class PulseProcessor {
    data class Result(val bpm: Int?, val quality: Float, val seconds: Float, val wave: List<Float>?)

    private val times = ArrayList<Double>(512)
    private val values = ArrayList<Double>(512)
    private var lastQuality = 0f

    val size: Int get() = times.size

    fun reset() {
        times.clear(); values.clear(); lastQuality = 0f
    }

    fun add(t: Double, v: Double) {
        if (times.isNotEmpty() && t <= times.last()) return   // out-of-order / duplicate frame
        times.add(t); values.add(v)
        // Keep the last 12 s (same window as iOS).
        while (times.size > 1 && t - times[0] > WINDOW_SEC) {
            times.removeAt(0); values.removeAt(0)
        }
    }

    fun analyse(): Result {
        val n = times.size
        val seconds = if (n > 1) (times[n - 1] - times[0]).toFloat() else 0f
        if (n <= 45 || seconds < 1.5f) return Result(null, lastQuality, seconds, null)   // ~1.5 s

        // 1. Resample to a steady 30 Hz (camera frames arrive unevenly; the filters need a fixed rate).
        val t0 = times[0]
        val m = floor((times[n - 1] - t0) * FS).toInt() + 1
        val y = DoubleArray(m)
        var j = 0
        for (k in 0 until m) {
            val tk = t0 + k / FS
            while (j < n - 2 && times[j + 1] < tk) j++
            val ta = times[j]; val tb = times[j + 1]
            val f = if (tb > ta) ((tk - ta) / (tb - ta)).coerceIn(0.0, 1.0) else 0.0
            y[k] = values[j] + (values[j + 1] - values[j]) * f
        }

        // 2. Normalise to relative change and invert: more blood absorbs more green, so the
        //    green/red ratio dips on each beat. After inverting, peaks of the wave are heartbeats.
        val mean = y.average()
        if (mean <= 0.0) return Result(null, 0f, seconds, null)
        val x = DoubleArray(m) { -(y[it] / mean - 1.0) }

        // 3. Remove slow drift (head movement, auto-exposure) and frame noise: zero-phase
        //    band-pass 0.7–3.5 Hz (two Butterworth biquads, run forward and backward).
        val bp = bandPass(x)

        // Live trace: last ~4 s, scaled to -1…1.
        val tailStart = max(0, m - (FS * 4).toInt())
        var peakAbs = 1e-9
        for (i in tailStart until m) peakAbs = max(peakAbs, abs(bp[i]))
        val wave = (tailStart until m).map { (bp[it] / peakAbs).toFloat() }

        // 4. Beat peaks: local maxima above the running mean, at least 0.33 s apart (≤ 180 bpm).
        val bpMean = bp.average()
        val beats = ArrayList<Double>()
        for (i in 1 until m - 1) {
            if (bp[i] > bpMean && bp[i] >= bp[i - 1] && bp[i] > bp[i + 1]) {
                val ti = i / FS
                if (beats.isNotEmpty() && ti - beats.last() < MIN_GAP) continue
                beats.add(ti)
            }
        }
        if (beats.size < 6) return Result(null, lastQuality, seconds, wave)

        // 5. Median beat-to-beat interval → bpm; spread of intervals → quality (as iOS).
        val intervals = (1 until beats.size).map { beats[it] - beats[it - 1] }.filter { it > 0.33 && it < 1.5 }
        if (intervals.size < 5) return Result(null, lastQuality, seconds, wave)
        val sorted = intervals.sorted()
        val median = sorted[sorted.size / 2]
        val avg = intervals.average()
        val sd = sqrt(intervals.sumOf { (it - avg) * (it - avg) } / intervals.size)
        val q = (1.0 - (sd / avg) * 4.0).coerceIn(0.0, 1.0).toFloat()
        val value = (60.0 / median).roundToInt()
        if (value !in 40..180) return Result(null, lastQuality, seconds, wave)
        lastQuality = q

        // 6. Cross-check with the spectrum: the strongest frequency in the band should match the
        //    beat count. If peaks and spectrum disagree, the "beats" are probably movement.
        val spectral = spectralBpm(bp)
        val agrees = spectral != null && abs(spectral - value) <= SPECTRAL_TOLERANCE_BPM

        // Only publish a reading once the rhythm is reasonably steady.
        val bpm = if (q >= MIN_QUALITY && agrees) value else null
        return Result(bpm, q, seconds, wave)
    }

    // ---- filters ----

    private class Biquad(val b0: Double, val b1: Double, val b2: Double, val a1: Double, val a2: Double) {
        fun run(x: DoubleArray): DoubleArray {
            val out = DoubleArray(x.size)
            var x1 = 0.0; var x2 = 0.0; var y1 = 0.0; var y2 = 0.0
            for (i in x.indices) {
                val y0 = b0 * x[i] + b1 * x1 + b2 * x2 - a1 * y1 - a2 * y2
                x2 = x1; x1 = x[i]; y2 = y1; y1 = y0
                out[i] = y0
            }
            return out
        }
    }

    /** RBJ cookbook biquads, Q = 1/√2 (Butterworth). */
    private fun biquad(f0: Double, highPass: Boolean): Biquad {
        val w0 = 2 * PI * f0 / FS
        val c = cos(w0)
        val alpha = sin(w0) / (2 * 0.7071067811865476)
        val a0 = 1 + alpha
        return if (highPass) {
            Biquad((1 + c) / 2 / a0, -(1 + c) / a0, (1 + c) / 2 / a0, -2 * c / a0, (1 - alpha) / a0)
        } else {
            Biquad((1 - c) / 2 / a0, (1 - c) / a0, (1 - c) / 2 / a0, -2 * c / a0, (1 - alpha) / a0)
        }
    }

    private val highPass = biquad(LOW_HZ, highPass = true)
    private val lowPass = biquad(HIGH_HZ, highPass = false)

    private fun filtfilt(f: Biquad, x: DoubleArray): DoubleArray {
        // Mirror-pad ~1 s each side so the start/end transients fall outside the signal.
        val pad = min(x.size - 1, FS.toInt())
        val padded = DoubleArray(x.size + 2 * pad)
        for (i in 0 until pad) padded[i] = 2 * x[0] - x[pad - i]
        for (i in x.indices) padded[pad + i] = x[i]
        for (i in 0 until pad) padded[pad + x.size + i] = 2 * x[x.size - 1] - x[x.size - 2 - i]
        val fwd = f.run(padded)
        fwd.reverse()
        val back = f.run(fwd)
        back.reverse()
        return back.copyOfRange(pad, pad + x.size)
    }

    private fun bandPass(x: DoubleArray): DoubleArray = filtfilt(lowPass, filtfilt(highPass, x))

    /**
     * Strongest frequency between 0.7 and 3.5 Hz (Goertzel over a Hann window, 1 bpm steps),
     * in bpm. null when the signal is flat.
     */
    private fun spectralBpm(x: DoubleArray): Int? {
        val n = x.size
        if (n < FS * 4) return null
        val w = DoubleArray(n) { x[it] * (0.5 - 0.5 * cos(2 * PI * it / (n - 1))) }
        var bestBpm = -1
        var bestPower = 0.0
        var bpm = (LOW_HZ * 60).roundToInt()
        val maxBpm = (HIGH_HZ * 60).roundToInt()
        while (bpm <= maxBpm) {
            val coeff = 2 * cos(2 * PI * (bpm / 60.0) / FS)
            var s1 = 0.0; var s2 = 0.0
            for (v in w) {
                val s0 = v + coeff * s1 - s2
                s2 = s1; s1 = s0
            }
            val power = s1 * s1 + s2 * s2 - coeff * s1 * s2
            if (power > bestPower) { bestPower = power; bestBpm = bpm }
            bpm++
        }
        return if (bestBpm > 0 && bestPower > 0.0) bestBpm else null
    }

    companion object {
        const val FS = 30.0
        const val WINDOW_SEC = 12.0
        const val MIN_GAP = 0.33
        const val LOW_HZ = 0.7
        const val HIGH_HZ = 3.5
        /** Same publishing threshold as iOS (q ≥ 0.35). */
        const val MIN_QUALITY = 0.35f
        const val SPECTRAL_TOLERANCE_BPM = 12
    }
}
