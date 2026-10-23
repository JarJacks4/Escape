package com.escape.soundscapes.api

import com.escape.soundscapes.model.bool
import com.escape.soundscapes.model.boolOrNull
import com.escape.soundscapes.model.dbl
import com.escape.soundscapes.model.dblOrNull
import com.escape.soundscapes.model.intOrNull
import com.escape.soundscapes.model.int
import com.escape.soundscapes.model.mapObjects
import com.escape.soundscapes.model.obj
import com.escape.soundscapes.model.str
import com.escape.soundscapes.model.strOrNull
import com.escape.soundscapes.model.strings
import java.io.IOException
import java.util.TimeZone
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject

// Lucille v1 API (ios/Classes/API/LucilleV1Client.swift). The uid comes from the Firebase ID token,
// so there are no user ids in paths.

data class V1MoodField(val energy: Double, val texture: Double)

data class V1TrackAudio(val intro: String, val bodies: List<String>, val outro: String, val crossfadeSec: Double?)

data class V1Track(
    val id: String,
    val title: String,
    val category: String,
    val mode: String,
    val moodField: V1MoodField,
    val durationSec: Double?,
    val premium: Boolean?,
    val audio: V1TrackAudio,
)

data class V1Category(
    val id: String,
    val label: String,
    val description: String,
    val icon: String,
    val color: String,
    val modes: List<String>,
    val trackCount: Int?,
)

data class V1Session(val id: String)
data class V1SessionDone(val streakDays: Int, val coinsAwarded: Int)
data class V1DailyDrop(val title: String, val trackId: String, val track: V1Track)
data class V1Progress(val coins: Int, val lifetimeCoins: Int, val streakDays: Int?)
data class V1Inner(val phase: String, val night: Boolean, val weatherAvailable: Boolean, val tempC: Double?, val bucket: String?, val moodWord: String?)

