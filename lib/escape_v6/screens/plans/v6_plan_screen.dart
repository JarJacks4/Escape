// Escape v6 — the active self-care plan (`GET /v2/plans/active`, `PATCH /v2/plans/{id}`).
//
// The day strip across the top, today's steps underneath with a 48 pt check target, and Lucille's
// reason for the plan (and for each step) wherever she gave one. Every step opens its *real*
// in-app destination through `v6Open` with the server's own route + params.
//
// Adjusting (easier / harder / shift days) always asks first: the person built this, so nothing
// reshapes it behind their back. Nothing here invents a number — a plan with no steps says so.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import '/escape_v6/screens/home/v6_home_widgets.dart';
import '/escape_v6/v6.dart';
import 'v6_plan_document_sheet.dart';
import 'v6_plans_api.dart';

class V6PlanScreen extends StatefulWidget {
  const V6PlanScreen({super.key, this.id});

  /// A specific plan; null means "whichever is active".
  final String? id;

  @override
  State<V6PlanScreen> createState() => _V6PlanScreenState();
}

class _V6PlanScreenState extends State<V6PlanScreen> {
  V6Plan? _plan;
  bool _loading = true;
  String? _error;
  String? _notice;
  int? _day;
  String? _busyItem;
  bool _adjusting = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final id = widget.id;
    final res = id == null || id.isEmpty ? await V6PlansApi.active() : await V6PlansApi.plan(id);
    if (!mounted) return;
    setState(() {
      _loading = false;
      _plan = res.plan;
      _error = res.ok ? null : res.error;
      _day = res.plan?.todayDay ?? (res.plan == null ? null : 1);
    });
  }

  void _apply(V6PlanResult res, {String? notice}) {
    setState(() {
      if (res.plan != null) _plan = res.plan;
      _notice = res.ok ? notice : (res.error ?? 'That did not work.');
    });
  }

  // ── ticking a step off ─────────────────────────────────────────────────────

  Future<void> _complete(V6PlanItem item) async {
    final plan = _plan;
    if (plan == null || _busyItem != null || item.done) return;
    HapticFeedback.mediumImpact();
    setState(() => _busyItem = item.id);
    final res = await V6PlansApi.completeItem(plan.id, item.id);
    if (!mounted) return;
    setState(() => _busyItem = null);
    if (!res.ok) {
      _apply(res);
      return;
    }
    if (res.plan != null) {
      _apply(res, notice: res.coins != null && res.coins! > 0 ? '+${res.coins} coins' : null);
    } else {
      // The v1 branch answers without the plan: ask for the truth rather than guess at it.
      setState(() => _notice = res.coins != null && res.coins! > 0 ? '+${res.coins} coins' : null);
      unawaited(_load());
    }
  }

  // ── adjusting (always confirmed) ───────────────────────────────────────────

  Future<void> _adjust(BuildContext ctx, String kind) async {
    final plan = _plan;
    if (plan == null || _adjusting) return;
    final copy = _adjustCopy(kind, plan);
    final yes = await showV6Sheet<bool>(
      ctx,
      title: copy.title,
      builder: (sheet) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6Eyebrow('This changes your plan', ink: V6Ink.accent),
        const SizedBox(height: 10),
        V6Text(copy.body, ink: V6Ink.muted),
        const SizedBox(height: 8),
        const V6Text('Days you have already finished are left alone.', size: 13, ink: V6Ink.faint),
        const SizedBox(height: 22),
        V6PrimaryPill(label: copy.confirm, onTap: () => Navigator.of(sheet).pop(true)),
        const SizedBox(height: 10),
        V6GhostPill(label: 'Not now', onTap: () => Navigator.of(sheet).pop(false)),
      ]),
    );
    if (yes != true || !mounted) return;
    setState(() {
      _adjusting = true;
      _notice = null;
    });
    final res = await V6PlansApi.adjust(plan.id, kind);
    if (!mounted) return;
    setState(() => _adjusting = false);
    _apply(res, notice: res.changed.isEmpty ? copy.done : res.changed.join(' · '));
  }

  static _AdjustCopy _adjustCopy(String kind, V6Plan plan) => switch (kind) {
        'easier' => _AdjustCopy(
            title: 'Make it easier?',
            body: 'The longest step of each unfinished day goes, and the daily target drops to '
                '${(plan.minutesPerDay - 5).clamp(5, 90)} minutes.',
            confirm: 'Make it easier',
            done: 'Lighter now.'),
        'harder' => _AdjustCopy(
            title: 'Add a little more?',
            body: 'One more step joins each unfinished day, and the daily target goes up to '
                '${(plan.minutesPerDay + 5).clamp(5, 90)} minutes.',
            confirm: 'Add more',
            done: 'A bit more in each day.'),
        _ => const _AdjustCopy(
            title: 'Shift the days forward?',
            body: 'Every day you have not done yet moves forward, starting today, so a missed day '
                'is not left in the past.',
            confirm: 'Shift the days',
            done: 'Your plan starts again from today.'),
      };

  Future<void> _export(BuildContext ctx) async {
    final plan = _plan;
    if (plan == null) return;
    await showV6PlanDocumentSheet(ctx, plan);
  }

  // ── build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: Builder(builder: (ctx) {
        final plan = _plan;
        if (_loading && plan == null) return _loadingBody();
        if (plan == null) return _emptyBody(ctx);
        return _planBody(ctx, plan);
      }),
    );
  }

  Widget _loadingBody() => V6ScrollPage(
        withNav: false,
        children: const [
          V6TopBar(title: 'Your plan', actions: [V6HelpButton(page: 'plans')]),
          V6Shimmer(child: V6Text('Opening your plan…', ink: V6Ink.muted)),
        ],
      );

  Widget _emptyBody(BuildContext ctx) {
    final failed = _error != null;
    return V6ActionPage(
      top: const V6TopBar(title: 'Your plan', actions: [V6HelpButton(page: 'plans')]),
      children: [
        V6Glass(
          padding: const EdgeInsets.fromLTRB(20, 26, 20, 24),
          child: Column(children: [
            V6MoodOrb(mood: V6Store.instance.currentMood ?? V6Mood.calm, size: 92, glow: true),
            const SizedBox(height: 18),
            V6SmokeIn(
              child: V6Display(failed ? "Couldn't reach your plan" : 'No plan yet',
                  size: 26, align: TextAlign.center),
            ),
            const SizedBox(height: 8),
            V6Text(
              failed
                  ? '$_error Your plan is safe on Escape — this is only the connection.'
                  : 'A plan is a handful of small, kind things on the days you choose. '
                      'You pick the goals and the time; Lucille shapes the days.',
              ink: V6Ink.muted,
              align: TextAlign.center,
            ),
          ]),
        ),
        const V6AutoHelp(page: 'plans'),
      ],
      footer: [
        if (failed) V6GhostPill(label: 'Try again', icon: Icons.refresh_rounded, onTap: _load),
        V6PrimaryPill(
          label: 'Build my plan',
          icon: Icons.auto_awesome_rounded,
          onTap: () => v6Open(ctx, V6PlanRoutes.builder),
        ),
      ],
    );
  }

  Widget _planBody(BuildContext ctx, V6Plan plan) {
    final today = plan.todayDay;
    final day = _day ?? today ?? 1;
    final items = plan.itemsOn(day);
    final next = items.where((i) => !i.done).v6First;
    final allDone = items.isNotEmpty && next == null;
    final notice = _notice;

    return V6ActionPage(
      top: V6TopBar(
        title: plan.title,
        subtitle: '${plan.days} days · ${plan.minutesPerDay} min a day',
        actions: const [V6HelpButton(page: 'plans')],
      ),
      children: [
        V6Hero(
          tag: V6PlanRoutes.heroTag,
          child: _PlanHeader(plan: plan, day: day, today: today, allDone: allDone),
        ),
        V6HelpTarget(
          id: 'plans.days',
          child: _DayStrip(
            plan: plan,
            selected: day,
            today: today,
            onPick: (d) => setState(() => _day = d),
          ),
        ),
        V6HelpTarget(
          id: 'plans.today',
          child: items.isEmpty
              ? V6Glass(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    V6Display('Day $day has no steps', size: 20),
                    const SizedBox(height: 6),
                    const V6Text('Nothing was scheduled here. Rest counts too.',
                        size: 14, ink: V6Ink.muted),
                  ]),
                )
              : V6Glass(
                  padding: const EdgeInsets.all(6),
                  child: Column(children: [
                    for (var i = 0; i < items.length; i++)
                      _ItemRow(
                        item: items[i],
                        divider: i > 0,
                        busy: _busyItem == items[i].id,
                        onCheck: () => _complete(items[i]),
                      ),
                  ]),
                ),
        ),
        if (notice != null)
          Semantics(
            liveRegion: true,
            child: V6Glass(
              padding: const EdgeInsets.all(14),
              radius: 18,
              child: Row(children: [
                Icon(Icons.info_outline_rounded, size: 18, color: V6Theme.of(ctx).accent),
                const SizedBox(width: 10),
                Expanded(child: V6Text(notice, size: 13, ink: V6Ink.muted)),
              ]),
            ),
          ),
        V6HelpTarget(
          id: 'plans.adjust',
          child: _AdjustCard(
            busy: _adjusting,
            onEasier: () => _adjust(ctx, 'easier'),
            onHarder: () => _adjust(ctx, 'harder'),
            onShift: () => _adjust(ctx, 'shift_days'),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          V6Row(
            title: 'How it is going',
            subtitle: 'Adherence, minutes, mood and score',
            leading: const V6IconBadge(icon: Icons.insights_rounded),
            onTap: () => v6Open(ctx, '${V6PlanRoutes.progress}?id=${plan.id}'),
          ),
          V6Row(
            title: 'Export this plan',
            subtitle: 'PDF, Markdown or Word',
            leading: const V6IconBadge(icon: Icons.ios_share_rounded),
            onTap: () => _export(ctx),
          ),
          const SizedBox(height: 10),
          const V6AutoHelp(page: 'plans'),
        ]),
      ],
      footer: [
        if (allDone)
          Semantics(
            liveRegion: true,
            child: V6SmokeIn(
              child: V6Text(
                day == today ? 'Today is done. That was kind of you.' : 'Day $day is done.',
                weight: FontWeight.w600,
                align: TextAlign.center,
              ),
            ),
          ),
        if (next != null)
          V6PrimaryPill(
            label: next.openRoute == null ? 'Mark “${_short(next.title)}” done' : 'Start ${_short(next.title)}',
            icon: next.openRoute == null ? Icons.check_rounded : Icons.play_arrow_rounded,
            onTap: () {
              final route = next.openRoute;
              if (route == null) {
                _complete(next);
              } else {
                v6Open(ctx, route);
              }
            },
          )
        else
          V6PrimaryPill(
            label: 'See how it is going',
            icon: Icons.insights_rounded,
            onTap: () => v6Open(ctx, '${V6PlanRoutes.progress}?id=${plan.id}'),
          ),
      ],
    );
  }

  static String _short(String text) => text.length <= 22 ? text : '${text.substring(0, 21)}…';
}

