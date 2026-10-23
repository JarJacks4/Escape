package com.escape.soundscapes.ui.sheets

import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.InputSetting
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.allowPermission
import com.escape.soundscapes.store.declinePermission
import com.escape.soundscapes.store.deleteInputHistory
import com.escape.soundscapes.store.submitMoodCheckIn
import com.escape.soundscapes.store.toggleInput
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.BottomSheet
import com.escape.soundscapes.ui.components.ChoiceChip
import com.escape.soundscapes.ui.components.EscSlider
import com.escape.soundscapes.ui.components.EscToggle
import com.escape.soundscapes.ui.components.GhostButton
import com.escape.soundscapes.ui.components.PrimaryButton
import com.escape.soundscapes.ui.components.escClickable
import kotlinx.coroutines.launch

/** MoodCheckInSheet.swift: Heavy → Bright slider with a colour orb, tags, latest Mood Scan, Tune my soundscape. */
@OptIn(ExperimentalLayoutApi::class)
@Composable
fun MoodCheckInSheet(store: AppStore) {
    val copy = store.content?.moodCheckIn
    val tags = copy?.tags ?: listOf("Restless", "Foggy", "Wired", "Low", "Steady", "Open")
    var value by remember { mutableFloatStateOf((copy?.defaultValue ?: 0.4).toFloat().coerceIn(0f, 1f)) }
    val selected = remember { mutableStateListOf<String>().apply { addAll(copy?.defaultTags ?: listOf("Restless")) } }
    var submitting by remember { mutableStateOf(false) }
    val label = if (value < 0.33f) "Heavy" else if (value < 0.66f) "Mixed" else "Bright"
    val orbHex = if (value < 0.33f) 0x39519FL else if (value < 0.66f) 0x8E7CD9L else 0xB9A3F0L
    val tint by animateColorAsState(hex(orbHex), tween(300), label = "orb")

    BottomSheet(copy?.title ?: "How's your inner weather?", onClose = { store.closeSheet() }) {
        Column(Modifier.padding(start = 24.dp, end = 24.dp, bottom = 32.dp), verticalArrangement = Arrangement.spacedBy(24.dp)) {
            Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(16.dp)) {
                Box(Modifier.size(80.dp).background(cssRadialCircle(listOf(tint.copy(alpha = 0x60 / 255f), tint.copy(alpha = 0x20 / 255f))), CircleShape)
                    .border(1.5.dp, tint.copy(alpha = 0x80 / 255f), CircleShape).clearAndSetSemantics { })
                Row(Modifier.fillMaxWidth().clearAndSetSemantics { }) {
                    Text("Heavy", style = EscFont.ui(13, color = Esc.haze))
                    Text(label, style = EscFont.ui(13, FontWeight.SemiBold).copy(textAlign = TextAlign.Center), modifier = Modifier.weight(1f))
                    Text("Bright", style = EscFont.ui(13, color = Esc.haze))
                }
                EscSlider(value, { value = it }, "Inner weather, Heavy to Bright", "$label, ${(value * 100).toInt()} percent",
                    Modifier.fillMaxWidth(), fill = tint)
            }
            FlowRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                tags.forEach { tag ->
                    ChoiceChip(tag, selected = tag in selected) { if (tag in selected) selected.remove(tag) else selected.add(tag) }
                }
            }
            // Only a real scan fills this in (the seed's "2 h ago: Restless" is sample data).
            // Without one, the row opens the Mood Scan instead.
            val latest = store.moodScan
            val scanTitle = if (latest != null) "Use my latest Mood Scan" else "Take a Mood Scan"
            val scanLine = latest?.label ?: "About a minute, with your front camera"
            val rowShape = RoundedCornerShape(16.dp)
            Row(
                Modifier.fillMaxWidth().background(hex(0x212C5A, 0.5f), rowShape).border(1.5.dp, hex(0xE6EAF4, 0.1f), rowShape)
                    .escClickable {
                        if (latest == null) {
                            store.openMoodScan()
                        } else {
                            latest.value?.let { value = it.toFloat().coerceIn(0f, 1f) }
                            tags.firstOrNull { it.equals(latest.mood, ignoreCase = true) }?.let { if (it !in selected) selected.add(it) }
                        }
                    }
                    .clearAndSetSemantics { contentDescription = "$scanTitle. $scanLine" }
                    .padding(vertical = 13.5.dp, horizontal = 17.5.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                Box(Modifier.size(32.dp).background(hex(0x8E7CD9, 0.3f), CircleShape).border(1.dp, hex(0x8E7CD9, 0.4f), CircleShape))
                Column {
                    Text(scanTitle, style = EscFont.ui(13, FontWeight.Medium))
                    Text(scanLine, style = EscFont.ui(12, color = Esc.haze))
                }
            }
            PrimaryButton(copy?.cta ?: "Tune my soundscape", disabled = submitting) {
                if (submitting) return@PrimaryButton
                submitting = true
                val ordered = tags.filter { it in selected }
                store.scope.launch { store.submitMoodCheckIn(value.toDouble(), ordered); submitting = false }
            }
            Box(Modifier.fillMaxWidth(), contentAlignment = Alignment.Center) { GhostButton("Skip") { store.closeSheet() } }
        }
    }
}

