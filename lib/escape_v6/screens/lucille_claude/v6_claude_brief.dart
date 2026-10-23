// Escape v6 — Lucille (Claude edition): the morning brief.
//
// One card for the Home screen: what Lucille noticed since yesterday and one suggested next step.
// Dismissible, and dismissed for the rest of the day.
//
// It shows ONLY what the server sent. There is no brief endpoint in the frozen turn contract, so
// if /v2/lucille/brief isn't there (or has nothing yet) the card says so plainly — it never
// writes a brief of its own, because a made-up "I noticed you slept badly" would be a lie about
// the user's own week.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/escape_v6/v6.dart';
import 'v6_claude_api.dart';

const kV6ClaudeBriefDismissedKey = 'v6_claude_brief_dismissed_day';

/// The parsed brief. Every field is nullable: a missing field renders nothing.
@immutable
class V6ClaudeBrief {
  const V6ClaudeBrief({this.greeting, this.noticed = const [], this.stepTitle, this.stepWhy, this.stepRoute});

  final String? greeting;

  /// "What I noticed since yesterday" — one line each, the server's words.
  final List<String> noticed;

  final String? stepTitle;
  final String? stepWhy;
  final String? stepRoute;

  bool get isEmpty => noticed.isEmpty && (stepTitle == null || stepTitle!.isEmpty);

  static V6ClaudeBrief? from(Map<String, dynamic> m) {
    final raw = m['brief'] is Map ? Map<String, dynamic>.from(m['brief'] as Map) : m;
    final noticed = <String>[];
    final n = raw['noticed'] ?? raw['notes'] ?? raw['highlights'];
    if (n is String && n.trim().isNotEmpty) {
      noticed.add(n.trim());
    } else if (n is List) {
      for (final item in n) {
        if (item is String && item.trim().isNotEmpty) {
          noticed.add(item.trim());
        } else if (item is Map && item['text'] != null) {
          final s = item['text'].toString().trim();
          if (s.isNotEmpty) noticed.add(s);
        }
      }
    }
    final step = raw['suggestion'] ?? raw['nextStep'] ?? raw['next'];
    String? title;
    String? why;
    String? route;
    if (step is Map) {
      title = step['title']?.toString();
      why = (step['why'] ?? step['reason'])?.toString();
      final r = step['route'] ?? step['deeplink'] ?? step['page'];
      route = r?.toString();
    } else if (step is String && step.trim().isNotEmpty) {
      title = step.trim();
    }
    final b = V6ClaudeBrief(
      greeting: raw['greeting']?.toString(),
      noticed: noticed,
      stepTitle: (title != null && title.isNotEmpty) ? title : null,
      stepWhy: (why != null && why.isNotEmpty) ? why : null,
      stepRoute: (route != null && route.isNotEmpty) ? route : null,
    );
    return b.isEmpty ? null : b;
  }
}

/// The Home-screen card. Renders nothing at all when the Claude edition is off.
class V6ClaudeBriefCard extends StatefulWidget {
  const V6ClaudeBriefCard({super.key, this.showEmptyState = true});

  /// On Home the honest empty state is worth showing once; embedded elsewhere it can be hidden.
  final bool showEmptyState;

  @override
  State<V6ClaudeBriefCard> createState() => _V6ClaudeBriefCardState();
}

class _V6ClaudeBriefCardState extends State<V6ClaudeBriefCard> {
  V6ClaudeBrief? _brief;
  bool _loading = true;
  bool _dismissed = false;
  bool _alive = true;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _alive = false;
    super.dispose();
  }

  static String _today() {
    final n = DateTime.now();
    return '${n.year}-${n.month.toString().padLeft(2, '0')}-${n.day.toString().padLeft(2, '0')}';
  }

  Future<void> _load() async {
    if (!V6Store.instance.v6ClaudeEdition) {
      if (_alive) setState(() => _loading = false);
      return;
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getString(kV6ClaudeBriefDismissedKey) == _today()) {
        if (_alive) {
          setState(() {
            _dismissed = true;
            _loading = false;
          });
        }
        return;
      }
    } catch (_) {}
    final r = await V6ClaudeApi.brief();
    if (!_alive) return;
    setState(() {
      _brief = r.ok ? V6ClaudeBrief.from(r.map) : null;
      _loading = false;
    });
  }

  Future<void> _dismiss() async {
    setState(() => _dismissed = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(kV6ClaudeBriefDismissedKey, _today());
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      if (!s.v6ClaudeEdition || _dismissed || _loading) return const SizedBox.shrink();
      final b = _brief;
      if (b == null) {
        if (!widget.showEmptyState) return const SizedBox.shrink();
        return const _BriefEmpty();
      }
      return _BriefBody(brief: b, onDismiss: () => unawaited(_dismiss()));
    });
  }
}

class _BriefBody extends StatelessWidget {
  const _BriefBody({required this.brief, required this.onDismiss});
  final V6ClaudeBrief brief;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final b = brief;
    return V6Glass(
      padding: const EdgeInsets.fromLTRB(18, 16, 10, 18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.wb_twilight_rounded, size: 16, color: p.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Text('THIS MORNING', style: V6Type.eyebrow(p.inkMuted), maxLines: 1),
          ),
          V6IconButton(
            icon: Icons.close_rounded,
            label: 'Dismiss the morning brief',
            size: V6Space.minTarget,
            onTap: onDismiss,
            child: Icon(Icons.close_rounded, size: 16, color: p.inkFaint),
          ),
        ]),
        const SizedBox(height: 6),
        if (b.greeting != null) ...[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Semantics(header: true, child: V6SmokeIn(child: V6Text(b.greeting!, size: 15, maxLines: 3))),
          ),
          const SizedBox(height: 10),
        ],
        for (final line in b.noticed)
          Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 6),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: p.inkFaint),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: V6Text(line, size: 13, ink: V6Ink.muted, maxLines: 4)),
            ]),
          ),
        if (b.stepTitle != null) ...[
          const SizedBox(height: 10),
          Divider(height: 1, color: p.glassBorder),
          const SizedBox(height: 12),
          const V6Eyebrow('ONE NEXT STEP', ink: V6Ink.faint),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: V6Text(b.stepTitle!, size: 15, weight: FontWeight.w600, maxLines: 3),
          ),
          if (b.stepWhy != null) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: V6Text(b.stepWhy!, size: 12, ink: V6Ink.faint, maxLines: 3),
            ),
          ],
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(children: [
              Expanded(
                child: V6PrimaryPill(
                  label: b.stepRoute == null ? 'Talk it through' : 'Start',
                  onTap: () => v6Open(
                    context,
                    b.stepRoute ?? V6Routes.claudeThread,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              V6GhostPill(label: 'Not today', onTap: onDismiss),
            ]),
          ),
        ],
      ]),
    );
  }
}

/// No brief yet — said plainly, with the one thing that actually makes one possible.
class _BriefEmpty extends StatelessWidget {
  const _BriefEmpty();

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.wb_twilight_rounded, size: 16, color: p.inkFaint),
          const SizedBox(width: 8),
          Expanded(child: Text('THIS MORNING', style: V6Type.eyebrow(p.inkMuted), maxLines: 1)),
        ]),
        const SizedBox(height: 8),
        const V6Text('No brief yet.', size: 15, weight: FontWeight.w600),
        const SizedBox(height: 4),
        const V6Text(
          'Lucille writes one once there is a day or two to look back on. Check in, or talk to '
          'her, and it will be here tomorrow morning.',
          size: 13,
          ink: V6Ink.muted,
        ),
      ]),
    );
  }
}
