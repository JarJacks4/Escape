package com.escape.soundscapes.ui.sheets

import androidx.compose.animation.AnimatedVisibility
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
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.escape.soundscapes.model.ContentBundle
import com.escape.soundscapes.model.LayerSetting
import com.escape.soundscapes.model.ModeId
import com.escape.soundscapes.model.MoodField
import com.escape.soundscapes.model.WhisperTopic
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.setWhisper
import com.escape.soundscapes.store.updateLayers
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.cssRadialCircle
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.BottomSheet
import com.escape.soundscapes.ui.components.ChoiceChip
import com.escape.soundscapes.ui.components.EscSlider
import com.escape.soundscapes.ui.components.EscToggle
import com.escape.soundscapes.ui.components.GhostButton
import com.escape.soundscapes.ui.components.LucilleOrb
import com.escape.soundscapes.ui.components.MoodFieldPad
import com.escape.soundscapes.ui.components.PrimaryButton
import com.escape.soundscapes.ui.components.escClickable
import kotlinx.coroutines.launch

/** MoodFieldSheet.swift: the pad writes store.moodField live; Cancel / back restores it. */
@OptIn(ExperimentalLayoutApi::class)
@Composable
fun MoodFieldSheet(store: AppStore) {
    val copy = store.content?.moodField
    val original = remember { store.moodField }
    val cancel = { store.moodField = original; store.closeSheet() }
    // The seed presets ("Yesterday 3 PM", "Your best focus") read as the person's history, which
    // the app doesn't have; offer plain starting points instead.
    val presets = listOf(
        ContentBundle.MoodFieldCopy.Preset("Settle", 0.25, 0.65),
        ContentBundle.MoodFieldCopy.Preset("Steady", 0.5, 0.5),
        ContentBundle.MoodFieldCopy.Preset("Lift", 0.75, 0.4),
    )
    val dots = copy?.padDots?.takeIf { it.isNotEmpty() } ?: listOf(
        ContentBundle.MoodFieldCopy.Dot(0.5, 0.35, 8.0, "#8E7CD9", 0.7),
        ContentBundle.MoodFieldCopy.Dot(0.65, 0.55, 6.0, "#A9B3D6", 0.5),
        ContentBundle.MoodFieldCopy.Dot(0.7, 0.3, 6.0, "#EF7702", 0.7),
    )
    BottomSheet("Mood Field", onClose = cancel) {
        Column(Modifier.padding(start = 24.dp, end = 24.dp, bottom = 24.dp), verticalArrangement = Arrangement.spacedBy(20.dp)) {
            Text(copy?.helper ?: "Drag to reshape the energy and feel of your soundscape.", style = EscFont.ui(14, color = Esc.haze).copy(lineHeight = 19.sp))
            Box(Modifier.fillMaxWidth(), contentAlignment = Alignment.Center) {
                MoodFieldPad(store.moodField, dots) { store.moodField = it }
            }
            val e = (store.moodField.energy * 100).toInt()
            val t = (store.moodField.texture * 100).toInt()
            Text(
                buildAnnotatedString {
                    append("Energy ")
                    withStyle(SpanStyle(fontWeight = FontWeight.SemiBold, color = Esc.mist)) { append("$e") }
                    append(" · Texture ")
                    withStyle(SpanStyle(fontWeight = FontWeight.SemiBold, color = Esc.mist)) { append("$t") }
                },
                style = EscFont.ui(14, color = Esc.haze).copy(textAlign = TextAlign.Center),
                modifier = Modifier.fillMaxWidth(),
            )
            FlowRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                presets.forEach { p ->
                    ChoiceChip(p.label, selected = false, textSize = 13, vertical = 9.5.dp, horizontal = 15.5.dp,
                        a11yLabel = "${p.label}. Moves the Mood Field to this preset") { store.moodField = MoodField(p.energy, p.texture) }
                }
            }
            PrimaryButton(copy?.cta ?: "Update soundscape") { store.scope.launch { store.applyMoodField() } }
            Box(Modifier.fillMaxWidth(), contentAlignment = Alignment.Center) { GhostButton("Cancel", onPress = cancel) }
        }
    }
}

