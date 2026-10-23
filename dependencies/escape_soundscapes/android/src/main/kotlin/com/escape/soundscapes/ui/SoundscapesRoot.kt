package com.escape.soundscapes.ui

import androidx.activity.compose.BackHandler
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.Crossfade
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.api.LucilleV1Client
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.scan.MoodScanFlow
import com.escape.soundscapes.SoundscapesBridge
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.NavTab
import com.escape.soundscapes.store.Screen
import com.escape.soundscapes.store.Sheet
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.rememberReduceMotion
import com.escape.soundscapes.ui.components.BottomNavBar
import com.escape.soundscapes.ui.components.BottomSheet
import com.escape.soundscapes.ui.components.PlaylistsPicker
import com.escape.soundscapes.ui.components.ToastHost
import com.escape.soundscapes.ui.screens.HomeScreen
import com.escape.soundscapes.ui.screens.LibraryScreen
import com.escape.soundscapes.ui.screens.ModeBrowseScreen
import com.escape.soundscapes.ui.screens.NowPlayingScreen
import com.escape.soundscapes.ui.screens.OnboardingScreen
import com.escape.soundscapes.ui.screens.PlaylistScreen
import com.escape.soundscapes.ui.screens.SessionCompleteScreen
import com.escape.soundscapes.ui.screens.SleepSetupScreen
import com.escape.soundscapes.ui.sheets.LayersSheet
import com.escape.soundscapes.ui.sheets.MoodCheckInSheet
import com.escape.soundscapes.ui.sheets.MoodFieldSheet
import com.escape.soundscapes.ui.sheets.PermissionPrimerSheet
import com.escape.soundscapes.ui.sheets.TimerSheet
import com.escape.soundscapes.ui.sheets.WhisperSheet
import com.escape.soundscapes.ui.sheets.YourInputsSheet
import kotlinx.coroutines.launch

private val EscColorScheme = darkColorScheme(
    primary = Esc.ember,
    onPrimary = androidx.compose.ui.graphics.Color.White,
    secondary = Esc.lilac,
    background = Esc.night,
    surface = Esc.ink,
    onSurface = Esc.mist,
    surfaceVariant = Esc.surface,
    onSurfaceVariant = Esc.haze,
    surfaceContainer = Esc.ink,
    surfaceContainerHigh = Esc.surface,
)

/**
 * RootView.swift: the current screen, the bottom nav, sheets over everything and the toast.
 * Sheets frost the screen behind them with RenderEffect blur on Android 12+.
 */
@Composable
fun SoundscapesRoot(store: AppStore, firstName: String?, onExitRoot: () -> Unit) {
    MaterialTheme(colorScheme = EscColorScheme) {
        val reduce = rememberReduceMotion()
        var playlistsOpen by rememberSaveable { mutableStateOf(false) }
        val sheet = store.sheet
        val frosted = sheet != null || playlistsOpen
        val blurRadius by animateDpAsState(if (frosted && !reduce) 24.dp else 0.dp, tween(200), label = "frost")

        // System back: sheets close themselves; screens step back like the iOS chevrons / "← Back".
        BackHandler(enabled = sheet == null && !playlistsOpen) {
            when (store.screen) {
                Screen.HOME, Screen.ONBOARDING -> onExitRoot()
                Screen.NOW_PLAYING -> store.minimizePlayer()
                Screen.SESSION_COMPLETE -> store.doneWithSession()
                Screen.MOOD_SCAN -> store.closeMoodScan()
                else -> store.setScreen(Screen.HOME)
            }
        }

        Box(Modifier.fillMaxSize().background(if (store.isSleepUI && store.screen == Screen.NOW_PLAYING) Esc.sleepNight else Esc.night)) {
            Box(Modifier.fillMaxSize().then(if (blurRadius > 0.dp) Modifier.blur(blurRadius) else Modifier)) {
                Crossfade(targetState = store.screen, animationSpec = tween(if (reduce) 0 else 200), label = "screen") { screen ->
                    when (screen) {
                        Screen.ONBOARDING -> OnboardingScreen(store)
                        Screen.HOME -> HomeScreen(store)
                        Screen.MODE_BROWSE -> ModeBrowseScreen(store)
                        Screen.NOW_PLAYING -> NowPlayingScreen(store)
                        Screen.SESSION_COMPLETE -> SessionCompleteScreen(store)
                        Screen.LIBRARY -> LibraryScreen(store, onOpenPlaylists = { playlistsOpen = true })
                        Screen.SLEEP_SETUP -> SleepSetupScreen(store)
                        Screen.PLAYLIST -> PlaylistScreen(store, onOpenPlaylists = { playlistsOpen = true })
                        Screen.MOOD_SCAN -> MoodScanFlow(
                            baseUrl = LucilleV1Client.PRODUCTION,
                            tokenProvider = { SoundscapesBridge.idToken() },
                            firstName = firstName,
                            onExit = { store.closeMoodScan() },
                            onPlayMode = { id ->
                                ModeId.loose(id)?.let { mode ->
                                    store.scanOpenedFromHost = false
                                    store.scope.launch { store.play(mode) }
                                }
                            },
                        )
                    }
                }
                AnimatedVisibility(
                    visible = store.showsBottomNav,
                    modifier = Modifier.align(Alignment.BottomCenter),
                    enter = fadeIn(),
                    exit = fadeOut(),
                ) {
                    BottomNavBar(activeTab = NavTab.SOUNDSCAPES) { store.selectTab(it) }
                }
            }

            if (sheet != null) {
                when (sheet) {
                    Sheet.MOOD_FIELD -> MoodFieldSheet(store)
                    Sheet.LAYERS -> LayersSheet(store)
                    Sheet.TIMER -> TimerSheet(store)
                    Sheet.MOOD_CHECK_IN -> MoodCheckInSheet(store)
                    Sheet.YOUR_INPUTS -> YourInputsSheet(store)
                    Sheet.PERMISSION_PRIMER -> PermissionPrimerSheet(store)
                    Sheet.LUCILLE_WHISPER -> WhisperSheet(store)
                }
            } else if (playlistsOpen) {
                BottomSheet(title = "Playlists", onClose = { playlistsOpen = false }) {
                    PlaylistsPicker(store) { playlistsOpen = false }
                }
            }

            ToastHost(store.toast) { store.toast = null }
        }
    }
}
