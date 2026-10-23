// Escape v6 — the plan charts (hand-drawn with CustomPainter).
//
// Written against the `dataviz` skill, mapped onto the Escape palette:
//   * One series per chart, so there is no legend box — the card title names what is plotted
//     (skill: "a single series needs no legend"). Identity comes from the mark's colour plus the
//     title, never colour alone.
//   * Form by job: a day-by-day magnitude (adherence, minutes) is **columns**; a level that moves
//     (mood, Self-Care Score) is a **line with a 10 % wash**. No dual axis anywhere, ever.
//   * Colour by job: each metric owns one hue, with its own step per mode — the night steps are
//     *chosen*, not a flipped version of the day ones. The four day steps and the four night steps
//     were both run through the skill's validator (lightness band, chroma floor, CVD separation,
//     normal-vision floor, ≥3:1 against the surface) and pass every check.
//   * Marks: columns ≤ 24 px with a 4 px rounded cap and a square baseline, air between bands
//     instead of a drawn border; 2 px line with round joins; an 8 px end marker with a 2 px
//     surface ring; hairline solid grid, never dashed.
//   * Labels are selective: the end value and the window's peak, plus the axis. Text always wears
//     ink tokens, never the series colour.
//   * A day with no data is a **gap** — the line breaks and no column is drawn. Nothing is
//     interpolated and nothing is 0 % because we do not know.
//   * Tap any day for its value (the phone's version of a hover tooltip), and every card can show
//     the same numbers as a table.
//   * Reduce Motion skips the reveal; the chart is simply there.
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/escape_v6/v6.dart';
import 'v6_plans_api.dart';

/// One hue per metric, one validated step per mode.
///
/// Day steps (on the pale Day glass): ember #B35600 · violet #6A3BB5 · teal #0B7D63 ·
/// royal #2347C8 — validator: lightness band PASS, chroma floor PASS, CVD separation PASS
/// (worst adjacent ΔE 18.2 deutan), normal-vision floor PASS (24.3), contrast PASS.
/// Night steps (on the #101E43 field): #C97510 · #8E78D6 · #0FA895 · #5B8DEF — all five
/// checks PASS (worst adjacent ΔE 12.2 deutan, normal-vision 18.1).
Color v6MetricColor(String metric, V6Palette p) {
  final light = p.isLight;
  return switch (metric) {
    'adherence' => light ? const Color(0xFFB35600) : const Color(0xFFC97510),
    'mood' => light ? const Color(0xFF6A3BB5) : const Color(0xFF8E78D6),
    'minutes' => light ? const Color(0xFF0B7D63) : const Color(0xFF0FA895),
    'score' => light ? const Color(0xFF2347C8) : const Color(0xFF5B8DEF),
    _ => p.accent,
  };
}

/// The colour the rings and caps sit on. The real surface is translucent glass over the ambient
/// video, so this is the nearest solid step of the same field — enough for a 2 px ring.
Color v6ChartSurface(V6Palette p) =>
    p.isLight ? const Color(0xFFEFF3FF) : const Color(0xFF101E43);

bool v6MetricIsColumns(String metric) => metric == 'adherence' || metric == 'minutes';

/// The y-axis top: a clean round number at or above the data's peak.
double v6ChartCeiling(String metric, double max) {
  if (metric == 'adherence' || metric == 'mood' || metric == 'score') return 100;
  if (max <= 0) return 10;
  const steps = [10.0, 15.0, 20.0, 30.0, 45.0, 60.0, 90.0, 120.0, 180.0, 240.0];
  for (final s in steps) {
    if (max <= s) return s;
  }
  return (max / 60).ceil() * 60.0;
}

// ───────────────────────── the chart ─────────────────────────

/// Draws [series]. Assumes the caller has already handled `series.empty` with an honest message:
/// this widget never invents a flat line.
class V6PlanChart extends StatefulWidget {
  const V6PlanChart({super.key, required this.series, this.height = 148});

