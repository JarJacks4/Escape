// Escape v6 — Lucille (Claude edition): the cards that appear inside the thread.
//
// artifact  → a document or chart she made (opens / shares the signed URL)
// action    → a chip that opens an app page through v6Open
// plan      → the Claude-authored self-care plan
// approval  → "Lucille wants to …" with Allow / Not now. NOTHING outside the conversation is
//             written until the user taps Allow, and a card the user ignores stays unanswered.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/escape_v6/v6.dart';
import 'v6_claude_api.dart';
import 'v6_claude_events.dart';

// ───────────────────────── artifact ─────────────────────────

/// A document or chart Lucille made. Opening hands the signed URL to the OS, which is also how
/// it gets shared (there is no share_plus in this app — see the report).
class V6ClaudeArtifactCard extends StatefulWidget {
  const V6ClaudeArtifactCard({super.key, required this.artifact});
  final V6ClaudeArtifactEvent artifact;

  @override
  State<V6ClaudeArtifactCard> createState() => _V6ClaudeArtifactCardState();
}

class _V6ClaudeArtifactCardState extends State<V6ClaudeArtifactCard> {
  bool _opening = false;
  bool _failed = false;

  Future<void> _open() async {
    final url = widget.artifact.url;
    if (url == null || _opening) return;
    setState(() {
      _opening = true;
      _failed = false;
    });
    var ok = false;
    try {
      final uri = Uri.tryParse(url);
      if (uri != null) ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      ok = false;
    }
    if (!mounted) return;
    setState(() {
      _opening = false;
      _failed = !ok;
    });
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.artifact;
    final p = V6Theme.of(context);
    final size = _sizeLabel(a.bytes);
    final sub = [
      a.isChart ? 'Chart' : 'Document',
      if (size != null) size,
    ].join(' · ');
    return V6Glass(
      padding: const EdgeInsets.all(16),
      onTap: a.url == null ? null : _open,
      semanticLabel: a.url == null
          ? '${a.title}. $sub. Not available yet.'
          : '${a.title}. $sub. Open',
      child: ExcludeSemantics(
        child: Row(children: [
          V6IconBadge(icon: a.isChart ? Icons.insights_rounded : Icons.description_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              V6Text(a.title, size: 15, weight: FontWeight.w600, maxLines: 2),
              const SizedBox(height: 2),
              V6Text(
                _failed ? "Couldn't open it — tap to try again" : sub,
                size: 12,
                ink: V6Ink.faint,
                maxLines: 1,
              ),
            ]),
          ),
          const SizedBox(width: 8),
          if (_opening)
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: p.inkMuted),
            )
          else if (a.url != null)
            Icon(Icons.ios_share_rounded, size: 18, color: p.inkMuted),
        ]),
      ),
    );
  }

  static String? _sizeLabel(int? bytes) {
    if (bytes == null || bytes <= 0) return null;
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).round()} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

// ───────────────────────── action ─────────────────────────

/// A chip that opens an app page. Unknown routes land on Home rather than crashing (v6Open).
class V6ClaudeActionChip extends StatelessWidget {
  const V6ClaudeActionChip({super.key, required this.action});
  final V6ClaudeActionEvent action;

  @override
  Widget build(BuildContext context) => V6Chip(
        label: action.label,
        icon: Icons.arrow_outward_rounded,
        onTap: () => v6Open(context, action.routeWithParams),
      );
}

/// A wrapping row of action chips.
class V6ClaudeActionRow extends StatelessWidget {
  const V6ClaudeActionRow({super.key, required this.actions});
  final List<V6ClaudeActionEvent> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [for (final a in actions) V6ClaudeActionChip(action: a)],
    );
  }
}

// ───────────────────────── plan ─────────────────────────

/// The plan Lucille wrote. Tapping opens the plan page; "Save as PDF" asks the server for a
/// document (the file itself is produced server-side and opened by the OS).
class V6ClaudePlanCard extends StatefulWidget {
  const V6ClaudePlanCard({super.key, required this.plan});
  final V6ClaudePlanEvent plan;

  @override
  State<V6ClaudePlanCard> createState() => _V6ClaudePlanCardState();
}

class _V6ClaudePlanCardState extends State<V6ClaudePlanCard> {
  bool _busy = false;
  String? _note;

  Future<void> _savePdf() async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _note = null;
    });
    final r = await V6ClaudeApi.planDocument(widget.plan.planId);
    if (!mounted) return;
    final url = r.ok ? r.map['url']?.toString() : null;
    var opened = false;
    if (url != null && url.isNotEmpty) {
      try {
        final uri = Uri.tryParse(url);
        if (uri != null) opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (_) {
        opened = false;
      }
    }
    if (!mounted) return;
    setState(() {
      _busy = false;
      _note = opened ? null : "Couldn't make the PDF just now.";
    });
  }

  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;
    final bits = <String>[
      if (plan.days != null) '${plan.days} ${plan.days == 1 ? 'day' : 'days'}',
      if (plan.minutesPerDay != null) '${plan.minutesPerDay} min a day',
    ];
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        V6Eyebrow(plan.updated ? 'Plan updated' : 'Your plan', ink: V6Ink.faint),
        const SizedBox(height: 8),
        Semantics(header: true, child: V6Text(plan.title, size: 17, weight: FontWeight.w600, maxLines: 3)),
        if (bits.isNotEmpty) ...[
          const SizedBox(height: 4),
          V6Text(bits.join(' · '), size: 12, ink: V6Ink.faint, maxLines: 1),
        ],
        if (_note != null) ...[
          const SizedBox(height: 8),
          V6Text(_note!, size: 12, ink: V6Ink.muted, maxLines: 2),
        ],
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
            child: V6GhostPill(
              label: 'Open plan',
              icon: Icons.checklist_rounded,
              onTap: () => v6Open(context, V6Routes.dailyPlan),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: V6GhostPill(
              label: _busy ? 'Making…' : 'Save as PDF',
              icon: Icons.picture_as_pdf_outlined,
              onTap: _busy ? null : () => unawaited(_savePdf()),
            ),
          ),
        ]),
      ]),
    );
  }
}