/** TimerSheet.swift: lengths (+ Custom 1…customMax), fade-out, Sunrise Wake in Sleep, Set timer. */
@OptIn(ExperimentalLayoutApi::class)
@Composable
fun TimerSheet(store: AppStore) {
    val copy = store.content?.timer
    val options = copy?.options ?: listOf("5", "15", "25", "50", "90", "Custom")
    val customMax = copy?.customMax ?: 240
    val prefs = store.preferences?.timer
    val initialMinutes = prefs?.minutes
    var selected by remember {
        mutableStateOf(initialMinutes?.let { if (options.contains(it.toString())) it.toString() else "Custom" } ?: copy?.default ?: "25")
    }
    var customText by remember { mutableStateOf(if (initialMinutes != null && !options.contains(initialMinutes.toString())) initialMinutes.toString() else "") }
    var fadeOut by remember { mutableStateOf(prefs?.fadeOut ?: copy?.fadeOut ?: true) }
    var sunriseWake by remember { mutableStateOf(prefs?.sunriseWake ?: copy?.sunriseWake ?: false) }
    val isCustom = selected == "Custom"
    val minutes = if (isCustom) customText.trim().toIntOrNull()?.coerceIn(1, customMax) ?: 25 else selected.toIntOrNull() ?: 25
    val sleep = store.currentMode == ModeId.SLEEP

    BottomSheet("Timer", onClose = { store.closeSheet() }) {
        Column(Modifier.padding(start = 24.dp, end = 24.dp, bottom = 24.dp), verticalArrangement = Arrangement.spacedBy(20.dp)) {
            FlowRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                options.forEach { o ->
                    ChoiceChip(if (o == "Custom") o else "$o min", selected = o == selected, horizontal = 21.5.dp,
                        a11yLabel = if (o == "Custom") "Custom length" else "$o minutes") { selected = o }
                }
            }
            AnimatedVisibility(isCustom) {
                Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    val shape = RoundedCornerShape(16.dp)
                    Box(Modifier.width(120.dp).background(Esc.cardSoft, shape).border(1.5.dp, Esc.hairline, shape).padding(vertical = 13.5.dp, horizontal = 17.5.dp)) {
                        if (customText.isEmpty()) Text("60", style = EscFont.ui(16, color = hex(0xA9B3D6, 0.7f)))
                        BasicTextField(
                            value = customText,
                            onValueChange = { v -> customText = v.filter { it.isDigit() }.take(3) },
                            textStyle = EscFont.ui(16),
                            singleLine = true,
                            cursorBrush = SolidColor(Esc.lilac),
                            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                            modifier = Modifier.fillMaxWidth().semantics { contentDescription = "Custom minutes" },
                        )
                    }
                    Text("min (max $customMax)", style = EscFont.ui(14, color = Esc.haze))
                }
            }
            ToggleRow(copy?.fadeOutLabel ?: "Fade out over 5 min", copy?.fadeOutSub ?: "Gentle wind-down at the end", fadeOut) { fadeOut = !fadeOut }
            if (sleep) {
                ToggleRow(copy?.sunriseLabel ?: "Sunrise wake", copy?.sunriseSub ?: "Soft alarm at your chosen time", sunriseWake) { sunriseWake = !sunriseWake }
            }
            PrimaryButton("Set timer") { store.setTimer(minutes, fadeOut, if (sleep) sunriseWake else null) }
        }
    }
}

@Composable
internal fun ToggleRow(label: String, sub: String, on: Boolean, onToggle: () -> Unit) {
    Row(Modifier.fillMaxWidth().padding(vertical = 4.dp), verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
        Column(Modifier.weight(1f)) {
            Text(label, style = EscFont.ui(15, FontWeight.Medium))
            Text(sub, style = EscFont.ui(13, color = Esc.haze))
        }
        EscToggle(on, label, onToggle = onToggle)
    }
}

