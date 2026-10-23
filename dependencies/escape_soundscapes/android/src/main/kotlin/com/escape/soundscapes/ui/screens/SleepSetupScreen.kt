package com.escape.soundscapes.ui.screens

import android.app.TimePickerDialog
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
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.navigationBars
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBars
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.model.PreferencesPatch
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.Screen
import com.escape.soundscapes.store.startSleep
import com.escape.soundscapes.store.updateSleep
import com.escape.soundscapes.theme.Esc
import com.escape.soundscapes.theme.EscFont
import com.escape.soundscapes.theme.EscIcon
import com.escape.soundscapes.theme.EscIconView
import com.escape.soundscapes.theme.hex
import com.escape.soundscapes.ui.components.EscToggle
import com.escape.soundscapes.ui.components.IconTarget
import com.escape.soundscapes.ui.components.LucilleOrb
import com.escape.soundscapes.ui.components.VisualLayer
import com.escape.soundscapes.ui.components.escClickable
import java.util.Locale
import kotlinx.coroutines.launch

/** SleepSetupView.swift. Night UI: #05081A, no pure white, 56dp targets, dimmed ember CTA. */
@Composable
fun SleepSetupScreen(store: AppStore) {
    val context = LocalContext.current
    val copy = store.content?.sleepSetup
    val prefs = store.preferences?.sleep
    val whisperIntro = prefs?.whisperIntro ?: copy?.whisperIntro ?: true
    val timer = prefs?.timer ?: copy?.timer ?: "45 min"
    val sunrise = prefs?.sunriseTime ?: copy?.sunriseTime ?: "07:00"
    val breath = prefs?.breathSync ?: copy?.breathSync ?: false
    fun row(key: String, label: String, sub: String) = copy?.rows?.get(key)?.let { it.label to it.sub } ?: (label to sub)
    val whisperRow = row("whisper", "Lucille Whisper intro", "Gentle guidance as you drift off")
    val timerRow = row("timer", "Sleep timer", "Audio will fade out after this time")
    val sunriseRow = row("sunrise", "Sunrise Wake", "Soft alarm wakes you gently")
    val breathRow = row("breath", "Breath Sync 4-7-8", "Guided breathing to help you unwind")
    var timerMenu by remember { mutableStateOf(false) }

    Box(Modifier.fillMaxSize().background(Esc.sleepNight)) {
        VisualLayer(isSleep = true)
        Column(Modifier.fillMaxSize().windowInsetsPadding(WindowInsets.statusBars).windowInsetsPadding(WindowInsets.navigationBars)) {
            Row(Modifier.fillMaxWidth().height(56.dp).padding(horizontal = 24.dp), verticalAlignment = Alignment.CenterVertically) {
                IconTarget(EscIcon.CHEVRON_DOWN, "Close", iconSize = 24.dp, target = 56.dp) { store.setScreen(Screen.HOME) }
                Text("Sleep", style = EscFont.display(22, Esc.mist.copy(alpha = 0.8f)).copy(textAlign = TextAlign.Center),
                    modifier = Modifier.weight(1f).semantics { heading() })
                Spacer(Modifier.size(56.dp))
            }
            Column(Modifier.weight(1f).verticalScroll(rememberScrollState()).padding(horizontal = 24.dp, vertical = 8.dp),
                verticalArrangement = Arrangement.spacedBy(2.dp)) {
                SleepRow(whisperRow, icon = { LucilleOrb(28.dp) }, onTap = {
                    store.updateSleep(PreferencesPatch.SleepPatch(whisperIntro = !whisperIntro))
                }) {
                    EscToggle(whisperIntro, whisperRow.first) { store.updateSleep(PreferencesPatch.SleepPatch(whisperIntro = !whisperIntro)) }
                }
                SleepRow(timerRow, icon = { EscIconView(EscIcon.MOON, 22.dp, Esc.haze) }) {
                    Box {
                        NightField(timer + "  ▾", "${timerRow.first}, $timer") { timerMenu = true }
                        DropdownMenu(expanded = timerMenu, onDismissRequest = { timerMenu = false }) {
                            (copy?.timerOptions ?: listOf("20 min", "30 min", "45 min", "60 min", "90 min")).forEach { option ->
                                DropdownMenuItem(
                                    text = { Text((if (option == timer) "✓ " else "") + option, style = EscFont.ui(15)) },
                                    onClick = { timerMenu = false; store.updateSleep(PreferencesPatch.SleepPatch(timer = option)) },
                                )
                            }
                        }
                    }
                }
                SleepRow(sunriseRow, icon = { EscIconView(EscIcon.SUNRISE, 22.dp, Esc.haze) }) {
                    NightField(displayTime(sunrise), "${sunriseRow.first}, ${displayTime(sunrise)}") {
                        val (h, m) = parseClock(sunrise)
                        TimePickerDialog(context, android.R.style.Theme_DeviceDefault_Dialog, { _, hour, minute ->
                            store.updateSleep(PreferencesPatch.SleepPatch(sunriseTime = String.format(Locale.US, "%02d:%02d", hour, minute)))
                        }, h, m, android.text.format.DateFormat.is24HourFormat(context)).show()
                    }
                }
                SleepRow(breathRow, icon = { EscIconView(EscIcon.SOUNDWAVE, 22.dp, Esc.haze) }, onTap = {
                    store.updateSleep(PreferencesPatch.SleepPatch(breathSync = !breath))
                }) {
                    EscToggle(breath, breathRow.first) { store.updateSleep(PreferencesPatch.SleepPatch(breathSync = !breath)) }
                }
            }
            Box(
                Modifier.padding(start = 24.dp, end = 24.dp, bottom = 16.dp, top = 16.dp).fillMaxWidth().height(64.dp)
                    .background(Esc.emberDim, CircleShape)
                    .escClickable { store.scope.launch { store.startSleep() } },
                contentAlignment = Alignment.Center,
            ) { Text(copy?.cta ?: "Start sleep", style = EscFont.ui(17, FontWeight.SemiBold)) }
        }
    }
}

