package com.escape.soundscapes.store

import com.escape.soundscapes.api.ApiError
import com.escape.soundscapes.model.BetaFeedbackRequest
import com.escape.soundscapes.model.InputSetting
import com.escape.soundscapes.model.LayerSetting
import com.escape.soundscapes.model.LibraryFilter
import com.escape.soundscapes.model.LibraryItem
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.model.PreferencesPatch
import com.escape.soundscapes.model.SessionOrigin
import com.escape.soundscapes.model.Track
import kotlinx.coroutines.launch

// AppStore actions for preferences, inputs, mood, library and playlists (second half of AppStore.swift).

// Preferences (Blend, Focus Shield, Layers, Whisper, Sleep)

fun AppStore.toggleBlend() {
    blendOn = !blendOn
    audio.setBlend(blendOn)
    savePreferences(PreferencesPatch(blendOn = blendOn))
}

fun AppStore.toggleFocusShield() {
    focusShieldOn = !focusShieldOn
    val on = focusShieldOn
    scope.launch {
        if (!host.setFocusShield(on)) { focusShieldOn = false; toast = "Focus Shield isn't available on Android yet." }
    }
    savePreferences(PreferencesPatch(focusShieldOn = on))
}

fun AppStore.updateLayers(layers: List<LayerSetting>) {
    val wasVoiceOn = voiceOn(preferences?.layers ?: emptyList())
    preferences = preferences?.copy(layers = layers)
    audio.setLayers(layers)
    savePreferences(PreferencesPatch(layers = layers))
    // The Lucille's Voice switch and the Whisper switch are the same setting.
    val nowOn = voiceOn(layers)
    val p = preferences
    if (nowOn != wasVoiceOn && p != null && p.whisper.enabled != nowOn) {
        preferences = p.copy(whisper = p.whisper.copy(enabled = nowOn))
        savePreferences(PreferencesPatch(whisper = PreferencesPatch.WhisperPatch(enabled = nowOn)))
    }
    pushWhisper()
}

fun AppStore.setWhisper(enabled: Boolean? = null, topic: String? = null) {
    preferences?.let { p ->
        preferences = p.copy(whisper = p.whisper.copy(enabled = enabled ?: p.whisper.enabled, selectedTopic = topic ?: p.whisper.selectedTopic))
    }
    savePreferences(PreferencesPatch(whisper = PreferencesPatch.WhisperPatch(enabled, topic)))
    // Keep the Lucille's Voice layer in step with the Whisper switch.
    val layers = preferences?.layers
    if (enabled != null && layers != null) {
        val i = layers.indexOfFirst { it.id == "voice" }
        if (i >= 0 && layers[i].muted == enabled) {
            val updated = layers.toMutableList().also { it[i] = it[i].copy(muted = !enabled) }
            preferences = preferences?.copy(layers = updated)
            audio.setLayers(updated)
            savePreferences(PreferencesPatch(layers = updated))
        }
    }
    pushWhisper()
}

fun AppStore.updateSleep(patch: PreferencesPatch.SleepPatch) {
    preferences?.let { p ->
        val s = p.sleep
        preferences = p.copy(sleep = s.copy(
            whisperIntro = patch.whisperIntro ?: s.whisperIntro,
            timer = patch.timer ?: s.timer,
            sunriseTime = patch.sunriseTime ?: s.sunriseTime,
            breathSync = patch.breathSync ?: s.breathSync,
        ))
    }
    savePreferences(PreferencesPatch(sleep = patch))
}

/** SleepSetup "Start sleep": sleep timer, Sunrise Wake, then play Sleep. */
suspend fun AppStore.startSleep() {
    val sleep = preferences?.sleep
    val minutes = (sleep?.timer ?: "45 min").split(" ").firstOrNull()?.toIntOrNull() ?: 45
    timerSeconds = minutes * 60
    val t = sleep?.sunriseTime
    if (t != null && preferences?.timer?.sunriseWake == true && !host.scheduleSunriseWake(t)) {
        toast = "Sunrise Wake isn't available on Android yet."
    }
    currentMode = ModeId.SLEEP
    try {
        val page = loadBrowse(ModeId.SLEEP)
        page.cards.firstOrNull { !it.locked }?.let { play(it.compositionId, SessionOrigin.MODE) }
    } catch (e: Exception) { handle(e) }
}

fun AppStore.setMoodFieldValue(f: MoodField) { moodField = f }

// Inputs, permissions, mood

/** YourInputsSheet toggle. Inputs needing a permission show the PermissionPrimer first. */
suspend fun AppStore.toggleInput(kind: InputSetting.Kind) {
    val input = inputs.firstOrNull { it.id == kind } ?: return
    if (input.alwaysOn || input.comingSoon == true) return
    val p = input.permission
    if (!input.enabled && p != null && !host.hasPermission(p)) {
        permissionTarget = kind
        setSheet(Sheet.PERMISSION_PRIMER)
        return
    }
    setInputEnabled(kind, !input.enabled)
}

private suspend fun AppStore.setInputEnabled(kind: InputSetting.Kind, enabled: Boolean) {
    try {
        val updated = api.setInput(kind, enabled)
        val i = inputs.indexOfFirst { it.id == kind }
        if (i >= 0) inputs[i] = updated
        refreshHome()
    } catch (e: Exception) { handle(e) }
}

