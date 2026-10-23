package com.escape.soundscapes.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.GradientSpec
import com.escape.soundscapes.model.LibraryFilter
import com.escape.soundscapes.model.LibraryItem
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.Screen
import com.escape.soundscapes.store.loadLibrary
import com.escape.soundscapes.store.play
import com.escape.soundscapes.store.remove
import com.escape.soundscapes.store.toggleOffline
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.brush
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.BackTextButton
import com.escape.soundscapes.ui.components.IconTarget
import com.escape.soundscapes.ui.components.PlaylistsFAB
import com.escape.soundscapes.ui.components.escClickable
import kotlinx.coroutines.launch

/** LibraryView.swift: ← Back · Library, Saved / Downloads / Memories tabs, rows, Playlists FAB. */
@Composable
fun LibraryScreen(store: AppStore, onOpenPlaylists: () -> Unit) {
    var loadedFilter by remember { mutableStateOf<LibraryFilter?>(null) }
    LaunchedEffect(Unit) {
        val f = store.libraryFilter
        store.loadLibrary(f)
        loadedFilter = f
    }
    val filters = LibraryFilter.entries
    val titles = store.content?.libraryTabs?.takeIf { it.size == filters.size } ?: filters.map { it.title }

    Box(Modifier.fillMaxSize().background(Esc.night)) {
        Column(Modifier.fillMaxSize().windowInsetsPadding(WindowInsets.statusBars)) {
            Row(Modifier.fillMaxWidth().height(52.dp).padding(horizontal = 24.dp), verticalAlignment = Alignment.CenterVertically) {
                BackTextButton { store.setScreen(Screen.HOME) }
                Text("Library", style = EscFont.display(22).copy(textAlign = TextAlign.Center), modifier = Modifier.weight(1f).semantics { heading() })
                Spacer(Modifier.width(60.dp))
            }
            // The Library's own pill: equal-width tabs.
            Row(
                Modifier.padding(horizontal = 24.dp).fillMaxWidth()
                    .background(Esc.pad, CircleShape).border(1.dp, hex(0xE6EAF4, 0.08f), CircleShape)
                    .padding(horizontal = 9.dp, vertical = 6.dp),
                horizontalArrangement = Arrangement.spacedBy(4.dp),
            ) {
                filters.forEachIndexed { i, f ->
                    val sel = f == store.libraryFilter
                    Box(
                        Modifier.weight(1f).height(40.dp).background(if (sel) Esc.royal else androidx.compose.ui.graphics.Color.Transparent, CircleShape)
                            .escClickable(role = Role.Tab) {
                                if (f != store.libraryFilter) store.scope.launch { store.loadLibrary(f); loadedFilter = f }
                            }
                            .semantics { selected = sel },
                        contentAlignment = Alignment.Center,
                    ) {
                        Text(titles[i], style = EscFont.ui(13, if (sel) FontWeight.SemiBold else FontWeight.Normal, if (sel) Esc.mist else Esc.haze), maxLines = 1)
                    }
                }
            }
            LazyColumn(
                Modifier.fillMaxSize(),
                contentPadding = PaddingValues(start = 24.dp, end = 24.dp, top = 16.dp,
                    bottom = 16.dp + Esc.Metrics.navHeight + (if (store.showsMiniPlayer) Esc.Metrics.navHeight else 0.dp) + 80.dp),
            ) {
                items(store.libraryItems, key = { it.id }) { item -> ItemRow(store, item) }
                if (store.libraryItems.isEmpty() && loadedFilter == store.libraryFilter) {
                    item { EmptyState(store.libraryFilter) }
                }
            }
        }
        PlaylistsFAB(store, onOpenPlaylists)
    }
}

@Composable
private fun ItemRow(store: AppStore, item: LibraryItem) {
    var menu by remember { mutableStateOf(false) }
    LibraryRow(item.title, "${item.mode} · ${item.duration}", item.offline, item.gradient, onPress = { store.scope.launch { store.play(item) } }) {
        Box {
            IconTarget(EscIcon.MORE, "More options for ${item.title}", iconSize = 20.dp) { menu = true }
            DropdownMenu(expanded = menu, onDismissRequest = { menu = false }) {
                DropdownMenuItem(text = { Text(if (item.offline) "Remove download" else "Download for offline", style = EscFont.ui(15)) },
                    onClick = { menu = false; store.scope.launch { store.toggleOffline(item) } })
                DropdownMenuItem(text = { Text("Remove", style = EscFont.ui(15, color = hex(0xFF8A80))) },
                    onClick = { menu = false; store.scope.launch { store.remove(item) } })
            }
        }
    }
}

@Composable
internal fun LibraryRow(title: String, meta: String, offline: Boolean, gradient: GradientSpec, onPress: () -> Unit, trailing: @Composable () -> Unit) {
    Column {
        Row(Modifier.fillMaxWidth().padding(vertical = 14.dp), verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(14.dp)) {
            Row(
                Modifier.weight(1f).escClickable(label = "Plays this soundscape", onClick = onPress)
                    .clearAndSetSemantics { contentDescription = "$title, $meta" + if (offline) ", offline" else "" },
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(14.dp),
            ) {
                Box(Modifier.size(52.dp).background(gradient.brush(), RoundedCornerShape(12.dp)))
                Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(2.dp)) {
                    Text(title, style = EscFont.ui(15, FontWeight.Medium), maxLines = 1, overflow = TextOverflow.Ellipsis)
                    Row(horizontalArrangement = Arrangement.spacedBy(8.dp), verticalAlignment = Alignment.CenterVertically) {
                        Text(meta, style = EscFont.ui(12, color = Esc.haze), maxLines = 1)
                        if (offline) {
                            Text("Offline", style = EscFont.ui(10, FontWeight.SemiBold, Esc.haze).copy(letterSpacing = 0.6.sp),
                                modifier = Modifier.background(hex(0x39519F, 0.3f), CircleShape).padding(vertical = 2.dp, horizontal = 8.dp))
                        }
                    }
                }
            }
            trailing()
        }
        Box(Modifier.fillMaxWidth().height(1.dp).background(Esc.hairlineSoft))
    }
}

@Composable
private fun EmptyState(filter: LibraryFilter) {
    val (title, body) = when (filter) {
        LibraryFilter.SAVED -> "Nothing saved yet" to "Tap the bookmark on Now Playing to keep a soundscape here."
        LibraryFilter.DOWNLOADS -> "No downloads yet" to "Download a soundscape to listen without a connection."
        LibraryFilter.MEMORY -> "No memories yet" to "Save a finished session as a Memory to find it here."
    }
    Column(Modifier.fillMaxWidth().padding(top = 48.dp).semantics(mergeDescendants = true) { },
        horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(6.dp)) {
        Text(title, style = EscFont.display(20))
        Text(body, style = EscFont.ui(14, color = Esc.haze).copy(textAlign = TextAlign.Center, lineHeight = 21.sp))
    }
}
