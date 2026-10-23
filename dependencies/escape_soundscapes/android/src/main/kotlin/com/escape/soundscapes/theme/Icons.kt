package com.escape.soundscapes.theme

import androidx.annotation.DrawableRes
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.escape.soundscapes.R
import com.escape.soundscapes.model.ModeId

/** Every Figma icon (Icons.swift), converted 1:1 from the iOS SVGs to VectorDrawables (res/drawable/icon_*). */
enum class EscIcon(@DrawableRes val res: Int) {
    PLAY(R.drawable.icon_play), PAUSE(R.drawable.icon_pause), SOUNDWAVE(R.drawable.icon_soundwave),
    TIMER(R.drawable.icon_timer), LOCK(R.drawable.icon_lock), SHUFFLE(R.drawable.icon_shuffle),
    BOOKMARK(R.drawable.icon_bookmark), SHARE(R.drawable.icon_share), CHEVRON_DOWN(R.drawable.icon_chevron_down),
    CHEVRON_RIGHT(R.drawable.icon_chevron_right), HOME(R.drawable.icon_home), REALM(R.drawable.icon_realm),
    LUCILLE(R.drawable.icon_lucille), PROFILE(R.drawable.icon_profile), INFO(R.drawable.icon_info),
    MIC(R.drawable.icon_mic), HEART(R.drawable.icon_heart), SUN(R.drawable.icon_sun), CLOUD(R.drawable.icon_cloud),
    MOOD(R.drawable.icon_mood), LAYERS(R.drawable.icon_layers), BLEND(R.drawable.icon_blend),
    SHIELD(R.drawable.icon_shield), WHISPER(R.drawable.icon_whisper), DOWNLOAD(R.drawable.icon_download),
    CHECK(R.drawable.icon_check), MOON(R.drawable.icon_moon), SUNRISE(R.drawable.icon_sunrise), MORE(R.drawable.icon_more),
    MODE_PICKS(R.drawable.icon_mode_picks), MODE_FOCUS(R.drawable.icon_mode_focus), MODE_CALM(R.drawable.icon_mode_calm),
    MODE_SLEEP(R.drawable.icon_mode_sleep), MODE_MOVE(R.drawable.icon_mode_move), MODE_REALMS(R.drawable.icon_mode_realms);

    companion object {
        /** Icon for a mode orb. Noise uses the soundwave (as in the Figma). */
        fun mode(m: ModeId): EscIcon = when (m) {
            ModeId.PICKS -> MODE_PICKS
            ModeId.FOCUS -> MODE_FOCUS
            ModeId.CALM -> MODE_CALM
            ModeId.SLEEP -> MODE_SLEEP
            ModeId.MOVE -> MODE_MOVE
            ModeId.NOISE -> SOUNDWAVE
            ModeId.REALMS -> MODE_REALMS
        }
    }
}

/** Decorative icon (TalkBack reads the surrounding control's label instead). */
@Composable
fun EscIconView(icon: EscIcon, size: Dp = 24.dp, color: Color = Esc.mist, modifier: Modifier = Modifier) {
    Icon(painter = painterResource(icon.res), contentDescription = null, tint = color, modifier = modifier.size(size))
}
