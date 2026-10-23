package com.escape.soundscapes.scan

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.util.Log
import androidx.activity.compose.BackHandler
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.Crossfade
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.spring
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.hapticfeedback.HapticFeedbackType
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalHapticFeedback
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.ceil
import kotlin.math.min

private enum class ScanPhase { Start, Pulse, Feel, Words, Result }

private const val PREFS = "escape_scan"
private const val SEEN_TOUR = "seenScanWalkthrough"
/** Seconds of clean face signal the pulse read collects (as iOS: 15 s). */
private const val PULSE_SECONDS = 15.0
/** No usable signal after this long: say so kindly and move on without a pulse. */
private const val PULSE_GIVE_UP_SECONDS = 45.0

/**
 * The Mood Scan: intro + consent → front-camera pulse read (optional) → Mood Field + word →
 * a few words → result with the Mood Orb, saved as a Lucille v1 mood check-in → Done.
 *
 * Port of ios/Classes/Screens/Scan (ScanFlowView + chrome + walkthrough), Mood Scan only.
 *
 * @param baseUrl Lucille v1 base, e.g. https://lucille-861854898360.us-central1.run.app
 * @param tokenProvider returns the Firebase ID token (sent as `Authorization: Bearer …`).
 * @param firstName used in the intro title when set.
 * @param onExit called on Close / Done / system back from the first screen.
 * @param onPlayMode plays a Soundscapes mode ("calm", "focus", "picks", …) for the result's
 *   `escape://mode/<id>` suggestions. Without it those links open only if the system resolves them.
 *
 * Needs `android.permission.CAMERA` in the merged manifest; it is requested here at run time.
 */
