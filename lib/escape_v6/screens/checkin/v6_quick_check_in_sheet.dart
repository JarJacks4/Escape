// Escape v6 — Quick check-in bottom sheet from Home (Figma Make: CheckIn.tsx DailyCheckInSheet).
// Six small orbs + energy + Save. Low moods open the gentle support sheet once it closes.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/escape_v6/v6.dart';
import 'v6_checkin_parts.dart';

class _QuickResult {
  const _QuickResult(this.mood, this.energy, {this.moreDetail = false});
  final V6Mood? mood;
  final double energy;
  final bool moreDetail;
}

/// Opens the quick check-in sheet. Resolves once the sheet (and any follow-up) is done.
Future<void> showV6QuickCheckIn(BuildContext context) async {
  final s = V6Store.instance;
  final r = await showV6Sheet<_QuickResult>(
    context,
    title: 'Quick check-in',
    builder: (ctx) => const _QuickBody(),
  );
  if (r == null || r.moreDetail) {
    // Closed without saving: never leave the preview colouring the app.
    s.setPreviewMood(null);
    if (r?.moreDetail == true && context.mounted) await v6Open(context, V6Routes.checkIn);
    return;
  }
  final mood = r.mood;
  if (mood == null) return;
  final today = s.checkIn.isToday ? s.checkIn : null;
  unawaited(s
      .completeCheckIn(V6CheckIn(
        mood: mood,
        energy: r.energy,
        tags: today?.tags ?? const [],
        intention: today?.intention,
      ))
      .then((_) {}, onError: (Object e) => debugPrint('V6QuickCheckIn save: $e')));
  if (v6NeedsSupport(mood, r.energy)) {
    await Future.delayed(const Duration(milliseconds: 400));
    if (context.mounted) await showV6Support(context, V6SupportLevel.gentle);
  }
}

class _QuickBody extends StatefulWidget {
  const _QuickBody();

  @override
  State<_QuickBody> createState() => _QuickBodyState();
}

class _QuickBodyState extends State<_QuickBody> {
  V6Mood? _mood;
  double _energy = 0.5;

  @override
  void initState() {
    super.initState();
    final c = V6Store.instance.checkIn;
    if (c.isToday) {
      _mood = c.mood;
      _energy = c.energy;
    }
  }

  void _pick(V6Mood m) {
    HapticFeedback.selectionClick();
    setState(() => _mood = m);
    V6Store.instance.setPreviewMood(m);
  }

  @override
  Widget build(BuildContext context) {
    final mood = _mood;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
      const V6Text('Pick the orb that feels closest.', ink: V6Ink.muted),
      const SizedBox(height: 14),
      V6CheckInMoodRow(value: mood, onChanged: _pick, orbSize: 52, fit: true),
      const SizedBox(height: 18),
      V6CheckInEnergySlider(value: _energy, onChanged: (v) => setState(() => _energy = v)),
      const SizedBox(height: 18),
      V6PrimaryPill(
        label: 'Save check-in',
        onTap: mood == null
            ? null
            : () {
                HapticFeedback.mediumImpact();
                Navigator.of(context).pop(_QuickResult(mood, _energy));
              },
      ),
      const SizedBox(height: 4),
      Center(
        child: V6Link(
          label: 'More detail',
          onTap: () => Navigator.of(context).pop(_QuickResult(mood, _energy, moreDetail: true)),
        ),
      ),
    ]);
  }
}