class LucilleV1Client(
    private val baseUrl: String = PRODUCTION,
    private val token: suspend () -> String?,
    private val http: OkHttpClient = defaultClient,
) {
    companion object {
        const val PRODUCTION = "https://lucille-861854898360.us-central1.run.app"
        private val JSON = "application/json".toMediaType()
        val defaultClient: OkHttpClient by lazy {
            OkHttpClient.Builder()
                .callTimeout(30, TimeUnit.SECONDS)
                .connectTimeout(15, TimeUnit.SECONDS)
                .readTimeout(30, TimeUnit.SECONDS)
                .build()
        }

        fun trackOf(o: JSONObject): V1Track {
            val a = o.obj("audio")
            val mf = o.obj("moodField")
            return V1Track(
                id = o.str("id"), title = o.str("title"), category = o.str("category"), mode = o.str("mode", "calm"),
                moodField = V1MoodField(mf.dbl("energy", 0.5), mf.dbl("texture", 0.5)),
                durationSec = o.dblOrNull("durationSec"), premium = o.boolOrNull("premium"),
                audio = V1TrackAudio(a.str("intro"), a.optJSONArray("bodies").strings(), a.str("outro"), a.dblOrNull("crossfadeSec")),
            )
        }
    }

    /** One request. Returns the parsed body ("{}" when empty). Throws [ApiError]. */
    private suspend fun call(method: String, path: String, query: List<Pair<String, String>> = emptyList(),
                             body: JSONObject? = null): JSONObject {
        val t = token()
        if (t.isNullOrEmpty()) throw ApiError.Unauthenticated
        val url = baseUrl.trimEnd('/').toHttpUrl().newBuilder().apply {
            path.split('/').filter { it.isNotEmpty() }.forEach { addPathSegment(it) }
            query.forEach { (k, v) -> addQueryParameter(k, v) }
        }.build()
        val reqBody = when {
            body != null -> body.toString().toRequestBody(JSON)
            method == "PUT" || method == "POST" -> "".toRequestBody(JSON)
            else -> null
        }
        val request = Request.Builder()
            .url(url)
            .method(method, reqBody)
            .header("Content-Type", "application/json")
            .header("X-Timezone", TimeZone.getDefault().id)
            .header("Authorization", "Bearer $t")
            .build()
        return withContext(Dispatchers.IO) {
            val response = try {
                http.newCall(request).execute()
            } catch (e: IOException) {
                throw ApiError.Transport(e.message ?: "network")
            }
            response.use { r ->
                val text = r.body?.string().orEmpty()
                if (!r.isSuccessful) {
                    var code = "lucille_${r.code}"
                    runCatching {
                        val detail = JSONObject(text).optJSONObject("detail")
                        val c = detail?.optString("code").orEmpty()
                        if (c.isNotEmpty()) code = if (c == "consent_required") "consent_required:${detail?.optString("purpose").orEmpty()}" else c
                    }
                    throw ApiError.Server(r.code, code, text.take(300))
                }
                if (text.isBlank()) JSONObject() else try {
                    JSONObject(text)
                } catch (e: Exception) {
                    throw ApiError.Decoding(e.message ?: "json")
                }
            }
        }
    }

    // Soundscapes

    suspend fun categories(): List<V1Category> =
        call("GET", "v1/soundscapes/categories").optJSONArray("categories").mapObjects { c ->
            V1Category(c.str("id"), c.str("label"), c.str("description"), c.str("icon"), c.str("color"),
                c.optJSONArray("modes").strings(), c.intOrNull("trackCount"))
        }

    suspend fun catalog(category: String? = null, mode: String? = null, search: String? = null): List<V1Track> {
        val q = buildList {
            category?.let { add("category" to it) }
            mode?.let { add("mode" to it) }
            search?.let { add("q" to it) }
        }
        return call("GET", "v1/soundscapes/catalog", q).optJSONArray("items").mapObjects { trackOf(it) }
    }

    suspend fun track(id: String): V1Track = trackOf(call("GET", "v1/soundscapes/tracks/$id"))

    suspend fun innerWeather(lat: Double? = null, lon: Double? = null): V1Inner {
        val q = if (lat != null && lon != null) listOf("lat" to lat.toString(), "lon" to lon.toString()) else emptyList()
        val o = call("GET", "v1/soundscapes/inputs-now", q)
        val w = o.optJSONObject("weather")
        return V1Inner(o.str("phase", "afternoon"), o.bool("night"), w?.bool("available") == true, w?.dblOrNull("tempC"),
            w?.strOrNull("bucket"), o.optJSONObject("mood")?.strOrNull("word"))
    }

    /** GET /v1/soundscapes/visual: the loop for a mode + Mood Field (the app uses OrbLoops locally). */
    suspend fun visual(mode: String, field: V1MoodField): JSONObject =
        call("GET", "v1/soundscapes/visual", listOf("mode" to mode, "energy" to field.energy.toString(), "texture" to field.texture.toString()))

    suspend fun startSession(trackId: String, mode: String, from: String = "mode", moodBefore: String? = null): V1Session {
        val body = JSONObject().put("trackId", trackId).put("mode", mode).put("startedFrom", from)
        moodBefore?.let { body.put("moodBefore", it) }
        return V1Session(call("POST", "v1/soundscapes/sessions", body = body).obj("session").str("id"))
    }

    suspend fun completeSession(id: String, minutes: Double, moodAfter: String? = null): V1SessionDone {
        val body = JSONObject().put("minutes", minutes).put("completed", true)
        moodAfter?.let { body.put("moodAfter", it) }
        val o = call("POST", "v1/soundscapes/sessions/$id/complete", body = body)
        return V1SessionDone(o.int("streakDays"), o.int("coinsAwarded"))
    }

    suspend fun save(id: String) {
        call("PUT", "v1/soundscapes/library/$id")
    }

    suspend fun dailyDrop(): V1DailyDrop {
        val o = call("GET", "v1/soundscapes/daily-drop")
        return V1DailyDrop(o.str("title"), o.str("trackId"), trackOf(o.obj("track")))
    }

    suspend fun progress(): V1Progress {
        val o = call("GET", "v1/me/progress")
        return V1Progress(o.int("coins"), o.int("lifetimeCoins"), o.intOrNull("streakDays"))
    }

    suspend fun eraseData(scope: String) {
        call("DELETE", "v1/privacy/data", listOf("scope" to scope))
    }

    suspend fun grantConsents(flags: Map<String, Boolean>) {
        call("PUT", "v1/privacy/consents", body = JSONObject().put("flags", JSONObject(flags.toMap())))
    }
}
