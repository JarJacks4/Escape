// Escape v6 — Daily plan (Figma Make: src/screens/Productivity.tsx → DailyPlan).
//
// A few kind tasks, never a to-do list that judges. Big 48 pt check circles, Lucille's
// suggestions marked with a spark, tap a task to start it, swipe your own tasks away, add new ones
// at the bottom (thumb zone). At 100% a quiet success state (no confetti): rest counts too.
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import '/escape_v6/screens/plans/v6_plans_api.dart';
import '/escape_v6/v6.dart';

const _areaLabel = {
  V6Area.mind: 'Mind',
  V6Area.body: 'Body',
  V6Area.reset: 'Reset',
  V6Area.journal: 'Journal',
  V6Area.life: 'Life',
};

class V6DailyPlanScreen extends StatefulWidget {
  const V6DailyPlanScreen({super.key});

  @override
  State<V6DailyPlanScreen> createState() => _V6DailyPlanScreenState();
}

class _V6DailyPlanScreenState extends State<V6DailyPlanScreen> {
  final _draft = TextEditingController();
  bool _distress = false;

  bool get _canAdd => _draft.text.trim().isNotEmpty;

  @override
  void dispose() {
    _draft.dispose();
    super.dispose();
  }

  /// [ctx] must sit inside V6Page so the Support sheet picks up the page palette.
  void _add(BuildContext ctx) {
    final t = _draft.text.trim();
    if (t.isEmpty) return;
    if (detectDistress(t)) {
      setState(() => _distress = true);
      showV6Support(ctx, V6SupportLevel.urgent);
      return;
    }
    HapticFeedback.lightImpact();
    V6Store.instance.addTask(t);
    _draft.clear();
    setState(() => _distress = false);
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: V6Watch(builder: (context, s) {
        final tasks = s.tasks;
        final total = tasks.length;
        final done = tasks.where((t) => t.done).length;
        return V6ActionPage(
          top: V6TopBar(
            title: "Today's plan",
            subtitle: '$done of $total done',
            actions: const [V6HelpButton(page: 'dailyPlan')],
          ),
          children: [
            V6Fade(
              child: total > 0 && done == total
                  ? _AllDone(key: const ValueKey('all-done'), mood: s.currentMood, total: total)
                  : _Summary(key: const ValueKey('summary'), done: done, total: total),
            ),
            V6HelpTarget(
              id: 'plan.list',
              child: tasks.isEmpty
                  ? const _EmptyPlan()
                  : V6Glass(
                      padding: const EdgeInsets.all(6),
                      child: Column(children: [
                        for (var i = 0; i < tasks.length; i++) _TaskRow(task: tasks[i], divider: i > 0),
                      ]),
                    ),
            ),
            // The deeper, server-authored self-care plan (days, charts, export). Today's list
            // above is untouched: this is only the way into it.
            V6Hero(
              tag: V6PlanRoutes.heroTag,
              child: V6Glass(
                onTap: () => v6Open(context, V6PlanRoutes.plan),
                semanticLabel: 'Your self-care plan, with its days, charts and export. Open it',
                padding: const EdgeInsets.all(16),
                radius: 20,
                child: Row(children: [
                  const V6IconBadge(icon: Icons.event_available_rounded),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      V6Text('Your self-care plan', size: 15, weight: FontWeight.w600),
                      V6Text('The whole stretch of days, how it is going, and a copy to keep',
                          size: 12, ink: V6Ink.faint),
                    ]),
                  ),
                  Icon(Icons.chevron_right_rounded, color: V6Theme.of(context).inkFaint),
                ]),
              ),
            ),
            Column(children: const [
              V6Text('Unfinished tasks roll into tomorrow. No guilt.',
                  size: 13, ink: V6Ink.faint, align: TextAlign.center),
              V6AutoHelp(page: 'dailyPlan'),
            ]),
          ],
          footer: [
            if (_distress)
              V6Glass(
                padding: const EdgeInsets.all(16),
                radius: 20,
                child: Semantics(
                  liveRegion: true,
                  child: const V6Text(kDistressReply, size: 14, ink: V6Ink.muted),
                ),
              ),
            V6HelpTarget(
              id: 'plan.add',
              child: Row(children: [
                Expanded(
                  child: V6TextField(
                    controller: _draft,
                    hint: 'Add a kind task…',
                    maxLength: 80,
                    textInputAction: TextInputAction.done,
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) => _add(context),
                  ),
                ),
                const SizedBox(width: 10),
                _AddButton(enabled: _canAdd, onTap: () => _add(context)),
              ]),
            ),
          ],
        );
      }),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({super.key, required this.done, required this.total});
  final int done;
  final int total;

  @override
  Widget build(BuildContext context) {
    final v = total == 0 ? 0.0 : done / total;
    final left = total - done;
    return V6Glass(
      padding: const EdgeInsets.all(18),
      child: Row(children: [
        V6Ring(
          value: v,
          size: 72,
          stroke: 6,
          semanticLabel: 'Plan progress',
          child: V6Fade(
            child: V6Text('${(v * 100).round()}%', key: ValueKey('pct-$done-$total'), size: 15, weight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            V6Display(total == 0 ? 'A blank page.' : (done == 0 ? 'Small steps count.' : 'Nice momentum.'), size: 22),
            const SizedBox(height: 4),
            V6Text(
              total == 0 ? 'Add one kind thing below.' : '$left left · start with whichever feels easiest.',
              size: 13,
              ink: V6Ink.muted,
            ),
          ]),
        ),
      ]),
    );
  }
}