@immutable
class _AdjustCopy {
  const _AdjustCopy({required this.title, required this.body, required this.confirm, required this.done});
  final String title;
  final String body;
  final String confirm;
  final String done;
}

// ───────────────────────── header ─────────────────────────

class _PlanHeader extends StatelessWidget {
  const _PlanHeader({required this.plan, required this.day, required this.today, required this.allDone});
  final V6Plan plan;
  final int day;
  final int? today;
  final bool allDone;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final progress = plan.progress;
    final why = plan.why;
    return V6Glass(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              V6Eyebrow(plan.fromClaude ? 'Written for you by Lucille' : 'Built from the Escape library'),
              const SizedBox(height: 6),
              // The one element on this page that resolves out of smoke.
              V6SmokeIn(child: V6Display(plan.title, size: 26, maxLines: 3)),
            ]),
          ),
          const SizedBox(width: 14),
          if (progress != null)
            V6Ring(
              value: progress,
              size: 68,
              stroke: 6,
              semanticLabel: 'Plan progress, ${plan.doneCount} of ${plan.items.length} steps done',
              child: V6Text('${(progress * 100).round()}%', size: 14, weight: FontWeight.w600),
            ),
        ]),
        if (plan.items.isEmpty) ...[
          const SizedBox(height: 10),
          const V6Text('This plan has no steps yet.', size: 13, ink: V6Ink.muted),
        ],
        if (why != null) ...[
          const SizedBox(height: 14),
          V6HelpTarget(
            id: 'plans.why',
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: p.accentSoft,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: p.glassBorder),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Semantics(
                  label: 'Why this plan',
                  child: Icon(Icons.auto_awesome_rounded, size: 15, color: p.accent),
                ),
                const SizedBox(width: 10),
                Expanded(child: V6Text(why, size: 13, ink: V6Ink.muted)),
              ]),
            ),
          ),
        ],
        if (plan.goalLabels.isNotEmpty) ...[
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final g in plan.goalLabels)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: p.glassBorder),
                  ),
                  child: V6Text(g, size: 12, ink: V6Ink.muted),
                ),
            ],
          ),
        ],
      ]),
    );
  }
}

