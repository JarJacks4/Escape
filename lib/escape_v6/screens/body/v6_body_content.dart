// Escape v6 — Body content: routines built from the real moves in lib/body_sections.dart, plus
// the shared Body widgets (routine art, 3D model viewport, calm silhouette fallback).
//
// ─── FOR THE INTERNS: where Lucille's avatar animations go ──────────────────────────────────
// The founder will upload Lucille's MetaHuman avatar animations later (one GLB per move).
// Paste each link into [kLucilleAvatarGlb] below, keyed by the EXACT move name from
// body_sections.dart (e.g. 'Mountain Pose', "Child's Pose", 'Brush Knee'). That is the only
// place you need to touch:
//   * a move with an entry here plays Lucille's GLB everywhere (section preview, player),
//     overriding the move's own `models` from body_sections.dart;
//   * a move without an entry falls back to its first `models` link, and then to the calm
//     silhouette + steps ("3D move coming soon").
// Use [v6GlbFor] whenever you need "the GLB to show for this move" — never read `models` directly.
// ─────────────────────────────────────────────────────────────────────────────────────────────
//
// To add a routine: append a V6BodyRoutine to [kV6BodyRoutines] using `_pick(sectionId, [...])`
// with exact move names. Minutes are computed from the moves, never typed by hand.
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '/body_sections.dart';
import '/escape_v6/v6.dart';

export '/body_sections.dart' show BodyMove, BodySection, kBodySections, bodySectionById;

/// Lucille's MetaHuman avatar animation per move name (GLB link). Empty until uploaded.
/// Example: `'Mountain Pose': 'https://res.cloudinary.com/.../Lucille_Mountain_Pose.glb',`
const Map<String, String> kLucilleAvatarGlb = {};

/// The GLB to show for [m]: Lucille's avatar → the move's first model → null (no 3D yet).
String? v6GlbFor(BodyMove m) {
  final l = kLucilleAvatarGlb[m.name];
  if (l != null && l.isNotEmpty) return l;
  if (m.models.isNotEmpty && m.models.first.isNotEmpty) return m.models.first;
  return null;
}

/// All GLB links for [m] in step order (Lucille's single animation replaces Start / End poses).
List<String> v6GlbsFor(BodyMove m) {
  final l = kLucilleAvatarGlb[m.name];
  if (l != null && l.isNotEmpty) return [l];
  return m.models.where((u) => u.isNotEmpty).toList();
}

/// Seconds a move takes: its hold time, or ≈ 3 s per rep when that is longer.
int v6BodyMoveSeconds(BodyMove m) {
  final byReps = m.reps * 3;
  return byReps > m.seconds ? byReps : m.seconds;
}

/// "45 s" or "8 reps".
String v6BodyMoveLabel(BodyMove m) => m.reps > 0 ? '${m.reps} reps' : '${m.seconds} s';

class V6BodyRoutine {
  const V6BodyRoutine({
    required this.id,
    required this.title,
    required this.sectionId,
    required this.minutes,
    required this.intensity,
    required this.equipment,
    required this.summary,
    required this.moves,
    this.image,
  });

  final String id;
  final String title;
  final String sectionId;
  final int minutes;

  /// Gentle | Steady | Lively
  final String intensity;
  final String equipment;
  final String summary;
  final List<BodyMove> moves;
  final String? image;

  BodySection get section => bodySectionById(sectionId);
  String get heroTag => 'body-routine-$id';
  bool get isFull => id.startsWith('full-');
  int get movesWith3d => moves.where((m) => v6GlbFor(m) != null).length;
}

String _img(String id) =>
    'https://images.unsplash.com/$id?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&q=80&w=900';

int _minutes(List<BodyMove> moves) {
  final s = moves.fold<int>(0, (a, m) => a + v6BodyMoveSeconds(m));
  return s <= 0 ? 1 : (s + 59) ~/ 60;
}

/// Moves of [sectionId] in the order given (unknown names are skipped, never crash).
List<BodyMove> _pick(String sectionId, List<String> names) {
  final moves = bodySectionById(sectionId).moves;
  final out = <BodyMove>[];
  for (final n in names) {
    final m = moves.where((x) => x.name == n).v6First;
    if (m != null) out.add(m);
  }
  return out;
}

