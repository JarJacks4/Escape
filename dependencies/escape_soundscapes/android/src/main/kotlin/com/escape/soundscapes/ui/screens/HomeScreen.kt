package com.escape.soundscapes.ui.screens

import android.content.Context
import androidx.compose.foundation.background
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Text
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.SessionOrigin
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.Screen
import com.escape.soundscapes.store.Sheet
import com.escape.soundscapes.store.openLibrary
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.brush
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.EscapeLogo
import com.escape.soundscapes.ui.components.InnerWeatherTile
import com.escape.soundscapes.ui.components.MiniPlayer
import com.escape.soundscapes.ui.components.ModeOrb
import com.escape.soundscapes.ui.components.PlayNowButton
import com.escape.soundscapes.ui.components.SegmentedTabs
import com.escape.soundscapes.ui.components.SoundscapeCard
import com.escape.soundscapes.ui.components.escClickable
import kotlinx.coroutines.launch

/**
 * SoundscapesHomeView.swift: header, greeting, home tabs, Play Now, Your Inner Weather, Lucille's
 * Daily Drop, Endless Soundscapes (mode orbs), Made by You, status line. Journeys and Listening
 * Circles stay hidden as on iOS. The MiniPlayer floats above the bottom nav.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(store: AppStore) {
    val scope = rememberCoroutineScope()
    val context = LocalContext.current
    var activeTab by remember { mutableStateOf("Now") }
    var refreshing by remember { mutableStateOf(false) }
    val prefs = remember { context.getSharedPreferences("escape_soundscapes.ui", Context.MODE_PRIVATE) }
    var showTour by remember { mutableStateOf(!prefs.getBoolean("seenHomeWalkthrough", false)) }
    val playNowBelowModes = store.home?.experiments?.homeVariant == "modes"

    Box(Modifier.fillMaxSize().background(Esc.night)) {
        PullToRefreshBox(
            isRefreshing = refreshing,
            onRefresh = { scope.launch { refreshing = true; store.refreshHome(); refreshing = false } },
            modifier = Modifier.fillMaxSize(),
        ) {
            Column(
                Modifier.fillMaxSize().verticalScroll(rememberScrollState())
                    .windowInsetsPadding(WindowInsets.statusBars)
                    .padding(bottom = maxOf(160.dp, Esc.Metrics.navHeight + if (store.nowPlaying != null) 72.dp else 0.dp))
                    .windowInsetsPadding(WindowInsets.navigationBars),
            ) {
                Header()
                Greeting(store)
                val tabs = store.home?.homeTabs?.takeIf { it.isNotEmpty() } ?: store.content?.homeTabs?.takeIf { it.isNotEmpty() }
                    ?: listOf("Now", "Focus", "Calm", "Sleep", "Move", "Realms")
                SegmentedTabs(tabs, activeTab, Modifier.padding(top = 16.dp, start = 24.dp, end = 24.dp)) { tab ->
                    activeTab = tab
                    val mode = ModeId.loose(tab)
                    if (tab != "Now" && mode != null) store.scope.launch { store.openBrowse(mode) }
                }
                if (playNowBelowModes) {
                    InnerWeather(store); DailyDropCard(store); ModeOrbs(store); PlayNow(store, 24)
                } else {
                    PlayNow(store, 16); InnerWeather(store); DailyDropCard(store); ModeOrbs(store)
                }
                val made = store.home?.madeByYou.orEmpty()
                if (made.isNotEmpty()) {
                    SectionLabel("Made by You", Modifier.padding(top = 24.dp, start = 24.dp, bottom = 12.dp))
                    Row(Modifier.horizontalScroll(rememberScrollState()).padding(horizontal = 24.dp), horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                        made.forEach { item ->
                            SoundscapeCard(item.title, item.description, item.gradient ?: com.escape.soundscapes.model.GradientSpec.fallback) {
                                store.scope.launch { store.play(item.compositionId, SessionOrigin.LIBRARY) }
                            }
                        }
                    }
                }
                LibraryEntry { store.scope.launch { store.openLibrary() } }
                Text(
                    "Blend: ${if (store.blendOn) "On" else "Off"} · Focus Shield: ${if (store.focusShieldOn) "On" else "Off"}",
                    style = EscFont.ui(12, color = Esc.haze),
                    modifier = Modifier.padding(top = 16.dp, start = 24.dp, end = 24.dp),
                )
            }
        }

        if (store.nowPlaying != null) {
            Box(Modifier.align(Alignment.BottomCenter).windowInsetsPadding(WindowInsets.navigationBars).padding(bottom = Esc.Metrics.navHeight + 4.dp)) {
                MiniPlayer(
                    mode = store.currentMode.title,
                    isPlaying = store.isPlaying,
                    onPress = { store.setScreen(Screen.NOW_PLAYING) },
                    onPlayPause = { store.togglePlay() },
                    onTimer = { store.setSheet(Sheet.TIMER) },
                )
            }
        }

        if (showTour) {
            HomeWalkthrough {
                showTour = false
                prefs.edit().putBoolean("seenHomeWalkthrough", true).apply()
            }
        }
    }
}

/** The only way into the Library on Android (iOS reaches it from "Made by You · All", hidden while empty). */
@Composable
private fun LibraryEntry(onOpen: () -> Unit) {
    val shape = RoundedCornerShape(16.dp)
    Row(
        Modifier.padding(top = 24.dp, start = 24.dp, end = 24.dp).fillMaxWidth().heightIn(min = 56.dp)
            .background(Esc.card, shape)
            .escClickable(label = "Opens your Library", onClick = onOpen)
            .clearAndSetSemantics { contentDescription = "Your Library. Saved, Downloads and Memories" }
            .padding(horizontal = 16.dp, vertical = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(12.dp),
    ) {
        EscIconView(EscIcon.BOOKMARK, 20.dp, Esc.lilac)
        Column(Modifier.weight(1f)) {
            Text("Your Library", style = EscFont.ui(15, FontWeight.Medium), maxLines = 1)
            Text("Saved, Downloads and Memories", style = EscFont.ui(12, color = Esc.haze), maxLines = 1)
        }
        EscIconView(EscIcon.CHEVRON_RIGHT, 18.dp, Esc.haze)
    }
}

@Composable
private fun Header() {
    Row(Modifier.fillMaxWidth().height(52.dp).padding(horizontal = 24.dp), verticalAlignment = Alignment.CenterVertically) {
        EscapeLogo(36.dp)
        Text("Soundscapes", style = EscFont.display(18).copy(textAlign = androidx.compose.ui.text.style.TextAlign.Center),
            modifier = Modifier.weight(1f).semantics { heading() }, maxLines = 1)
        Spacer(Modifier.size(44.dp))
    }
}

@Composable
private fun Greeting(store: AppStore) {
    val phase = store.inputsNow?.phaseLabel?.lowercase() ?: "afternoon"
    val part = if (phase in listOf("morning", "afternoon", "evening")) phase else "evening"
    val name = store.home?.user?.firstName.orEmpty()
    Text(
        if (name.isEmpty()) "Good $part." else "Good $part, $name.",
        style = EscFont.display(28).copy(lineHeight = 34.sp),
        modifier = Modifier.padding(top = 8.dp, start = 24.dp, end = 24.dp).semantics { heading() },
    )
}

@Composable
private fun PlayNow(store: AppStore, top: Int) {
    PlayNowButton(
        subtitle = store.inputsNow?.playNowSubtitle ?: "Lucille picks Focus for your afternoon",
        modifier = Modifier.padding(top = top.dp, start = 24.dp, end = 24.dp),
        onPress = { store.scope.launch { store.playNow() } },
    )
}

@Composable
internal fun SectionLabel(text: String, modifier: Modifier = Modifier) =
    Text(text.uppercase(), style = EscFont.label(), modifier = modifier.semantics { heading() })

@Composable
private fun InnerWeather(store: AppStore) {
    val now = store.inputsNow
    val openInputs = { store.setSheet(Sheet.YOUR_INPUTS) }
    val phase = if (now == null) "Now" to "--" else now.phaseLabel to now.phaseValue.ifEmpty { now.phaseLabel }
    val weather = if (now == null) "--" else now.weather?.let { w ->
        "${w.tempF}° ${w.condition}" + if (w.city.isEmpty()) "" else " · ${w.city}"
    } ?: "Off"
    val mood = if (now == null) "--" else now.mood?.takeIf { it.isNotEmpty() } ?: "Scan to add"
    val heart = if (now == null) "--" else now.heartBpm?.let { "$it bpm" } ?: "Scan"
    Column(Modifier.padding(top = 16.dp)) {
        SectionLabel("Your Inner Weather", Modifier.padding(start = 24.dp, bottom = 8.dp))
        Row(Modifier.horizontalScroll(rememberScrollState()).padding(horizontal = 24.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            InnerWeatherTile(phase.first, phase.second, EscIcon.SUN, Esc.ember, openInputs)
            InnerWeatherTile("Weather", weather, EscIcon.CLOUD, Esc.violet, openInputs)
            InnerWeatherTile("Mood", mood, EscIcon.MOOD, Esc.lilac) { store.openMoodScan() }
            InnerWeatherTile("Heart", heart, EscIcon.HEART, Esc.ember, openInputs)
        }
    }
}

@Composable
private fun DailyDropCard(store: AppStore) {
    val drop = store.home?.dailyDrop
    val shape = RoundedCornerShape(20.dp)
    val label = drop?.label ?: "Lucille's Daily Drop"
    val title = drop?.title ?: "Today's soundscape"
    val subtitle = drop?.subtitle ?: "Picked by Lucille for your day"
    Column(
        Modifier
            .padding(top = 20.dp, start = 24.dp, end = 24.dp)
            .fillMaxWidth()
            .clip(shape)
            .background(drop?.gradient?.brush() ?: Esc.signature)
            .background(hex(0x05081A, 0.35f))
            .escClickable(label = "Plays today's Daily Drop") {
                store.scope.launch { store.play(drop?.compositionId ?: "daily_drop_thu", SessionOrigin.DAILY_DROP) }
            }
            .clearAndSetSemantics { contentDescription = "$label. $title. $subtitle" }
            .padding(20.dp),
    ) {
        Row(Modifier.fillMaxWidth().padding(bottom = 4.dp), verticalAlignment = Alignment.Top) {
            Text(label.uppercase(), style = EscFont.ui(11, FontWeight.SemiBold, Color.White.copy(alpha = 0.7f)).copy(letterSpacing = 1.32.sp),
                maxLines = 1, modifier = Modifier.weight(1f))
            Text(drop?.badge ?: "New every morning", style = EscFont.ui(11, color = Color.White.copy(alpha = 0.8f)), maxLines = 1,
                modifier = Modifier.background(Color.Black.copy(alpha = 0.3f), CircleShape).padding(vertical = 3.dp, horizontal = 10.dp))
        }
        Text(title, style = EscFont.display(26, Color.White), modifier = Modifier.padding(bottom = 4.dp))
        Text(subtitle, style = EscFont.ui(13, color = Color.White.copy(alpha = 0.7f)), modifier = Modifier.padding(bottom = 16.dp))
        Row(
            Modifier.background(Color.White.copy(alpha = 0.2f), CircleShape)
                .padding(vertical = 11.dp, horizontal = 21.dp),
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            EscIconView(EscIcon.PLAY, 14.dp, Color.White)
            Text("Play", style = EscFont.ui(14, FontWeight.SemiBold, Color.White))
        }
    }
}

@Composable
private fun ModeOrbs(store: AppStore) {
    val items = store.modes.map { it.id to it.title }.ifEmpty { ModeId.entries.map { it to it.title } }
    Column(Modifier.padding(top = 24.dp)) {
        SectionLabel("Endless Soundscapes", Modifier.padding(start = 24.dp, bottom = 12.dp))
        Row(Modifier.horizontalScroll(rememberScrollState()).padding(horizontal = 24.dp).heightIn(min = 48.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp), verticalAlignment = Alignment.Top) {
            items.forEach { (id, title) ->
                ModeOrb(id, title, active = store.currentMode == id, locked = store.isLocked(id)) {
                    store.scope.launch { store.play(id) }
                }
            }
        }
    }
}