/** YourInputsSheet.swift: what Lucille may read; delete history. */
@Composable
fun YourInputsSheet(store: AppStore) {
    var confirm by remember { mutableStateOf(false) }
    BottomSheet("Your Inputs", onClose = { store.closeSheet() }) {
        Column(Modifier.padding(start = 24.dp, end = 24.dp, bottom = 32.dp)) {
            store.inputs.forEach { input -> InputRow(input) { store.scope.launch { store.toggleInput(input.id) } } }
            Text(store.inputsFooter.ifEmpty { store.content?.inputsFooter ?: "Used only to shape your soundscape. Never sold." },
                style = EscFont.ui(12, color = Esc.haze).copy(lineHeight = 19.sp), modifier = Modifier.padding(top = 20.dp, bottom = 8.dp))
            Box(Modifier.height(48.dp).escClickable { confirm = true }, contentAlignment = Alignment.CenterStart) {
                Text("Delete my input history", style = EscFont.ui(14, color = Esc.haze).copy(textDecoration = TextDecoration.Underline))
            }
        }
    }
    if (confirm) {
        AlertDialog(
            onDismissRequest = { confirm = false },
            title = { Text("Delete your input history?", style = EscFont.display(20)) },
            text = { Text("Lucille will forget the weather, heart rate and mood readings she has stored. This can't be undone.", style = EscFont.ui(14, color = Esc.haze)) },
            confirmButton = { TextButton(onClick = { confirm = false; store.scope.launch { store.deleteInputHistory() } }) { Text("Delete", color = hex(0xFF8A80)) } },
            dismissButton = { TextButton(onClick = { confirm = false }) { Text("Cancel", color = Esc.mist) } },
            containerColor = Esc.surface,
        )
    }
}

@Composable
private fun InputRow(input: InputSetting, onToggle: () -> Unit) {
    val soon = input.comingSoon == true
    val locked = input.alwaysOn || soon
    Column {
        Row(Modifier.fillMaxWidth().padding(vertical = 10.dp), verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(14.dp)) {
            Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(2.dp)) {
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp), verticalAlignment = Alignment.CenterVertically) {
                    Text(input.label, style = EscFont.ui(15, FontWeight.Medium, if (soon) Esc.haze else Esc.mist))
                    if (soon) {
                        Text("Soon", style = EscFont.ui(10, color = Esc.haze),
                            modifier = Modifier.background(Esc.card, CircleShape).border(1.dp, hex(0xE6EAF4, 0.1f), CircleShape).padding(vertical = 3.dp, horizontal = 9.dp))
                    }
                }
                Text(input.sub, style = EscFont.ui(13, color = Esc.haze))
            }
            Box(Modifier.alpha(if (locked) 0.5f else 1f)) {
                EscToggle(input.alwaysOn || input.enabled, input.label + if (locked) (if (soon) ", coming soon" else ", always on") else "",
                    enabled = !locked, onToggle = onToggle)
            }
        }
        Box(Modifier.fillMaxWidth().height(1.dp).background(Esc.hairlineSoft))
    }
}

/** PermissionPrimerSheet.swift: shown before the system dialog. Android's beta has no location/health permission. */
@Composable
fun PermissionPrimerSheet(store: AppStore) {
    val key = when (store.permissionTarget) {
        InputSetting.Kind.HEART -> "heart"
        InputSetting.Kind.CALENDAR -> "calendar"
        else -> "weather"
    }
    val primer = store.content?.permissionPrimer?.get(key) ?: when (key) {
        "heart" -> ContentBundle.PrimerCopy("Let Lucille follow your heartbeat", "Heart rate helps Lucille slow the pulse when your body is racing.", true)
        "calendar" -> ContentBundle.PrimerCopy("Let Lucille plan around your day", "Your calendar lets Lucille switch to Focus for deep-work blocks.", true)
        else -> ContentBundle.PrimerCopy("Let Lucille match today's weather", "Your location helps Lucille reflect the outside world in your soundscape.", null)
    }
    BottomSheet(null, onClose = { store.declinePermission() }) {
        Column(Modifier.fillMaxWidth().padding(start = 24.dp, end = 24.dp, bottom = 40.dp), horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(20.dp)) {
            Box(Modifier.size(80.dp).background(cssRadialCircle(listOf(hex(0xB9A3F0, 0.3f), hex(0x39519F, 0.1f))), CircleShape)
                .border(1.5.dp, hex(0xB9A3F0, 0.3f), CircleShape).clearAndSetSemantics { }, contentAlignment = Alignment.Center) {
                EscIconView(EscIcon.SOUNDWAVE, 36.dp, Esc.lilac)
            }
            Column(horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(primer.title, style = EscFont.display(22).copy(textAlign = TextAlign.Center), modifier = Modifier.semantics { heading() })
                Text(primer.body, style = EscFont.ui(15, color = Esc.haze).copy(textAlign = TextAlign.Center, lineHeight = 24.sp))
            }
            PrimaryButton("Allow") { store.scope.launch { store.allowPermission() } }
            GhostButton("Not now") { store.declinePermission() }
        }
    }
}