V6BodyRoutine _routine({
  required String id,
  required String title,
  required String sectionId,
  required String intensity,
  required String equipment,
  required String summary,
  required List<BodyMove> moves,
  String? image,
}) =>
    V6BodyRoutine(
      id: id,
      title: title,
      sectionId: sectionId,
      minutes: _minutes(moves),
      intensity: intensity,
      equipment: equipment,
      summary: summary,
      moves: moves,
      image: image,
    );

V6BodyRoutine _full(String sectionId, String intensity, String equipment, String summary, {String? image}) {
  final s = bodySectionById(sectionId);
  return _routine(
    id: 'full-$sectionId',
    title: 'Full ${s.title} flow',
    sectionId: sectionId,
    intensity: intensity,
    equipment: equipment,
    summary: summary,
    moves: s.moves,
    image: image,
  );
}

final List<V6BodyRoutine> kV6BodyRoutines = [
  // ── Yoga ──
  _full('yoga', 'Steady', 'Mat', 'All ten yoga poses, from Mountain Pose to a long rest in Corpse Pose.',
      image: _img('photo-1542401886-65d6c61db217')),
  _routine(
    id: 'yoga-morning-wake-up',
    title: 'Morning Wake-Up',
    sectionId: 'yoga',
    intensity: 'Steady',
    equipment: 'Mat',
    summary: 'Wake up your spine and legs, then find your balance for the day.',
    image: _img('photo-1542401886-65d6c61db217'),
    moves: _pick('yoga', ['Mountain Pose', 'Cat-Cow', 'Downward-Facing Dog', 'Warrior I', 'Warrior II', 'Tree Pose']),
  ),
  _routine(
    id: 'yoga-evening-unwind',
    title: 'Evening Unwind',
    sectionId: 'yoga',
    intensity: 'Gentle',
    equipment: 'Mat or bed',
    summary: 'Slow folds and long holds to let the day drain out of your body.',
    image: _img('photo-1621840090029-08b00c831808'),
    moves: _pick('yoga', ['Cat-Cow', "Child's Pose", 'Cobra Pose', 'Seated Forward Fold', 'Corpse Pose']),
  ),
  // ── Pilates ──
  _full('pilates', 'Steady', 'Mat', 'The ten classic mat moves for core control and posture.'),
  _routine(
    id: 'pilates-core-basics',
    title: 'Core Basics',
    sectionId: 'pilates',
    intensity: 'Steady',
    equipment: 'Mat',
    summary: 'Build a steady core with the first moves every Pilates class starts with.',
    moves: _pick('pilates', ['The Hundred', 'Roll Up', 'Single Leg Stretch', 'Double Leg Stretch', 'Pilates Teaser Prep']),
  ),
  _routine(
    id: 'pilates-posture-reset',
    title: 'Posture Reset',
    sectionId: 'pilates',
    intensity: 'Gentle',
    equipment: 'Mat',
    summary: 'Lengthen your spine and open your chest after a long day sitting.',
    moves: _pick('pilates', ['Spine Stretch Forward', 'Swan Prep', 'Shoulder Bridge', 'Single Leg Circle', 'Rolling Like a Ball']),
  ),
  // ── Yang style Tai Chi ──
  _full('taichi', 'Gentle', 'No equipment', 'Ten Yang style forms, slow and flowing, start to finish.',
      image: _img('photo-1508402476522-c77c2fa4479d')),
  _routine(
    id: 'taichi-grounding-flow',
    title: 'Grounding Flow',
    sectionId: 'taichi',
    intensity: 'Gentle',
    equipment: 'No equipment',
    summary: 'Slow forms that root you through the feet and quiet a busy mind.',
    image: _img('photo-1508402476522-c77c2fa4479d'),
    moves: _pick('taichi', [
      'Commencing Form',
      'White Crane Spreads Its Wings',
      'Play the Lute',
      'Single Whip',
      'Wave Hands Like Clouds',
    ]),
  ),
  _routine(
    id: 'taichi-opening-the-day',
    title: 'Opening the Day',
    sectionId: 'taichi',
    intensity: 'Gentle',
    equipment: 'No equipment',
    summary: 'Flowing steps that warm the whole body and balance left and right.',
    image: _img('photo-1508402476522-c77c2fa4479d'),
    moves: _pick('taichi', [
      'Commencing Form',
      "Parting the Wild Horse's Mane",
      'Brush Knee',
      'Repulse Monkey',
      "Grasp the Bird's Tail (Left)",
      "Grasp the Bird's Tail (Right)",
    ]),
  ),
  // ── Exercise ──
  _full('exercise', 'Lively', 'No equipment', 'All ten strength and cardio basics in one session.'),
  _routine(
    id: 'exercise-quick-strength',
    title: 'Quick Strength',
    sectionId: 'exercise',
    intensity: 'Steady',
    equipment: 'No equipment',
    summary: 'Legs, chest and core in a few minutes, no kit needed.',
    moves: _pick('exercise', ['Arm Stretching', 'Air Squat', 'Push-Up', 'Reverse Lunge', 'Plank', 'Glute Bridge']),
  ),
  _routine(
    id: 'exercise-energy-boost',
    title: 'Energy Boost',
    sectionId: 'exercise',
    intensity: 'Lively',
    equipment: 'No equipment',
    summary: 'Get your heart going and shake off a sluggish afternoon.',
    moves: _pick('exercise', ['Arm Stretching', 'Jumping Jacks', 'Air Squat Bent Arms', 'Overhead Squat', 'Burpee']),
  ),
];

