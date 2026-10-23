// Escape v6 — Mind (Figma Make: MindReset.tsx › Mind + EnergyCenterBottomSheet).
//
// Lucille's pick (from today's check-in, with the reason), the seven energy centers, then guided
// sessions grouped Breathe / Meditate / Focus / Sleep / Energy with a chip filter.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import '../sessions/v6_session_common.dart';

const _kMindGroups = ['Breathe', 'Meditate', 'Focus', 'Sleep', 'Energy'];

/// Lucille's pick for the Mind page (Figma `lucillePick`).
String _mindPick(V6Mood? m) => switch (m) {
      V6Mood.restless => 'adhd-overthinking',
      V6Mood.tired => 'deep-sleep',
      V6Mood.focused || V6Mood.energized => 'increase-focus',
      V6Mood.low => 'long-exhale',
      _ => 'anxiety-relief',
    };

class V6MindScreen extends StatefulWidget {
  const V6MindScreen({super.key});

  @override
  State<V6MindScreen> createState() => _V6MindScreenState();
}

class _V6MindScreenState extends State<V6MindScreen> {
  String _group = 'All';

  /// [themed] must sit inside V6Page so the sheet takes the page palette.
  void _openCenter(BuildContext themed, V6EnergyCenter c) {
    final page = themed;
    showV6Sheet<void>(
      themed,
      title: '${c.name} center',
      builder: (ctx) {
        final practice = v6Exercise(c.exerciseId);
        return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            V6CenterOrb(color: c.color, size: 64),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const V6Eyebrow('Supports', ink: V6Ink.faint),
                const SizedBox(height: 2),
                V6Display(c.focus, size: 22),
              ]),
            ),
          ]),
          const SizedBox(height: 18),
          V6Glass(
            padding: const EdgeInsets.all(16),
            radius: 18,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const V6Eyebrow('Affirmation', ink: V6Ink.accent),
              const SizedBox(height: 6),
              V6Display('“${c.affirmation}”', size: 20),
            ]),
          ),
          const SizedBox(height: 16),
          const V6Text(
            "Rest your attention where this center lives. Breathe toward it for a few minutes, and notice "
            "what softens. There's no right way to feel it.",
            ink: V6Ink.muted,
          ),
          if (practice != null) ...[
            const SizedBox(height: 10),
            V6Text('Practice: ${practice.title} · ${practice.minutes} min', size: 13, ink: V6Ink.faint),
          ],
          const SizedBox(height: 22),
          V6PrimaryPill(
            label: 'Start a short practice',
            icon: Icons.play_arrow_rounded,
            onTap: () {
              Navigator.of(ctx).pop();
              if (page.mounted) v6Open(page, '${V6Routes.exercise}?id=${c.exerciseId}');
            },
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: Stack(children: [
        V6Watch(builder: (context, s) {
          final mood = s.currentMood;
          final pick = v6Exercise(_mindPick(mood)) ?? kV6Exercises.first;
          return V6ScrollPage(
            withNav: false,
            gap: 22,
            children: [
              const V6TopBar(
                large: true,
                title: 'Mind',
                subtitle: 'Quiet the noise, one breath at a time.',
                actions: [V6HelpButton(page: 'mind')],
              ),
              _PickCard(pick: pick, mood: mood),
              _centers(context),
              _sessions(),
            ],
          );
        }),
        const V6AutoHelp(page: 'mind'),
      ]),
    );
  }

  Widget _centers(BuildContext themed) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const V6SectionHeader('Energy centers'),
      const SizedBox(height: 12),
      V6HelpTarget(
        id: 'mind.centers',
        child: SizedBox(
          height: 92,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: kV6EnergyCenters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, i) {
              final c = kV6EnergyCenters[i];
              return V6Pressable(
                onTap: () => _openCenter(themed, c),
                semanticLabel: '${c.name} center. ${c.focus}',
                child: SizedBox(
                  width: 68,
                  child: Column(children: [
                    const SizedBox(height: 4),
                    V6CenterOrb(color: c.color),
                    const SizedBox(height: 8),
                    V6Text(c.name, size: 11, weight: FontWeight.w500, ink: V6Ink.muted, align: TextAlign.center, maxLines: 2, height: 1.2),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }

  Widget _sessions() {
    final mind = kV6Exercises.where((e) => e.area == 'mind').toList();
    final groups = _group == 'All' ? _kMindGroups : [_group];
    final sections = <Widget>[];
    for (final g in groups) {
      final items = mind.where((e) => e.group == g).toList();
      if (items.isEmpty) continue;
      if (_group == 'All') {
        sections.add(Padding(
          padding: EdgeInsets.only(top: sections.isEmpty ? 0 : 18, bottom: 8, left: 4),
          child: V6Eyebrow(g),
        ));
      }
      sections.add(V6ExerciseList(items: items));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const V6SectionHeader('Guided sessions'),
      const SizedBox(height: 12),
      SizedBox(
        height: 48,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          itemCount: _kMindGroups.length + 1,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, i) {
            final g = i == 0 ? 'All' : _kMindGroups[i - 1];
            return Center(
              child: V6Chip(label: g, selected: _group == g, onTap: () => setState(() => _group = g)),
            );
          },
        ),
      ),
      const SizedBox(height: 14),
      V6HelpTarget(
        id: 'mind.sessions',
        child: V6Fade(
          child: Column(
            key: ValueKey(_group),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: sections,
          ),
        ),
      ),
    ]);
  }
}

class _PickCard extends StatelessWidget {
  const _PickCard({required this.pick, required this.mood});
  final V6Exercise pick;
  final V6Mood? mood;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final why = mood == null
        ? 'A gentle place to start'
        : "Because you're feeling ${moodOption(mood!).label.toLowerCase()}";
    return V6Glass(
      padding: const EdgeInsets.all(18),
      onTap: () => v6Open(context, '${V6Routes.exercise}?id=${pick.id}'),
      semanticLabel: 'Let Lucille choose: ${pick.title}. $why. ${pick.minutes} minutes',
      child: Row(children: [
        V6MoodOrb(mood: mood ?? V6Mood.calm, size: 64, glow: true, live: true),
        const SizedBox(width: 16),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const V6Eyebrow('Let Lucille choose', ink: V6Ink.faint),
            const SizedBox(height: 3),
            V6Display(pick.title, size: 22, maxLines: 2),
            const SizedBox(height: 3),
            V6Text('$why · ${pick.minutes} min', size: 13, ink: V6Ink.muted),
          ]),
        ),
        const SizedBox(width: 8),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(color: p.ink, shape: BoxShape.circle),
          child: Icon(Icons.play_arrow_rounded, color: p.onInk, size: 24),
        ),
      ]),
    );
  }
}