private val figmaLayers = listOf(
    LayerSetting("ambience", "Ambience", "~", 0.5, false),
    LayerSetting("melody", "Melody", "♪", 0.5, false),
    LayerSetting("pulse", "Pulse", "●", 0.5, false),
    LayerSetting("nature", "Nature", "❧", 0.6, true),
    LayerSetting("brainwave", "Brainwave", "⌇", 0.5, true, listOf("Delta", "Theta", "Alpha", "Beta"), "Alpha", "Use headphones"),
    LayerSetting("voice", "Lucille's Voice", "◎", 0.3, true),
)

/** LayersSheet.swift: edits a local copy; saves when a slider is released, a switch flips or a chip is tapped. */
@Composable
fun LayersSheet(store: AppStore) {
    val local = remember { mutableStateListOf<LayerSetting>().apply { addAll(store.preferences?.layers?.takeIf { it.isNotEmpty() } ?: figmaLayers) } }
    fun mutate(id: String, change: (LayerSetting) -> LayerSetting) {
        val i = local.indexOfFirst { it.id == id }
        if (i >= 0) local[i] = change(local[i])
    }
    fun persist() = store.updateLayers(local.toList())

    BottomSheet("Layers", onClose = { store.closeSheet() }) {
        Column(Modifier.padding(start = 24.dp, end = 24.dp, bottom = 32.dp), verticalArrangement = Arrangement.spacedBy(4.dp)) {
            local.forEach { layer ->
                Column(Modifier.padding(vertical = 10.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                        Box(Modifier.size(32.dp).background(Esc.card, RoundedCornerShape(8.dp)).border(1.dp, hex(0xE6EAF4, 0.1f), RoundedCornerShape(8.dp))
                            .semantics { }, contentAlignment = Alignment.Center) {
                            Text(layer.glyph, style = EscFont.ui(14, color = Esc.haze))
                        }
                        Text(layer.label, style = EscFont.ui(15, FontWeight.Medium, if (layer.muted) Esc.haze else Esc.mist), maxLines = 1, modifier = Modifier.weight(1f))
                        EscSlider(
                            value = layer.value.toFloat(),
                            onChange = { v -> mutate(layer.id) { it.copy(value = (v * 100).toInt() / 100.0) } },
                            a11yLabel = "${layer.label} level",
                            a11yValue = "${(layer.value * 100).toInt()} percent",
                            modifier = Modifier.width(100.dp),
                            trackColor = if (layer.muted) Color.White.copy(alpha = 0.24f) else hex(0xEFEFEF),
                            fill = if (layer.muted) hex(0xCBC8C9) else Esc.violet,
                            trackHeight = 8.dp,
                            thumb = 15.dp,
                            enabled = !layer.muted,
                            onEditingChanged = { editing -> if (!editing) persist() },
                        )
                        EscToggle(!layer.muted, layer.label) { mutate(layer.id) { it.copy(muted = !it.muted) }; persist() }
                    }
                    val chips = layer.chips
                    if (!chips.isNullOrEmpty()) {
                        Column(Modifier.padding(start = 44.dp), verticalArrangement = Arrangement.spacedBy(4.dp)) {
                            Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                chips.forEach { chip ->
                                    ChoiceChip(chip, selected = layer.selectedChip == chip, textSize = 12, vertical = 7.dp, horizontal = 13.dp,
                                        a11yLabel = "${layer.label} $chip") { mutate(layer.id) { it.copy(selectedChip = chip) }; persist() }
                                }
                            }
                            layer.chipNote?.takeIf { it.isNotEmpty() }?.let {
                                Text(it, style = EscFont.ui(11, color = Esc.haze).copy(fontStyle = FontStyle.Italic))
                            }
                        }
                    }
                }
                Box(Modifier.fillMaxWidth().height(1.dp).background(Esc.hairlineSoft))
            }
        }
    }
}