V6BodyRoutine? v6BodyRoutine(String? id) {
  if (id == null || id.isEmpty) return null;
  return kV6BodyRoutines.where((r) => r.id == id).v6First;
}

List<V6BodyRoutine> v6BodyRoutinesFor(String sectionId) =>
    kV6BodyRoutines.where((r) => r.sectionId == sectionId).toList();

// ───────────────────────── shared Body widgets ─────────────────────────

/// Routine artwork that fills its parent: the photo if there is one, otherwise a glow in the
/// section colour with its icon. Wrap in [V6Hero] with [V6BodyRoutine.heroTag] on both pages.
class V6BodyRoutineArt extends StatelessWidget {
  const V6BodyRoutineArt({super.key, required this.routine});
  final V6BodyRoutine routine;

  @override
  Widget build(BuildContext context) {
    final s = routine.section;
    final glow = DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.4, -0.5),
          radius: 1.2,
          colors: [s.color.withOpacity(0.55), const Color(0xFF0B1329), const Color(0xFF030508)],
          stops: const [0, 0.6, 1],
        ),
      ),
      child: Align(
        alignment: const Alignment(0.75, -0.55),
        child: Icon(s.icon, size: 96, color: Colors.white.withOpacity(0.16)),
      ),
    );
    final img = routine.image;
    return Stack(fit: StackFit.expand, children: [
      glow,
      if (img != null)
        Image.network(
          img,
          fit: BoxFit.cover,
          semanticLabel: routine.title,
          frameBuilder: (context, child, frame, sync) => AnimatedOpacity(
            opacity: frame == null && !sync ? 0 : 1,
            duration: const Duration(milliseconds: 400),
            child: child,
          ),
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
        ),
      const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x1A030508), Color(0xE0030508)],
          ),
        ),
      ),
    ]);
  }
}

/// The 3D viewport: a GLB in model-viewer, keyed by its URL so it reloads per move.
class V6BodyModel extends StatelessWidget {
  const V6BodyModel({super.key, required this.glb, required this.alt, this.autoRotate = false});
  final String glb;
  final String alt;
  final bool autoRotate;

  @override
  Widget build(BuildContext context) => Semantics(
        label: '3D guide: $alt',
        child: ModelViewer(
          key: ValueKey(glb),
          src: glb,
          alt: alt,
          autoPlay: true,
          autoRotate: autoRotate,
          cameraControls: true,
          backgroundColor: Colors.transparent,
          ar: false,
        ),
      );
}

/// Calm glowing figure shown while a move has no 3D model yet. Sways gently (still when
/// [paused] or Reduce Motion is on).
class V6BodySilhouette extends StatefulWidget {
  const V6BodySilhouette({super.key, this.paused = false, this.height = 240, this.color});
  final bool paused;
  final double height;
  final Color? color;