@Composable
private fun SleepRow(labels: Pair<String, String>, icon: @Composable () -> Unit, onTap: (() -> Unit)? = null, right: @Composable () -> Unit) {
    Column {
        Row(
            Modifier.fillMaxWidth().heightIn(min = 56.dp)
                .then(if (onTap != null) Modifier.escClickable(pressedAlpha = 1f, onClick = onTap) else Modifier)
                .padding(vertical = 16.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(14.dp),
        ) {
            icon()
            Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(2.dp)) {
                Text(labels.first, style = EscFont.ui(16, FontWeight.Medium, Esc.mist.copy(alpha = 0.8f)))
                Text(labels.second, style = EscFont.ui(13, color = Esc.haze.copy(alpha = 0.7f)))
            }
            right()
        }
        Box(Modifier.fillMaxWidth().height(1.dp).background(Esc.hairlineSoft))
    }
}

/** The TSX <select> / <input type="time"> chrome, with a 56dp target. */
@Composable
private fun NightField(text: String, a11y: String, onClick: () -> Unit) {
    val shape = RoundedCornerShape(8.dp)
    Box(Modifier.widthIn(min = 56.dp).heightIn(min = 56.dp).escClickable(onClick = onClick).semantics { contentDescription = a11y },
        contentAlignment = Alignment.Center) {
        Text(text, style = EscFont.ui(14, color = Esc.mist.copy(alpha = 0.8f)),
            modifier = Modifier.background(hex(0x101E43, 0.8f), shape).border(1.dp, hex(0xE6EAF4, 0.1f), shape).padding(vertical = 7.dp, horizontal = 11.dp))
    }
}

private fun parseClock(hhmm: String): Pair<Int, Int> {
    val p = hhmm.split(":").mapNotNull { it.trim().toIntOrNull() }
    return (p.getOrNull(0) ?: 7) to (p.getOrNull(1) ?: 0)
}

/** "07:00" → "07:00 AM" (as the prototype's time input shows it). */
private fun displayTime(hhmm: String): String {
    val (h, m) = parseClock(hhmm)
    val h12 = if (h % 12 == 0) 12 else h % 12
    return String.format(Locale.US, "%02d:%02d %s", h12, m, if (h < 12) "AM" else "PM")
}
