package com.escape.soundscapes.api

import com.escape.soundscapes.model.BetaFeedbackRequest
import com.escape.soundscapes.model.BrowsePage
import com.escape.soundscapes.model.ComposeAccepted
import com.escape.soundscapes.model.CompleteSessionRequest
import com.escape.soundscapes.model.Composition
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.Home
import com.escape.soundscapes.model.InputSetting
import com.escape.soundscapes.model.InputsNow
import com.escape.soundscapes.model.InputsResponse
import com.escape.soundscapes.model.Journey
import com.escape.soundscapes.model.LibraryFilter
import com.escape.soundscapes.model.LibraryItem
import com.escape.soundscapes.model.Mode
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.MoodCheckIn
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.model.MoodScan
import com.escape.soundscapes.model.Playlist
import com.escape.soundscapes.model.PlaylistSummary
import com.escape.soundscapes.model.Preferences
import com.escape.soundscapes.model.PreferencesPatch
import com.escape.soundscapes.model.Profile
import com.escape.soundscapes.model.Session
import com.escape.soundscapes.model.SessionResult
import com.escape.soundscapes.model.StartSessionRequest

/**
 * What the store asks the backend (ios/Classes/API/SoundscapesAPI.swift), limited to the endpoints
 * behind the screens ported to Android. Compose, Journeys, Circles and Premium are not ported.
 * All calls are made from the main thread; implementations move network work to Dispatchers.IO.
 */
interface SoundscapesApi {
    suspend fun content(): ContentBundle
    suspend fun home(q: InputsQuery): Home
    suspend fun inputsNow(q: InputsQuery): InputsNow
    suspend fun me(): Profile
    suspend fun updateProfile(firstName: String?): Profile
    suspend fun preferences(): Preferences
    suspend fun updatePreferences(patch: PreferencesPatch): Preferences
    suspend fun completeOnboarding()
    suspend fun inputs(): InputsResponse
    suspend fun setInput(id: InputSetting.Kind, enabled: Boolean): InputSetting
    suspend fun deleteInputHistory()
    suspend fun postMoodCheckIn(value: Double, tags: List<String>, source: String): MoodCheckIn
    suspend fun latestMoodScan(): MoodScan?
    suspend fun modes(): List<Mode>
    suspend fun browse(mode: ModeId): BrowsePage
    suspend fun journeys(): List<Journey>
    suspend fun composition(id: String): Composition
    suspend fun variation(id: String): ComposeAccepted
    suspend fun retune(id: String, moodField: MoodField): ComposeAccepted
    suspend fun library(filter: LibraryFilter?): List<LibraryItem>
    suspend fun save(compositionId: String, offline: Boolean): LibraryItem
    suspend fun setOffline(itemId: String, offline: Boolean): LibraryItem
    suspend fun removeFromLibrary(itemId: String)
    suspend fun saveMemory(sessionId: String, title: String?): LibraryItem
    suspend fun playlists(): List<PlaylistSummary>
    suspend fun playlist(id: String): Playlist
    suspend fun setLike(playlistId: String, trackId: String, liked: Boolean)
    suspend fun startSession(req: StartSessionRequest): Session
    suspend fun completeSession(id: String, req: CompleteSessionRequest): SessionResult
    suspend fun sendBetaFeedback(req: BetaFeedbackRequest)
}

/** Query for /v1/home and /v1/inputs/now. */
data class InputsQuery(
    val tz: String? = java.util.TimeZone.getDefault().id,
    val lat: Double? = null,
    val lon: Double? = null,
    val heartBpm: Double? = null,
)

/** APIError.swift. */
sealed class ApiError(message: String) : Exception(message) {
    object Unauthenticated : ApiError("unauthenticated")
    /** 402: PremiumSheet on iOS (not ported: shown as a toast on Android). */
    class PremiumRequired(message: String) : ApiError(message)
    class NotFound(message: String) : ApiError(message)
    class Invalid(message: String) : ApiError(message)
    class Conflict(val code: String, message: String) : ApiError(message)
    class Server(val status: Int, val code: String, message: String) : ApiError(message)
    class Transport(message: String) : ApiError(message)
    class Decoding(message: String) : ApiError(message)

    /** Text that is safe to show in the UI. */
    val userMessage: String
        get() = when (this) {
            is Unauthenticated -> "Please sign in again."
            is PremiumRequired, is NotFound, is Invalid, is Conflict -> message ?: ""
            is Server -> "Something went wrong. Try again in a moment."
            is Transport -> "You're offline. Check your connection."
            is Decoding -> "The app needs an update to show this."
        }
}
