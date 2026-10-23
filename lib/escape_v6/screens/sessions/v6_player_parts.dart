// Escape v6 — pieces of the exercise player: bottom dock, grounding card, missing state.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';

/// Bottom dock in the thumb zone: haptics / voice toggles, then progress ring · Pause · End.
/// Pause is the largest control. While paused the ring hides the clock (no time pressure).
class V6PlayerDock extends StatelessWidget {
  const V6PlayerDock({
    super.key,
    required this.paused,
    required this.finishing,
    required this.progress,
    required this.ringLabel,
    required this.ringSemantics,
    required this.showHaptics,
    required this.haptics,
    required this.onHaptics,
    required this.voice,
    required this.onVoice,
    required this.onPause,
    required this.onEnd,
  });

  final bool paused;
  final bool finishing;
  final double progress;
  final String ringLabel;
  final String ringSemantics;
  final bool showHaptics;
  final bool haptics;
  final ValueChanged<bool> onHaptics;
  final bool voice;
  final ValueChanged<bool> onVoice;
  final VoidCallback onPause;
  final VoidCallback onEnd;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      radius: 32,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // Wrap, not Row: at 360 pt with 1.3× text the two pills no longer fit on one line.
        Wrap(alignment: WrapAlignment.center, spacing: 8, runSpacing: 8, children: [
          if (showHaptics)
            _DockToggle(icon: Icons.vibration_rounded, label: 'Haptics', on: haptics, onChanged: onHaptics),
          _DockToggle(icon: Icons.record_voice_over_rounded, label: "Lucille's voice", on: voice, onChanged: onVoice),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          V6Ring(
            value: progress,
            size: 56,
            stroke: 4,
            semanticLabel: paused ? 'Paused' : ringSemantics,
            child: V6Fade(
              child: paused
                  ? Icon(Icons.spa_rounded, key: const ValueKey('p'), size: 20, color: p.inkMuted)
                  : V6Text(ringLabel, key: const ValueKey('t'), size: 12, weight: FontWeight.w600, height: 1),
            ),
          ),
          V6Pressable(
            onTap: finishing ? null : onPause,
            semanticLabel: paused ? 'Resume' : 'Pause',
            scale: 0.94,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: p.ink,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: p.glowB.withOpacity(0.35), blurRadius: 24)],
              ),
              child: V6Fade(
                duration: V6Motion.quick,
                child: Icon(
                  paused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                  key: ValueKey(paused),
                  size: 38,
                  color: p.onInk,
                ),
              ),
            ),
          ),
          V6IconButton(
            icon: Icons.close_rounded,
            label: 'End session',
            size: 56,
            onTap: finishing ? null : onEnd,
          ),
        ]),
      ]),
    );
  }
}

class _DockToggle extends StatelessWidget {
  const _DockToggle({required this.icon, required this.label, required this.on, required this.onChanged});
  final IconData icon;
  final String label;
  final bool on;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final fg = on ? p.onInk : p.inkMuted;
    return Semantics(
      toggled: on,
      child: V6Pressable(
        onTap: () => onChanged(!on),
        semanticLabel: label,
        child: AnimatedContainer(
          duration: V6Motion.quick,
          constraints: const BoxConstraints(minHeight: 48),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: on ? p.ink : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: on ? p.ink : p.glassBorder),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, size: 16, color: fg),
            const SizedBox(width: 6),
            Text(label, style: V6Type.body(13, fg, weight: FontWeight.w500, height: 1.2)),
          ]),
        ),
      ),
    );
  }
}

/// One 5·4·3·2·1 grounding step.
class V6GroundCard extends StatelessWidget {
  const V6GroundCard({super.key, required this.count, required this.text});
  final int count;
  final String text;

  @override
  Widget build(BuildContext context) => Semantics(
        liveRegion: true,
        label: text,
        child: ExcludeSemantics(
          child: V6Glass(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              V6Display('$count', size: 48, ink: V6Ink.accent),
              const SizedBox(height: 6),
              V6Display(text, size: 24, align: TextAlign.center),
              const SizedBox(height: 8),
              const V6Text('Take your time with each one.', size: 13, ink: V6Ink.faint, align: TextAlign.center),
            ]),
          ),
        ),
      );
}

/// Unknown session id in the player.
class V6PlayerMissing extends StatelessWidget {
  const V6PlayerMissing({super.key});

  @override
  Widget build(BuildContext context) => V6Page(
        child: V6ActionPage(
          top: const V6TopBar(closeIcon: true),
          children: [
            const SizedBox(height: 40),
            const Center(child: V6MoodOrb(mood: null, size: 120, live: true)),
            Semantics(header: true, child: const V6Display('This session moved', size: 30, align: TextAlign.center)),
            const V6Text("We couldn't find it. Explore has everything that's here now.",
                ink: V6Ink.muted, align: TextAlign.center),
          ],
          footer: [
            V6PrimaryPill(label: 'Back', onTap: () => Navigator.of(context).maybePop()),
            V6Link(label: 'Go to Explore', onTap: () => v6Open(context, V6Routes.tabExplore)),
          ],
        ),
      );
}
