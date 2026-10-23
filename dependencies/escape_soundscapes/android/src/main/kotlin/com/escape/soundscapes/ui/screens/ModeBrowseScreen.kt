package com.escape.soundscapes.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.BrowseCard
import com.escape.soundscapes.model.BrowsePage
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.Screen
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.cssColor
import com.escape.soundscapes.ui.components.BackTextButton
import com.escape.soundscapes.ui.components.SoundscapeCard
import kotlinx.coroutines.launch

/** ModeBrowseView.swift: back, title + tagline, a row of soundscape cards. Free Sleep cards open Sleep setup. */
@Composable
fun ModeBrowseScreen(store: AppStore) {
    LaunchedEffect(store.browseMode) { runCatching { store.loadBrowse(store.browseMode) } }
    val page = store.browsePage
    val base = if (store.browseMode == ModeId.SLEEP) Esc.sleepNight else Esc.night
    if (page == null) {
        Column(Modifier.fillMaxSize().background(base).windowInsetsPadding(WindowInsets.statusBars)) {
            BackTextButton(Modifier.padding(top = 8.dp, start = 24.dp)) { store.setScreen(Screen.HOME) }
            Box(Modifier.weight(1f).fillMaxWidth(), contentAlignment = Alignment.Center) { CircularProgressIndicator(color = Esc.haze) }
        }
        return
    }
    Content(store, page)
}

@Composable
private fun Content(store: AppStore, page: BrowsePage) {
    val bg = page.background.takeIf { it.isNotEmpty() }?.let { cssColor(it) } ?: Esc.night
    Column(
        Modifier.fillMaxSize().background(bg).verticalScroll(rememberScrollState())
            .windowInsetsPadding(WindowInsets.statusBars)
            .padding(bottom = 96.dp + if (store.showsMiniPlayer) 72.dp else 0.dp)
            .windowInsetsPadding(WindowInsets.navigationBars),
    ) {
        BackTextButton(Modifier.padding(top = 8.dp, start = 24.dp)) { store.setScreen(Screen.HOME) }
        Column(Modifier.padding(top = 16.dp, start = 24.dp, end = 24.dp, bottom = 4.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
            Text(page.title, style = EscFont.display(34), modifier = Modifier.semantics { heading() })
            Text(page.tagline, style = EscFont.ui(16, color = Esc.haze).copy(lineHeight = 22.sp))
        }
        Row(
            Modifier.padding(top = 20.dp).horizontalScroll(rememberScrollState()).padding(horizontal = 24.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
        ) {
            page.cards.forEach { card ->
                SoundscapeCard(card.title, card.description, card.gradient, card.isPremium, card.seasonal ?: false,
                    lockedNote = if (card.locked) "Premium, locked" else null) {
                    open(store, card, page) { store.scope.launch { store.play(card) } }
                }
            }
        }
        // Journeys chips are hidden (SoundscapesFeatures.journeys is off).
    }
}

private fun open(store: AppStore, card: BrowseCard, page: BrowsePage, play: () -> Unit) {
    if (page.mode == ModeId.SLEEP && !card.locked) {
        store.currentMode = ModeId.SLEEP
        store.setScreen(Screen.SLEEP_SETUP)
    } else play()
}
