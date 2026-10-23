package com.escape.soundscapes.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.IntrinsicSize
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.model.filling
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.EscSlider
import com.escape.soundscapes.ui.components.StatTile
import com.escape.soundscapes.ui.components.StatValue
import com.escape.soundscapes.ui.components.escClickable
import kotlinx.coroutines.launch

/**
 * SessionCompleteView.swift: headline, 2×2 stats, "How do you feel now?", Memory / Keep listening /
 * Done. The beta feedback card is hidden (SoundscapesFeatures.betaFeedback is off, as on iOS).
 */
@Composable
fun SessionCompleteScreen(store: AppStore) {
    val copy = store.content?.sessionComplete
    var moodAfter by rememberSaveable { mutableFloatStateOf((copy?.moodAfterDefault ?: 0.75).toFloat()) }
    val name = store.firstName
    val headline = (copy?.headline ?: "Nice work, {firstName}.").filling(mapOf("firstName" to name)).let {
        if (name.isEmpty()) it.replace(", .", ".") else it
    }
    val subtitle = (copy?.subtitleTemplate ?: "{mode} session complete.").filling(mapOf("mode" to store.currentMode.title))
    // Only the real result is shown. The seed's `sample` (47 min, 6 days, +40, Heavy to Bright) is
    // prototype data, so a session that couldn't be recorded shows dashes instead.
    val r = store.lastResult
    val minutes = r?.minutes?.let { "$it min" } ?: "--"
    val streak = r?.streakDays
    val shards = r?.shardsEarned?.let { "+$it" } ?: "--"
    val from = r?.moodFrom
    val to = r?.moodTo
    fun button(i: Int, fallback: String) = copy?.buttons?.getOrNull(i) ?: fallback

    Column(
        Modifier.fillMaxSize().background(Esc.night).verticalScroll(rememberScrollState())
            .windowInsetsPadding(WindowInsets.statusBars)
            .padding(start = 24.dp, end = 24.dp, top = 20.dp, bottom = 48.dp + Esc.Metrics.navHeight)
            .windowInsetsPadding(WindowInsets.navigationBars),
    ) {
        Text(headline, style = EscFont.display(28), modifier = Modifier.semantics { heading() })
        Text(subtitle, style = EscFont.ui(15, color = Esc.haze), modifier = Modifier.padding(top = 4.dp, bottom = 28.dp))

        Column(verticalArrangement = Arrangement.spacedBy(8.dp), modifier = Modifier.padding(bottom = 24.dp)) {
            Row(Modifier.height(IntrinsicSize.Min), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                StatTile("Duration", Modifier.weight(1f).fillMaxHeight()) { StatValue(minutes) }
                StatTile("Streak", Modifier.weight(1f).fillMaxHeight(), sub = if (streak == 1) "day" else "days") { StatValue(streak?.toString() ?: "--") }
            }
            Row(Modifier.height(IntrinsicSize.Min), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                StatTile("Mood shift", Modifier.weight(1f).fillMaxHeight(), sub = if (from != null && to != null) "$from to $to" else "Not recorded") {
                    Row(horizontalArrangement = Arrangement.spacedBy(8.dp), verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.clearAndSetSemantics { }) {
                        MoodDot(hex(0x39519F, 0.8f), hex(0x39519F, 0.3f))
                        Text("→", style = EscFont.display(20, Esc.haze))
                        MoodDot(hex(0xB9A3F0, 0.8f), hex(0xB9A3F0, 0.3f))
                    }
                }
                StatTile("Realm Shards", Modifier.weight(1f).fillMaxHeight(), sub = "earned today") { StatValue(shards) }
            }
        }

        Text("How do you feel now?", style = EscFont.ui(14, color = Esc.haze), modifier = Modifier.padding(bottom = 2.dp))
        EscSlider(
            value = moodAfter,
            onChange = { moodAfter = (it * 100).toInt() / 100f },
            a11yLabel = "How do you feel now?",
            a11yValue = if (moodAfter < 0.34f) "Heavy" else if (moodAfter > 0.66f) "Bright" else "In between",
            trackColor = hex(0x3B3B3B),
            trackBorder = hex(0x8A8A8A),
            trackHeight = 8.dp,
            a11yStep = 0.1f,
        )
        Row(Modifier.fillMaxWidth().padding(bottom = 24.dp).clearAndSetSemantics { }) {
            Text("Heavy", style = EscFont.ui(12, color = Esc.haze), modifier = Modifier.weight(1f))
            Text("Bright", style = EscFont.ui(12, color = Esc.haze))
        }

        Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
            PillButton(button(0, "Save this as a Memory"), Esc.card, Esc.hairline) { store.scope.launch { store.saveMemory() } }
            PillButton(button(1, "Keep listening"), hex(0x39519F, 0.3f), hex(0x39519F, 0.6f)) { store.keepListening() }
            Box(Modifier.fillMaxWidth().height(48.dp).escClickable { store.doneWithSession() }, contentAlignment = Alignment.Center) {
                Text(button(2, "Done"), style = EscFont.ui(15, color = Esc.haze))
            }
        }
    }
}

@Composable
private fun MoodDot(inner: Color, outer: Color) =
    Box(Modifier.size(18.dp).background(cssRadialCircle(listOf(inner, outer)), CircleShape))

@Composable
private fun PillButton(title: String, fill: Color, stroke: Color, onClick: () -> Unit) {
    Box(
        Modifier.fillMaxWidth().height(52.dp).background(fill, CircleShape).border(1.5.dp, stroke, CircleShape).escClickable(onClick = onClick),
        contentAlignment = Alignment.Center,
    ) { Text(title, style = EscFont.ui(15, FontWeight.Medium), maxLines = 1) }
}