// ───────────────────────── day strip ─────────────────────────

class _DayStrip extends StatelessWidget {
  const _DayStrip({required this.plan, required this.selected, required this.today, required this.onPick});
  final V6Plan plan;
  final int selected;
  final int? today;
  final ValueChanged<int> onPick;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: plan.days,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final day = i + 1;
          final items = plan.itemsOn(day);
          final done = items.where((x) => x.done).length;
          final isToday = day == today;
          final isSel = day == selected;
          final date = items.v6First?.date;
          final when = date == null ? null : DateTime.tryParse(date);
          return Semantics(
            selected: isSel,
            label: 'Day $day${isToday ? ', today' : ''}'
                '${items.isEmpty ? ', nothing planned' : ', $done of ${items.length} done'}',
            child: ExcludeSemantics(
              child: V6Pressable(
                onTap: () => onPick(day),
                scale: 0.94,
                child: AnimatedContainer(
                  duration: V6Motion.quick,
                  width: 62,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSel ? p.ink : p.glass[1],
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: isToday && !isSel ? p.accent : p.glassBorder),
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      when == null ? 'Day' : v6ShortWeekday(when),
                      style: V6Type.body(10, isSel ? p.onInk : p.inkFaint, height: 1),
                    ),
                    const SizedBox(height: 4),
                    Text('$day', style: V6Type.displayStyle(20, isSel ? p.onInk : p.ink)),
                    const SizedBox(height: 6),
                    if (items.isEmpty)
                      Text('–', style: V6Type.body(11, isSel ? p.onInk : p.inkFaint, height: 1))
                    else
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        for (var k = 0; k < items.length.clamp(0, 4); k++) ...[
                          if (k > 0) const SizedBox(width: 3),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: k < done
                                  ? (isSel ? p.onInk : p.accent)
                                  : (isSel ? p.onInk.withOpacity(0.35) : p.inkFaint.withOpacity(0.5)),
                            ),
                          ),
                        ],
                      ]),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

