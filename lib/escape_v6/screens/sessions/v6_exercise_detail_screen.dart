// Escape v6 — Exercise detail (Figma Make: Sessions.tsx › DetailLayout / ExerciseDetail).
//
// Founder reference: full-bleed photo (or a big live orb in the session palette), title +
// category top-left, a glass info card near the bottom ("6 min · Quiet spot") that expands into
// steps and benefits, then a round list button + a wide "Start" pill in the thumb zone.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_session_common.dart';

const _onPhoto = Colors.white;
const _onPhotoMuted = Color(0xD9FFFFFF);

class V6ExerciseDetailScreen extends StatefulWidget {
  const V6ExerciseDetailScreen({super.key, required this.id});
  final String id;

  @override
  State<V6ExerciseDetailScreen> createState() => _V6ExerciseDetailScreenState();
}

class _V6ExerciseDetailScreenState extends State<V6ExerciseDetailScreen> {
  bool _expanded = false;

  void _start(V6Exercise e) => v6Open(context, '${V6Routes.player}?id=${e.id}');

  /// [themed] must sit inside V6Page so the sheet takes the session palette.
  void _stepsSheet(BuildContext themed, V6Exercise e) {
    showV6Sheet<void>(
      themed,
      title: 'How it works',
      builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _StepsAndBenefits(e: e),
        const SizedBox(height: 22),
        V6PrimaryPill(
          label: 'Start',
          icon: Icons.play_arrow_rounded,
          onTap: () {
            Navigator.of(ctx).pop();
            if (mounted) _start(e);
          },
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final e = v6Exercise(widget.id);
    if (e == null) return const _MovedState();
    final hasPhoto = e.image != null;
    // Photography always gets light ink + a scrim so text stays legible in Day mode.
    return V6Page(
      activity: hasPhoto ? V6PaletteId.night : e.palette,
      showMedia: !hasPhoto,
      child: Builder(builder: (context) {
        final mq = MediaQuery.of(context);
        final p = V6Theme.of(context);
        final ink = hasPhoto ? _onPhoto : p.ink;
        final muted = hasPhoto ? _onPhotoMuted : p.inkMuted;
        return Stack(children: [
          if (hasPhoto) ...[
            Positioned.fill(
              child: V6Photo(
                url: e.image,
                height: mq.size.height,
                radius: 0,
                heroTag: e.heroTag,
                semanticLabel: '',
              ),
            ),
            const Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x8C05081A), Color(0x1A05081A), Color(0x4005081A), Color(0xE605081A)],
                      stops: [0, 0.35, 0.6, 1],
                    ),
                  ),
                ),
              ),
            ),
          ],
          // Fills the screen when it fits; scrolls instead of overflowing on a 360×640 phone with
          // large text and the info card expanded.
          CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(height: mq.padding.top + 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
              child: Row(children: [
                V6IconButton(
                  icon: Icons.keyboard_arrow_down_rounded,
                  label: 'Close',
                  onTap: () => Navigator.of(context).maybePop(),
                ),
                const Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
              child: V6Rise(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Semantics(header: true, child: Text(e.title, style: V6Type.displayStyle(34, ink))),
                  const SizedBox(height: 6),
                  Text(e.category.toUpperCase(), style: V6Type.eyebrow(muted)),
                  const SizedBox(height: 12),
                  Text(e.summary, style: V6Type.body(15, muted)),
                ]),
              ),
            ),
            Expanded(
              child: hasPhoto
                  ? const SizedBox()
                  : Center(
                      child: V6MoodOrb(
                        mood: v6ExerciseMood(e),
                        // Figma: 200 pt; shrinks on short phones so Start stays in view.
                        size: (mq.size.height * 0.28).clamp(140.0, 200.0),
                        glow: true,
                        live: true,
                        heroTag: e.heroTag,
                        semanticLabel: '${e.title} orb',
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(V6Space.gutter, 0, V6Space.gutter, 20 + mq.padding.bottom),
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                V6Rise(index: 1, child: _InfoCard(e: e, expanded: _expanded, onTap: () => setState(() => _expanded = !_expanded))),
                const SizedBox(height: 12),
                V6Rise(
                  index: 2,
                  child: Row(children: [
                    V6IconButton(
                      icon: Icons.format_list_bulleted_rounded,
                      label: 'How it works',
                      size: 56,
                      onTap: () => _stepsSheet(context, e),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: V6PrimaryPill(label: 'Start', icon: Icons.play_arrow_rounded, onTap: () => _start(e)),
                    ),
                  ]),
                ),
              ]),
            ),
              ]),
            ),
          ]),
        ]);
      }),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.e, required this.expanded, required this.onTap});
  final V6Exercise e;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final maxH = MediaQuery.sizeOf(context).height * 0.34;
    return V6Glass(
      radius: 22,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Semantics(
          button: true,
          expanded: expanded,
          label: '${e.minutes} minutes. ${e.needs}. ${expanded ? 'Hide steps' : 'Show steps'}',
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: ExcludeSemantics(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Row(children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                      V6Text('${e.minutes} min · ${e.needs}', size: 16, weight: FontWeight.w600),
                      if (e.breath != null) ...[
                        const SizedBox(height: 2),
                        V6Text(e.breath!.label, size: 13, ink: V6Ink.muted),
                      ],
                    ]),
                  ),
                  AnimatedRotation(
                    turns: expanded ? 0.5 : 0,
                    duration: V6Motion.quick,
                    child: Icon(Icons.keyboard_arrow_up_rounded, color: p.inkMuted),
                  ),
                ]),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 320),
          curve: V6Motion.ease,
          alignment: Alignment.topCenter,
          child: expanded
              ? ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxH),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 14),
                    child: _StepsAndBenefits(e: e),
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
      ]),
    );
  }
}

