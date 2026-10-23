// Escape v6 — Settings (Figma Make: Profile.tsx Settings).
//
// Appearance (Auto / Day / Night, mood takeover, reduce motion), one daily check-in reminder,
// Lucille's voice in text chat, Apple Health / Health Connect, and mood personalisation.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import '../lucille/v6_lucille_parts.dart' show V6SpeakReplies;
import 'v6_profile_parts.dart';

class V6SettingsScreen extends StatefulWidget {
  const V6SettingsScreen({super.key});

  @override
  State<V6SettingsScreen> createState() => _V6SettingsScreenState();
}

class _V6SettingsScreenState extends State<V6SettingsScreen> {
  bool _healthBusy = false;
  BuildContext? _inner; // a context inside V6Page (live palette)
  BuildContext get _ctx => (_inner != null && _inner!.mounted) ? _inner! : context;

  @override
  void initState() {
    super.initState();
    unawaited(V6SpeakReplies.load());
  }

  String get _healthName => defaultTargetPlatform == TargetPlatform.iOS ? 'Apple Health' : 'Health Connect';

  String _time(BuildContext context, int h, int m) =>
      MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay(hour: h, minute: m));

  Future<void> _setReminder(bool on) async {
    final s = V6Store.instance;
    if (on) {
      final ok = await V6Reminders.requestPermission();
      if (!ok) {
        if (mounted) v6Snack(_ctx, 'Notifications are off for Escape. Turn them on in your phone settings.');
        return;
      }
      s.updateProfile((p) => p.moodReminder = true);
      final scheduled =
          await V6Reminders.scheduleDaily(hour: s.profile.reminderHour, minute: s.profile.reminderMinute);
      if (!scheduled) {
        // Never show "on" for a reminder that will not arrive.
        s.updateProfile((p) => p.moodReminder = false);
        if (mounted) v6Snack(_ctx, "Couldn't set the reminder on this phone. Please try again.");
      }
    } else {
      s.updateProfile((p) => p.moodReminder = false);
      await V6Reminders.cancel();
    }
  }

  Future<void> _pickTime() async {
    final s = V6Store.instance;
    final p = V6Theme.of(_ctx);
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: s.profile.reminderHour, minute: s.profile.reminderMinute),
      helpText: 'Daily check-in reminder',
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: (p.isLight ? const ColorScheme.light() : const ColorScheme.dark()).copyWith(
            primary: p.accent,
            surface: p.isLight ? const Color(0xFFF6F8FF) : V6Brand.surface,
            onSurface: p.isLight ? V6Brand.inkNavy : V6Brand.mist,
          ),
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
    if (picked == null || !mounted) return;
    s.updateProfile((pr) {
      pr.reminderHour = picked.hour;
      pr.reminderMinute = picked.minute;
    });
    if (s.profile.moodReminder) {
      await V6Reminders.scheduleDaily(hour: picked.hour, minute: picked.minute);
    }
  }

  Future<void> _toggleHealth(bool on) async {
    final s = V6Store.instance;
    if (!on) {
      s.disconnectHealth();
      v6Snack(_ctx, 'Disconnected. Escape no longer reads or writes $_healthName.');
      return;
    }
    setState(() => _healthBusy = true);
    final ok = await s.connectHealth();
    if (!mounted) return;
    setState(() => _healthBusy = false);
    v6Snack(
        _ctx,
        ok
            ? 'Connected to $_healthName.'
            : "$_healthName isn't set up on this phone yet, or access wasn't allowed. You can try again any time.");
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: V6Watch(builder: (context, s) {
        _inner = context;
        return V6ScrollPage(withNav: false, gap: 20, children: [
          const V6TopBar(title: 'Settings'),
          // Appearance.
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6SectionHeader('Appearance'),
            const SizedBox(height: 12),
            Semantics(
              label: 'Appearance',
              container: true,
              child: Row(children: [
                for (final m in V6ThemeMode.values) ...[
                  if (m != V6ThemeMode.auto) const SizedBox(width: 10),
                  Expanded(child: _ModeTile(mode: m, selected: s.themeMode == m, onTap: () => s.setThemeMode(m))),
                ],
              ]),
            ),
            const SizedBox(height: 10),
            V6Fade(
              child: V6Text(
                s.themeMode == V6ThemeMode.auto
                    ? 'Following the sun · ${s.isDaytime() ? 'Day' : 'Night'} right now (6am–6pm is Day)'
                    : 'Always ${s.themeMode == V6ThemeMode.day ? 'Day' : 'Night'}',
                key: ValueKey('${s.themeMode}${s.isDaytime()}'),
                size: 12,
                ink: V6Ink.faint,
              ),
            ),
          ]),
          V6ListPanel(children: [
            V6Row(
              leading: const V6RowIcon(Icons.palette_outlined),
              title: 'Let my mood colour the app',
              subtitle: 'Your check-in tints every page for the day',
              trailing: V6Toggle(on: s.moodTakeover, onChanged: s.setMoodTakeover, label: 'Let my mood colour the app'),
            ),
            V6Row(
              leading: const V6RowIcon(Icons.motion_photos_off_outlined),
              title: 'Reduce motion',
              subtitle: 'Calmer orbs, no drifting backgrounds',
              trailing: V6Toggle(on: s.reduceMotion, onChanged: s.setReduceMotion, label: 'Reduce motion'),
            ),
          ]),
          // Reminders.
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6SectionHeader('Reminders'),
            const SizedBox(height: 12),
            V6ListPanel(children: [
              V6Row(
                leading: const V6RowIcon(Icons.notifications_none_rounded),
                title: 'Daily check-in',
                subtitle: 'One gentle reminder a day, never more',
                trailing: V6Toggle(on: s.profile.moodReminder, onChanged: _setReminder, label: 'Daily check-in reminder'),
              ),
              V6Row(
                leading: const V6RowIcon(Icons.schedule_rounded),
                title: 'Time',
                subtitle: s.profile.moodReminder ? 'Every day' : 'Turn the reminder on to use this',
                trailing: V6Text(_time(context, s.profile.reminderHour, s.profile.reminderMinute),
                    weight: FontWeight.w600, ink: s.profile.moodReminder ? V6Ink.normal : V6Ink.faint),
                onTap: _pickTime,
              ),
            ]),
          ]),
          // Lucille.
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6SectionHeader('Lucille'),
            const SizedBox(height: 12),
            V6ListPanel(children: [
              ValueListenableBuilder<bool>(
                valueListenable: V6SpeakReplies.value,
                builder: (context, on, _) => V6Row(
                  leading: const V6RowIcon(Icons.record_voice_over_outlined),
                  title: 'Speak replies aloud',
                  subtitle: "Hear Lucille's voice in text chat too",
                  trailing: V6Toggle(on: on, onChanged: V6SpeakReplies.set, label: 'Speak replies aloud'),
                ),
              ),
              V6Row(
                leading: const V6RowIcon(Icons.mic_none_rounded),
                title: 'Voice chat',
                subtitle: 'Talk with Lucille out loud',
                onTap: () => v6Open(context, V6Routes.lucilleVoice),
              ),
            ]),
          ]),
          // Health.
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6SectionHeader('Health'),
            const SizedBox(height: 12),
            V6ListPanel(children: [
              V6Row(
                leading: const V6RowIcon(Icons.favorite_border_rounded),
                title: s.healthConnected ? 'Connected to $_healthName' : 'Connect $_healthName',
                subtitle: 'Escape reads heart rate, HRV and sleep to tune sessions, and saves your '
                    'mindful minutes and moods there. Nothing is shared with anyone else.',
                trailing: _healthBusy
                    ? const SizedBox(width: 50, height: 30, child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))))
                    : V6Toggle(on: s.healthConnected, onChanged: _toggleHealth, label: 'Connect $_healthName'),
              ),
            ]),
          ]),
          // Personalisation.
          V6ListPanel(children: [
            V6Row(
              leading: const V6RowIcon(Icons.auto_awesome_outlined),
              title: 'Personalize from my mood',
              subtitle: 'Use check-ins to tailor suggestions',
              trailing: V6Toggle(on: s.personalizeFromMood, onChanged: s.setPersonalize, label: 'Personalize from my mood'),
            ),
          ]),
        ]);
      }),
    );
  }
}

