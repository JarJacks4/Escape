// Escape v6 — Body routine detail (Figma Make: Body.tsx → BodyDetail / DetailLayout).
//
// Hero art continues from the hub card (tag 'body-routine-{id}'), then the info card, every move
// with expandable steps, and Start in the thumb zone.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_body_content.dart';
import 'v6_body_section_screen.dart' show showV6MovePreview;

class V6BodyDetailScreen extends StatelessWidget {
  const V6BodyDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final r = v6BodyRoutine(id);
    if (r == null) {
      return V6Page(
        activity: V6PaletteId.body,
        child: V6ActionPage(
          top: const V6TopBar(),
          footer: [V6PrimaryPill(label: 'Back to Body', onTap: () => v6Open(context, V6Routes.body))],
          children: const [
            V6Display("This routine isn't here any more", size: 26),
            V6Text('It may have been renamed. Every routine is still on the Body page.', ink: V6Ink.muted),
          ],
        ),
      );
    }
    final s = r.section;
    return V6Page(
      activity: V6PaletteId.body,
      child: V6ActionPage(
        top: V6TopBar(title: r.title, subtitle: s.title),
        footer: [
          Row(children: [
            // Builder: the sheet must open from a context inside V6Page so it gets the Body palette.
            Builder(
              builder: (inner) => V6IconButton(
                icon: Icons.format_list_bulleted_rounded,
                label: 'See all ${r.moves.length} moves',
                size: V6Space.ctaHeight,
                onTap: () => _showMoveList(inner, r),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: V6PrimaryPill(
                label: 'Start',
                icon: Icons.play_arrow_rounded,
                onTap: () => v6Open(context, '${V6Routes.bodyPlayer}?id=${r.id}'),
              ),
            ),
          ]),
        ],
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(V6Space.radiusPanel),
            child: SizedBox(
              height: 240,
              child: Stack(fit: StackFit.expand, children: [
                V6Hero(tag: r.heroTag, child: V6BodyRoutineArt(routine: r)),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 18,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${s.type} · ${r.intensity}'.toUpperCase(), style: V6Type.eyebrow(const Color(0xD9FFFFFF))),
                    const SizedBox(height: 6),
                    Semantics(header: true, child: Text(r.title, style: V6Type.displayStyle(32, Colors.white))),
                  ]),
                ),
              ]),
            ),
          ),
          V6Glass(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(children: [
              Icon(Icons.schedule_rounded, size: 20, color: V6Theme.of(context).accent),
              const SizedBox(width: 12),
              Expanded(
                child: V6Text('${r.minutes} min · ${r.equipment} · ${r.intensity}',
                    size: 15, weight: FontWeight.w500),
              ),
            ]),
          ),
          V6Text(r.summary, ink: V6Ink.muted),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            V6SectionHeader('${r.moves.length} movements'),
            if (r.movesWith3d > 0) ...[
              const SizedBox(height: 4),
              V6Text('${r.movesWith3d} with a 3D guide', size: 12, ink: V6Ink.faint),
            ],
            const SizedBox(height: 12),
            for (var i = 0; i < r.moves.length; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              _ExpandableMove(move: r.moves[i], index: i, section: s),
            ],
          ]),
        ],
      ),
    );
  }

  void _showMoveList(BuildContext context, V6BodyRoutine r) {
    showV6Sheet<void>(
      context,
      title: '${r.moves.length} moves',
      builder: (ctx) => Column(mainAxisSize: MainAxisSize.min, children: [
        for (var i = 0; i < r.moves.length; i++)
          V6Row(
            title: '${i + 1}. ${r.moves[i].name}',
            subtitle: '${v6BodyMoveLabel(r.moves[i])} · ${r.moves[i].cue}',
            trailing: v6GlbFor(r.moves[i]) != null ? const V6Body3dBadge() : null,
            onTap: () {
              Navigator.of(ctx).pop();
              showV6MovePreview(context, r.moves[i], r.section);
            },
          ),
      ]),
    );
  }
}

class _ExpandableMove extends StatefulWidget {
  const _ExpandableMove({required this.move, required this.index, required this.section});
  final BodyMove move;
  final int index;
  final BodySection section;

  @override
  State<_ExpandableMove> createState() => _ExpandableMoveState();
}

class _ExpandableMoveState extends State<_ExpandableMove> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final m = widget.move;
    final p = V6Theme.of(context);
    final has3d = v6GlbFor(m) != null;
    return Semantics(
      expanded: _open,
      child: V6Glass(
        padding: const EdgeInsets.all(14),
        radius: V6Space.radiusCard,
        onTap: () => setState(() => _open = !_open),
        semanticLabel: '${widget.index + 1}. ${m.name}, ${v6BodyMoveLabel(m)}. ${_open ? 'Hide' : 'Show'} steps',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ExcludeSemantics(
            child: Row(children: [
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.section.color.withOpacity(0.16),
                  border: Border.all(color: widget.section.color.withOpacity(0.4)),
                ),
                child: Text('${widget.index + 1}', style: V6Type.body(13, p.ink, weight: FontWeight.w600, height: 1)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Flexible(child: V6Text(m.name, size: 15, weight: FontWeight.w600, maxLines: 1)),
                    if (has3d) ...[const SizedBox(width: 8), const V6Body3dBadge()],
                  ]),
                  V6Text('${v6BodyMoveLabel(m)} · ${m.cue}', size: 13, ink: V6Ink.muted, maxLines: _open ? null : 1),
                ]),
              ),
              AnimatedRotation(
                turns: _open ? 0.5 : 0,
                duration: V6Motion.quick,
                child: Icon(Icons.expand_more_rounded, color: p.inkFaint),
              ),
            ]),
          ),
          AnimatedSize(
            duration: V6Theme.motionOff(context) ? Duration.zero : const Duration(milliseconds: 280),
            curve: V6Motion.ease,
            alignment: Alignment.topCenter,
            child: _open
                ? Padding(padding: const EdgeInsets.only(top: 14, left: 4), child: V6BodySteps(steps: m.steps, size: 13))
                : const SizedBox(width: double.infinity),
          ),
        ]),
      ),
    );
  }
}
