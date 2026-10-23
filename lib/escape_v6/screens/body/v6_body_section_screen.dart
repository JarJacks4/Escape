// Escape v6 — one Body section (Yoga, Pilates, Yang Tai Chi, Exercise): its 10 moves, a preview
// sheet per move (steps + 3D model) and "Start all 10".
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_body_content.dart';

class V6BodySectionScreen extends StatelessWidget {
  const V6BodySectionScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final s = bodySectionById(id);
    final full = v6BodyRoutine('full-${s.id}');
    final with3d = s.moves.where((m) => v6GlbFor(m) != null).length;
    final themed = v6BodyRoutinesFor(s.id).where((r) => !r.isFull).toList();
    return V6Page(
      activity: V6PaletteId.body,
      child: V6ActionPage(
        top: V6TopBar(title: s.title, subtitle: s.type),
        footer: [
          V6PrimaryPill(
            label: 'Start all ${s.moves.length}',
            icon: Icons.play_arrow_rounded,
            onTap: full == null ? null : () => v6Open(context, '${V6Routes.bodyPlayer}?id=${full.id}'),
          ),
        ],
        children: [
          _SectionHeader(section: s, minutes: full?.minutes, with3d: with3d),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            V6SectionHeader('${s.moves.length} moves'),
            const SizedBox(height: 4),
            const V6Text('Tap a move to see how to do it.', size: 13, ink: V6Ink.faint),
            const SizedBox(height: 12),
            for (var i = 0; i < s.moves.length; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              _MoveRow(section: s, move: s.moves[i], index: i),
            ],
          ]),
          if (themed.isNotEmpty)
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const V6SectionHeader('Shorter routines'),
              const SizedBox(height: 12),
              for (final r in themed) ...[
                V6Glass(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  radius: V6Space.radiusCard,
                  child: V6Row(
                    title: r.title,
                    subtitle: '${r.minutes} min · ${r.moves.length} moves · ${r.intensity}',
                    leading: V6IconBadge(icon: s.icon, color: s.color, size: 40),
                    onTap: () => v6Open(context, '${V6Routes.bodyDetail}?id=${r.id}'),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ]),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.section, required this.minutes, required this.with3d});
  final BodySection section;
  final int? minutes;
  final int with3d;

  @override
  Widget build(BuildContext context) {
    final s = section;
    return V6Glass(
      tint: s.color,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [s.color.withOpacity(0.55), s.color.withOpacity(0.08)]),
            border: Border.all(color: s.color.withOpacity(0.5)),
            boxShadow: [BoxShadow(color: s.color.withOpacity(0.35), blurRadius: 28)],
          ),
          child: Icon(s.icon, size: 30, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Semantics(header: true, child: V6Display(s.title, size: 30)),
            const SizedBox(height: 4),
            V6Text(s.tagline, ink: V6Ink.muted),
            const SizedBox(height: 10),
            V6Text(
              [
                '${s.moves.length} moves',
                if (minutes != null) 'about $minutes min',
                if (with3d > 0) '$with3d with 3D guide',
              ].join(' · '),
              size: 12,
              ink: V6Ink.faint,
            ),
          ]),
        ),
      ]),
    );
  }
}

class _MoveRow extends StatelessWidget {
  const _MoveRow({required this.section, required this.move, required this.index});
  final BodySection section;
  final BodyMove move;
  final int index;

  @override
  Widget build(BuildContext context) {
    final m = move;
    final has3d = v6GlbFor(m) != null;
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.all(14),
      radius: V6Space.radiusCard,
      onTap: () => showV6MovePreview(context, m, section),
      semanticLabel: '${index + 1}. ${m.name}. ${m.cue}. ${v6BodyMoveLabel(m)}${has3d ? '. 3D guide' : ''}',
      child: ExcludeSemantics(
        child: Row(children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: section.color.withOpacity(0.16),
              border: Border.all(color: section.color.withOpacity(0.4)),
            ),
            child: Text('${index + 1}', style: V6Type.body(13, p.ink, weight: FontWeight.w600, height: 1)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Flexible(child: V6Text(m.name, size: 15, weight: FontWeight.w600, maxLines: 1)),
                if (has3d) ...[const SizedBox(width: 8), const V6Body3dBadge()],
              ]),
              const SizedBox(height: 2),
              V6Text(m.cue, size: 13, ink: V6Ink.muted, maxLines: 2),
            ]),
          ),
          const SizedBox(width: 10),
          V6Text(v6BodyMoveLabel(m), size: 12, ink: V6Ink.faint, weight: FontWeight.w500),
        ]),
      ),
    );
  }
}

/// Bottom sheet: the move's 3D model (with Start / End switch when it has two), cue and steps.
Future<void> showV6MovePreview(BuildContext context, BodyMove move, BodySection section) =>
    showV6Sheet<void>(context, title: move.name, builder: (_) => _MovePreview(move: move, section: section));

class _MovePreview extends StatefulWidget {
  const _MovePreview({required this.move, required this.section});
  final BodyMove move;
  final BodySection section;

  @override
  State<_MovePreview> createState() => _MovePreviewState();
}

class _MovePreviewState extends State<_MovePreview> {
  int _model = 0;

  @override
  Widget build(BuildContext context) {
    final m = widget.move;
    final glbs = v6GlbsFor(m);
    final labels = m.stepLabels;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      V6Text('${widget.section.type} · ${v6BodyMoveLabel(m)}', size: 13, ink: V6Ink.faint),
      const SizedBox(height: 14),
      ClipRRect(
        borderRadius: BorderRadius.circular(V6Space.radiusCard),
        child: Container(
          height: 280,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, 0.6),
              radius: 1,
              colors: [Color(0x4038BDF8), Color(0x0F34D399), Color(0x00030508)],
            ),
          ),
          child: glbs.isEmpty
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  V6BodySilhouette(height: 200, color: widget.section.color),
                  const SizedBox(height: 8),
                  const V6Text('3D move coming soon', size: 12, ink: V6Ink.faint),
                ])
              : V6Fade(
                  child: V6BodyModel(
                    key: ValueKey(glbs[_model.clamp(0, glbs.length - 1)]),
                    glb: glbs[_model.clamp(0, glbs.length - 1)],
                    alt: m.name,
                  ),
                ),
        ),
      ),
      if (glbs.length > 1) ...[
        const SizedBox(height: 12),
        Wrap(spacing: 8, children: [
          for (var i = 0; i < glbs.length; i++)
            V6Chip(
              label: i < labels.length ? labels[i] : 'Step ${i + 1}',
              selected: i == _model,
              onTap: () => setState(() => _model = i),
            ),
        ]),
      ],
      const SizedBox(height: 16),
      V6Text(m.cue, size: 16, weight: FontWeight.w500),
      const SizedBox(height: 16),
      const V6Eyebrow('How to do it'),
      const SizedBox(height: 10),
      V6BodySteps(steps: m.steps),
    ]);
  }
}
