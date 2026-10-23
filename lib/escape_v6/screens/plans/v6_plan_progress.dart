// Escape v6 — how the plan is going (`GET /v2/plans/{id}/chart?metric=…&range=…`).
//
// Four metrics (adherence, minutes, mood, Self-Care Score) over 7, 30 or 90 days. The server
// sends the series as data and we draw it ourselves (see v6_plan_charts.dart, written to the
// `dataviz` skill). Days with no data are gaps, never zeros, and a window without enough real
// days says "not enough days yet" instead of showing a flat line.
import 'package:flutter/material.dart';

import '/escape_v6/screens/home/v6_home_widgets.dart';
import '/escape_v6/v6.dart';
import 'v6_plan_charts.dart';
import 'v6_plan_document_sheet.dart';
import 'v6_plans_api.dart';

class V6PlanProgressScreen extends StatefulWidget {
  const V6PlanProgressScreen({super.key, this.id});

  /// The plan to chart; 'active' when null.
  final String? id;

  @override
  State<V6PlanProgressScreen> createState() => _V6PlanProgressScreenState();
}

class _V6PlanProgressScreenState extends State<V6PlanProgressScreen> {
  final _cache = <String, V6PlanSeries>{};
  final _loading = <String>{};
  String _metric = 'adherence';
  String _range = '30d';
  bool _table = false;
  V6Plan? _plan;

  String get _planId => widget.id == null || widget.id!.isEmpty ? 'active' : widget.id!;
  String get _key => '$_metric.$_range';

  @override
  void initState() {
    super.initState();
    _fetch();
    _loadPlan();
  }

  Future<void> _loadPlan() async {
    final res = widget.id == null || widget.id!.isEmpty
        ? await V6PlansApi.active()
        : await V6PlansApi.plan(widget.id!);
    if (!mounted) return;
    setState(() => _plan = res.plan);
  }

  Future<void> _fetch({bool force = false}) async {
    final key = _key;
    if (_loading.contains(key)) return;
    if (!force && _cache.containsKey(key)) return;
    setState(() => _loading.add(key));
    final s = await V6PlansApi.chart(metric: _metric, range: _range, planId: _planId);
    if (!mounted) return;
    setState(() {
      _loading.remove(key);
      _cache[key] = s;
    });
  }

  void _pickMetric(String m) {
    if (m == _metric) return;
    setState(() {
      _metric = m;
      _table = false;
    });
    _fetch();
  }

  void _pickRange(String r) {
    if (r == _range) return;
    setState(() => _range = r);
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    final series = _cache[_key];
    final loading = _loading.contains(_key);
    final plan = _plan;
    return V6Page(
      child: Builder(
        builder: (ctx) => V6ActionPage(
          top: V6TopBar(
            title: 'How it is going',
            subtitle: plan == null ? null : plan.title,
            actions: const [V6HelpButton(page: 'plans')],
          ),
          children: [
            _MetricTabs(metric: _metric, onPick: _pickMetric),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Row(children: [
                for (final r in kV6PlanRanges) ...[
                  if (r != kV6PlanRanges.first) const SizedBox(width: 8),
                  Expanded(
                    child: V6Chip(
                      label: v6RangeLabel(r),
                      selected: _range == r,
                      onTap: () => _pickRange(r),
                    ),
                  ),
                ],
              ]),
            ]),
            _ChartCard(
              metric: _metric,
              range: _range,
              series: series,
              loading: loading,
              table: _table,
              onToggleTable: () => setState(() => _table = !_table),
              onRetry: () => _fetch(force: true),
            ),
            if (series != null && !series.empty) _StatRow(series: series),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const V6Text('Only days you really used Escape appear here. A blank day stays blank.',
                  size: 12, ink: V6Ink.faint, align: TextAlign.center),
              const SizedBox(height: 10),
              const V6AutoHelp(page: 'plans'),
            ]),
          ],
          footer: [
            if (plan != null)
              V6PrimaryPill(
                label: 'Export this plan',
                icon: Icons.ios_share_rounded,
                onTap: () => showV6PlanDocumentSheet(ctx, plan),
              )
            else
              V6PrimaryPill(label: 'Back to my plan', onTap: () => Navigator.of(ctx).maybePop()),
          ],
        ),
      ),
    );
  }
}