/** LucilleWhisperSheet.swift: enable switch + topic list; taps save through store.setWhisper. */
@Composable
fun WhisperSheet(store: AppStore) {
    val copy = store.content?.whisper
    var localEnabled by remember { mutableStateOf<Boolean?>(null) }
    var localTopic by remember { mutableStateOf<String?>(null) }
    val enabled = localEnabled ?: store.preferences?.whisper?.enabled ?: copy?.enabled ?: false
    val topic = localTopic ?: store.preferences?.whisper?.selectedTopic ?: copy?.selectedTopic ?: "affirmations"
    val topics = copy?.topics?.takeIf { it.isNotEmpty() } ?: listOf(
        WhisperTopic("focus", "Focus Guidance", "Gentle prompts to keep you on task."),
        WhisperTopic("affirmations", "Affirmations", "Positive thoughts spoken softly."),
        WhisperTopic("breathing", "Breathing Cues", "Inhale and exhale pacing."),
        WhisperTopic("sleep", "Sleep Story", "A calming narrative to drift off."),
    )
    BottomSheet("Lucille Whisper", onClose = { store.closeSheet() }) {
        Column(Modifier.fillMaxWidth().padding(start = 24.dp, end = 24.dp, bottom = 32.dp), horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(24.dp)) {
            Box(Modifier.size(140.dp).semantics { }, contentAlignment = Alignment.Center) {
                if (enabled) Box(Modifier.size(180.dp).background(cssRadialCircle(listOf(hex(0xB9A3F0, 0.4f), hex(0xB9A3F0, 0f)), listOf(0.0, 0.7)), CircleShape))
                LucilleOrb(if (enabled) 100.dp else 80.dp)
            }
            Column(horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(if (enabled) copy?.onTitle ?: "Lucille is whispering..." else copy?.offTitle ?: "Voice disabled",
                    style = EscFont.display(22).copy(textAlign = TextAlign.Center), modifier = Modifier.semantics { heading() })
                Text(if (enabled) copy?.onBody ?: "An AI-guided voice layer that softly blends into your soundscape."
                    else copy?.offBody ?: "Turn on Lucille Whisper to add a gentle, guided voice layer.",
                    style = EscFont.ui(14, color = Esc.haze).copy(textAlign = TextAlign.Center, lineHeight = 19.sp), modifier = Modifier.width(280.dp))
            }
            val cardShape = RoundedCornerShape(16.dp)
            Row(Modifier.fillMaxWidth().background(Color.White.copy(alpha = 0.05f), cardShape).border(1.dp, Color.White.copy(alpha = 0.1f), cardShape)
                .padding(horizontal = 17.dp, vertical = 5.dp), verticalAlignment = Alignment.CenterVertically) {
                Text("Enable Whisper", style = EscFont.ui(16, FontWeight.Medium), modifier = Modifier.weight(1f))
                EscToggle(enabled, "Enable Whisper") {
                    val next = !enabled
                    localEnabled = next
                    store.setWhisper(enabled = next)
                }
            }
            AnimatedVisibility(enabled) {
                Column(Modifier.fillMaxWidth(), verticalArrangement = Arrangement.spacedBy(12.dp)) {
                    Text("WHISPER TOPIC", style = EscFont.ui(12, FontWeight.SemiBold, Esc.haze).copy(letterSpacing = 1.2.sp),
                        modifier = Modifier.padding(bottom = 4.dp).semantics { heading() })
                    topics.forEach { t ->
                        val sel = t.id == topic
                        val shape = RoundedCornerShape(16.dp)
                        Column(
                            Modifier.fillMaxWidth()
                                .background(if (sel) hex(0xB9A3F0, 0.15f) else Color.White.copy(alpha = 0.03f), shape)
                                .border(1.dp, if (sel) hex(0xB9A3F0, 0.4f) else Color.White.copy(alpha = 0.08f), shape)
                                .escClickable { localTopic = t.id; store.setWhisper(topic = t.id) }
                                .semantics(mergeDescendants = true) { selected = sel }
                                .padding(vertical = 15.dp, horizontal = 17.dp),
                            verticalArrangement = Arrangement.spacedBy(4.dp),
                        ) {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Text(t.label, style = EscFont.ui(15, FontWeight.Medium, if (sel) Esc.mist else Esc.haze), modifier = Modifier.weight(1f))
                                if (sel) Box(Modifier.size(8.dp).background(Esc.lilac, CircleShape))
                            }
                            Text(t.description, style = EscFont.ui(13, color = hex(0xA9B3D6, 0.7f)))
                        }
                    }
                }
            }
        }
    }
}