@Composable
fun MoodScanFlow(
    baseUrl: String,
    tokenProvider: suspend () -> String?,
    firstName: String?,
    onExit: () -> Unit,
    onPlayMode: ((String) -> Unit)? = null,
) {
    val context = LocalContext.current
    val haptics = LocalHapticFeedback.current
    val lifecycleOwner = LocalLifecycleOwner.current
    val scope = rememberCoroutineScope()
    val reduceMotion = rememberReduceMotion()

    val currentToken by rememberUpdatedState(tokenProvider)
    val currentExit by rememberUpdatedState(onExit)
    val api = remember(baseUrl) { ScanApi(baseUrl) { currentToken() } }
    val reader = remember { PulseReader() }
    val pulse by reader.state.collectAsState()

    var phase by remember { mutableStateOf(ScanPhase.Start) }
    var reading by remember { mutableStateOf(MoodReading()) }
    var words by remember { mutableStateOf("") }
    var progress by remember { mutableFloatStateOf(0f) }        // 0…1 of PULSE_SECONDS clean signal
    var pulseWait by remember { mutableFloatStateOf(0f) }       // seconds in the pulse step
    var pulseFailed by remember { mutableStateOf(false) }
    var cameraGranted by remember { mutableStateOf(hasCameraPermission(context)) }

    var coins by remember { mutableStateOf<Int?>(null) }
    var coinsAwarded by remember { mutableStateOf<Int?>(null) }
    var saveState by remember { mutableStateOf(SaveState.Saving) }
    var crisis by remember { mutableStateOf(false) }
    var consentPurpose by remember { mutableStateOf("wellbeing_data") }
    var saveJob by remember { mutableStateOf<Job?>(null) }

    val prefs = remember(context) { context.getSharedPreferences(PREFS, Context.MODE_PRIVATE) }
    var showTour by remember { mutableStateOf(!prefs.getBoolean(SEEN_TOUR, false)) }

    LaunchedEffect(api) { coins = api.lifetimeCoins() }

    fun submit() {
        if (saveJob?.isActive == true) return
        saveState = SaveState.Saving
        val r = reading
        val w = words
        saveJob = scope.launch {
            when (val result = api.checkIn(r, w)) {
                is ScanSaveResult.Saved -> {
                    coinsAwarded = result.coinsAwarded
                    coins = coins?.plus(result.coinsAwarded)
                    crisis = result.crisis
                    saveState = SaveState.Saved
                }
                is ScanSaveResult.NeedsConsent -> {
                    consentPurpose = result.purpose
                    saveState = SaveState.NeedsConsent
                }
                ScanSaveResult.Failed -> saveState = SaveState.Failed
            }
        }
    }

    /** "Allow & save": record consent, then save the same scan again. */
    fun allowAndSave() {
        if (saveJob?.isActive == true) return
        saveState = SaveState.Saving
        saveJob = scope.launch {
            // Storing check-ins needs wellbeing_data; a measured pulse also needs camera_scan.
            val flags = mutableMapOf("wellbeing_data" to true)
            if (reading.pulseMeasured) flags["camera_scan"] = true
            flags[consentPurpose] = true
            val ok = api.grantConsents(flags)
            saveState = if (ok) SaveState.Saving else SaveState.NeedsConsent
            saveJob = null
            if (ok) submit()
        }
    }

    fun go(next: ScanPhase) {
        haptics.performHapticFeedback(HapticFeedbackType.TextHandleMove)
        if (next == ScanPhase.Pulse) {
            reading = reading.copy(pulseMeasured = false, pulseQuality = null)
            pulseWait = 0f
            pulseFailed = false
            reader.reset(if (cameraGranted) PulseReader.Status.Starting else PulseReader.Status.Denied)
        }
        progress = 0f
        phase = next
        if (next == ScanPhase.Result) {
            coinsAwarded = null
            crisis = false
            submit()
        }
    }

    val permissionLauncher = rememberLauncherForActivityResult(ActivityResultContracts.RequestPermission()) { granted ->
        cameraGranted = granted
        go(ScanPhase.Pulse)
    }

    fun startScan() {
        if (hasCameraPermission(context)) {
            cameraGranted = true
            go(ScanPhase.Pulse)
        } else {
            permissionLauncher.launch(Manifest.permission.CAMERA)
        }
    }

    // Coming back from Settings with Camera now allowed: start the read straight away.
    DisposableEffect(lifecycleOwner) {
        val observer = LifecycleEventObserver { _, event ->
            if (event == Lifecycle.Event.ON_RESUME && !cameraGranted && hasCameraPermission(context)) {
                cameraGranted = true
                if (phase == ScanPhase.Pulse) reader.reset(PulseReader.Status.Starting)
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose { lifecycleOwner.lifecycle.removeObserver(observer) }
    }

    // Pulse timing, 10 Hz (as iOS advance()). Runs with reduced motion too.
    LaunchedEffect(phase) {
        if (phase != ScanPhase.Pulse) return@LaunchedEffect
        while (true) {
            delay(100)
            if (pulseFailed) continue
            pulseWait += 0.1f
            val s = reader.state.value
            // Count down only while a face is in view; ~15 s of clean signal.
            if (s.status == PulseReader.Status.Reading) progress = min(1f, progress + (0.1 / PULSE_SECONDS).toFloat())
            val bpm = s.bpm
            if (bpm != null) {
                // The orb now beats with the measured heart, and its energy starts from it.
                val energy = if (!reading.pulseMeasured) MoodReading.energyFromPulse(bpm) else reading.energy
                reading = reading.copy(energy = energy, bpm = bpm, pulseMeasured = true, pulseQuality = s.quality)
            }
            if (progress >= 1f && reading.pulseMeasured) { go(ScanPhase.Feel); break }
            if (pulseWait > PULSE_GIVE_UP_SECONDS) {
                if (reading.pulseMeasured) { go(ScanPhase.Feel); break }
                val cameraIssue = s.status == PulseReader.Status.Denied || s.status == PulseReader.Status.Unavailable
                if (!cameraIssue) pulseFailed = true   // never guess a number
            }
        }
    }

    BackHandler {
        when (phase) {
            ScanPhase.Start, ScanPhase.Result -> currentExit()
            ScanPhase.Pulse, ScanPhase.Feel -> go(ScanPhase.Start)
            ScanPhase.Words -> go(ScanPhase.Feel)
        }
    }

    // Deep links from Lucille's suggestions open only if something in the app handles them.
    val openable = remember { HashMap<String, Boolean>() }
    val currentPlayMode by rememberUpdatedState(onPlayMode)
    val modePrefix = "escape://mode/"
    val canOpen: (String) -> Boolean = { link ->
        (link.startsWith(modePrefix) && currentPlayMode != null) || openable.getOrPut(link) { resolves(context, link) }
    }
    val open: (String) -> Unit = { link ->
        val play = currentPlayMode
        if (link.startsWith(modePrefix) && play != null) play(link.removePrefix(modePrefix))
        else if (openLink(context, link)) currentExit()
    }

    BoxWithConstraints(Modifier.fillMaxSize().background(ScanColors.night)) {
        val w = maxWidth
        val h = maxHeight
        val blurBehindTour = showTour && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S

        Box(Modifier.fillMaxSize().then(if (blurBehindTour) Modifier.blur(20.dp) else Modifier)) {
            // Calm night backdrop (iOS streams HEVC scan backgrounds here; see report).
            Box(
                Modifier.fillMaxSize().background(
                    Brush.radialGradient(
                        0f to ScanColors.royal.copy(alpha = 0.28f),
                        0.6f to ScanColors.ink.copy(alpha = 0.4f),
                        1f to ScanColors.night,
                    ),
                ),
            )
            // Reading scrim: clear to 45%, then night at the foot.
            Box(
                Modifier.fillMaxSize().background(
                    Brush.verticalGradient(
                        0f to Color.Transparent,
                        0.45f to Color.Transparent,
                        1f to ScanColors.night.copy(alpha = 0.85f),
                    ),
                ),
            )

            // THE hero orb: one element, positioned per phase.
            val target = when (phase) {
                ScanPhase.Start -> 200.dp to 0.40f
                ScanPhase.Pulse, ScanPhase.Feel, ScanPhase.Words -> 300.dp to 0.45f
                ScanPhase.Result -> 168.dp to 0.24f
            }
            val heroSpring = spring<Float>(dampingRatio = 0.82f, stiffness = 50f)
            val orbSize by animateDpAsState(
                target.first,
                if (reduceMotion) tween(0) else spring(dampingRatio = 0.82f, stiffness = 50f),
                label = "orbSize",
            )
            val orbCy by animateFloatAsState(target.second, if (reduceMotion) tween(0) else heroSpring, label = "orbY")
            val beat = when {
                phase == ScanPhase.Pulse && reading.pulseMeasured -> 1f
                phase == ScanPhase.Result -> 0.3f
                else -> 0.4f
            }
            Box(
                Modifier
                    .offset(x = (w - orbSize) / 2, y = h * orbCy - orbSize / 2)
                    .size(orbSize),
            ) {
                if (phase == ScanPhase.Result) {
                    VideoMoodOrb(reading, Modifier.fillMaxSize())
                } else {
                    MoodOrb(
                        reading,
                        beatStrength = beat,
                        breathing = phase == ScanPhase.Pulse,
                        drift = phase != ScanPhase.Start,
                        modifier = Modifier.fillMaxSize(),
                    )
                }
                if (phase == ScanPhase.Pulse && cameraGranted && !pulseFailed &&
                    pulse.status != PulseReader.Status.Unavailable
                ) {
                    FaceGuideRing(
                        active = pulse.status == PulseReader.Status.Reading,
                        modifier = Modifier.size(orbSize * 0.62f).align(Alignment.Center),
                    )
                }
            }

            // The camera runs only while the pulse step is showing (and the person said yes).
            if (phase == ScanPhase.Pulse && cameraGranted && !pulseFailed) {
                PulseCamera(reader)
            }

            Crossfade(targetState = phase, animationSpec = tween(350), label = "scanChrome") { p ->
                when (p) {
                    ScanPhase.Start -> MoodStartChrome(
                        firstName = firstName,
                        coins = coins,
                        start = { startScan() },
                        skip = { go(ScanPhase.Feel) },
                        close = { currentExit() },
                        replayTour = { showTour = true },
                    )
                    ScanPhase.Pulse -> MoodPulseChrome(
                        state = pulse,
                        failed = pulseFailed,
                        secondsLeft = ceil(PULSE_SECONDS * (1 - progress)).toInt(),
                        back = { go(ScanPhase.Start) },
                        skip = { go(ScanPhase.Feel) },
                        openSettings = { openAppSettings(context) },
                    )
                    ScanPhase.Feel -> MoodFeelChrome(reading, onChange = { reading = it }, next = { go(ScanPhase.Words) })
                    ScanPhase.Words -> MoodWordsChrome(words, onWords = { words = it }, next = { go(ScanPhase.Result) })
                    ScanPhase.Result -> MoodResultChrome(
                        reading = reading,
                        coins = coins,
                        coinsAwarded = coinsAwarded,
                        saveState = saveState,
                        crisis = crisis,
                        orbSpace = (h * 0.24f + 84.dp - 64.dp).coerceAtLeast(120.dp),
                        allowAndSave = { allowAndSave() },
                        retry = { submit() },
                        canOpen = canOpen,
                        open = open,
                        done = { currentExit() },
                    )
                }
            }
        }

        if (showTour) {
            ScanWalkthrough(onDone = {
                showTour = false
                prefs.edit().putBoolean(SEEN_TOUR, true).apply()
            })
        }
    }
}

private fun hasCameraPermission(context: Context): Boolean =
    ContextCompat.checkSelfPermission(context, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED

private fun openAppSettings(context: Context) {
    val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.fromParts("package", context.packageName, null))
    if (context !is Activity) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    runCatching { context.startActivity(intent) }.onFailure { Log.w("[Scan]", "settings: ${it.message}") }
}

private fun resolves(context: Context, link: String): Boolean = runCatching {
    Intent(Intent.ACTION_VIEW, Uri.parse(link)).resolveActivity(context.packageManager) != null
}.getOrDefault(false)

private fun openLink(context: Context, link: String): Boolean = runCatching {
    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(link))
    if (context !is Activity) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    context.startActivity(intent)
    true
}.getOrElse {
    Log.w("[Scan]", "can't open $link: ${it.message}")
    false
}