class _MetricTabs extends StatelessWidget {
  const _MetricTabs({required this.metric, required this.onPick});
  final String metric;
  final ValueChanged<String> onPick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: kV6PlanMetrics.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final m = kV6PlanMetrics[i];
          return Center(
            child: V6Chip(
              label: v6MetricTitle(m),
              selected: m == metric,
              onTap: () => onPick(m),
            ),
          );
        },
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.metric,
    required this.range,
    required this.series,
    required this.loading,
    required this.table,
    required this.onToggleTable,
    required this.onRetry,
  });

  final String metric;
  final String range;
  final V6PlanSeries? series;
  final bool loading;
  final bool table;
  final VoidCallback onToggleTable;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final s = series;
    final title = s?.title.isNotEmpty == true ? s!.title : v6MetricTitle(metric);
    Widget body;
    if (s == null) {
      body = loading
          ? const V6Shimmer(
              key: ValueKey('loading'),
              child: V6Text('Reading your real days…', ink: V6Ink.muted),
            )
          : Column(key: const ValueKey('failed'), crossAxisAlignment: CrossAxisAlignment.start, children: [
              const V6Text("Couldn't load this chart. Nothing is lost.", size: 14, ink: V6Ink.muted),
              V6Link(label: 'Try again', ink: V6Ink.accent, onTap: onRetry),
            ]);
    } else if (s.empty) {
      body = Column(
        key: const ValueKey('empty'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.schedule_rounded, size: 18, color: p.inkFaint),
            const SizedBox(width: 8),
            const Expanded(child: V6Text('Not enough days yet', weight: FontWeight.w600)),
          ]),
          const SizedBox(height: 6),
          V6Text(
            s.note.isNotEmpty
                ? s.note
                : 'A few more days of real use and this will have something honest to show.',
            size: 13,
            ink: V6Ink.muted,
          ),
        ],
      );
    } else {
      body = Column(
        key: ValueKey('chart-$metric-$range-${s.realCount}'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          V6PlanChart(series: s),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: V6Link(
              label: table ? 'Hide the numbers' : 'Show the numbers',
              ink: V6Ink.accent,
              onTap: onToggleTable,
            ),
          ),
          if (table) V6PlanSeriesTable(series: s),
        ],
      );
    }

    return V6Glass(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: v6MetricColor(metric, p),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Semantics(header: true, child: V6Display(title, size: 20, maxLines: 2))),
          V6Text(v6RangeLabel(range), size: 12, ink: V6Ink.faint),
        ]),
        if (v6MetricCaption(metric).isNotEmpty) ...[
          const SizedBox(height: 4),
          V6Text(v6MetricCaption(metric), size: 12, ink: V6Ink.faint),
        ],
        const SizedBox(height: 14),
        V6Fade(child: body),
      ]),
    );
  }
}

/// Latest / average / days with data. Every tile shows a real number or nothing at all.
class _StatRow extends StatelessWidget {
  const _StatRow({required this.series});
  final V6PlanSeries series;

  @override
  Widget build(BuildContext context) {
    final real = series.points.where((p) => p.value != null).toList();
    final latest = real.isEmpty ? null : real.last.value;
    final avg = series.average;
    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: _StatTile(
            label: 'Latest',
            value: latest == null ? null : v6FormatValue(latest, series.unit),
            series: series,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            label: 'Average',
            value: avg == null ? null : v6FormatValue(avg, series.unit),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            label: 'Days with data',
            value: '${real.length} of ${series.points.length}',
          ),
        ),
      ]),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value, this.series});
  final String label;

  /// Null means "no data yet" — shown as a dash, never as a zero.
  final String? value;

  /// When given, the tile carries the sparkline of this series.
  final V6PlanSeries? series;

  @override
  Widget build(BuildContext context) {
    final s = series;
    return V6Glass(
      padding: const EdgeInsets.all(14),
      radius: 20,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        V6Text(label, size: 11, ink: V6Ink.faint, maxLines: 2, height: 1.2),
        const SizedBox(height: 6),
        V6Text(value ?? '—', size: 18, weight: FontWeight.w600, maxLines: 1),
        if (s != null) ...[
          const SizedBox(height: 8),
          V6PlanSparkline(series: s),
        ],
      ]),
    );
  }
}