class _StepsAndBenefits extends StatelessWidget {
  const _StepsAndBenefits({required this.e});
  final V6Exercise e;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      for (var i = 0; i < e.steps.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: p.accentSoft,
                border: Border.all(color: p.glassBorder),
              ),
              child: V6Text('${i + 1}', size: 12, weight: FontWeight.w600, height: 1),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: V6Text(e.steps[i], size: 15, weight: FontWeight.w500),
              ),
            ),
          ]),
        ),
      if (e.benefits.isNotEmpty) ...[
        const SizedBox(height: 4),
        const V6Eyebrow('Why it helps'),
        const SizedBox(height: 10),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final b in e.benefits)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: p.glass[1],
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: p.glassBorder),
              ),
              child: V6Text(b, size: 13, height: 1.2),
            ),
        ]),
      ],
    ]);
  }
}

/// Unknown id (old deeplink, removed session): never a crash or a blank page.
class _MovedState extends StatelessWidget {
  const _MovedState();

  @override
  Widget build(BuildContext context) {
    void back() {
      final nav = Navigator.of(context);
      if (nav.canPop()) {
        nav.pop();
      } else {
        v6Open(context, V6Routes.tabExplore);
      }
    }

    return V6Page(
      child: V6ActionPage(
        top: V6TopBar(onBack: back),
        children: [
          const SizedBox(height: 40),
          const Center(child: V6MoodOrb(mood: null, size: 120, live: true)),
          Semantics(header: true, child: const V6Display('This session moved', size: 30, align: TextAlign.center)),
          const V6Text(
            "We couldn't find it. It may have been renamed or retired. Explore has everything that's here now.",
            ink: V6Ink.muted,
            align: TextAlign.center,
          ),
        ],
        footer: [
          V6PrimaryPill(label: 'Back', onTap: back),
          V6Link(label: 'Go to Explore', onTap: () => v6Open(context, V6Routes.tabExplore)),
        ],
      ),
    );
  }
}