// ───────────────────────── approval ─────────────────────────

/// "Lucille wants to replace your plan" — Allow / Not now.
///
/// Destructive requests get the warning tint and a red Allow, so a tap that deletes or replaces
/// something never looks like an ordinary confirm. The answer is posted to /v2/lucille/approve;
/// if the post fails the card says so and the choice is offered again — it never pretends.
class V6ClaudeApprovalCard extends StatefulWidget {
  const V6ClaudeApprovalCard({super.key, required this.approval, this.onAnswered});

  final V6ClaudeApprovalEvent approval;

  /// Called with the state the server confirmed (allowed / declined / failed).
  final void Function(V6ClaudeApprovalState state)? onAnswered;

  @override
  State<V6ClaudeApprovalCard> createState() => _V6ClaudeApprovalCardState();
}

class _V6ClaudeApprovalCardState extends State<V6ClaudeApprovalCard> {
  bool _busy = false;
  bool _failed = false;

  Future<void> _answer(bool allow) async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _failed = false;
    });
    final r = await V6ClaudeApi.approve(widget.approval.id, allow);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _failed = !r.ok;
    });
    widget.onAnswered?.call(r.ok
        ? (allow ? V6ClaudeApprovalState.allowed : V6ClaudeApprovalState.declined)
        : V6ClaudeApprovalState.failed);
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.approval;
    final p = V6Theme.of(context);
    final answered =
        a.state == V6ClaudeApprovalState.allowed || a.state == V6ClaudeApprovalState.declined;
    final accent = a.destructive ? V6Brand.danger : p.accent;

    return V6Glass(
      padding: const EdgeInsets.all(18),
      border: a.destructive ? V6Brand.danger.withOpacity(0.45) : null,
      tint: a.destructive ? V6Brand.danger.withOpacity(0.08) : null,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(
            a.destructive ? Icons.warning_amber_rounded : Icons.help_outline_rounded,
            size: 16,
            color: accent,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Needs your okay',
              style: V6Type.eyebrow(a.destructive ? V6Brand.danger : p.inkMuted),
              maxLines: 1,
            ),
          ),
        ]),
        const SizedBox(height: 10),
        Semantics(header: true, child: V6Text(a.label, size: 16, weight: FontWeight.w600, maxLines: 4)),
        if (a.detail != null) ...[
          const SizedBox(height: 6),
          V6Text(a.detail!, size: 13, ink: V6Ink.muted, maxLines: 6),
        ],
        const SizedBox(height: 14),
        if (answered)
          Row(children: [
            Icon(
              a.state == V6ClaudeApprovalState.allowed ? Icons.check_rounded : Icons.block_rounded,
              size: 15,
              color: p.inkFaint,
            ),
            const SizedBox(width: 6),
            V6Text(
              a.state == V6ClaudeApprovalState.allowed ? 'You allowed this' : 'Not now — nothing changed',
              size: 12,
              ink: V6Ink.faint,
              maxLines: 1,
            ),
          ])
        else ...[
          if (_failed)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: V6Text(
                "Couldn't send your answer. Nothing has changed — try again.",
                size: 12,
                ink: V6Ink.muted,
                maxLines: 2,
              ),
            ),
          Row(children: [
            Expanded(
              child: _AllowButton(
                label: _busy ? 'Sending…' : 'Allow',
                destructive: a.destructive,
                onTap: _busy ? null : () => unawaited(_answer(true)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: V6GhostPill(
                label: 'Not now',
                onTap: _busy ? null : () => unawaited(_answer(false)),
              ),
            ),
          ]),
        ],
      ]),
    );
  }
}

/// Allow: ink-filled normally, danger-filled when the request is destructive.
class _AllowButton extends StatelessWidget {
  const _AllowButton({required this.label, required this.destructive, required this.onTap});
  final String label;
  final bool destructive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final fill = destructive ? V6Brand.danger : p.ink;
    final fg = destructive ? const Color(0xFF1A0606) : p.onInk;
    return V6Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: AnimatedOpacity(
        duration: V6Motion.quick,
        opacity: onTap == null ? 0.5 : 1,
        child: Container(
          height: V6Space.minTarget,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: fill, borderRadius: BorderRadius.circular(999)),
          child: Text(label, style: V6Type.body(15, fg, weight: FontWeight.w600, height: 1.2)),
        ),
      ),
    );
  }
}
