// Escape v6 — Reset (Figma Make: MindReset.tsx › Reset).
//
// Built for hard moments (Hick's law): ONE obvious tool first (One-Minute Reset starts straight
// away), then a few calm choices, and human support always visible at the bottom.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import '../sessions/v6_session_common.dart';

class V6ResetScreen extends StatelessWidget {
  const V6ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final breathing = kV6Exercises.where((e) => e.area == 'reset' && e.group == 'Breathing').toList();
    final grounding = kV6Exercises.where((e) => e.area == 'reset' && e.group == 'Grounding').toList();
    final nature = kV6Exercises.where((e) => e.area == 'reset' && e.group == 'Nature').toList();
    return V6Page(
      child: Stack(children: [
        V6ScrollPage(
          withNav: false,
          gap: 22,
          children: [
            const V6TopBar(
              large: true,
              title: 'Reset',
              subtitle: 'Small tools for big moments.',
              actions: [V6HelpButton(page: 'reset')],
            ),
            const V6HelpTarget(id: 'reset.quick', child: _QuickReset()),
            if (breathing.isNotEmpty)
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const V6SectionHeader('Breathing'),
                const SizedBox(height: 12),
                IntrinsicHeight(
                  child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    for (var i = 0; i < breathing.length; i++) ...[
                      if (i > 0) const SizedBox(width: 10),
                      Expanded(child: _BreathTile(e: breathing[i])),
                    ],
                  ]),
                ),
              ]),
            if (grounding.isNotEmpty)
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const V6SectionHeader('Grounding'),
                const SizedBox(height: 12),
                V6Glass(
                  padding: const EdgeInsets.all(6),
                  child: Column(children: [
                    for (var i = 0; i < grounding.length; i++) V6ExerciseRow(exercise: grounding[i], divider: i > 0),
                    _JournalRow(divider: grounding.isNotEmpty),
                  ]),
                ),
              ]),
            if (nature.isNotEmpty)
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const V6SectionHeader('Nature'),
                const SizedBox(height: 12),
                SizedBox(
                  height: 190,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    itemCount: nature.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, i) => _NatureCard(e: nature[i]),
                  ),
                ),
              ]),
            const V6HelpTarget(id: 'reset.support', child: _SupportCard()),
            const _LucilleHint(),
          ],
        ),
        const V6AutoHelp(page: 'reset'),
      ]),
    );
  }
}

class _QuickReset extends StatelessWidget {
  const _QuickReset();

  @override
  Widget build(BuildContext context) {
    final e = v6Exercise('one-minute-reset');
    if (e == null) return const SizedBox.shrink();
    void start() => v6Open(context, '${V6Routes.player}?id=${e.id}');
    return V6Glass(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        V6Pressable(
          onTap: () => v6Open(context, '${V6Routes.exercise}?id=${e.id}'),
          semanticLabel: '${e.title} details',
          child: Row(children: [
            // Continues into the detail page / player orb (same exercise heroTag, unique on this page).
            V6MoodOrb(mood: v6ExerciseMood(e), size: 72, glow: true, live: true, heroTag: e.heroTag),
            const SizedBox(width: 16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const V6Eyebrow('Fastest relief · 60 sec', ink: V6Ink.faint),
                const SizedBox(height: 4),
                Semantics(header: true, child: V6Display(e.title, size: 24)),
                const SizedBox(height: 4),
                V6Text(e.summary, size: 13, ink: V6Ink.muted),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 16),
        V6PrimaryPill(label: 'Start now', icon: Icons.play_arrow_rounded, onTap: start),
      ]),
    );
  }
}

class _BreathTile extends StatelessWidget {
  const _BreathTile({required this.e});
  final V6Exercise e;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final b = e.breath;
    final pattern = b == null
        ? ''
        : [b.inhale, if (b.hold > 0) b.hold, b.exhale, if (b.rest > 0) b.rest].join('·');
    return V6Glass(
      padding: const EdgeInsets.all(14),
      radius: 20,
      onTap: () => v6Open(context, '${V6Routes.exercise}?id=${e.id}'),
      semanticLabel: '${e.title}. ${b?.label ?? ''}. ${e.minutes} minutes',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.air_rounded, size: 22, color: p.accent),
        const SizedBox(height: 16),
        V6Text(e.title.replaceFirst('Calm Breathing ', ''), size: 14, weight: FontWeight.w600),
        const SizedBox(height: 2),
        V6Text('${pattern.isEmpty ? '' : '$pattern · '}${e.minutes} min', size: 12, ink: V6Ink.faint),
      ]),
    );
  }
}

class _NatureCard extends StatelessWidget {
  const _NatureCard({required this.e});
  final V6Exercise e;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: () => v6Open(context, '${V6Routes.exercise}?id=${e.id}'),
      semanticLabel: '${e.title}. ${e.minutes} minutes',
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: p.glassBorder),
        ),
        child: V6Photo(
          url: e.image,
          height: 190,
          radius: 22,
          heroTag: e.heroTag,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.title, style: V6Type.displayStyle(19, Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text('${e.minutes} min', style: V6Type.body(12, const Color(0xCCE6EAF4))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _JournalRow extends StatelessWidget {
  const _JournalRow({required this.divider});
  final bool divider;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: () => v6Open(context, 'journal'),
      semanticLabel: 'Write it out. Journal, 3 minutes',
      child: Container(
        constraints: const BoxConstraints(minHeight: 68),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(border: divider ? Border(top: BorderSide(color: p.glassBorder)) : null),
        child: Row(children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: p.accentSoft, borderRadius: BorderRadius.circular(16)),
            child: Icon(Icons.edit_rounded, size: 20, color: p.isLight ? p.ink : p.accent),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              V6Text('Write it out', size: 15, weight: FontWeight.w600),
              SizedBox(height: 2),
              V6Text('Journal · 3 min', size: 13, ink: V6Ink.faint),
            ]),
          ),
          Icon(Icons.chevron_right_rounded, size: 20, color: p.inkFaint),
        ]),
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard();

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.all(18),
      onTap: () => showV6Support(context, V6SupportLevel.urgent),
      semanticLabel: 'I need support now. Talk to a real person, any time',
      child: Row(children: [
        Icon(Icons.shield_outlined, size: 26, color: p.accent),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            V6Text('I need support now', size: 15, weight: FontWeight.w600),
            SizedBox(height: 2),
            V6Text('Talk to a real person, any time', size: 13, ink: V6Ink.faint),
          ]),
        ),
        Icon(Icons.chevron_right_rounded, size: 20, color: p.inkFaint),
      ]),
    );
  }
}

class _LucilleHint extends StatelessWidget {
  const _LucilleHint();

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.auto_awesome_rounded, size: 14, color: V6Theme.of(context).inkFaint),
        const SizedBox(width: 8),
        const Flexible(
          child: V6Text('Lucille can suggest a reset from your check-in', size: 12, ink: V6Ink.faint),
        ),
      ]);
}