  final V6PlanSeries series;
  final double height;

  @override
  State<V6PlanChart> createState() => _V6PlanChartState();
}

class _V6PlanChartState extends State<V6PlanChart> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  late final CurvedAnimation _curved = CurvedAnimation(parent: _c, curve: V6Motion.ease);
  int? _selected;

  @override
  void initState() {
    super.initState();
    _c.forward();
  }

  @override
  void didUpdateWidget(V6PlanChart old) {
    super.didUpdateWidget(old);
    if (old.series.metric != widget.series.metric || old.series.range != widget.series.range) {
      _selected = null;
      _c
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _curved.dispose();
    _c.dispose();
    super.dispose();
  }

  void _pick(Offset local, double width) {
    final pts = widget.series.points;
    if (pts.isEmpty) return;
    final plotLeft = _V6ChartGeometry.padLeft;
    final plotWidth = math.max(1.0, width - plotLeft - _V6ChartGeometry.padRight);
    final rel = ((local.dx - plotLeft) / plotWidth).clamp(0.0, 1.0);
    var i = (rel * (pts.length - 1)).round().clamp(0, pts.length - 1).toInt();
    // Prefer a day that actually has a value: selecting a gap would say nothing.
    if (pts[i].value == null) {
      for (var d = 1; d < pts.length; d++) {
        final a = i - d;
        final b = i + d;
        if (a >= 0 && pts[a].value != null) {
          i = a;
          break;
        }
        if (b < pts.length && pts[b].value != null) {
          i = b;
          break;
        }
      }
    }
    if (pts[i].value == null || i == _selected) return;
    HapticFeedback.selectionClick();
    setState(() => _selected = i);
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final s = widget.series;
    final off = V6Theme.motionOff(context);
    final color = v6MetricColor(s.metric, p);
    final sel = _selected;
    final selected = sel != null && sel < s.points.length ? s.points[sel] : null;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      // The tap read-out: the phone's hover tooltip. Live so a screen reader hears each pick.
      SizedBox(
        height: 22,
        child: Semantics(
          liveRegion: true,
          child: V6Fade(
            child: selected == null
                ? V6Text('Tap a day for its number.',
                    key: const ValueKey('hint'), size: 12, ink: V6Ink.faint)
                : Row(
                    key: ValueKey('sel-${selected.day}'),
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: V6Text(
                          '${v6SpokenDay(selected.day)} · ${v6FormatValue(selected.value!, s.unit)}',
                          size: 12,
                          weight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      const SizedBox(height: 6),
      Semantics(
        label: v6SeriesSummary(s),
        child: ExcludeSemantics(
          child: LayoutBuilder(
            builder: (context, box) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (d) => _pick(d.localPosition, box.maxWidth),
              onHorizontalDragUpdate: (d) => _pick(d.localPosition, box.maxWidth),
              child: AnimatedBuilder(
                animation: _curved,
                builder: (context, _) => CustomPaint(
                  size: Size(box.maxWidth, widget.height),
                  painter: _V6SeriesPainter(
                    series: s,
                    t: off ? 1 : _curved.value,
                    color: color,
                    ink: p.ink,
                    inkFaint: p.inkFaint,
                    grid: p.glassBorder,
                    surface: v6ChartSurface(p),
                    selected: sel,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class _V6ChartGeometry {
  static const padLeft = 38.0;
  static const padRight = 10.0;
  static const padTop = 10.0;
  static const padBottom = 22.0;
}

class _V6SeriesPainter extends CustomPainter {
  _V6SeriesPainter({
    required this.series,
    required this.t,
    required this.color,
    required this.ink,
    required this.inkFaint,
    required this.grid,
    required this.surface,
    required this.selected,
  });

  final V6PlanSeries series;
  final double t;
  final Color color;
  final Color ink;
  final Color inkFaint;
  final Color grid;
  final Color surface;
  final int? selected;

  void _text(Canvas canvas, String s, Offset at, Color c, {double size = 10, bool right = false, FontWeight weight = FontWeight.w400}) {
    final tp = TextPainter(
      text: TextSpan(text: s, style: V6Type.body(size, c, weight: weight, height: 1)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(right ? at.dx - tp.width : at.dx, at.dy));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pts = series.points;
    if (pts.isEmpty) return;
    final left = _V6ChartGeometry.padLeft;
    final top = _V6ChartGeometry.padTop;
    final right = size.width - _V6ChartGeometry.padRight;
    final bottom = size.height - _V6ChartGeometry.padBottom;
    final plotW = math.max(1.0, right - left);
    final plotH = math.max(1.0, bottom - top);
    final ceiling = v6ChartCeiling(series.metric, series.max);

    double x(int i) => pts.length == 1 ? left + plotW / 2 : left + plotW * i / (pts.length - 1);
    double y(double v) => bottom - plotH * (v / ceiling).clamp(0.0, 1.0);

    // ── chrome: a hairline baseline and one hairline at the ceiling. Recessive, solid.
    final line = Paint()
      ..color = grid
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(left, bottom + 0.5), Offset(right, bottom + 0.5), line);
    canvas.drawLine(Offset(left, top + 0.5), Offset(right, top + 0.5), line);
    _text(canvas, v6AxisTick(ceiling, series.unit), Offset(left - 6, top - 4), inkFaint, right: true);
    _text(canvas, '0', Offset(left - 6, bottom - 6), inkFaint, right: true);

    // ── x labels: ends always, then a few evenly spaced. Never a label on every day.
    final want = <int>{0, pts.length - 1};
    final stride = pts.length <= 8 ? 1 : (pts.length / 5).ceil();
    for (var i = 0; i < pts.length; i += stride) {
      want.add(i);
    }
    final ordered = want.toList()..sort();
    var lastRight = -1e9;
    for (final i in ordered) {
      final label = pts[i].label;
      if (label.isEmpty) continue;
      final tp = TextPainter(
        text: TextSpan(text: label, style: V6Type.body(10, inkFaint, height: 1)),
        textDirection: TextDirection.ltr,
      )..layout();
      var dx = x(i) - tp.width / 2;
      if (i == pts.length - 1) dx = math.min(dx, right - tp.width);
      if (i == 0) dx = math.max(dx, 0);
      if (dx < lastRight + 6) continue; // measured, so labels never collide or clip
      tp.paint(canvas, Offset(dx, bottom + 7));
      lastRight = dx + tp.width;
    }

    if (v6MetricIsColumns(series.metric)) {
      _paintColumns(canvas, pts, x, y, bottom, plotW);
    } else {
      _paintLine(canvas, pts, x, y, bottom);
    }
    _paintLabels(canvas, pts, x, y, size.width);
  }

  // Columns: ≤24 px, air between bands, 4 px rounded cap, square at the baseline.
  void _paintColumns(Canvas canvas, List<V6PlanPoint> pts, double Function(int) x,
      double Function(double) y, double bottom, double plotW) {
    final band = plotW / math.max(1, pts.length);
    final w = math.min(24.0, math.max(2.0, band - (band > 6 ? 3.0 : 1.0)));
    final fill = Paint()..color = color;
    final dim = Paint()..color = color.withOpacity(0.45);
    for (var i = 0; i < pts.length; i++) {
      final v = pts[i].value;
      if (v == null) continue; // a gap stays a gap
      final full = y(v);
      final h = (bottom - full) * t;
      if (h <= 0.4) continue;
      final rect = Rect.fromLTWH(x(i) - w / 2, bottom - h, w, h);
      final r = Radius.circular(math.min(4.0, h));
      canvas.drawRRect(
        RRect.fromRectAndCorners(rect, topLeft: r, topRight: r),
        selected == null || selected == i ? fill : dim,
      );
    }
  }

  // Line: 2 px, round joins, a 10 % wash under it, broken across gaps.
  void _paintLine(Canvas canvas, List<V6PlanPoint> pts, double Function(int) x,
      double Function(double) y, double bottom) {
    final stroke = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final wash = Paint()..color = color.withOpacity(0.10);

    var i = 0;
    while (i < pts.length) {
      if (pts[i].value == null) {
        i++;
        continue;
      }
      final run = <Offset>[];
      var j = i;
      while (j < pts.length && pts[j].value != null) {
        final v = pts[j].value!;
        run.add(Offset(x(j), bottom - (bottom - y(v)) * t));
        j++;
      }
      if (run.length == 1) {
        canvas.drawCircle(run.first, 3, Paint()..color = color);
      } else {
        final path = Path()..moveTo(run.first.dx, run.first.dy);
        for (final o in run.skip(1)) {
          path.lineTo(o.dx, o.dy);
        }
        final area = Path.from(path)
          ..lineTo(run.last.dx, bottom)
          ..lineTo(run.first.dx, bottom)
          ..close();
        canvas.drawPath(area, wash);
        canvas.drawPath(path, stroke);
      }
      i = j;
    }

    // End marker: ≥8 px with a 2 px surface ring so it stays legible over the line.
    final lastReal = _lastRealIndex(pts);
    if (lastReal != null) {
      final o = Offset(x(lastReal), bottom - (bottom - y(pts[lastReal].value!)) * t);
      canvas.drawCircle(o, 6, Paint()..color = surface);
      canvas.drawCircle(o, 4, Paint()..color = color);
    }
    final sel = selected;
    if (sel != null && sel != lastReal && pts[sel].value != null) {
      final o = Offset(x(sel), bottom - (bottom - y(pts[sel].value!)) * t);
      canvas.drawCircle(o, 6, Paint()..color = surface);
      canvas.drawCircle(o, 4, Paint()..color = color);
    }
  }

  /// Two direct labels at most: the latest value, and the window's peak when it is elsewhere.
  void _paintLabels(Canvas canvas, List<V6PlanPoint> pts, double Function(int) x,
      double Function(double) y, double width) {
    if (t < 0.9) return;
    final last = _lastRealIndex(pts);
    if (last == null) return;
    var peak = last;
    for (var i = 0; i < pts.length; i++) {
      final v = pts[i].value;
      if (v != null && v > (pts[peak].value ?? 0)) peak = i;
    }
    void label(int i, {required bool strong}) {
      final v = pts[i].value;
      if (v == null) return;
      final text = v6FormatValue(v, series.unit);
      final tp = TextPainter(
        text: TextSpan(
            text: text,
            style: V6Type.body(11, strong ? ink : inkFaint,
                weight: strong ? FontWeight.w600 : FontWeight.w400, height: 1)),
        textDirection: TextDirection.ltr,
      )..layout();
      var dx = x(i) - tp.width / 2;
      dx = dx.clamp(0.0, math.max(0.0, width - tp.width));
      tp.paint(canvas, Offset(dx, math.max(0.0, y(v) - 16)));
    }

    label(last, strong: true);
    if (peak != last) label(peak, strong: false);
  }

  int? _lastRealIndex(List<V6PlanPoint> pts) {
    for (var i = pts.length - 1; i >= 0; i--) {
      if (pts[i].value != null) return i;
    }
    return null;
  }

  @override
  bool shouldRepaint(_V6SeriesPainter o) =>
      o.t != t ||
      o.selected != selected ||
      o.color != color ||
      o.ink != ink ||
      o.series != series;
}

/// "0 / 100" style axis tick.
String v6AxisTick(double v, String unit) {
  final n = v >= 1000 ? '${(v / 1000).toStringAsFixed(v % 1000 == 0 ? 0 : 1)}K' : v.round().toString();
  return unit == '%' ? '$n%' : n;
}

/// What a screen reader hears instead of the picture.
String v6SeriesSummary(V6PlanSeries s) {
  final real = s.points.where((p) => p.value != null).toList();
  if (real.isEmpty) return '${s.title}: no data yet.';
  final latest = real.last;
  final avg = s.average;
  return '${s.title}, last ${v6RangeLabel(s.range)}. '
      '${real.length} of ${s.points.length} days have data. '
      'Latest ${v6SpokenDay(latest.day)}: ${v6FormatValue(latest.value!, s.unit)}.'
      '${avg == null ? '' : ' Average ${v6FormatValue(avg, s.unit)}.'}';
}

// ───────────────────────── table view ─────────────────────────

/// The same numbers as a list, for anyone who would rather read them (and for the days a chart
/// cannot label). Only days with real data appear — a blank day is simply not in the table.
class V6PlanSeriesTable extends StatelessWidget {
  const V6PlanSeriesTable({super.key, required this.series});
  final V6PlanSeries series;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final rows = series.points.where((x) => x.value != null).toList().reversed.toList();
    if (rows.isEmpty) {
      return const V6Text('No days with data yet.', size: 13, ink: V6Ink.muted);
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      for (var i = 0; i < rows.length; i++)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            border: i == 0 ? null : Border(top: BorderSide(color: p.glassBorder)),
          ),
          child: Row(children: [
            Expanded(child: V6Text(v6SpokenDay(rows[i].day), size: 13, ink: V6Ink.muted, maxLines: 1)),
            V6Text(v6FormatValue(rows[i].value!, series.unit), size: 13, weight: FontWeight.w600),
          ]),
        ),
    ]);
  }
}

// ───────────────────────── sparkline ─────────────────────────

/// A 2 px sparkline for a stat tile. Nothing is drawn when there is too little real data.
class V6PlanSparkline extends StatelessWidget {
  const V6PlanSparkline({super.key, required this.series, this.height = 34});
  final V6PlanSeries series;
  final double height;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    if (series.empty || series.realCount < 2) return SizedBox(height: height);
    return ExcludeSemantics(
      child: SizedBox(
        height: height,
        child: CustomPaint(
          painter: _V6SparkPainter(
            series: series,
            color: v6MetricColor(series.metric, p),
            surface: v6ChartSurface(p),
          ),
        ),
      ),
    );
  }
}

class _V6SparkPainter extends CustomPainter {
  _V6SparkPainter({required this.series, required this.color, required this.surface});
  final V6PlanSeries series;
  final Color color;
  final Color surface;

  @override
  void paint(Canvas canvas, Size size) {
    final pts = series.points;
    if (pts.length < 2) return;
    final ceiling = v6ChartCeiling(series.metric, series.max);
    double x(int i) => size.width * i / (pts.length - 1);
    double y(double v) => size.height - (size.height - 4) * (v / ceiling).clamp(0.0, 1.0) - 2;
    final stroke = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    var i = 0;
    Offset? lastPoint;
    while (i < pts.length) {
      if (pts[i].value == null) {
        i++;
        continue;
      }
      final run = <Offset>[];
      var j = i;
      while (j < pts.length && pts[j].value != null) {
        run.add(Offset(x(j), y(pts[j].value!)));
        j++;
      }
      if (run.length > 1) {
        final path = Path()..moveTo(run.first.dx, run.first.dy);
        for (final o in run.skip(1)) {
          path.lineTo(o.dx, o.dy);
        }
        canvas.drawPath(path, stroke);
      }
      lastPoint = run.last;
      i = j;
    }
    if (lastPoint != null) {
      canvas.drawCircle(lastPoint, 4, Paint()..color = surface);
      canvas.drawCircle(lastPoint, 2.5, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(_V6SparkPainter o) => o.series != series || o.color != color;
}
