package com.escape.soundscapes

import android.app.Application
import android.content.Intent
import android.graphics.Color as AndroidColor
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.SystemBarStyle
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import com.escape.soundscapes.api.LucilleBackedApi
import com.escape.soundscapes.api.LucilleV1Client
import com.escape.soundscapes.api.MockSoundscapesApi
import com.escape.soundscapes.api.SoundscapesApi
import com.escape.soundscapes.audio.SoundscapePlayer
import com.escape.soundscapes.store.AppStore
import com.escape.soundscapes.store.HostServices
import com.escape.soundscapes.store.NavTab
import com.escape.soundscapes.ui.SoundscapesRoot
import com.escape.soundscapes.visual.OrbLoops
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/** Holds the store across configuration changes; released when the module closes. */
class SoundscapesViewModel(app: Application) : AndroidViewModel(app) {
    var store: AppStore? = null
        private set
    var firstName: String? = null
        private set

    /** Builds the store once (SoundscapesHostingFactory.swift). */
    fun ensureStore(mock: Boolean, lucille: Boolean, firstName: String?, baseUrl: String?, screen: String?, sheet: String?) {
        if (store != null) return
        this.firstName = firstName
        val app = getApplication<Application>()
        val host = HostServices(app)
        val player = SoundscapePlayer(app)
        // The Node backend client (APIClient.swift, used when mock = false + baseUrl) is not ported:
        // that path, like the others, runs on the bundled mock with the Lucille v1 catalog when enabled.
        val s = AppStore(buildApi(app, lucille || (!mock && baseUrl != null), firstName), player, host, viewModelScope)
        store = s
        if (screen != null || sheet != null) s.openFromHost(screen, sheet)
        viewModelScope.launch {
            withContext(Dispatchers.IO) { OrbLoops.indexBundled(app) }
            s.bootstrap()
        }
    }

    override fun onCleared() {
        store?.shutdown()
        store = null
    }
}

/** Bundled mock alone, or the Lucille v1 catalog backed by it (the seed is ~30 KB, parsed in a few ms). */
private fun buildApi(app: Application, lucille: Boolean, firstName: String?): SoundscapesApi {
    val mock = MockSoundscapesApi.bundled(app)
    return if (lucille) LucilleBackedApi(mock, LucilleV1Client(token = { SoundscapesBridge.idToken() }), firstName) else mock
}

/** Full-screen host for the Compose module (the iOS overFullScreen modal). */
class SoundscapesActivity : ComponentActivity() {
    private val vm: SoundscapesViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge(
            statusBarStyle = SystemBarStyle.dark(AndroidColor.TRANSPARENT),
            navigationBarStyle = SystemBarStyle.dark(AndroidColor.TRANSPARENT),
        )
        super.onCreate(savedInstanceState)
        SoundscapesBridge.register(this)
        val i = intent
        vm.ensureStore(
            mock = i.getBooleanExtra(EXTRA_MOCK, true),
            lucille = i.getBooleanExtra(EXTRA_LUCILLE, false),
            firstName = i.getStringExtra(EXTRA_FIRST_NAME),
            baseUrl = i.getStringExtra(EXTRA_BASE_URL),
            screen = i.getStringExtra(EXTRA_SCREEN),
            sheet = i.getStringExtra(EXTRA_SHEET),
        )
        val store = vm.store ?: run { finish(); return }
        store.host.view = window.decorView
        store.onExitToHost = { tab: NavTab -> SoundscapesBridge.exit(this, tab.raw) }
        store.onOpenHostRoute = { route: String -> SoundscapesBridge.exit(this, route) }
        store.onCloseToHost = { SoundscapesBridge.exit(this, null) }
        setContent {
            SoundscapesRoot(
                store = store,
                firstName = vm.firstName,
                onExitRoot = { SoundscapesBridge.exit(this, null) },
            )
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        // Re-opened from the playback notification: nothing to change.
    }

    override fun onDestroy() {
        vm.store?.host?.view = null
        SoundscapesBridge.unregister(this)
        super.onDestroy()
    }

    /** Fade out like the iOS cross-dissolve dismissal. */
    fun finishWithFade() {
        if (isFinishing) return
        finish()
        @Suppress("DEPRECATION")
        overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out)
    }

    companion object {
        const val EXTRA_MOCK = "mock"
        const val EXTRA_LUCILLE = "lucille"
        const val EXTRA_FIRST_NAME = "firstName"
        const val EXTRA_BASE_URL = "baseUrl"
        const val EXTRA_SCREEN = "screen"
        const val EXTRA_SHEET = "sheet"
    }
}
