package com.escape.soundscapes.scan

import android.util.Log
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.IOException
import java.net.HttpURLConnection
import java.net.URL
import java.util.TimeZone

/**
 * The few Lucille v1 calls the Mood Scan makes (see ios LucilleV1Client.swift and
 * LucilleLLM/escape_api/routers/mood.py). Plain HttpURLConnection + org.json so the scan
 * package has no networking dependency of its own.
 *
 * Every call sends `Authorization: Bearer <Firebase ID token>` and `X-Timezone: <IANA id>`.
 */
internal class ScanApi(
    baseUrl: String,
    private val tokenProvider: suspend () -> String?,
) {
    private val base = baseUrl.trimEnd('/')

    /** A non-2xx answer. [code] is detail.code from the API when it sent one (e.g. "consent_required"). */
    class HttpError(val status: Int, val code: String?, val purpose: String?) : IOException("Lucille $status ${code ?: ""}")

    private suspend fun call(method: String, path: String, body: JSONObject? = null): JSONObject {
        val token = tokenProvider()?.takeIf { it.isNotBlank() } ?: throw HttpError(401, "unauthenticated", null)
        return withContext(Dispatchers.IO) {
            val conn = URL("$base/$path").openConnection() as HttpURLConnection
            try {
                conn.requestMethod = method
                conn.connectTimeout = 15_000
                conn.readTimeout = 30_000
                conn.useCaches = false
                conn.setRequestProperty("Accept", "application/json")
                conn.setRequestProperty("Content-Type", "application/json")
                conn.setRequestProperty("X-Timezone", TimeZone.getDefault().id)
                conn.setRequestProperty("Authorization", "Bearer $token")
                if (body != null) {
                    conn.doOutput = true
                    conn.outputStream.use { it.write(body.toString().toByteArray(Charsets.UTF_8)) }
                }
                val status = conn.responseCode
                val stream = if (status in 200..299) conn.inputStream else conn.errorStream
                val text = stream?.bufferedReader(Charsets.UTF_8)?.use { it.readText() }.orEmpty()
                if (status !in 200..299) {
                    val detail = runCatching { JSONObject(text).optJSONObject("detail") }.getOrNull()
                    val code = detail?.optString("code")?.takeIf { it.isNotEmpty() }
                    val purpose = detail?.optString("purpose")?.takeIf { it.isNotEmpty() }
                    Log.w(TAG, "$method /$path -> $status ${code ?: text.take(200)}")
                    throw HttpError(status, code, purpose)
                }
                if (text.isBlank()) JSONObject() else JSONObject(text)
            } finally {
                conn.disconnect()
            }
        }
    }

    /**
     * POST /v1/mood/checkins with source "scan". `pulse` is only sent when the camera really
     * measured it with enough quality.
     */
    suspend fun checkIn(reading: MoodReading, text: String): ScanSaveResult {
        val body = JSONObject().apply {
            put("source", "scan")
            put("word", reading.word)
            put("valence", reading.valence.toDouble().coerceIn(0.0, 1.0))
            put("energy", reading.energy.toDouble().coerceIn(0.0, 1.0))
            val trimmed = text.trim().take(2000)
            if (trimmed.isNotEmpty()) put("text", trimmed)
            if (reading.pulseMeasured) {
                put("pulse", JSONObject().apply {
                    put("bpm", reading.bpm.toDouble())
                    reading.pulseQuality?.let { put("quality", it.toDouble().coerceIn(0.0, 1.0)) }
                })
            }
        }
        return try {
            val r = call("POST", "v1/mood/checkins", body)
            val crisis = r.optJSONObject("safety")?.optBoolean("crisis", false) ?: false
            ScanSaveResult.Saved(coinsAwarded = r.optInt("coinsAwarded", 0), crisis = crisis)
        } catch (e: HttpError) {
            if (e.code == "consent_required") ScanSaveResult.NeedsConsent(e.purpose ?: "wellbeing_data") else ScanSaveResult.Failed
        } catch (e: CancellationException) {
            throw e
        } catch (e: Exception) {
            Log.w(TAG, "check-in failed: ${e.message}")
            ScanSaveResult.Failed
        }
    }

    /** PUT /v1/privacy/consents. Returns true on success. */
    suspend fun grantConsents(flags: Map<String, Boolean>): Boolean = try {
        val f = JSONObject()
        flags.forEach { (k, v) -> f.put(k, v) }
        call("PUT", "v1/privacy/consents", JSONObject().put("flags", f))
        true
    } catch (e: CancellationException) {
        throw e
    } catch (e: Exception) {
        Log.w(TAG, "consents failed: ${e.message}")
        false
    }

    /** GET /v1/me/progress → lifetime Escape Coins (null offline). */
    suspend fun lifetimeCoins(): Int? = try {
        val r = call("GET", "v1/me/progress")
        if (r.has("lifetimeCoins")) r.optInt("lifetimeCoins") else null
    } catch (e: CancellationException) {
        throw e
    } catch (e: Exception) {
        null
    }

    private companion object {
        const val TAG = "[Scan]"
    }
}
