// Escape Health — Health Connect side of the `escape_health` MethodChannel.
//
// Contract (see lib/escape_health.dart):
//   availability          -> "available" | "needsInstall" | "unsupported"
//   requestAuthorization  -> Boolean (true when at least one requested permission is granted)
//   snapshot              -> Map with optional keys heartRate, heartRateAt (epoch ms),
//                            restingHeartRate, hrvMs, sleepMinutesLastNight, stepsToday
//   logStateOfMind        -> false (Health Connect has no State of Mind record)
//   logMindfulSession     -> Boolean (MindfulnessSessionRecord; false when the provider lacks it)
//   openStore             -> opens the Play Store page for Health Connect
//
// Everything is failure-tolerant: errors become null / false, never a PlatformException, never a
// crash. Below API 26 nothing from Health Connect is touched and the plugin reports "unsupported".
package com.escape.health

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import androidx.activity.ComponentActivity
import androidx.activity.result.ActivityResultLauncher
import androidx.health.connect.client.HealthConnectClient
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.HeartRateRecord
import androidx.health.connect.client.records.HeartRateVariabilityRmssdRecord
import androidx.health.connect.client.records.MindfulnessSessionRecord
import androidx.health.connect.client.records.RestingHeartRateRecord
import androidx.health.connect.client.records.SleepSessionRecord
import androidx.health.connect.client.records.StepsRecord
import androidx.health.connect.client.records.metadata.Metadata
import androidx.health.connect.client.request.AggregateRequest
import androidx.health.connect.client.request.ReadRecordsRequest
import androidx.health.connect.client.time.TimeRangeFilter
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import java.time.Duration
import java.time.Instant
import java.time.LocalTime
import java.time.ZoneId
import java.time.ZonedDateTime
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class EscapeHealthPlugin :
    FlutterPlugin,
    MethodChannel.MethodCallHandler,
    ActivityAware,
    PluginRegistry.ActivityResultListener {

    private var channel: MethodChannel? = null
    private var appContext: Context? = null
    private var activity: Activity? = null
    private var activityBinding: ActivityPluginBinding? = null
    private var scope: CoroutineScope = newScope()

    private var pendingAuthResult: MethodChannel.Result? = null
    private var permissionLauncher: ActivityResultLauncher<Set<String>>? = null

    // region FlutterPlugin

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appContext = binding.applicationContext
        scope = newScope()
        channel = MethodChannel(binding.binaryMessenger, CHANNEL).also { it.setMethodCallHandler(this) }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
        finishAuthorization(false)
        scope.cancel()
        appContext = null
    }

    // endregion

    // region ActivityAware

    override fun onAttachedToActivity(binding: ActivityPluginBinding) = attach(binding)

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) = attach(binding)

    override fun onDetachedFromActivityForConfigChanges() = detach()

    override fun onDetachedFromActivity() = detach()

    private fun attach(binding: ActivityPluginBinding) {
        activityBinding = binding
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    private fun detach() {
        activityBinding?.removeActivityResultListener(this)
        activityBinding = null
        activity = null
        // The permission UI is tied to the old activity; never leave the Dart future hanging.
        finishAuthorization(false)
    }

    // endregion

    // region MethodCallHandler

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "availability" -> result.success(availability())
                "requestAuthorization" -> requestAuthorization(result)
                "snapshot" -> snapshot(result)
                "logStateOfMind" -> result.success(false)
                "logMindfulSession" -> {
                    val start = (call.argument<Any>("start") as? Number)?.toLong()
                    val end = (call.argument<Any>("end") as? Number)?.toLong()
                    val title = call.argument<String>("title") ?: "Escape"
                    if (start == null || end == null || end <= start) {
                        result.success(false)
                    } else {
                        logMindfulSession(start, end, title, result)
                    }
                }
                "openStore" -> {
                    openStore()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        } catch (t: Throwable) {
            safeReply(result, defaultFor(call.method))
        }
    }

    // endregion

    // region Availability

    private fun isSupportedSdk(): Boolean = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O

    private fun availability(): String {
        val ctx = appContext ?: return "unsupported"
        if (!isSupportedSdk()) return "unsupported"
        return try {
            when (HealthConnectClient.getSdkStatus(ctx, PROVIDER_PACKAGE)) {
                HealthConnectClient.SDK_AVAILABLE -> "available"
                HealthConnectClient.SDK_UNAVAILABLE_PROVIDER_UPDATE_REQUIRED -> "needsInstall"
                else -> "unsupported"
            }
        } catch (t: Throwable) {
            "unsupported"
        }
    }

    private fun client(): HealthConnectClient? {
        val ctx = appContext ?: return null
        if (!isSupportedSdk()) return null
        return try {
            if (HealthConnectClient.getSdkStatus(ctx, PROVIDER_PACKAGE) != HealthConnectClient.SDK_AVAILABLE) {
                null
            } else {
                HealthConnectClient.getOrCreate(ctx, PROVIDER_PACKAGE)
            }
        } catch (t: Throwable) {
            null
        }
    }

    // endregion

    // region Permissions

    private fun readPermissions(): Set<String> = setOf(
        HealthPermission.getReadPermission(HeartRateRecord::class),
        HealthPermission.getReadPermission(RestingHeartRateRecord::class),
        HealthPermission.getReadPermission(HeartRateVariabilityRmssdRecord::class),
        HealthPermission.getReadPermission(SleepSessionRecord::class),
        HealthPermission.getReadPermission(StepsRecord::class),
    )

    private fun mindfulnessWritePermission(): String? = try {
        HealthPermission.getWritePermission(MindfulnessSessionRecord::class)
    } catch (t: Throwable) {
        null
    }

    private fun allPermissions(): Set<String> {
        val perms = readPermissions().toMutableSet()
        mindfulnessWritePermission()?.let { perms.add(it) }
        return perms
    }

    private fun requestAuthorization(result: MethodChannel.Result) {
        val act = activity
        val hc = client()
        if (act == null || hc == null) {
            result.success(false)
            return
        }
        if (pendingAuthResult != null) {
            // A sheet is already showing; don't stack a second one.
            result.success(false)
            return
        }
        scope.launch {
            try {
                val wanted = allPermissions()
                val granted = grantedPermissions(hc)
                if (granted.containsAll(wanted)) {
                    safeReply(result, true)
                    return@launch
                }
                pendingAuthResult = result
                val contract = PermissionController.createRequestPermissionResultContract(PROVIDER_PACKAGE)
                if (act is ComponentActivity) {
                    // FlutterFragmentActivity (or any ComponentActivity host): use the result registry.
                    permissionLauncher?.unregister()
                    permissionLauncher = act.activityResultRegistry.register(REGISTRY_KEY, contract) { _ ->
                        onPermissionUiFinished()
                    }
                    permissionLauncher?.launch(wanted)
                } else {
                    // Plain FlutterActivity: launch the contract's intent and catch it in onActivityResult.
                    val intent = contract.createIntent(act, wanted)
                    act.startActivityForResult(intent, REQUEST_CODE_PERMISSIONS)
                }
            } catch (t: Throwable) {
                if (pendingAuthResult === result) {
                    finishAuthorization(false)
                } else {
                    safeReply(result, false)
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQUEST_CODE_PERMISSIONS) return false
        onPermissionUiFinished()
        return true
    }

    /** Re-reads the granted set (the contract only reports what changed) and completes the call. */
    private fun onPermissionUiFinished() {
        permissionLauncher?.unregister()
        permissionLauncher = null
        val hc = client()
        if (hc == null) {
            finishAuthorization(false)
            return
        }
        scope.launch {
            val granted = grantedPermissions(hc)
            finishAuthorization(allPermissions().any { it in granted })
        }
    }

    private fun finishAuthorization(value: Boolean) {
        permissionLauncher?.unregister()
        permissionLauncher = null
        val r = pendingAuthResult ?: return
        pendingAuthResult = null
        safeReply(r, value)
    }

    private suspend fun grantedPermissions(hc: HealthConnectClient): Set<String> = try {
        hc.permissionController.getGrantedPermissions()
    } catch (t: Throwable) {
        emptySet()
    }

    // endregion

    // region Snapshot

    private fun snapshot(result: MethodChannel.Result) {
        val hc = client()
        if (hc == null) {
            result.success(null)
            return
        }
        scope.launch {
            val out = HashMap<String, Any>()
            try {
                val granted = grantedPermissions(hc)
                val now = Instant.now()
                val zone = ZoneId.systemDefault()

                if (HealthPermission.getReadPermission(HeartRateRecord::class) in granted) {
                    tryRead {
                        val since = now.minus(Duration.ofHours(2))
                        val response = hc.readRecords(
                            ReadRecordsRequest(
                                recordType = HeartRateRecord::class,
                                timeRangeFilter = TimeRangeFilter.between(since, now),
                                ascendingOrder = false,
                                pageSize = 100,
                            )
                        )
                        val latest = response.records
                            .flatMap { it.samples }
                            .filter { !it.time.isBefore(since) && !it.time.isAfter(now) }
                            .maxByOrNull { it.time }
                        if (latest != null) {
                            out["heartRate"] = latest.beatsPerMinute.toDouble()
                            out["heartRateAt"] = latest.time.toEpochMilli()
                        }
                    }
                }

                if (HealthPermission.getReadPermission(RestingHeartRateRecord::class) in granted) {
                    tryRead {
                        val response = hc.readRecords(
                            ReadRecordsRequest(
                                recordType = RestingHeartRateRecord::class,
                                timeRangeFilter = TimeRangeFilter.between(now.minus(Duration.ofDays(7)), now),
                                ascendingOrder = false,
                                pageSize = 1,
                            )
                        )
                        response.records.maxByOrNull { it.time }?.let {
                            out["restingHeartRate"] = it.beatsPerMinute.toDouble()
                        }
                    }
                }

                if (HealthPermission.getReadPermission(HeartRateVariabilityRmssdRecord::class) in granted) {
                    tryRead {
                        val response = hc.readRecords(
                            ReadRecordsRequest(
                                recordType = HeartRateVariabilityRmssdRecord::class,
                                timeRangeFilter = TimeRangeFilter.between(now.minus(Duration.ofDays(7)), now),
                                ascendingOrder = false,
                                pageSize = 1,
                            )
                        )
                        response.records.maxByOrNull { it.time }?.let {
                            out["hrvMs"] = it.heartRateVariabilityMillis
                        }
                    }
                }

                if (HealthPermission.getReadPermission(StepsRecord::class) in granted) {
                    tryRead {
                        val startOfDay = ZonedDateTime.now(zone).toLocalDate().atStartOfDay(zone).toInstant()
                        val response = hc.aggregate(
                            AggregateRequest(
                                metrics = setOf(StepsRecord.COUNT_TOTAL),
                                timeRangeFilter = TimeRangeFilter.between(startOfDay, now),
                            )
                        )
                        response[StepsRecord.COUNT_TOTAL]?.let { out["stepsToday"] = it }
                    }
                }

                if (HealthPermission.getReadPermission(SleepSessionRecord::class) in granted) {
                    tryRead {
                        val minutes = sleepMinutesLastNight(hc, zone)
                        if (minutes != null && minutes > 0) out["sleepMinutesLastNight"] = minutes
                    }
                }
            } catch (t: Throwable) {
                // Fall through with whatever was collected.
            }
            safeReply(result, out)
        }
    }

    /**
     * Asleep time for the 24 h window ending today at 18:00 local. Uses the session's asleep stages
     * (sleeping / light / deep / REM) when present, else the whole session; overlapping sessions from
     * several apps are merged so time is never double-counted.
     */
    private suspend fun sleepMinutesLastNight(hc: HealthConnectClient, zone: ZoneId): Long? {
        val windowEnd = ZonedDateTime.now(zone).with(LocalTime.of(18, 0)).toInstant()
        val windowStart = windowEnd.minus(Duration.ofDays(1))
        val response = hc.readRecords(
            ReadRecordsRequest(
                recordType = SleepSessionRecord::class,
                // Widened so a session that started before the window still comes back; clipped below.
                timeRangeFilter = TimeRangeFilter.between(windowStart.minus(Duration.ofHours(12)), windowEnd),
                ascendingOrder = true,
                pageSize = 100,
            )
        )
        val asleepStages = setOf(
            SleepSessionRecord.STAGE_TYPE_SLEEPING,
            SleepSessionRecord.STAGE_TYPE_LIGHT,
            SleepSessionRecord.STAGE_TYPE_DEEP,
            SleepSessionRecord.STAGE_TYPE_REM,
        )
        val intervals = ArrayList<Pair<Instant, Instant>>()
        for (session in response.records) {
            if (session.stages.isNotEmpty()) {
                for (stage in session.stages) {
                    if (stage.stage in asleepStages) intervals.add(stage.startTime to stage.endTime)
                }
            } else {
                intervals.add(session.startTime to session.endTime)
            }
        }
        val clipped = intervals.mapNotNull { (s, e) ->
            val start = if (s.isBefore(windowStart)) windowStart else s
            val end = if (e.isAfter(windowEnd)) windowEnd else e
            if (end.isAfter(start)) start to end else null
        }.sortedBy { it.first }
        if (clipped.isEmpty()) return null

        var totalMs = 0L
        var curStart = clipped[0].first
        var curEnd = clipped[0].second
        for (i in 1 until clipped.size) {
            val (s, e) = clipped[i]
            if (!s.isAfter(curEnd)) {
                if (e.isAfter(curEnd)) curEnd = e
            } else {
                totalMs += Duration.between(curStart, curEnd).toMillis()
                curStart = s
                curEnd = e
            }
        }
        totalMs += Duration.between(curStart, curEnd).toMillis()
        return Math.round(totalMs / 60_000.0)
    }

    private inline fun tryRead(block: () -> Unit) {
        try {
            block()
        } catch (t: Throwable) {
            // SecurityException (permission revoked), RemoteException, IllegalStateException… ignore.
        }
    }

    // endregion

    // region Writes

    private fun logMindfulSession(startMs: Long, endMs: Long, title: String, result: MethodChannel.Result) {
        val hc = client()
        if (hc == null) {
            result.success(false)
            return
        }
        scope.launch {
            val ok = try {
                val permission = mindfulnessWritePermission()
                if (permission == null || permission !in grantedPermissions(hc)) {
                    false
                } else {
                    val zone = ZoneId.systemDefault()
                    val start = Instant.ofEpochMilli(startMs)
                    val end = Instant.ofEpochMilli(endMs)
                    val record = MindfulnessSessionRecord(
                        startTime = start,
                        startZoneOffset = zone.rules.getOffset(start),
                        endTime = end,
                        endZoneOffset = zone.rules.getOffset(end),
                        metadata = Metadata.manualEntry(),
                        mindfulnessSessionType = MindfulnessSessionRecord.MINDFULNESS_SESSION_TYPE_MEDITATION,
                        title = title.take(MAX_TITLE),
                        notes = null,
                    )
                    hc.insertRecords(listOf(record))
                    true
                }
            } catch (t: Throwable) {
                // NoClassDefFoundError / UnsupportedOperationException / feature not available on this
                // Health Connect version, SecurityException, RemoteException…
                false
            }
            safeReply(result, ok)
        }
    }

    // endregion

    // region Store

    private fun openStore() {
        val ctx: Context = activity ?: appContext ?: return
        val market = Intent(
            Intent.ACTION_VIEW,
            Uri.parse("market://details?id=$PROVIDER_PACKAGE&url=healthconnect%3A%2F%2Fonboarding"),
        ).apply {
            setPackage("com.android.vending")
            putExtra("overlay", true)
            putExtra("callerId", ctx.packageName)
        }
        val web = Intent(
            Intent.ACTION_VIEW,
            Uri.parse("https://play.google.com/store/apps/details?id=$PROVIDER_PACKAGE"),
        )
        for (intent in listOf(market, web)) {
            if (ctx !is Activity) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            try {
                ctx.startActivity(intent)
                return
            } catch (t: Throwable) {
                // Try the next one.
            }
        }
    }

    // endregion

    // region Helpers

    private fun safeReply(result: MethodChannel.Result, value: Any?) {
        try {
            result.success(value)
        } catch (t: Throwable) {
            // Already replied or engine gone.
        }
    }

    private fun defaultFor(method: String): Any? = when (method) {
        "availability" -> "unsupported"
        "requestAuthorization", "logStateOfMind", "logMindfulSession" -> false
        else -> null
    }

    private fun newScope() = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)

    // endregion

    private companion object {
        const val CHANNEL = "escape_health"
        const val PROVIDER_PACKAGE = "com.google.android.apps.healthdata"
        const val REGISTRY_KEY = "com.escape.health.permissions"
        const val REQUEST_CODE_PERMISSIONS = 0x4E41 // arbitrary, unlikely to collide
        const val MAX_TITLE = 100
    }
}