/** PermissionPrimer "Allow". */
suspend fun AppStore.allowPermission() {
    val kind = permissionTarget
    val p = inputs.firstOrNull { it.id == kind }?.permission
    if (p == null) { setSheet(Sheet.YOUR_INPUTS); return }
    val granted = host.requestPermission(p)
    host.track("permission", mapOf("input" to kind.raw, "granted" to granted.toString()))
    // HostServices has no location / health source on Android yet, so say that rather than
    // pointing at a Settings switch that doesn't exist.
    if (granted) setInputEnabled(kind, true) else toast = "${kind.raw.replaceFirstChar { it.uppercase() }} isn't available on Android yet."
    setSheet(Sheet.YOUR_INPUTS)
}

fun AppStore.declinePermission() = setSheet(Sheet.YOUR_INPUTS)

suspend fun AppStore.deleteInputHistory() {
    try {
        api.deleteInputHistory()
        moodScan = null
        toast = "Input history deleted"
        refreshHome()
    } catch (e: Exception) { handle(e) }
}

/** MoodCheckIn "Tune my soundscape": record, nudge the Mood Field, open Now Playing. */
suspend fun AppStore.submitMoodCheckIn(value: Double, tags: List<String>) {
    try {
        api.postMoodCheckIn(value, tags, "manual")
        // Heavy → calmer and more grounded; bright → more energy.
        moodField = MoodField(0.3 + 0.5 * value, moodField.texture)
        sheet = null
        if (nowPlaying == null) playNow() else setScreen(Screen.NOW_PLAYING)
        refreshHome()
    } catch (e: Exception) { handle(e) }
}

// Library + playlists

suspend fun AppStore.openLibrary() {
    setScreen(Screen.LIBRARY)
    loadLibrary(libraryFilter)
}

suspend fun AppStore.loadLibrary(filter: LibraryFilter) {
    libraryFilter = filter
    try {
        val items = api.library(filter)
        libraryItems.clear()
        libraryItems.addAll(items)
        if (filter == LibraryFilter.SAVED) {
            savedCompositionIds.clear()
            items.forEach { savedCompositionIds[it.compositionId] = true }
        }
    } catch (e: Exception) { handle(e) }
}

/** Now Playing bookmark. */
suspend fun AppStore.saveCurrent() {
    val c = nowPlaying ?: return
    if (isSaved(c.compositionId)) return
    try {
        recordSaved(api.save(c.compositionId, false))
        toast = "Saved to your Library"
        host.haptic(HapticKind.SUCCESS)
    } catch (e: Exception) { handle(e) }
}

private fun AppStore.recordSaved(item: LibraryItem) {
    savedCompositionIds[item.compositionId] = true
    if (libraryFilter != LibraryFilter.SAVED) return
    val i = libraryItems.indexOfFirst { it.id == item.id || it.compositionId == item.compositionId }
    if (i >= 0) libraryItems[i] = item else libraryItems.add(0, item)
}

/** Offline downloads need Premium on the mock; purchases aren't wired, so the message shows as a toast. */
suspend fun AppStore.toggleOffline(item: LibraryItem) {
    try {
        val updated = api.setOffline(item.id, !item.offline)
        val i = libraryItems.indexOfFirst { it.id == item.id }
        if (i >= 0) libraryItems[i] = updated
    } catch (e: ApiError.PremiumRequired) {
        toast = e.message
    } catch (e: Exception) { handle(e) }
}

suspend fun AppStore.remove(item: LibraryItem) {
    try {
        api.removeFromLibrary(item.id)
        libraryItems.removeAll { it.id == item.id }
        if (item.kind == LibraryItem.Kind.SAVED) savedCompositionIds.remove(item.compositionId)
    } catch (e: Exception) { handle(e) }
}

suspend fun AppStore.play(item: LibraryItem) = play(item.compositionId, SessionOrigin.LIBRARY)

suspend fun AppStore.loadPlaylists() {
    try {
        val list = api.playlists()
        playlistSummaries.clear()
        playlistSummaries.addAll(list)
    } catch (e: Exception) { handle(e) }
}

suspend fun AppStore.openPlaylist(id: String) {
    playlist = null
    playlistId = id
    setScreen(Screen.PLAYLIST)
    try { playlist = api.playlist(id) } catch (e: Exception) { handle(e) }
}

suspend fun AppStore.toggleLike(track: Track) {
    val pl = playlist ?: return
    val i = pl.tracks.indexOfFirst { it.id == track.id }
    if (i < 0) return
    val liked = !(pl.tracks[i].liked ?: false)
    fun withLike(v: Boolean) = playlist?.let { p -> p.copy(tracks = p.tracks.toMutableList().also { it[i] = it[i].copy(liked = v) }) }
    playlist = withLike(liked)
    host.haptic(HapticKind.SELECTION)
    try { api.setLike(pl.id, track.id, liked) } catch (e: Exception) { playlist = withLike(!liked); handle(e) }
}

suspend fun AppStore.play(track: Track) = play(track.compositionId, SessionOrigin.PLAYLIST)

/** Playlist "Play all": first track. */
suspend fun AppStore.playPlaylist() {
    playlist?.tracks?.firstOrNull()?.let { play(it) }
}

suspend fun AppStore.sendBetaFeedback(calmRating: Int, visual: String?, note: String?) {
    try {
        api.sendBetaFeedback(BetaFeedbackRequest(session?.sessionId ?: lastResult?.sessionId, currentMode.raw, calmRating,
            visual?.lowercase(), note?.ifEmpty { null }))
        toast = "Thanks! Sent to the team."
    } catch (e: Exception) { handle(e) }
}