const _weekdayShort = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

String v6ShortWeekday(DateTime d) => _weekdayShort[d.weekday - 1];

// ───────────────────────── one step ─────────────────────────

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item, required this.divider, required this.busy, required this.onCheck});
  final V6PlanItem item;
  final bool divider;
  final bool busy;
  final VoidCallback onCheck;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final route = item.openRoute;
    final why = item.why;
    final meta = [
      if (item.minutes > 0) '${item.minutes} min',
      if (item.kind != null && item.kind!.isNotEmpty) item.kind!,
    ].join(' · ');

    final text = AnimatedOpacity(
      duration: V6Motion.quick,
      opacity: item.done ? 0.55 : 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(
          item.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: V6Type.body(15, p.ink, weight: FontWeight.w600, height: 1.3).copyWith(
            decoration: item.done ? TextDecoration.lineThrough : null,
            decorationColor: p.inkMuted,
          ),
        ),
        if (meta.isNotEmpty) ...[
          const SizedBox(height: 2),
          Row(children: [
            Icon(v6PlanKindIcon(item.kind), size: 13, color: p.inkFaint),
            const SizedBox(width: 5),
            Flexible(child: V6Text(meta, size: 12, ink: V6Ink.faint, maxLines: 1)),
          ]),
        ],
        if (why != null) ...[
          const SizedBox(height: 6),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.auto_awesome_rounded, size: 12, color: p.accent),
            const SizedBox(width: 5),
            Expanded(child: V6Text(why, size: 12, ink: V6Ink.muted, height: 1.35)),
          ]),
        ],
      ]),
    );

    return Container(
      constraints: const BoxConstraints(minHeight: 72),
      decoration: BoxDecoration(
        border: divider ? Border(top: BorderSide(color: p.glassBorder)) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: _BigCheck(done: item.done, busy: busy, title: item.title, onTap: onCheck),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: route == null || item.done
              ? text
              : Semantics(
                  customSemanticsActions: {
                    const CustomSemanticsAction(label: 'Open this step'): () => v6Open(context, route),
                  },
                  child: V6Pressable(
                    onTap: () => v6Open(context, route),
                    semanticLabel: 'Start ${item.title}'
                        '${item.minutes > 0 ? ', ${item.minutes} minutes' : ''}'
                        '${why == null ? '' : '. $why'}',
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: V6Space.minTarget),
                      child: Row(children: [
                        Expanded(child: text),
                        Icon(Icons.chevron_right_rounded, color: p.inkFaint),
                      ]),
                    ),
                  ),
                ),
        ),
      ]),
    );
  }
}