  @override
  State<V6BodySilhouette> createState() => _V6BodySilhouetteState();
}

class _V6BodySilhouetteState extends State<V6BodySilhouette> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(seconds: 5));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(covariant V6BodySilhouette old) {
    super.didUpdateWidget(old);
    _sync();
  }

  void _sync() {
    final still = widget.paused || V6Theme.motionOff(context);
    if (still) {
      _c.stop();
    } else if (!_c.isAnimating) {
      _c.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final glow = widget.color ?? const Color(0xFF38BDF8);
    final h = widget.height;
    return ExcludeSemantics(
      child: SizedBox(
        height: h,
        width: h * 0.8,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Positioned(
            bottom: h * 0.02,
            child: Container(
              width: h * 0.8,
              height: h * 0.15,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [glow.withOpacity(0.35), glow.withOpacity(0)]),
                borderRadius: BorderRadius.circular(h),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _c,
            builder: (context, _) => CustomPaint(
              size: Size(h * 0.57, h),
              painter: _FigurePainter(Curves.easeInOut.transform(_c.value), glow),
            ),
          ),
        ]),
      ),
    );
  }
}

class _FigurePainter extends CustomPainter {
  _FigurePainter(this.t, this.glow);
  final double t;
  final Color glow;

  @override
  void paint(Canvas canvas, Size size) {
    // Drawn on the Figma 170 × 300 grid, then scaled.
    final sx = size.width / 170, sy = size.height / 300;
    canvas.save();
    canvas.scale(sx, sy);
    // Whole-body sway from the feet.
    canvas.translate(85, 300);
    canvas.rotate((t - 0.5) * 0.05);
    canvas.translate(-85, -300);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xF2E6EAF4), glow.withOpacity(0.55)],
      ).createShader(const Rect.fromLTWH(0, 0, 170, 300))
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 3);
    canvas.drawCircle(const Offset(85, 38), 20, Paint()..color = const Color(0x26E6EAF4));
    canvas.drawCircle(const Offset(85, 38), 20, paint);
    canvas.drawLine(const Offset(85, 62), const Offset(85, 154), paint);
    final lift = (t - 0.5) * 18;
    final left = Path()
      ..moveTo(85, 80)
      ..cubicTo(60, 92 - lift, 40, 110 - lift, 30, 136 - lift * 2);
    final right = Path()
      ..moveTo(85, 80)
      ..cubicTo(110, 92 - lift, 130, 110 - lift, 140, 136 - lift * 2);
    canvas.drawPath(left, paint);
    canvas.drawPath(right, paint);
    canvas.drawPath(
        Path()
          ..moveTo(85, 154)
          ..lineTo(60, 220)
          ..lineTo(52, 286),
        paint);
    canvas.drawPath(
        Path()
          ..moveTo(85, 154)
          ..lineTo(110, 220)
          ..lineTo(118, 286),
        paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_FigurePainter o) => o.t != t || o.glow != glow;
}

/// Numbered "How to do it" steps.
class V6BodySteps extends StatelessWidget {
  const V6BodySteps({super.key, required this.steps, this.size = 14});
  final List<String> steps;
  final double size;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (var i = 0; i < steps.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 12, top: 1),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: p.accentSoft,
                border: Border.all(color: p.accent.withOpacity(0.4)),
              ),
              child: Text('${i + 1}', style: V6Type.body(12, p.ink, weight: FontWeight.w600, height: 1)),
            ),
            Expanded(child: V6Text(steps[i], size: size, ink: V6Ink.muted)),
          ]),
        ),
    ]);
  }
}

/// Small "3D" pill for moves that have a model.
class V6Body3dBadge extends StatelessWidget {
  const V6Body3dBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      label: '3D guide available',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: p.accentSoft,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: p.accent.withOpacity(0.45)),
        ),
        child: ExcludeSemantics(
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.view_in_ar_rounded, size: 13, color: p.accent),
            const SizedBox(width: 4),
            Text('3D', style: V6Type.body(11, p.accent, weight: FontWeight.w600, height: 1)),
          ]),
        ),
      ),
    );
  }
}
