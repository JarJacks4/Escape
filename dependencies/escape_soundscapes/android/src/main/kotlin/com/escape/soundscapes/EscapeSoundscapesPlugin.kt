package com.escape.soundscapes

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.lang.ref.WeakReference
import kotlin.coroutines.resume
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull

/**
 * Flutter bridge (EscapeSoundscapesPlugin.swift). Methods: isSupported, open({mock, lucille,
 * firstName, baseUrl, screen, sheet}), close. Calls back into Dart: getIdToken, onExit(tab),
 * sendFeedback(map). The activity reaches Dart through [SoundscapesBridge].
 */
class EscapeSoundscapesPlugin : FlutterPlugin, ActivityAware, MethodChannel.MethodCallHandler {
    private var channel: MethodChannel? = null
    private var appContext: Context? = null
    private var activity: Activity? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appContext = binding.applicationContext
        val ch = MethodChannel(binding.binaryMessenger, "escape_soundscapes")
        ch.setMethodCallHandler(this)
        channel = ch
        SoundscapesBridge.attach(ch)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel?.let { SoundscapesBridge.detach(it) }
        channel = null
        appContext = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) { activity = binding.activity }
    override fun onDetachedFromActivityForConfigChanges() { activity = null }
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) { activity = binding.activity }
    override fun onDetachedFromActivity() { activity = null }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "isSupported" -> result.success(Build.VERSION.SDK_INT >= MIN_SDK)
            "open" -> open(call, result)
            "close" -> {
                SoundscapesBridge.closeFromHost()
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun open(call: MethodCall, result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < MIN_SDK) {
            result.error("unsupported", "Soundscapes requires Android 8.0", null)
            return
        }
        if (SoundscapesBridge.isPresented) { result.success(null); return }
        val from = activity
        val ctx = from ?: appContext
        if (ctx == null) {
            result.error("no_activity", "No activity to present from", null)
            return
        }
        val intent = Intent(ctx, SoundscapesActivity::class.java).apply {
            putExtra(SoundscapesActivity.EXTRA_MOCK, call.argument<Boolean>("mock") ?: true)
            putExtra(SoundscapesActivity.EXTRA_LUCILLE, call.argument<Boolean>("lucille") ?: false)
            putExtra(SoundscapesActivity.EXTRA_FIRST_NAME, call.argument<String>("firstName"))
            putExtra(SoundscapesActivity.EXTRA_BASE_URL, call.argument<String>("baseUrl"))
            putExtra(SoundscapesActivity.EXTRA_SCREEN, call.argument<String>("screen"))
            putExtra(SoundscapesActivity.EXTRA_SHEET, call.argument<String>("sheet"))
            if (from == null) addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        ctx.startActivity(intent)
        from?.overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out)
        result.success(null)
    }

    companion object {
        const val MIN_SDK = 26
    }
}

/** Static bridge between [SoundscapesActivity] (and its store) and the Flutter channel. */
object SoundscapesBridge {
    private val main = Handler(Looper.getMainLooper())
    @Volatile private var channel: MethodChannel? = null
    private var presented: WeakReference<SoundscapesActivity>? = null

    internal fun attach(ch: MethodChannel) { channel = ch }
    internal fun detach(ch: MethodChannel) { if (channel === ch) channel = null }

    val isPresented: Boolean get() = presented?.get()?.isFinishing == false

    internal fun register(activity: SoundscapesActivity) { presented = WeakReference(activity) }
    internal fun unregister(activity: SoundscapesActivity) { if (presented?.get() === activity) presented = null }

    /** Firebase ID token from Dart (null when signed out, detached or after 15 s). */
    suspend fun idToken(): String? = withContext(Dispatchers.Main) {
        val ch = channel ?: return@withContext null
        withTimeoutOrNull(15_000) {
            suspendCancellableCoroutine<String?> { cont ->
                ch.invokeMethod("getIdToken", null, object : MethodChannel.Result {
                    override fun success(value: Any?) { if (cont.isActive) cont.resume(value as? String) }
                    override fun error(code: String, message: String?, details: Any?) { if (cont.isActive) cont.resume(null) }
                    override fun notImplemented() { if (cont.isActive) cont.resume(null) }
                })
            }
        }
    }

    /** Beta feedback to Dart (written to Firestore there). True when Dart accepted it. */
    suspend fun sendFeedback(payload: Map<String, Any>): Boolean = withContext(Dispatchers.Main) {
        val ch = channel ?: return@withContext false
        withTimeoutOrNull(20_000) {
            suspendCancellableCoroutine<Boolean> { cont ->
                ch.invokeMethod("sendFeedback", payload, object : MethodChannel.Result {
                    override fun success(value: Any?) { if (cont.isActive) cont.resume(true) }
                    override fun error(code: String, message: String?, details: Any?) { if (cont.isActive) cont.resume(false) }
                    override fun notImplemented() { if (cont.isActive) cont.resume(false) }
                })
            }
        } ?: false
    }

    /**
     * The user left Soundscapes. With a tab, Flutter switches to it first while the module still
     * covers the screen, then the module fades out (same order as iOS). Without one, it just closes.
     */
    internal fun exit(activity: SoundscapesActivity, tab: String?) {
        val ch = channel
        if (tab == null || ch == null) {
            activity.finishWithFade()
            ch?.invokeMethod("onExit", null)
            return
        }
        ch.invokeMethod("onExit", tab, object : MethodChannel.Result {
            override fun success(value: Any?) = later()
            override fun error(code: String, message: String?, details: Any?) = later()
            override fun notImplemented() = later()
            private fun later() { main.postDelayed({ activity.finishWithFade() }, 150) }
        })
    }

    /** close() from Dart. */
    internal fun closeFromHost() {
        val a = presented?.get() ?: return
        a.finishWithFade()
        channel?.invokeMethod("onExit", null)
    }
}