class _ModeTile extends StatelessWidget {
  const _ModeTile({required this.mode, required this.selected, required this.onTap});
  final V6ThemeMode mode;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final label = switch (mode) {
      V6ThemeMode.auto => 'Auto',
      V6ThemeMode.day => 'Day',
      V6ThemeMode.night => 'Night',
    };
    // The live sun/moon orb shows what the app looks like right now; the other tiles show
    // their fixed sun or moon.
    final Widget orb = switch (mode) {
      V6ThemeMode.auto => const V6DayNightOrb(size: 36, interactive: false),
      V6ThemeMode.day => const _StaticOrb(day: true),
      V6ThemeMode.night => const _StaticOrb(day: false),
    };
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      child: V6Glass(
        radius: 22,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        border: selected ? p.ink : null,
        onTap: onTap,
        semanticLabel: label,
        child: SizedBox(
          height: 76,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 40, child: Center(child: orb)),
            const SizedBox(height: 10),
            V6Text(label, size: 14, weight: selected ? FontWeight.w700 : FontWeight.w500),
          ]),
        ),
      ),
    );
  }
}

class _StaticOrb extends StatelessWidget {
  const _StaticOrb({required this.day});
  final bool day;

  @override
  Widget build(BuildContext context) {
    // Figma: DayNightOrb force day/night at 40.
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: day
            ? const RadialGradient(
                center: Alignment(-0.2, -0.3),
                colors: [Colors.white, Color(0xFFF6F8FF), Color(0xFFFFD9A8), Color(0xFFF08A1D)],
                stops: [0, 0.35, 0.75, 1],
              )
            : const RadialGradient(
                center: Alignment(-0.3, -0.4),
                colors: [Color(0xFFE6EAF4), Color(0xFFB9A3F0), Color(0xFF39519F)],
                stops: [0, 0.45, 1],
              ),
        boxShadow: [BoxShadow(color: day ? const Color(0xBFFFD6A0) : const Color(0x8CB9A3F0), blurRadius: 18)],
      ),
      child: day
          ? null
          : ClipOval(
              child: Stack(children: [
                Positioned(
                  top: -7.2,
                  left: 12.8,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xC70B1230)),
                  ),
                ),
              ]),
            ),
    );
  }
}
