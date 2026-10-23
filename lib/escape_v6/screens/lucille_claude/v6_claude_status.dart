// Escape v6 — Lucille (Claude edition): THE STATUS LINE.
//
// One grey line above Lucille's reply that says what she is actually doing — `Thinking…`,
// `Read your last 3 check-ins`, `Drafted your week`, `Made a PDF`. Every word comes from a
// `status` frame on the wire; this widget has no vocabulary of its own, so it can never claim
// work that didn't happen. When the server sends nothing, nothing is shown.
//
// While the turn runs each label dissolves into the next through [V6SmokeSwitch]. When the turn
// finishes the line collapses into one tappable summary ("Show what Lucille did") that expands to
// the whole list, so the receipt stays available without crowding the reply.
//
// It is informational only: a GestureDetector with no focus node, outside the composer's focus
// scope, so it can never block typing or steal the keyboard.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_claude_events.dart';

IconData v6ClaudeStatusIcon(V6ClaudeStatusKind kind) {
  switch (kind) {
    case V6ClaudeStatusKind.thinking:
      return Icons.auto_awesome_rounded;
    case V6ClaudeStatusKind.reading:
      return Icons.menu_book_rounded;
    case V6ClaudeStatusKind.writing:
      return Icons.edit_outlined;
    case V6ClaudeStatusKind.searching:
      return Icons.search_rounded;
    case V6ClaudeStatusKind.drafting:
      return Icons.description_outlined;
    case V6ClaudeStatusKind.checking:
      return Icons.fact_check_outlined;
    case V6ClaudeStatusKind.other:
      return Icons.more_horiz_rounded;
  }
}

class V6ClaudeStatusLine extends StatefulWidget {
  const V6ClaudeStatusLine({
    super.key,
    required this.statuses,
    required this.active,
    this.startExpanded = false,
  });

  /// Server statuses in arrival order. Empty means nothing is drawn.
  final List<V6ClaudeStatusEvent> statuses;

  /// True while the turn is still running (live line) — false collapses it to the summary.
  final bool active;

  /// Only for the thread's own restore-from-disk case; the summary is collapsed by default.
  final bool startExpanded;

  @override
  State<V6ClaudeStatusLine> createState() => _V6ClaudeStatusLineState();
}

class _V6ClaudeStatusLineState extends State<V6ClaudeStatusLine> {
  late bool _open = widget.startExpanded;

  @override
  Widget build(BuildContext context) {
    final list = widget.statuses;
    // Never show a status the server didn't send.
    if (list.isEmpty) return const SizedBox.shrink();

    if (widget.active) {
      final s = list.last;
      return Padding(
        padding: const EdgeInsets.only(left: 2, bottom: 6),
        child: Semantics(
          liveRegion: true,
          label: s.label,
          child: ExcludeSemantics(
            child: V6SmokeSwitch(
              drift: 8,
              child: _StatusRow(key: ValueKey('${list.length}-${s.label}'), status: s),
            ),
          ),
        ),
      );
    }

    // Finished: one quiet summary, tappable.
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        V6Pressable(
          haptic: false,
          scale: 0.99,
          semanticLabel: _open
              ? 'Hide what Lucille did'
              : 'Show what Lucille did, ${list.length} ${list.length == 1 ? 'step' : 'steps'}',
          onTap: () => setState(() => _open = !_open),
          child: ConstrainedBox(
            // Full-height target (the row looks like one line of grey text, but the whole band
            // above the reply is tappable).
            constraints: const BoxConstraints(minHeight: 44),
            child: ExcludeSemantics(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  _open ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: V6Theme.of(context).inkFaint,
                ),
                const SizedBox(width: 4),
                V6Text(
                  _open ? 'Hide what Lucille did' : 'Show what Lucille did',
                  size: 12,
                  ink: V6Ink.faint,
                  maxLines: 1,
                ),
              ]),
            ),
          ),
        ),
        AnimatedSize(
          duration: V6Theme.motionOff(context) ? Duration.zero : V6Motion.quick,
          curve: V6Motion.ease,
          alignment: Alignment.topLeft,
          child: _open
              ? Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final s in list)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: _StatusRow(status: s),
                        ),
                    ],
                  ),
                )
              : const SizedBox(width: double.infinity, height: 0),
        ),
      ]),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({super.key, required this.status});
  final V6ClaudeStatusEvent status;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(v6ClaudeStatusIcon(status.kind), size: 13, color: p.inkFaint),
      const SizedBox(width: 6),
      Flexible(
        child: Text(
          status.label,
          style: V6Type.body(12, p.inkFaint, height: 1.3),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
