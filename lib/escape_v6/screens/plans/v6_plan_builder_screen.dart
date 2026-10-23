// Escape v6 — build a self-care plan (`POST /v2/plans`).
//
// Four quiet steps: what you want, how much time, anything Lucille should know, then a review.
// **Nothing is sent until the review step's one button.** The goals come from
// `/v1/selfcare/goals`; when the server says *why* it put a goal in front of you, that reason is
// shown under the goal — and when it doesn't, nothing is shown rather than a made-up reason.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/escape_v6/screens/home/v6_home_widgets.dart';
import '/escape_v6/v6.dart';
import 'v6_plans_api.dart';

const _minuteChoices = [5, 10, 15, 20, 30, 45];
const _dayChoices = [3, 7, 10, 14];

class V6PlanBuilderScreen extends StatefulWidget {
  const V6PlanBuilderScreen({super.key});

  @override
  State<V6PlanBuilderScreen> createState() => _V6PlanBuilderScreenState();
}

class _V6PlanBuilderScreenState extends State<V6PlanBuilderScreen> {
  final _note = TextEditingController();

  int _step = 0;
  List<V6PlanGoal>? _goals;
  bool _goalsFailed = false;
  final _picked = <String>[];
  int _minutes = 15;
  int _days = 7;
  bool _tooMany = false;
  bool _distress = false;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final goal = V6Store.instance.profile.dailyGoalMin;
    if (_minuteChoices.contains(goal)) _minutes = goal;
    _loadGoals();
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _loadGoals() async {
    setState(() {
      _goalsFailed = false;
      _goals = null;
    });
    final g = await V6PlansApi.goals();
    if (!mounted) return;
    setState(() {
      _goals = g;
      _goalsFailed = g.isEmpty;
    });
  }

  bool get _canGoOn => switch (_step) {
        0 => _picked.isNotEmpty,
        1 => true,
        2 => !_distress,
        _ => !_saving,
      };

  void _toggleGoal(String key) {
    setState(() {
      _tooMany = false;
      if (_picked.remove(key)) return;
      if (_picked.length >= 3) {
        _tooMany = true;
        return;
      }
      _picked.add(key);
    });
    HapticFeedback.selectionClick();
  }

  void _checkNote(BuildContext ctx) {
    final t = _note.text.trim();
    final hit = t.isNotEmpty && detectDistress(t);
    if (hit && !_distress) {
      setState(() => _distress = true);
      showV6Support(ctx, V6SupportLevel.urgent);
      return;
    }
    if (!hit && _distress) setState(() => _distress = false);
  }

  void _next(BuildContext ctx) {
    if (_step == 2) _checkNote(ctx);
    if (!_canGoOn) return;
    if (_step < 3) {
      HapticFeedback.selectionClick();
      setState(() => _step += 1);
      return;
    }
    _create(ctx);
  }

  void _back() {
    if (_step == 0) {
      Navigator.of(context).maybePop();
      return;
    }
    setState(() => _step -= 1);
  }

  Future<void> _create(BuildContext ctx) async {
    if (_saving || _picked.isEmpty) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    final res = await V6PlansApi.create(
      goals: _picked,
      minutesPerDay: _minutes,
      days: _days,
      notes: _note.text,
    );
    if (!mounted) return;
    final plan = res.plan;
    if (!res.ok || plan == null) {
      setState(() {
        _saving = false;
        _error = res.error ?? 'That did not work. Try again?';
      });
      return;
    }
    HapticFeedback.mediumImpact();
    // Leave the builder behind: the plan itself is where the person lives from now on.
    final nav = Navigator.of(context);
    nav.pop();
    await v6Open(nav.context, '${V6PlanRoutes.plan}?id=${plan.id}');
  }

