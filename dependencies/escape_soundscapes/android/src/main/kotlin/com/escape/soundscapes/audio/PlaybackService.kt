package com.escape.soundscapes.audio

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.ServiceCompat
import androidx.core.content.ContextCompat
import com.escape.soundscapes.R
import com.escape.soundscapes.SoundscapesActivity

/** The store registers itself here so the notification buttons can reach it. Main thread only. */
object PlaybackControls {
    var onToggle: (() -> Unit)? = null
    var onEnd: (() -> Unit)? = null
}

/**
 * Keeps the soundscape playing with the screen off or the app in the background (Sleep mode).
 * A plain foreground service of type mediaPlayback with a play/pause + end notification; it holds
 * no player itself. Lock-screen media controls (MediaSession) are not wired yet.
 */
class PlaybackService : Service() {

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val action = intent?.action
        // A notification button with no store behind it (module closed) must not leave an orphan
        // foreground notification: stop instead.
        val orphan = (action == ACTION_TOGGLE || action == ACTION_END) && PlaybackControls.onToggle == null
        if (action == ACTION_STOP || orphan) {
            running = false
            requested = false
            ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
            stopSelf()
            return START_NOT_STICKY
        }
        when (action) {
            ACTION_TOGGLE -> PlaybackControls.onToggle?.invoke()
            ACTION_END -> PlaybackControls.onEnd?.invoke()
        }
        val title = intent?.getStringExtra(EXTRA_TITLE) ?: lastTitle
        val subtitle = intent?.getStringExtra(EXTRA_SUBTITLE) ?: lastSubtitle
        val playing = if (intent?.hasExtra(EXTRA_PLAYING) == true) intent.getBooleanExtra(EXTRA_PLAYING, true) else lastPlaying
        lastTitle = title; lastSubtitle = subtitle; lastPlaying = playing
        try {
            ServiceCompat.startForeground(this, NOTIFICATION_ID, notification(title, subtitle, playing),
                if (Build.VERSION.SDK_INT >= 29) ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK else 0)
            running = true
        } catch (e: Exception) {
            Log.w("EscapeSoundscapes", "foreground service refused", e)
            requested = false
            stopSelf()
        }
        return START_NOT_STICKY
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        PlaybackControls.onEnd?.invoke()
        running = false
        stopSelf()
    }

    override fun onDestroy() {
        running = false
        requested = false
        super.onDestroy()
    }

    private fun notification(title: String, subtitle: String, playing: Boolean): android.app.Notification {
        ensureChannel(this)
        val flags = PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        val open = PendingIntent.getActivity(this, 0,
            Intent(this, SoundscapesActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_REORDER_TO_FRONT), flags)
        val toggle = PendingIntent.getService(this, 1, Intent(this, PlaybackService::class.java).setAction(ACTION_TOGGLE), flags)
        val end = PendingIntent.getService(this, 2, Intent(this, PlaybackService::class.java).setAction(ACTION_END), flags)
        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.icon_soundwave)
            .setContentTitle(title)
            .setContentText(subtitle)
            .setContentIntent(open)
            .setOngoing(playing)
            .setSilent(true)
            .setCategory(NotificationCompat.CATEGORY_TRANSPORT)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .addAction(if (playing) R.drawable.icon_pause else R.drawable.icon_play, if (playing) "Pause" else "Play", toggle)
            .addAction(R.drawable.icon_chevron_down, "End session", end)
            .build()
    }

    companion object {
        private const val CHANNEL_ID = "escape_soundscapes_playback"
        private const val NOTIFICATION_ID = 7301
        private const val ACTION_TOGGLE = "com.escape.soundscapes.TOGGLE"
        private const val ACTION_END = "com.escape.soundscapes.END"
        private const val ACTION_STOP = "com.escape.soundscapes.STOP"
        private const val EXTRA_TITLE = "title"
        private const val EXTRA_SUBTITLE = "subtitle"
        private const val EXTRA_PLAYING = "playing"

        @Volatile var running = false; private set
        /** A start was sent but onStartCommand hasn't run yet; stop() must still reach the service. */
        @Volatile private var requested = false
        private var lastTitle = "Escape Soundscapes"
        private var lastSubtitle = "Composed by Lucille (AI)"
        private var lastPlaying = true

        private fun ensureChannel(context: Context) {
            if (Build.VERSION.SDK_INT < 26) return
            val nm = context.getSystemService(NotificationManager::class.java) ?: return
            if (nm.getNotificationChannel(CHANNEL_ID) != null) return
            nm.createNotificationChannel(NotificationChannel(CHANNEL_ID, "Soundscapes playback", NotificationManager.IMPORTANCE_LOW).apply {
                description = "Shows while a soundscape is playing"
                setShowBadge(false)
            })
        }

        /** Starts or refreshes the notification. The first start must happen while the app is visible. */
        fun update(context: Context, title: String, subtitle: String, playing: Boolean) {
            val intent = Intent(context, PlaybackService::class.java)
                .putExtra(EXTRA_TITLE, title).putExtra(EXTRA_SUBTITLE, subtitle).putExtra(EXTRA_PLAYING, playing)
            try {
                if (running) context.startService(intent) else ContextCompat.startForegroundService(context, intent)
                requested = true
            } catch (e: Exception) {
                // Android 12+ refuses a new foreground service from the background; playback still works in the foreground.
                Log.w("EscapeSoundscapes", "couldn't start playback service", e)
            }
        }

        fun stop(context: Context) {
            if (!running && !requested) return
            requested = false
            try {
                context.startService(Intent(context, PlaybackService::class.java).setAction(ACTION_STOP))
            } catch (e: Exception) {
                context.stopService(Intent(context, PlaybackService::class.java))
            }
        }
    }
}