/// Gentle success state: an orb, a kind line, no fireworks.
class _AllDone extends StatelessWidget {
  const _AllDone({super.key, required this.mood, required this.total});
  final V6Mood? mood;
  final int total;

  @override
  Widget build(BuildContext context) {
    return V6Glass(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 22),
      child: Semantics(
        liveRegion: true,
        child: Column(children: [
          V6MoodOrb(mood: mood ?? V6Mood.calm, size: 88, glow: true),
          const SizedBox(height: 16),
          const V6Display('You did it all.', size: 26, align: TextAlign.center),
          const SizedBox(height: 6),
          V6Text(
            'All $total done. That was a kind day to yourself. Rest counts too.',
            ink: V6Ink.muted,
            align: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}

class _EmptyPlan extends StatelessWidget {
  const _EmptyPlan();

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        Icon(Icons.eco_rounded, size: 28, color: p.accent),
        const SizedBox(height: 10),
        const V6Display('Nothing planned', size: 20, align: TextAlign.center),
        const SizedBox(height: 4),
        const V6Text('Keep it small: a glass of water, a short walk, one slow breath.',
            size: 14, ink: V6Ink.muted, align: TextAlign.center),
      ]),
    );
  }
}

class _TaskRow extends StatelessWidget {
  const _TaskRow({required this.task, required this.divider});
  final V6Task task;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final s = V6Store.instance;
    final t = task;
    final route = t.route;
    final canOpen = route != null && route.isNotEmpty && !t.done;
    final removable = t.planId == null;
    final meta = '${_areaLabel[t.area] ?? 'Life'}${t.minutes > 0 ? ' · ${t.minutes} min' : ''}';

    final text = AnimatedOpacity(
      duration: V6Motion.quick,
      opacity: t.done ? 0.55 : 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(
          t.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: V6Type.body(15, p.ink, weight: FontWeight.w600, height: 1.3).copyWith(
            decoration: t.done ? TextDecoration.lineThrough : null,
            decorationColor: p.inkMuted,
          ),
        ),
        const SizedBox(height: 2),
        Row(children: [
          if (t.fromLucille) ...[
            Semantics(
              label: 'Suggested by Lucille',
              child: Icon(Icons.auto_awesome_rounded, size: 13, color: p.accent),
            ),
            const SizedBox(width: 4),
          ],
          Flexible(child: V6Text(meta, size: 12, ink: V6Ink.faint, maxLines: 1)),
        ]),
      ]),
    );

    Widget row = Container(
      constraints: const BoxConstraints(minHeight: 68),
      decoration: BoxDecoration(
        border: divider ? Border(top: BorderSide(color: p.glassBorder)) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(children: [
        _BigCheck(
          done: t.done,
          title: t.title,
          onTap: () {
            HapticFeedback.mediumImpact();
            s.toggleTask(t.id);
          },
        ),
        const SizedBox(width: 12),
        Expanded(
          child: canOpen
              ? V6Pressable(
                  onTap: () => v6Open(context, route!),
                  semanticLabel: 'Start ${t.title}',
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: V6Space.minTarget),
                    child: Row(children: [
                      Expanded(child: text),
                      Icon(Icons.chevron_right_rounded, color: p.inkFaint),
                    ]),
                  ),
                )
              : text,
        ),
      ]),
    );

    if (!removable) return row;
    row = Semantics(
      customSemanticsActions: {
        const CustomSemanticsAction(label: 'Remove task'): () => s.removeTask(t.id),
      },
      child: row,
    );
    return Dismissible(
      key: ValueKey('task-${t.id}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        HapticFeedback.lightImpact();
        s.removeTask(t.id);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: V6Brand.danger.withOpacity(0.16),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.delete_outline_rounded, color: V6Brand.danger, size: 20),
          const SizedBox(width: 6),
          Text('Remove', style: V6Type.body(14, V6Brand.danger, weight: FontWeight.w600)),
        ]),
      ),
      child: row,
    );
  }
}

class _BigCheck extends StatelessWidget {
  const _BigCheck({required this.done, required this.title, required this.onTap});
  final bool done;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      checked: done,
      child: V6Pressable(
        onTap: onTap,
        haptic: false,
        scale: 0.9,
        semanticLabel: done ? '$title, done. Mark not done' : 'Mark $title done',
        child: AnimatedContainer(
          duration: V6Motion.quick,
          width: V6Space.minTarget,
          height: V6Space.minTarget,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done ? p.ink : Colors.transparent,
            border: Border.all(color: done ? p.ink : p.inkFaint, width: 1.5),
          ),
          child: AnimatedScale(
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

class _AddButton extends StatelessWidget {
  const _AddButton({required this.enabled, required this.onTap});
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: enabled ? onTap : null,
      scale: 0.9,
      semanticLabel: 'Add task',
      child: AnimatedOpacity(
        duration: V6Motion.quick,
        opacity: enabled ? 1 : 0.4,
        child: Container(
          width: V6Space.ctaHeight,
          height: V6Space.ctaHeight,
          decoration: BoxDecoration(shape: BoxShape.circle, color: p.ink),
          child: Icon(Icons.add_rounded, size: 26, color: p.onInk),
        ),
      ),
    );
  }
}