  @override
  Widget build(BuildContext context) {
    return V6Page(
      child: Builder(
        builder: (ctx) => V6ActionPage(
          top: V6TopBar(
            title: 'A plan that fits you',
            subtitle: 'Step ${_step + 1} of 4',
            onBack: _back,
            actions: const [V6HelpButton(page: 'plans')],
          ),
          children: [
            V6PageDots(count: 4, index: _step),
            V6Fade(child: _body(ctx)),
          ],
          footer: [
            if (_error != null)
              Semantics(
                liveRegion: true,
                child: V6Text(_error!, size: 13, ink: V6Ink.muted, align: TextAlign.center),
              ),
            if (_step == 3)
              const V6Text('Nothing is saved until you tap below.',
                  size: 12, ink: V6Ink.faint, align: TextAlign.center),
            V6PrimaryPill(
              label: switch (_step) {
                0 => 'Continue',
                1 => 'Continue',
                2 => 'Review my plan',
                _ => 'Create my plan',
              },
              loading: _saving,
              onTap: _canGoOn ? () => _next(ctx) : null,
            ),
            if (_step == 3) V6Link(label: 'Change something', onTap: () => setState(() => _step = 0)),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext ctx) => switch (_step) {
        0 => _goalStep(key: const ValueKey('goals')),
        1 => _shapeStep(key: const ValueKey('shape')),
        2 => _noteStep(ctx, key: const ValueKey('note')),
        _ => _reviewStep(key: const ValueKey('review')),
      };

  // ── step 1: goals ──────────────────────────────────────────────────────────

  Widget _goalStep({Key? key}) {
    final goals = _goals;
    return Column(key: key, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6SmokeIn(child: const V6Display('What would help most?', size: 30)),
      const SizedBox(height: 8),
      const V6Text('Pick up to three. Lucille builds the days around them.', ink: V6Ink.muted),
      const SizedBox(height: 18),
      if (goals == null && !_goalsFailed)
        const V6Shimmer(child: V6Text('Loading what you can aim for…', ink: V6Ink.muted))
      else if (_goalsFailed)
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const V6Text("Couldn't load the goal list. Nothing is lost.", ink: V6Ink.muted),
          V6Link(label: 'Try again', ink: V6Ink.accent, onTap: _loadGoals),
        ])
      else
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (final g in goals!) ...[
            _GoalCard(
              goal: g,
              selected: _picked.contains(g.key),
              onTap: () => _toggleGoal(g.key),
            ),
            const SizedBox(height: 10),
          ],
        ]),
      if (_tooMany)
        Semantics(
          liveRegion: true,
          child: const V6Text('Three is the most — let one go to add another.',
              size: 13, ink: V6Ink.accent),
        ),
      const V6AutoHelp(page: 'plans'),
    ]);
  }

  // ── step 2: time ───────────────────────────────────────────────────────────

  Widget _shapeStep({Key? key}) {
    return Column(key: key, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6SmokeIn(child: const V6Display('How much time?', size: 30)),
      const SizedBox(height: 8),
      const V6Text('Small is fine. A plan you can keep beats a plan that looks impressive.',
          ink: V6Ink.muted),
      const SizedBox(height: 20),
      V6Glass(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const V6Eyebrow('Minutes a day'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final m in _minuteChoices)
                V6Chip(
                  label: '$m min',
                  selected: _minutes == m,
                  onTap: () => setState(() => _minutes = m),
                ),
            ],
          ),
          const SizedBox(height: 22),
          const V6Eyebrow('How many days'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final d in _dayChoices)
                V6Chip(
                  label: '$d days',
                  selected: _days == d,
                  onTap: () => setState(() => _days = d),
                ),
            ],
          ),
          const SizedBox(height: 16),
          V6Text('About ${_minutes * _days} minutes over $_days days. You can make it easier later.',
              size: 13, ink: V6Ink.muted),
        ]),
      ),
    ]);
  }

  // ── step 3: a note to Lucille ──────────────────────────────────────────────

  Widget _noteStep(BuildContext ctx, {Key? key}) {
    final catalogOnly = V6PlansApi.claudeEdition == false;
    return Column(key: key, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6SmokeIn(child: const V6Display('Anything I should know?', size: 30)),
      const SizedBox(height: 8),
      const V6Text('Optional. Shift work, a hard week, something you want to avoid — it all helps.',
          ink: V6Ink.muted),
      const SizedBox(height: 18),
      V6TextField(
        controller: _note,
        hint: 'e.g. mornings are rushed, evenings are quiet…',
        maxLines: 4,
        maxLength: 400,
        onChanged: (_) => _checkNote(ctx),
      ),
      const SizedBox(height: 10),
      if (_distress)
        V6Glass(
          padding: const EdgeInsets.all(16),
          radius: 20,
          child: Semantics(
            liveRegion: true,
            child: const V6Text(kDistressReply, size: 14, ink: V6Ink.muted),
          ),
        )
      else if (catalogOnly)
        const V6Text('On this build your plan is picked from the Escape library, so a note is kept '
            'on your phone only.', size: 12, ink: V6Ink.faint)
      else
        const V6Text('Lucille reads this once, to write the plan.', size: 12, ink: V6Ink.faint),
    ]);
  }

  // ── step 4: review ─────────────────────────────────────────────────────────

  Widget _reviewStep({Key? key}) {
    final goals = _goals ?? const <V6PlanGoal>[];
    final labels = [
      for (final k in _picked) goals.where((g) => g.key == k).v6First?.label ?? k,
    ];
    final note = _note.text.trim();
    return Column(key: key, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      V6SmokeIn(child: const V6Display('Does this feel right?', size: 30)),
      const SizedBox(height: 8),
      const V6Text('Read it over. Change anything you want before it exists.', ink: V6Ink.muted),
      const SizedBox(height: 18),
      V6Hero(
        tag: V6PlanRoutes.heroTag,
        child: V6Glass(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const V6Eyebrow('Your plan'),
            const SizedBox(height: 8),
            V6Display('$_days days · $_minutes min a day', size: 24),
            const SizedBox(height: 16),
            for (final l in labels) ...[
              Row(children: [
                Icon(Icons.check_rounded, size: 16, color: V6Theme.of(context).accent),
                const SizedBox(width: 8),
                Expanded(child: V6Text(l, size: 15, weight: FontWeight.w500)),
              ]),
              const SizedBox(height: 6),
            ],
            if (note.isNotEmpty) ...[
              const SizedBox(height: 10),
              const V6Eyebrow('Your note'),
              const SizedBox(height: 4),
              V6Text(note, size: 14, ink: V6Ink.muted),
            ],
          ]),
        ),
      ),
      const SizedBox(height: 12),
      const V6Text('Your plan is private. Nobody but you sees it unless you export it.',
          size: 12, ink: V6Ink.faint),
    ]);
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal, required this.selected, required this.onTap});
  final V6PlanGoal goal;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final why = goal.why;
    return Semantics(
      selected: selected,
      child: V6Glass(
        onTap: onTap,
        semanticLabel: why == null ? goal.label : '${goal.label}. Suggested because $why',
        padding: const EdgeInsets.all(16),
        radius: 20,
        border: selected ? p.accent : null,
        tint: selected ? p.accent : null,
        child: Row(children: [
          AnimatedContainer(
            duration: V6Motion.quick,
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? p.ink : Colors.transparent,
              border: Border.all(color: selected ? p.ink : p.inkFaint, width: 1.5),
            ),
            child: AnimatedScale(
              duration: V6Motion.quick,
              curve: Curves.easeOutBack,
              scale: selected ? 1 : 0,
              child: Icon(Icons.check_rounded, size: 16, color: p.onInk),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              V6Text(goal.label, size: 16, weight: FontWeight.w600),
              if (why != null) ...[
                const SizedBox(height: 4),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.auto_awesome_rounded, size: 13, color: p.accent),
                  const SizedBox(width: 6),
                  Expanded(child: V6Text(why, size: 13, ink: V6Ink.muted)),
                ]),
              ],
            ]),
          ),
        ]),
      ),
    );
  }
}
