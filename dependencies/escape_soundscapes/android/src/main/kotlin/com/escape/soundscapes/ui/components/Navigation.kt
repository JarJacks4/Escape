package com.escape.soundscapes.ui.components

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.R
import com.escape.soundscapes.model.PlaylistSummary
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.NavTab
import com.escape.soundscapes.store.loadPlaylists
import com.escape.soundscapes.store.openPlaylist
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.cssLinear
import com.escape.soundscapes.theme.cssColor
import com.escape.soundscapes.theme.hex
import kotlinx.coroutines.launch

/** 72dp bar with the Escape app's tabs (BottomNavBar.swift); its fill extends under the nav bar. */
@Composable
fun BottomNavBar(activeTab: NavTab, onTabChange: (NavTab) -> Unit) {
    Column(
        Modifier.fillMaxWidth().background(if (canBlur) Esc.navBar else hex(0x101E43, 0.98f))
            .windowInsetsPadding(WindowInsets.navigationBars),
    ) {
        Box(Modifier.fillMaxWidth().height(1.dp).background(hex(0xE6EAF4, 0.08f)))
        Row(Modifier.fillMaxWidth().height(71.dp).padding(top = 8.dp)) {
            NavTab.entries.forEach { tab ->
                val active = tab == activeTab
                val tint = if (active) Esc.lilac else Esc.haze
                Column(
                    Modifier.weight(1f).fillMaxSize().alpha(if (active) 1f else 0.5f)
                        .escClickable(role = Role.Tab, onClick = { onTabChange(tab) })
                        .clearAndSetSemantics { contentDescription = tab.raw; selected = active },
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(3.dp),
                ) {
                    TabIcon(tab, tint)
                    Text(tab.raw, style = EscFont.ui(10, FontWeight.Medium, tint).copy(letterSpacing = 0.4.sp), maxLines = 1)
                }
            }
        }
    }
}

/** Home and Sound use the module's icons; Lucille, Explore and Market the Escape app's font glyphs. */
@Composable
private fun TabIcon(tab: NavTab, tint: Color) {
    fun glyph(code: Int) = String(Character.toChars(code))
    Box(Modifier.size(22.dp), contentAlignment = Alignment.Center) {
        when (tab) {
            NavTab.HOME -> EscIconView(EscIcon.HOME, 22.dp, tint)
            NavTab.SOUNDSCAPES -> EscIconView(EscIcon.SOUNDWAVE, 22.dp, Esc.haze)
            NavTab.LUCILLE -> Text(glyph(0xEA8B), style = TextStyle(fontFamily = EscFont.basicons, fontSize = 20.sp, color = tint))
            NavTab.EXPLORE -> Text(glyph(0xE248), style = TextStyle(fontFamily = EscFont.materialIcons, fontSize = 22.sp, color = tint))
            NavTab.MARKET -> Text(glyph(0xF969), style = TextStyle(fontFamily = EscFont.iconia, fontSize = 20.sp, color = tint))
        }
    }
}

/** Escape logo tile. */
@Composable
fun EscapeLogo(size: Dp = 36.dp) {
    val shape = RoundedCornerShape(10.dp)
    Box(
        Modifier.size(size).background(Esc.ink, shape).border(1.dp, Esc.hairline, shape).semantics { contentDescription = "Escape" },
        contentAlignment = Alignment.Center,
    ) {
        Image(painterResource(R.drawable.escape_logo), contentDescription = null, modifier = Modifier.size(size * 0.72f))
    }
}

/** Floating button (lower right) on Library and Playlist that opens the list of playlists (PlaylistsFAB.swift). */
@Composable
fun PlaylistsFAB(store: AppStore, onOpen: () -> Unit) {
    Box(Modifier.fillMaxSize().windowInsetsPadding(WindowInsets.navigationBars), contentAlignment = Alignment.BottomEnd) {
        Box(
            Modifier
                .padding(end = 24.dp, bottom = 24.dp + Esc.Metrics.navHeight + (if (store.showsMiniPlayer) 72.dp else 0.dp))
                .size(56.dp)
                .shadow(10.dp, CircleShape, ambientColor = Color.Black.copy(alpha = 0.35f), spotColor = Color.Black.copy(alpha = 0.35f))
                .background(Esc.ember, CircleShape)
                .escClickable(label = "Opens your playlists", onClick = onOpen)
                .semantics { contentDescription = "Playlists" },
            contentAlignment = Alignment.Center,
        ) {
            // The iOS SF Symbol "music.note.list" has no icon here; the Material Icons glyph "queue_music" matches it.
            Text(String(Character.toChars(0xE03D)), style = TextStyle(fontFamily = EscFont.materialIcons, fontSize = 24.sp, color = Color.White))
        }
    }
}

/** Playlists picker sheet content (PlaylistsPickerSheet). */
@Composable
fun PlaylistsPicker(store: AppStore, onDismiss: () -> Unit) {
    var loaded by remember { mutableStateOf(false) }
    LaunchedEffect(Unit) {
        store.loadPlaylists()
        loaded = true
    }
    Column(Modifier.fillMaxWidth()) {
        Text("Collections from Lucille's catalog. Tap one to listen.", style = EscFont.ui(13, color = Esc.haze),
            modifier = Modifier.padding(horizontal = 24.dp).padding(bottom = 12.dp))
        if (store.playlistSummaries.isEmpty()) {
            Text(if (loaded) "Playlists aren't available right now. Try again in a moment." else "Loading playlists…",
                style = EscFont.ui(14, color = Esc.haze), modifier = Modifier.padding(horizontal = 24.dp, vertical = 16.dp))
        } else {
            store.playlistSummaries.forEach { p ->
                PlaylistRow(p) {
                    onDismiss()
                    store.scope.launch { store.openPlaylist(p.id) }
                }
            }
        }
        Box(Modifier.height(24.dp))
    }
}

@Composable
private fun PlaylistRow(p: PlaylistSummary, onClick: () -> Unit) {
    val shape = RoundedCornerShape(16.dp)
    Row(
        Modifier.padding(horizontal = 24.dp, vertical = 5.dp).fillMaxWidth()
            .background(Color.White.copy(alpha = 0.06f), shape)
            .escClickable(onClick = onClick)
            .semantics(mergeDescendants = true) { }
            .padding(12.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(14.dp),
    ) {
        Box(Modifier.size(52.dp).background(cssLinear(135.0, p.artGradient.colors.map { cssColor(it) }), RoundedCornerShape(12.dp)))
        Column(Modifier.weight(1f)) {
            Text(p.title, style = EscFont.ui(16, FontWeight.SemiBold), maxLines = 1)
            Text("${p.trackCount} tracks · ${p.summary}", style = EscFont.ui(12, color = Esc.haze), maxLines = 1)
        }
        EscIconView(EscIcon.CHEVRON_RIGHT, 18.dp, Esc.haze)
    }
}

/** Header text marked as a heading for TalkBack. */
@Composable
fun Heading(text: String, style: TextStyle, modifier: Modifier = Modifier) =
    Text(text, style = style, modifier = modifier.semantics { heading() })
