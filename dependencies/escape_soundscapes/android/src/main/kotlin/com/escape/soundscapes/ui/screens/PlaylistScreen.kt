package com.escape.soundscapes.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.GradientSpec
import com.escape.soundscapes.model.Playlist
import com.escape.soundscapes.model.Track
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.Screen
import com.escape.soundscapes.store.play
import com.escape.soundscapes.store.playPlaylist
import com.escape.soundscapes.store.toggleLike
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EqualizerBars
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.brush
import com.escape.soundscapes.theme.cssLinear
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.BackTextButton
import com.escape.soundscapes.ui.components.IconTarget
import com.escape.soundscapes.ui.components.PlaylistsFAB
import com.escape.soundscapes.ui.components.PrimaryButton
import com.escape.soundscapes.ui.components.escClickable
import kotlinx.coroutines.launch

/** PlaylistView.swift: summary card, Play all + Shuffle, tracks with like hearts, Playlists FAB. */
@Composable
fun PlaylistScreen(store: AppStore, onOpenPlaylists: () -> Unit) {
    var shuffleOn by rememberSaveable { mutableStateOf(false) }
    val data = store.playlist ?: Playlist("", "Playlist", "Loading…", "Lucille", GradientSpec(listOf("#2A3A7A", "#101E43")), emptyList())

    Box(Modifier.fillMaxSize().background(Esc.night)) {
        Column(Modifier.fillMaxSize().windowInsetsPadding(WindowInsets.statusBars)) {
            Row(Modifier.fillMaxWidth().height(52.dp).padding(horizontal = 24.dp), verticalAlignment = Alignment.CenterVertically) {
                BackTextButton { store.setScreen(Screen.HOME) }
                Text("Your Playlist", style = EscFont.display(22).copy(textAlign = TextAlign.Center), modifier = Modifier.weight(1f).semantics { heading() })
                Spacer(Modifier.width(60.dp))
            }
            Column(
                Modifier.fillMaxSize().verticalScroll(rememberScrollState())
                    .padding(top = 8.dp, start = 24.dp, end = 24.dp, bottom = 96.dp + Esc.Metrics.navHeight + if (store.showsMiniPlayer) 72.dp else 0.dp),
            ) {
                SummaryCard(data)
                Row(Modifier.padding(top = 16.dp), horizontalArrangement = Arrangement.spacedBy(12.dp), verticalAlignment = Alignment.CenterVertically) {
                    PrimaryButton("Play all", Modifier.weight(1f)) {
                        val pick = if (shuffleOn) data.tracks.randomOrNull() else null
                        store.scope.launch { if (pick != null) store.play(pick) else store.playPlaylist() }
                    }
                    Box(
                        Modifier.size(56.dp)
                            .background(if (shuffleOn) hex(0xB9A3F0, 0.18f) else Color.Transparent, CircleShape)
                            .border(1.dp, if (shuffleOn) hex(0xB9A3F0, 0.5f) else hex(0xE6EAF4, 0.2f), CircleShape)
                            .escClickable(label = "Shuffle") {
                                shuffleOn = !shuffleOn
                                val t = data.tracks.randomOrNull()
                                if (shuffleOn && t != null) store.scope.launch { store.play(t) }
                            }
                            .semantics { contentDescription = "Shuffle"; stateDescription = if (shuffleOn) "On" else "Off" },
                        contentAlignment = Alignment.Center,
                    ) { EscIconView(EscIcon.SHUFFLE, 22.dp, if (shuffleOn) Esc.lilac else Esc.mist) }
                }
                Text("TRACKS", style = EscFont.label(), modifier = Modifier.padding(top = 28.dp, bottom = 12.dp).semantics { heading() })
                data.tracks.forEachIndexed { i, t ->
                    TrackRow(i + 1, t, playing = store.isPlaying && store.nowPlaying?.compositionId == t.compositionId,
                        onPlay = { store.scope.launch { store.play(t) } }, onLike = { store.scope.launch { store.toggleLike(t) } })
                }
            }
        }
        PlaylistsFAB(store, onOpenPlaylists)
    }
}

@Composable
private fun SummaryCard(p: Playlist) {
    val shape = RoundedCornerShape(24.dp)
    Row(
        Modifier.fillMaxWidth()
            .background(cssLinear(160.0, listOf(hex(0x39519F, 0.4f), hex(0x18224A, 0.9f))), shape)
            .border(1.dp, hex(0xE6EAF4, 0.1f), shape)
            .padding(17.dp),
        horizontalArrangement = Arrangement.spacedBy(16.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(Modifier.size(88.dp).background(p.artGradient.brush(), RoundedCornerShape(20.dp)).clearAndSetSemantics { },
            contentAlignment = Alignment.Center) { EscIconView(EscIcon.SOUNDWAVE, 34.dp, Esc.mist) }
        Column(Modifier.weight(1f)) {
            Text(p.title, style = EscFont.display(22), modifier = Modifier.padding(bottom = 6.dp).semantics { heading() })
            Text(p.summary, style = EscFont.ui(12, color = Esc.haze), modifier = Modifier.padding(bottom = 8.dp))
            Text(p.credit, style = EscFont.ui(10, FontWeight.SemiBold, Esc.lilac).copy(letterSpacing = 0.6.sp), maxLines = 1,
                modifier = Modifier.background(hex(0xB9A3F0, 0.14f), CircleShape).border(1.dp, hex(0xB9A3F0, 0.28f), CircleShape)
                    .padding(vertical = 3.dp, horizontal = 9.dp))
        }
    }
}

@Composable
private fun TrackRow(index: Int, track: Track, playing: Boolean, onPlay: () -> Unit, onLike: () -> Unit) {
    val liked = track.liked ?: false
    Column {
        Row(Modifier.fillMaxWidth().padding(vertical = 12.dp), verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(14.dp)) {
            Row(
                Modifier.weight(1f).escClickable(label = "Plays this soundscape", onClick = onPlay)
                    .clearAndSetSemantics {
                        contentDescription = "${track.title}, ${track.mode}, ${track.duration}"
                        if (playing) stateDescription = "Playing"
                    },
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(14.dp),
            ) {
                Box(Modifier.width(14.dp), contentAlignment = Alignment.Center) {
                    if (playing) EqualizerBars() else Text("$index", style = EscFont.ui(12, color = Esc.haze.copy(alpha = 0.6f)))
                }
                Box(Modifier.size(48.dp).background(track.gradient.brush(), RoundedCornerShape(12.dp)))
                Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(2.dp)) {
                    Text(track.title, style = EscFont.ui(15, FontWeight.Medium, if (playing) Esc.lilac else Esc.mist), maxLines = 1, overflow = TextOverflow.Ellipsis)
                    Text("${track.mode} · ${track.duration}", style = EscFont.ui(12, color = Esc.haze), maxLines = 1)
                }
            }
            Box(Modifier.semantics { stateDescription = if (liked) "On" else "Off" }) {
                IconTarget(EscIcon.HEART, "Favorite", color = if (liked) Esc.ember else Esc.haze.copy(alpha = 0.6f), iconSize = 20.dp,
                    selected = liked, onClick = onLike)
            }
        }
        Box(Modifier.fillMaxWidth().height(1.dp).background(Esc.hairlineSoft))
    }
}
