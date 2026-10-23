package com.escape.soundscapes.scan

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectHorizontalDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.imePadding
import androidx.compose.foundation.layout.navigationBarsPadding
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicText
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.StrokeJoin
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.ProgressBarRangeInfo
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.liveRegion
import androidx.compose.ui.semantics.progressBarRangeInfo
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.setProgress
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardCapitalization
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import kotlin.math.roundToInt

// Per-phase chrome for the scan flow (ios ScanChrome.swift). The orb is drawn by MoodScanFlow;
// these are the frosted panels and controls that float over it.

private val SidePad = 24.dp

@Composable
private fun TopBar(content: @Composable RowScope.() -> Unit) {
    Row(
        Modifier.fillMaxWidth().statusBarsPadding().padding(horizontal = SidePad).padding(top = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween,
    ) { content() }
}

@Composable
private fun Title(text: String, size: Int = 26) {
    BasicText(text, Modifier.fillMaxWidth().semantics { heading() }, style = ScanFonts.display(size))
}

@Composable
private fun Hint(text: String, size: Int = 14) {
    BasicText(text, Modifier.fillMaxWidth(), style = ScanFonts.ui(size, align = TextAlign.Center))
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun Pills(items: List<String>, color: Color = ScanColors.mist) {
    FlowRow(
        Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(8.dp, Alignment.CenterHorizontally),
        verticalArrangement = Arrangement.spacedBy(8.dp),
    ) {
        items.forEach { BasicText(it, Modifier.glassPill(), style = ScanFonts.ui(12, color = color)) }
    }
}

// MARK: Mood 1 · Start (intro + consent)

@Composable
internal fun MoodStartChrome(
    firstName: String?,
    coins: Int?,
    start: () -> Unit,
    skip: () -> Unit,
    close: () -> Unit,
    replayTour: () -> Unit,
) {
    Column(Modifier.fillMaxSize().navigationBarsPadding()) {
        TopBar {
            GlassIconButton(ScanIcon.Close, "Close Mood Scan", onClick = close)
            if (coins != null) CoinBadge(coins, null)
        }
        Column(
            Modifier.padding(horizontal = SidePad).padding(top = 24.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Eyebrow("Mood Scan")
            val name = firstName?.trim()?.takeIf { it.isNotEmpty() }
            Title(if (name != null) "How's your inner weather, $name?" else "How's your inner weather?", 32)
        }
        Spacer(Modifier.weight(1f))
        Column(
            Modifier.padding(horizontal = SidePad).padding(bottom = 24.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Hint("About a minute. Look into the front camera while you breathe with the orb, then tell Lucille how you feel.")
            Pills(listOf("Pulse · front camera", "How you feel · tap", "A few words"))
            PrimaryCTA("Start Mood Scan", Modifier.padding(top = 14.dp), onClick = start)
            QuietButton("Skip the camera, just tap how I feel", onClick = skip)
            // camera_scan consent copy (server purpose "camera_scan").
            BasicText(
                "Use your camera for the pulse part of the Mood Scan. Frames never leave your phone.",
                Modifier.fillMaxWidth(),
                style = ScanFonts.ui(11, align = TextAlign.Center),
            )
            QuietButton("How the scan works", color = ScanColors.haze, onClick = replayTour)
        }
    }
}

// MARK: Mood 2a · Pulse

@Composable
internal fun MoodPulseChrome(
    state: PulseReader.State,
    /** True once 45 s passed with no usable reading: say so kindly, offer to move on. */
    failed: Boolean,
    secondsLeft: Int,
    back: () -> Unit,
    skip: () -> Unit,
    openSettings: () -> Unit,
) {
    val status = state.status
    val bpm = state.bpm
    val title = when {
        failed -> "Couldn't read your pulse, that's okay"
        status == PulseReader.Status.Denied -> "Camera is off for Escape"
        status == PulseReader.Status.Unavailable -> "No front camera available"
        status == PulseReader.Status.Reading -> "Hold still, reading your pulse"
        else -> "Look into the front camera"
    }
    val hint = when {
        failed -> "Light, movement and skin tone can all get in the way. You can still tap how you feel; no pulse will be saved."
        status == PulseReader.Status.Denied -> "Allow Camera for Escape in Settings to read your pulse, or skip and just tap how you feel."
        status == PulseReader.Status.Unavailable -> "This device can't read a pulse with its camera right now. Skip and tap how you feel."
        status == PulseReader.Status.Reading -> "Keep your face in the circle and stay still. Breathe in as the orb grows, out as it settles."
        status == PulseReader.Status.PlaceFace -> "Hold your phone at eye level with your face in the circle, in steady, even light."
        else -> "Turning on the camera…"
    }
    val pills = when (status) {
        PulseReader.Status.Reading -> listOf("Face in view", if (bpm == null) "Finding your beat" else "Steady signal", "$secondsLeft s")
        PulseReader.Status.PlaceFace -> listOf("Camera on", "Waiting for your face")
        else -> listOf("Front camera", "Frames stay on your phone")
    }
    val noCamera = failed || status == PulseReader.Status.Denied || status == PulseReader.Status.Unavailable

    Column(Modifier.fillMaxSize().navigationBarsPadding()) {
        TopBar {
            GlassIconButton(ScanIcon.Back, "Back", onClick = back)
            Spacer(Modifier.width(1.dp))
        }
        Column(
            Modifier.padding(horizontal = SidePad).padding(top = 10.dp).semantics { liveRegion = LiveRegionMode.Polite },
            verticalArrangement = Arrangement.spacedBy(8.dp),
        ) {
            Title(title)
            Hint(hint)
        }
        Spacer(Modifier.weight(1f))
        Column(
            Modifier.padding(horizontal = SidePad).padding(bottom = 32.dp),
            verticalArrangement = Arrangement.spacedBy(14.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            if (!failed && status == PulseReader.Status.Reading && state.wave.size > 1) {
                PulseTrace(state.wave, Modifier.fillMaxWidth().height(44.dp).padding(horizontal = 8.dp))
            }
            if (!noCamera) {
                // Never show a number unless the reader has a steady, cross-checked reading.
                val bpmLabel = if (bpm != null) "Pulse estimate $bpm beats per minute" else "Pulse not read yet"
                Row(
                    Modifier.clearAndSetSemantics { contentDescription = bpmLabel; liveRegion = LiveRegionMode.Polite },
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(6.dp),
                ) {
                    ScanIconView(ScanIcon.Heart, ScanColors.ember, Modifier.size(18.dp))
                    BasicText(bpm?.toString() ?: "--", style = ScanFonts.display(44))
                    BasicText("bpm", style = ScanFonts.ui(14))
                }
                BasicText(
                    "An estimate for wellbeing only, not for medical use.",
                    style = ScanFonts.ui(11, align = TextAlign.Center),
                )
                Pills(pills)
            }
            when {
                failed -> PrimaryCTA("Tap how I feel instead", onClick = skip)
                status == PulseReader.Status.Denied -> {
                    GlassButton("Open Settings", Modifier.fillMaxWidth(), onClick = openSettings)
                    PrimaryCTA("Continue without pulse", onClick = skip)
                }
                status == PulseReader.Status.Unavailable -> PrimaryCTA("Continue without pulse", onClick = skip)
                else -> GlassButton("Skip pulse", Modifier.padding(top = 8.dp), onClick = skip)
            }
        }
    }
}

/** The live pulse wave as a line. */
@Composable
private fun PulseTrace(wave: List<Float>, modifier: Modifier) {
    Canvas(modifier.semantics { contentDescription = "Live pulse signal from the camera" }) {
        if (wave.size < 2) return@Canvas
        val step = size.width / (wave.size - 1)
        val mid = size.height / 2
        val p = Path()
        wave.forEachIndexed { i, v ->
            val x = i * step
            val y = mid - v * size.height / 2
            if (i == 0) p.moveTo(x, y) else p.lineTo(x, y)
        }
        drawPath(p, ScanColors.ember, style = Stroke(2.dp.toPx(), cap = StrokeCap.Round, join = StrokeJoin.Round))
    }
}

/** A thin ring showing where to hold the face during the pulse read. */
@Composable
internal fun FaceGuideRing(active: Boolean, modifier: Modifier) {
    Canvas(modifier.clearAndSetSemantics { }) {
        val r = size.minDimension / 2 - 2.dp.toPx()
        drawCircle(
            if (active) ScanColors.ember.copy(alpha = 0.8f) else Color.White.copy(alpha = 0.35f),
            radius = r,
            style = Stroke(1.5.dp.toPx(), pathEffect = if (active) null else androidx.compose.ui.graphics.PathEffect.dashPathEffect(floatArrayOf(10f, 10f))),
        )
    }
}

// MARK: Mood 2b · Feel (the Mood Field: energy x pleasantness, plus words)

@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun MoodFeelChrome(reading: MoodReading, onChange: (MoodReading) -> Unit, next: () -> Unit) {
    Column(Modifier.fillMaxSize().navigationBarsPadding()) {
        Column(
            Modifier.statusBarsPadding().padding(horizontal = SidePad).padding(top = 64.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp),
        ) {
            Title("How does it feel right now?")
            Hint("Move the orb. It changes with you.")
        }
        Spacer(Modifier.weight(1f))
        Column(
            Modifier.padding(horizontal = SidePad).padding(bottom = 32.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp),
        ) {
            LabelledSlider("Energy", reading.energy) { onChange(reading.copy(energy = it)) }
            LabelledSlider("Pleasant", reading.valence) { onChange(reading.copy(valence = it)) }
            FlowRow(
                Modifier.fillMaxWidth().padding(top = 2.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp, Alignment.CenterHorizontally),
                verticalArrangement = Arrangement.spacedBy(8.dp),
            ) {
                reading.words.forEach { w ->
                    val on = w == reading.word
                    val shape = RoundedCornerShape(24.dp)
                    Box(
                        Modifier
                            .heightIn(min = 48.dp)
                            .clip(shape)
                            .background(if (on) ScanColors.royal.copy(alpha = 0.7f) else ScanColors.glass)
                            .border(1.dp, if (on) ScanColors.lilac else Color.White.copy(alpha = 0.12f), shape)
                            .clickable(role = Role.RadioButton) { onChange(reading.copy(chosenWord = w)) }
                            .semantics { selected = on }
                            .padding(horizontal = 16.dp),
                        contentAlignment = Alignment.Center,
                    ) {
                        BasicText(w, style = ScanFonts.ui(14, FontWeight.Medium, ScanColors.mist))
                    }
                }
            }
            PrimaryCTA("That's it", Modifier.padding(top = 6.dp), onClick = next)
        }
    }
}

/** A frosted 0…1 slider with a 48dp touch area and TalkBack adjust support. */
@Composable
private fun LabelledSlider(title: String, value: Float, onValue: (Float) -> Unit) {
    val update by rememberUpdatedState(onValue)
    Row(
        Modifier.fillMaxWidth().glass(18.dp).padding(horizontal = 14.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(10.dp),
    ) {
        BasicText(title, Modifier.width(84.dp).clearAndSetSemantics { }, style = ScanFonts.ui(13))
        Canvas(
            Modifier
                .weight(1f)
                .height(48.dp)
                .semantics {
                    contentDescription = title
                    stateDescription = "${(value * 100).roundToInt()} percent"
                    progressBarRangeInfo = ProgressBarRangeInfo(value, 0f..1f)
                    setProgress { target -> update(target.coerceIn(0f, 1f)); true }
                }
                .pointerInput(Unit) {
                    detectTapGestures { pos -> update((pos.x / size.width).coerceIn(0f, 1f)) }
                }
                .pointerInput(Unit) {
                    detectHorizontalDragGestures { change, _ ->
                        change.consume()
                        update((change.position.x / size.width).coerceIn(0f, 1f))
                    }
                },
        ) {
            val track = 4.dp.toPx()
            val y = size.height / 2
            val x = value * size.width
            drawLine(Color.White.copy(alpha = 0.15f), Offset(0f, y), Offset(size.width, y), track, StrokeCap.Round)
            drawLine(ScanColors.lilac, Offset(0f, y), Offset(x, y), track, StrokeCap.Round)
            drawCircle(Color.White, radius = 11.dp.toPx(), center = Offset(x.coerceIn(11.dp.toPx(), size.width - 11.dp.toPx()), y))
        }
    }
}

// MARK: Mood 2c · Words

@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun MoodWordsChrome(words: String, onWords: (String) -> Unit, next: () -> Unit) {
    val focus = LocalFocusManager.current
    val suggestions = listOf("Too many tabs open", "Big day tomorrow", "Slept badly")
    Column(Modifier.fillMaxSize().navigationBarsPadding().imePadding()) {
        Column(
            Modifier.statusBarsPadding().padding(horizontal = SidePad).padding(top = 64.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp),
        ) {
            Title("Anything on your mind?")
            Hint("Type a few words for Lucille. Optional.")
        }
        Spacer(Modifier.weight(1f))
        Column(
            Modifier.padding(horizontal = SidePad).padding(bottom = 32.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp),
        ) {
            Box(
                Modifier.fillMaxWidth().heightIn(min = 52.dp).glass(16.dp).padding(horizontal = 16.dp, vertical = 14.dp),
                contentAlignment = Alignment.CenterStart,
            ) {
                BasicTextField(
                    value = words,
                    onValueChange = { onWords(it.take(2000)) },
                    textStyle = ScanFonts.ui(15, color = ScanColors.mist),
                    cursorBrush = SolidColor(ScanColors.lilac),
                    keyboardOptions = KeyboardOptions(capitalization = KeyboardCapitalization.Sentences, imeAction = ImeAction.Done),
                    keyboardActions = KeyboardActions(onDone = { focus.clearFocus() }),
                    modifier = Modifier.fillMaxWidth().semantics { contentDescription = "A few words for Lucille, optional" },
                    decorationBox = { inner ->
                        if (words.isEmpty()) BasicText("Too many tabs open in my head", style = ScanFonts.ui(15, color = ScanColors.haze.copy(alpha = 0.7f)))
                        inner()
                    },
                )
            }
            FlowRow(
                Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp, Alignment.CenterHorizontally),
                verticalArrangement = Arrangement.spacedBy(8.dp),
            ) {
                suggestions.forEach { s ->
                    Box(
                        Modifier.heightIn(min = 48.dp).glass(999.dp).clickable(role = Role.Button) { onWords(s) }.padding(horizontal = 14.dp),
                        contentAlignment = Alignment.Center,
                    ) { BasicText(s, style = ScanFonts.ui(13)) }
                }
            }
            PrimaryCTA("See my mood", Modifier.padding(top = 6.dp)) { focus.clearFocus(); next() }
        }
    }
}

// MARK: Mood 3 · Result

internal enum class SaveState { Saving, Saved, NeedsConsent, Failed }

@Composable
internal fun MoodResultChrome(
    reading: MoodReading,
    coins: Int?,
    coinsAwarded: Int?,
    saveState: SaveState,
    crisis: Boolean,
    orbSpace: androidx.compose.ui.unit.Dp,
    allowAndSave: () -> Unit,
    retry: () -> Unit,
    canOpen: (String) -> Boolean,
    open: (String) -> Unit,
    done: () -> Unit,
) {
    Column(Modifier.fillMaxSize()) {
        TopBar {
            GlassIconButton(ScanIcon.Close, "Close Mood Scan", onClick = done)
            if (coins != null) CoinBadge(coins, coinsAwarded?.takeIf { it > 0 }?.let { "+$it" })
        }
        Column(
            Modifier
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
                .navigationBarsPadding()
                .padding(horizontal = SidePad)
                .padding(top = orbSpace, bottom = 32.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp),
        ) {
            Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(6.dp)) {
                Eyebrow("Lucille hears", ScanColors.haze)
                BasicText(reading.word, Modifier.semantics { heading() }, style = ScanFonts.display(40))
                BasicText(reading.line, style = ScanFonts.ui(14, align = TextAlign.Center))
            }

            Column(Modifier.fillMaxWidth().glass(20.dp).padding(16.dp), verticalArrangement = Arrangement.spacedBy(10.dp)) {
                BasicText("What Lucille noticed", style = ScanFonts.ui(13, FontWeight.SemiBold, ScanColors.mist))
                Row(Modifier.fillMaxWidth()) {
                    Stat(if (reading.pulseMeasured) "${reading.bpm}" else "--", if (reading.pulseMeasured) "bpm pulse" else "pulse not read")
                    Stat("${MoodReading.pct(reading.energy)}%", "energy")
                    Stat("${MoodReading.pct(reading.valence)}%", "pleasant")
                }
                BasicText(reading.because, style = ScanFonts.ui(13))
            }

            SaveStatus(saveState, coinsAwarded, allowAndSave, retry)

            if (crisis) {
                Column(Modifier.fillMaxWidth().glass(20.dp).padding(16.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                    BasicText("You don't have to carry this alone", style = ScanFonts.ui(14, FontWeight.SemiBold, ScanColors.mist))
                    BasicText(
                        "If things feel like too much, please reach out to someone you trust, or your local emergency number if you might be in danger.",
                        style = ScanFonts.ui(12),
                    )
                    // One tap to a person (same lines as the app's Support sheet). The dialer opens
                    // with the number filled in; nothing is called without the person's tap there.
                    val context = androidx.compose.ui.platform.LocalContext.current
                    SmallGradientButton("Call or text 988 (US, 24/7)") { launchExternal(context, "tel:988") }
                    GlassButton("Find a helpline near you", Modifier.fillMaxWidth()) { launchExternal(context, "https://findahelpline.com") }
                }
            }

            Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                BasicText("Lucille suggests", Modifier.semantics { heading() }, style = ScanFonts.ui(13, FontWeight.SemiBold, ScanColors.mist))
                val (tunedTitle, tunedMode) = reading.tunedSoundscape
                val tunedLink = "escape://mode/$tunedMode"
                val tunedShape = RoundedCornerShape(20.dp)
                Row(
                    Modifier
                        .fillMaxWidth()
                        .clip(tunedShape)
                        .background(Brush.linearGradient(listOf(ScanColors.ember.copy(alpha = 0.22f), ScanColors.cardSoft)))
                        .border(1.dp, ScanColors.ember.copy(alpha = 0.4f), tunedShape)
                        .then(if (canOpen(tunedLink)) Modifier.clickable(role = Role.Button) { open(tunedLink) } else Modifier)
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(2.dp)) {
                        BasicText("Soundscape tuned to your mood", style = ScanFonts.ui(12))
                        BasicText(tunedTitle, style = ScanFonts.ui(15, FontWeight.SemiBold, ScanColors.mist))
                    }
                    if (canOpen(tunedLink)) {
                        Box(Modifier.size(52.dp).clip(CircleShape).background(ScanColors.primaryGradient), contentAlignment = Alignment.Center) {
                            ScanIconView(ScanIcon.Play, Color.White, Modifier.size(18.dp))
                        }
                    }
                }
                reading.suggestions.forEach { s ->
                    val clickable = canOpen(s.deeplink)
                    Row(
                        Modifier
                            .fillMaxWidth()
                            .glass(18.dp)
                            .then(if (clickable) Modifier.clickable(role = Role.Button) { open(s.deeplink) } else Modifier)
                            .padding(14.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(12.dp),
                    ) {
                        Box(Modifier.size(44.dp).glass(22.dp), contentAlignment = Alignment.Center) {
                            BasicText(s.minutes, style = ScanFonts.ui(11, FontWeight.SemiBold, ScanColors.lilac, TextAlign.Center))
                        }
                        Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(2.dp)) {
                            BasicText(s.title, style = ScanFonts.ui(14, FontWeight.SemiBold, ScanColors.mist))
                            BasicText(s.why, style = ScanFonts.ui(12), maxLines = 2)
                        }
                        if (clickable) ScanIconView(ScanIcon.Chevron, ScanColors.haze, Modifier.size(14.dp))
                    }
                }
            }

            BasicText(
                "For wellbeing only, not a medical device. The pulse is a camera estimate; if you're worried about your heart, talk to a doctor.",
                Modifier.padding(top = 6.dp),
                style = ScanFonts.ui(11),
            )
            PrimaryCTA("Done", Modifier.padding(top = 8.dp), onClick = done)
        }
    }
}

@Composable
private fun SaveStatus(state: SaveState, coinsAwarded: Int?, allowAndSave: () -> Unit, retry: () -> Unit) {
    when (state) {
        SaveState.Saving -> BasicText("Saving to your mood history…", Modifier.semantics { liveRegion = LiveRegionMode.Polite }, style = ScanFonts.ui(12))
        SaveState.Saved -> {
            val extra = coinsAwarded?.takeIf { it > 0 }?.let { " · +$it Escape Coins" }.orEmpty()
            BasicText("Saved to your mood history$extra", Modifier.semantics { liveRegion = LiveRegionMode.Polite }, style = ScanFonts.ui(12))
        }
        SaveState.NeedsConsent -> Column(
            Modifier.fillMaxWidth().glass(20.dp).padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp),
        ) {
            BasicText("Save this scan to your mood history?", style = ScanFonts.ui(14, FontWeight.SemiBold, ScanColors.mist))
            BasicText(
                "Lucille uses your check-ins (and your pulse, if measured) for your Mood Orb, Mood Stats and suggestions. You can delete them any time in Privacy.",
                style = ScanFonts.ui(12),
            )
            SmallGradientButton("Allow & save", allowAndSave)
        }
        SaveState.Failed -> Row(
            Modifier.fillMaxWidth().glass(20.dp).padding(horizontal = 16.dp, vertical = 8.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            BasicText("Couldn't save this scan. Check your connection.", Modifier.weight(1f), style = ScanFonts.ui(12))
            Box(Modifier.heightIn(min = 48.dp).clickable(role = Role.Button, onClick = retry).padding(horizontal = 12.dp), contentAlignment = Alignment.Center) {
                BasicText("Try again", style = ScanFonts.ui(13, FontWeight.SemiBold, ScanColors.lilac))
            }
        }
    }
}

/** Opens the dialer or the browser outside the module (crisis lines). */
private fun launchExternal(context: android.content.Context, uri: String) {
    val action = if (uri.startsWith("tel:")) android.content.Intent.ACTION_DIAL else android.content.Intent.ACTION_VIEW
    val intent = android.content.Intent(action, android.net.Uri.parse(uri))
    if (context !is android.app.Activity) intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
    runCatching { context.startActivity(intent) }
}

@Composable
internal fun SmallGradientButton(title: String, onClick: () -> Unit) {
    Box(
        Modifier
            .heightIn(min = 48.dp)
            .clip(RoundedCornerShape(24.dp))
            .background(ScanColors.primaryGradient)
            .clickable(role = Role.Button, onClick = onClick)
            .padding(horizontal = 20.dp),
        contentAlignment = Alignment.Center,
    ) {
        BasicText(title, style = ScanFonts.ui(14, FontWeight.SemiBold, Color.White))
    }
}

@Composable
private fun RowScope.Stat(big: String, small: String) {
    Column(Modifier.weight(1f).semantics(mergeDescendants = true) { }, verticalArrangement = Arrangement.spacedBy(2.dp)) {
        BasicText(big, style = ScanFonts.ui(18, FontWeight.SemiBold, ScanColors.mist))
        BasicText(small, style = ScanFonts.ui(12))
    }
}