/// The 48 pt check target.
class _BigCheck extends StatelessWidget {
  const _BigCheck({required this.done, required this.busy, required this.title, required this.onTap});
  final bool done;
  final bool busy;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      checked: done,
      child: V6Pressable(
        onTap: done || busy ? null : onTap,
        haptic: false,
        scale: 0.9,
        semanticLabel: done ? '$title, done' : 'Mark $title done',
        child: AnimatedContainer(
          duration: V6Motion.quick,
          width: V6Space.minTarget,
          height: V6Space.minTarget,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done ? p.ink : Colors.transparent,
            border: Border.all(color: done ? p.ink : p.inkFaint, width: 1.5),
          ),
          child: busy
              ? Padding(
                  padding: const EdgeInsets.all(14),
                  child: CircularProgressIndicator(strokeWidth: 2, color: p.accent),
                )
              : AnimatedScale(
                  duration: V6Motion.quick,
                  curve: Curves.easeOutBack,
                  scale: done ? 1 : 0,
                  child: Icon(Icons.check_rounded, size: 24, color: p.onInk),
                ),
        ),
      ),
    );
  }
}

// ───────────────────────── adjust ─────────────────────────

class _AdjustCard extends StatelessWidget {
  const _AdjustCard({
    required this.busy,
    required this.onEasier,
    required this.onHarder,
    required this.onShift,
  });
  final bool busy;
  final VoidCallback onEasier;
  final VoidCallback onHarder;
  final VoidCallback onShift;

  @override
  Widget build(BuildContext context) {
    return V6Glass(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6Eyebrow('Does this feel right?'),
        const SizedBox(height: 8),
        const V6Text('A plan is a guess until you live it. Change it as often as you like — '
            'it asks before anything moves.', size: 13, ink: V6Ink.muted),
        const SizedBox(height: 14),
        AnimatedOpacity(
          duration: V6Motion.quick,
          opacity: busy ? 0.4 : 1,
          child: Row(children: [
            Expanded(
              child: _AdjustButton(
                  icon: Icons.trending_down_rounded,
                  label: 'Easier',
                  onTap: busy ? null : onEasier),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _AdjustButton(
                  icon: Icons.trending_up_rounded, label: 'More', onTap: busy ? null : onHarder),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _AdjustButton(
                  icon: Icons.event_repeat_rounded,
                  label: 'Shift days',
                  onTap: busy ? null : onShift),
            ),
          ]),
        ),
      ]),
    );
  }
}

class _AdjustButton extends StatelessWidget {
  const _AdjustButton({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        constraints: const BoxConstraints(minHeight: V6Space.minTarget),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: p.glass[1],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: p.glassBorder),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 18, color: p.ink),
          const SizedBox(height: 4),
          Text(label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: V6Type.body(12, p.ink, weight: FontWeight.w600, height: 1.1)),
        ]),
      ),
    );
  }
}
