// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:url_launcher/url_launcher.dart';

/// Escape Journal V2 — the whole scan-first Journal as one widget, wired to the Lucille v1 API.
///
/// FlutterFlow setup
///   1. Custom Code > Widgets > + Add > Widget, name `EscapeJournalV2`.
///      Parameters: initialScreen (String, nullable: 'home' | 'stats' | 'insights' | 'letter' | 'entries'),
///                  initialMode (String, nullable: 'free' | 'guided' | 'gratitude' | 'ritual'),
///                  onClose (Action, nullable)
///   2. Needs the custom action `lucilleV1` and the custom widget `MoodOrbVideo`.
///   3. New page `JournalHomeV2` (route /journalHomeV2), no app bar, body = this widget at
///      width/height infinity. Page parameters `screen` and `mode` -> pass into the widget.
///   4. Point every journal door (Home, Mind, Reset, Lucille tab, Mood Result "Save this moment",
///      side menu) at JournalHomeV2.
///
/// Screens: Home (one Mood Orb + period chips) -> Mood Stats (tap the orb), New entry (4 modes with
/// icons) -> optional 20 s breath -> Editor (prompt, voice, energy center) -> Lucille reflects
/// (+ reframe, tuned soundscape, suggestions) -> Saved. Also Insights, Entries, Letter to future you.
/// Hero animation: the Mood Orb flies Home <-> Stats and Editor -> Reflection -> Saved.
class EscapeJournalV2 extends StatefulWidget {
  const EscapeJournalV2({
    super.key,
    this.width,
    this.height,
    this.initialScreen,
    this.initialMode,
    this.onClose,
  });

  final double? width;
  final double? height;
  final String? initialScreen;
  final String? initialMode;
  final Future Function()? onClose;

  @override
  State<EscapeJournalV2> createState() => _EscapeJournalV2State();
}

// ───────────────────────── brand ─────────────────────────

class _C {
  static const night = Color(0xFF0B1230);
  static const sleep = Color(0xFF05081A);
  static const navy = Color(0xFF121A3E);
  static const cyan = Color(0xFF4CF6F6);
  static const teal = Color(0xFF39D9C1);
  static const ice = Color(0xFFD0E3F7);
  static const lilac = Color(0xFFB9A3F0);
  static const violet = Color(0xFF8E7CD9);
  static const royal = Color(0xFF39519F);
  static const ember = Color(0xFFEF7702);
  static const mist = Color(0xFFE9E6F7);
  static const muted = Color(0xFFA1A6CC);
}

Color _hex(dynamic hex, [Color fallback = _C.cyan]) {
  if (hex is! String || hex.isEmpty) return fallback;
  final h = hex.replaceAll('#', '');
  final v = int.tryParse(h.length == 6 ? 'FF$h' : h, radix: 16);
  return v == null ? fallback : Color(v);
}

TextStyle _display(double size, [Color color = _C.mist]) =>
    GoogleFonts.gildaDisplay(fontSize: size, color: color, height: 1.12);
TextStyle _body(double size, {Color color = _C.mist, FontWeight weight = FontWeight.w400, double height = 1.45}) =>
    GoogleFonts.workSans(fontSize: size, color: color, fontWeight: weight, height: height);

const _modeMeta = <String, Map<String, dynamic>>{
  'free': {'label': 'Free write', 'sub': 'Open page, gently prompted', 'icon': Icons.edit_outlined, 'color': _C.cyan},
  'guided': {'label': 'Lucille guided', 'sub': 'She asks, you answer, she reflects', 'icon': Icons.auto_awesome_outlined, 'color': _C.lilac},
  'gratitude': {'label': 'Gratitude', 'sub': 'Three good things', 'icon': Icons.favorite_border, 'color': _C.teal},
  'ritual': {'label': 'Ritual Spark', 'sub': 'One intention for tonight', 'icon': Icons.local_fire_department_outlined, 'color': _C.ember},
};

const _centers = <String, String>{
  'grounding': 'Grounding', 'creativity': 'Creativity', 'power': 'Power', 'connection': 'Connection',
  'expression': 'Expression', 'intuition': 'Intuition', 'purpose': 'Purpose',
};

const _consentCopy = <String, String>{
  'wellbeing_data': 'Save your mood check-ins and journal entries so your Mood Orb and stats can grow with you.',
  'ai_reflection': 'Let Lucille (AI) read this entry to write a short reflection. Entries are not used to train models.',
  'voice': 'Use your microphone to speak your entry. Speech is turned into text on your phone.',
  'camera_scan': 'Use your camera for the pulse part of the Mood Scan. Frames never leave your phone.',
  'personalization': 'Use your history to personalise suggestions and plans.',
};

String _orbUrl(BuildContext context, Map? orb) {
  if (orb == null) return '';
  final ios = Theme.of(context).platform == TargetPlatform.iOS;
  return (ios ? orb['orbHevc'] : orb['orbH264'])?.toString() ?? '';
}

// ───────────────────────── store ─────────────────────────

class _Store extends ChangeNotifier {
  bool disposed = false;
  Map<String, dynamic>? home;
  String period = 'week';
  bool loading = false;
  String? error;

  Map? get orb => home?['orb'] is Map ? home!['orb'] as Map : null;
  Color get accent => _hex((orb?['orb'] as Map?)?['accent'], _C.cyan);
  bool get night => home?['night'] == true;

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  void set(Map<String, dynamic> h) {
    if (disposed) return;
    home = h;
    notifyListeners();
  }

  void setOrb(Map<String, dynamic> summary) {
    if (disposed) return;
    home = {...?home, 'orb': summary};
    notifyListeners();
  }
}

// ───────────────────────── api ─────────────────────────

Future<Map<String, dynamic>> _api(BuildContext context, String method, String path, [dynamic body]) async {
  Map<String, dynamic> res = Map<String, dynamic>.from(await lucilleV1(method, path, body) as Map);
  final purpose = res['consentPurpose'];
  if (purpose != null && context.mounted) {
    final allow = await _askConsent(context, purpose.toString());
    if (allow == true) {
      await lucilleV1('PUT', '/v1/privacy/consents', {
        'flags': {purpose: true}
      });
      res = Map<String, dynamic>.from(await lucilleV1(method, path, body) as Map);
    }
  }
  return res;
}

Future<bool?> _askConsent(BuildContext context, String purpose) {
  return showModalBottomSheet<bool>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (ctx) => _Glass(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('YOUR CHOICE', style: _body(11, color: _C.cyan, weight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text('Allow this?', style: _display(24)),
        const SizedBox(height: 8),
        Text(_consentCopy[purpose] ?? 'Escape needs your permission for this feature.', style: _body(14, color: _C.ice)),
        const SizedBox(height: 6),
        Text('You can change this any time in Settings › Privacy.', style: _body(12, color: _C.muted)),
        const SizedBox(height: 16),
        _Cta(label: 'Allow', onTap: () => Navigator.of(ctx).pop(true)),
        const SizedBox(height: 8),
        _Ghost(label: 'Not now', onTap: () => Navigator.of(ctx).pop(false)),
      ]),
    ),
  );
}

void _openDeeplink(BuildContext context, Map? link) {
  final path = link?['path']?.toString();
  if (path == null || path.isEmpty) return;
  final params = (link?['params'] as Map?)?.map((k, v) => MapEntry(k.toString(), v.toString())) ?? <String, String>{};
  final uri = Uri(path: path, queryParameters: params.isEmpty ? null : params);
  try {
    GoRouter.of(context).push(uri.toString());
  } catch (_) {}
}

// ───────────────────────── root ─────────────────────────

class _EscapeJournalV2State extends State<EscapeJournalV2> {
  final _store = _Store();
  final _nav = GlobalKey<NavigatorState>();
  final _hero = MaterialApp.createMaterialHeroController();

  @override
  void dispose() {
    _store.dispose();
    _hero.dispose();
    super.dispose();
  }

  Route _initialRoute() {
    switch (widget.initialScreen) {
      case 'stats':
        return _route(_StatsScreen(store: _store));
      case 'insights':
        return _route(_InsightsScreen(store: _store));
      case 'letter':
        return _route(_LetterScreen(store: _store));
      case 'entries':
        return _route(_EntriesScreen(store: _store));
      default:
        return _route(_HomeScreen(store: _store, onClose: widget.onClose, initialMode: widget.initialMode));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: AnimatedBuilder(
        animation: _store,
        builder: (context, child) => TweenAnimationBuilder<Color?>(
          tween: ColorTween(end: _store.accent),
          duration: const Duration(milliseconds: 900),
          builder: (context, accent, _) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.35),
                radius: 1.1,
                colors: [(accent ?? _C.cyan).withOpacity(0.16), _store.night ? _C.sleep : _C.night, _C.navy],
                stops: const [0, 0.55, 1],
              ),
            ),
            child: child,
          ),
        ),
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) async {
            if (didPop) return;
            final nav = _nav.currentState;
            if (nav != null && nav.canPop()) {
              nav.pop();
            } else if (widget.onClose != null) {
              await widget.onClose!();
            } else if (context.mounted && Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: HeroControllerScope(
            controller: _hero,
            child: Navigator(
              key: _nav,
              onGenerateInitialRoutes: (_, __) => [_initialRoute()],
              onGenerateRoute: (_) => _initialRoute(),
            ),
          ),
        ),
      ),
    );
  }
}

Route<T> _route<T>(Widget page) => PageRouteBuilder<T>(
      transitionDuration: const Duration(milliseconds: 450),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, anim, __, child) {
        final curved = CurvedAnimation(parent: anim, curve: const Cubic(.2, .8, .2, 1));
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween(begin: const Offset(0, 0.03), end: Offset.zero).animate(curved),
            child: child,
          ),
        );
      },
    );

// ───────────────────────── shared UI ─────────────────────────

/// Pop inside the journal; on its first screen, leave the journal page (hits the PopScope -> onClose).
void _back(BuildContext context) {
  final nav = Navigator.of(context);
  if (nav.canPop()) {
    nav.pop();
  } else {
    Navigator.of(context, rootNavigator: true).maybePop();
  }
}

class _Glass extends StatelessWidget {
  const _Glass({required this.child, this.padding = const EdgeInsets.all(16), this.margin, this.onTap, this.border, this.tint});
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Color? border;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final box = ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [(tint ?? _C.cyan).withOpacity(0.09), _C.navy.withOpacity(0.55)],
            ),
            border: Border.all(color: border ?? _C.ice.withOpacity(0.16)),
          ),
          child: child,
        ),
      ),
    );
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: onTap == null ? box : _Pressable(onTap: onTap!, child: box),
    );
  }
}

class _Pressable extends StatefulWidget {
  const _Pressable({required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;
  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> {
  bool _down = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onTap,
        child: AnimatedScale(scale: _down ? 0.98 : 1, duration: const Duration(milliseconds: 140), child: widget.child),
      );
}

class _Cta extends StatelessWidget {
  const _Cta({required this.label, required this.onTap, this.busy = false, this.expand = true});
  final String label;
  final VoidCallback? onTap;
  final bool busy;
  final bool expand;
  @override
  Widget build(BuildContext context) => _Pressable(
        onTap: busy || onTap == null ? () {} : onTap!,
        child: Container(
          height: 54,
          width: expand ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            gradient: const LinearGradient(colors: [_C.cyan, _C.teal]),
            boxShadow: [BoxShadow(color: _C.cyan.withOpacity(0.25), blurRadius: 18)],
          ),
          child: busy
              ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF06121F)))
              : Text(label, style: _body(16, color: const Color(0xFF06121F), weight: FontWeight.w600)),
        ),
      );
}

class _Ghost extends StatelessWidget {
  const _Ghost({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => _Pressable(
        onTap: onTap,
        child: Container(
          height: 48,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), border: Border.all(color: _C.ice.withOpacity(0.18))),
          child: Text(label, style: _body(14, weight: FontWeight.w500)),
        ),
      );
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, this.onTap, this.selected = false, this.icon, this.iconColor});
  final String label;
  final VoidCallback? onTap;
  final bool selected;
  final IconData? icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final pill = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        gradient: selected ? const LinearGradient(colors: [_C.cyan, _C.teal]) : null,
        color: selected ? null : _C.navy.withOpacity(0.6),
        border: Border.all(color: selected ? Colors.transparent : _C.ice.withOpacity(0.16)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[Icon(icon, size: 14, color: selected ? const Color(0xFF06121F) : (iconColor ?? _C.cyan)), const SizedBox(width: 6)],
        Text(label, style: _body(12, color: selected ? const Color(0xFF06121F) : _C.mist, weight: selected ? FontWeight.w600 : FontWeight.w400)),
      ]),
    );
    return onTap == null ? pill : _Pressable(onTap: onTap!, child: pill);
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text, {this.color = _C.cyan});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) =>
      Text(text.toUpperCase(), style: _body(11, color: color, weight: FontWeight.w600).copyWith(letterSpacing: 1.5));
}

class _IconBtn extends StatelessWidget {
  const _IconBtn({required this.icon, required this.onTap, this.semantic});
  final IconData icon;
  final VoidCallback onTap;
  final String? semantic;
  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: semantic,
        child: _Pressable(
          onTap: onTap,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(shape: BoxShape.circle, color: _C.navy.withOpacity(0.6), border: Border.all(color: _C.ice.withOpacity(0.16))),
            child: Icon(icon, color: _C.mist, size: 20),
          ),
        ),
      );
}

class _Orb extends StatelessWidget {
  const _Orb({required this.orb, required this.size, this.heroTag});
  final Map? orb;
  final double size;
  final String? heroTag;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: MoodOrbVideo(
          width: size,
          height: size,
          videoUrl: _orbUrl(context, orb),
          posterUrl: orb?['orbPoster']?.toString(),
          glowHex: orb?['accent']?.toString(),
          heroTag: heroTag,
        ),
      );
}

class _Page extends StatelessWidget {
  const _Page({required this.children, this.onRefresh, this.bottom});
  final List<Widget> children;
  final Future<void> Function()? onRefresh;
  final Widget? bottom;
  @override
  Widget build(BuildContext context) {
    Widget list = ListView(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 16, 20, 24),
      children: children,
    );
    if (onRefresh != null) list = RefreshIndicator(color: _C.cyan, onRefresh: onRefresh!, child: list);
    return Material(
      type: MaterialType.transparency,
      child: Column(children: [
        Expanded(child: list),
        if (bottom != null)
          Padding(padding: EdgeInsets.fromLTRB(20, 8, 20, MediaQuery.of(context).padding.bottom + 16), child: bottom!),
      ]),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.eyebrow, required this.title, this.eyebrowColor = _C.cyan, this.trailing});
  final String eyebrow;
  final String title;
  final Color eyebrowColor;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) => Row(children: [
        _IconBtn(icon: Icons.chevron_left, semantic: 'Back', onTap: () => _back(context)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Eyebrow(eyebrow, color: eyebrowColor),
            const SizedBox(height: 2),
            Text(title, style: _display(23)),
          ]),
        ),
        if (trailing != null) trailing!,
      ]);
}

class _Bars extends StatelessWidget {
  const _Bars({required this.items, this.height = 80});
  final List items;
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final b in items)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: ((b['h'] ?? 0) as num).toDouble().clamp(3, 100) / 100),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutCubic,
                    builder: (_, v, __) => Container(
                      height: height * v,
                      decoration: BoxDecoration(
                        color: b['empty'] == true ? _C.ice.withOpacity(0.08) : _hex(b['c']),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}

Widget _loadingOrError(bool loading, String? error, VoidCallback retry) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: loading
            ? const CircularProgressIndicator(color: _C.cyan, strokeWidth: 2)
            : Column(children: [
                Text(error ?? 'Something went wrong.', style: _body(14, color: _C.muted), textAlign: TextAlign.center),
                const SizedBox(height: 12),
                _Pill(label: 'Try again', onTap: retry),
              ]),
      ),
    );

// ───────────────────────── 1 · Home ─────────────────────────

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({required this.store, this.onClose, this.initialMode});
  final _Store store;
  final Future Function()? onClose;
  final String? initialMode;
  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  _Store get s => widget.store;

  @override
  void initState() {
    super.initState();
    Future.microtask(_load);
    if (widget.initialMode != null && _modeMeta.containsKey(widget.initialMode)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _startMode(widget.initialMode!));
    }
  }

  Future<void> _load() async {
    s.loading = true;
    s.error = null;
    if (mounted) setState(() {});
    final r = await _api(context, 'GET', '/v1/journal/home?period=${s.period}');
    if (!mounted) return;
    setState(() => s.loading = false);
    if (r['ok'] == true) {
      s.set(Map<String, dynamic>.from(r['data'] as Map));
    } else {
      setState(() => s.error = 'Couldn\'t reach Lucille. Pull to try again.');
    }
  }

  Future<void> _setPeriod(String p) async {
    if (p == s.period) return;
    setState(() => s.period = p);
    final r = await _api(context, 'GET', '/v1/mood/summary?period=$p');
    if (r['ok'] == true && mounted) s.setOrb(Map<String, dynamic>.from(r['data'] as Map));
  }

  void _startMode(String mode) {
    final seed = s.home?['lastScan'] as Map?;
    Navigator.of(context).push(_route(_EditorScreen(store: s, mode: mode, seed: seed)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: s,
      builder: (context, _) {
        final h = s.home;
        final orb = s.orb;
        final last = h?['lastScan'] as Map?;
        final weekly = h?['weeklyReflection'] as Map?;
        return _Page(
          onRefresh: _load,
          bottom: _Cta(
            label: 'New entry',
            onTap: () => Navigator.of(context).push(_route(_ComposeScreen(store: s))),
          ),
          children: [
            Row(children: [
              if (widget.onClose != null) ...[
                _IconBtn(icon: Icons.chevron_left, semantic: 'Close journal', onTap: () => widget.onClose!()),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const _Eyebrow('Journal'),
                  const SizedBox(height: 4),
                  Text(h?['greetingName'] != null ? 'Welcome back, ${h!['greetingName']}' : 'Welcome back', style: _display(28)),
                ]),
              ),
              if ((h?['streakDays'] ?? 0) > 0)
                _Pill(label: '${h!['streakDays']}-day rhythm', icon: Icons.blur_on, iconColor: _C.cyan),
            ]),
            if (h == null) _loadingOrError(s.loading, s.error, _load),
            if (last != null) ...[
              const SizedBox(height: 16),
              _Glass(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                onTap: () => _startMode('guided'),
                child: Row(children: [
                  _Orb(orb: last['orb'] as Map?, size: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(text: 'Your last Mood Scan read ', style: _body(13)),
                        TextSpan(text: '${last['word']}', style: _body(13, weight: FontWeight.w600)),
                      ])),
                      Text('${last['ageHours']} h ago · save this moment', style: _body(12, color: _C.muted)),
                    ]),
                  ),
                  const _Pill(label: 'Save', selected: true),
                ]),
              ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.08),
            ],
            if (h != null) ...[
              const SizedBox(height: 20),
              Row(children: [
                const Expanded(child: _Eyebrow('Your mood, overall')),
                for (final p in const ['week', 'month', 'year'])
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: _Pill(label: p[0].toUpperCase() + p.substring(1), selected: s.period == p, onTap: () => _setPeriod(p)),
                  ),
              ]),
              const SizedBox(height: 8),
              _Glass(
                onTap: () => Navigator.of(context).push(_route(_StatsScreen(store: s))),
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: const Cubic(.2, .8, .2, 1),
                    width: ((orb?['size'] ?? 96) as num).toDouble(),
                    height: ((orb?['size'] ?? 96) as num).toDouble(),
                    child: _Orb(orb: orb?['orb'] as Map?, size: ((orb?['size'] ?? 96) as num).toDouble(), heroTag: 'jv2-orb'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: Column(
                        key: ValueKey('${s.period}-${orb?['word']}'),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${orb?['word'] ?? ''}', style: _display(22)),
                          const SizedBox(height: 4),
                          Text('${orb?['caption'] ?? ''}', style: _body(13, color: _C.muted)),
                          const SizedBox(height: 8),
                          Text('${orb?['sub'] ?? ''} · tap for mood stats ›', style: _body(12, color: _C.cyan)),
                        ],
                      ),
                    ),
                  ),
                ]),
              ).animate().fadeIn(duration: 450.ms, delay: 80.ms).slideY(begin: 0.08),
              if (weekly != null) ...[
                const SizedBox(height: 14),
                _Glass(
                  tint: _C.lilac,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const _Eyebrow('Lucille · weekly reflection', color: _C.lilac),
                    const SizedBox(height: 6),
                    Text('${weekly['text']}', style: _body(14)),
                    const SizedBox(height: 10),
                    _Ghost(label: 'Open this week', onTap: () => Navigator.of(context).push(_route(_InsightsScreen(store: s)))),
                  ]),
                ).animate().fadeIn(duration: 450.ms, delay: 140.ms),
              ],
              const SizedBox(height: 18),
              Row(children: [
                const Expanded(child: _Eyebrow('Start writing')),
                _Pill(label: 'Your entries', onTap: () => Navigator.of(context).push(_route(_EntriesScreen(store: s)))),
              ]),
              const SizedBox(height: 8),
              Wrap(spacing: 8, runSpacing: 8, children: [
                for (final e in _modeMeta.entries)
                  _Pill(label: e.value['label'] as String, icon: e.value['icon'] as IconData, iconColor: e.value['color'] as Color, onTap: () => _startMode(e.key)),
              ]),
            ],
          ],
        );
      },
    );
  }
}

// ───────────────────────── 2 · New entry (mode pick) ─────────────────────────

class _ComposeScreen extends StatefulWidget {
  const _ComposeScreen({required this.store});
  final _Store store;
  @override
  State<_ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<_ComposeScreen> {
  bool breathe = true;

  void _go(String mode) {
    final seed = widget.store.home?['lastScan'] as Map?;
    final editor = _EditorScreen(store: widget.store, mode: mode, seed: seed);
    Navigator.of(context).push(_route(breathe ? _BreathScreen(next: editor, orb: seed?['orb'] as Map?) : editor));
  }

  @override
  Widget build(BuildContext context) {
    final seed = widget.store.home?['lastScan'] as Map?;
    return _Page(children: [
      const _TopBar(eyebrow: 'New entry', title: 'How do you want to reflect?'),
      if (seed != null) ...[
        const SizedBox(height: 14),
        _Glass(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(children: [
            _Orb(orb: seed['orb'] as Map?, size: 34),
            const SizedBox(width: 10),
            Expanded(
              child: Text.rich(TextSpan(children: [
                TextSpan(text: 'Seeded from your scan · ', style: _body(13)),
                TextSpan(text: '${seed['word']}', style: _body(13, weight: FontWeight.w600)),
              ])),
            ),
          ]),
        ),
      ],
      const SizedBox(height: 16),
      for (final (i, e) in _modeMeta.entries.indexed)
        _Glass(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          onTap: () => _go(e.key),
          child: Row(children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: _C.navy.withOpacity(0.6),
                border: Border.all(color: (e.value['color'] as Color).withOpacity(0.35)),
              ),
              child: Icon(e.value['icon'] as IconData, color: e.value['color'] as Color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(e.value['label'] as String, style: _body(16, weight: FontWeight.w600)),
                Text(e.value['sub'] as String, style: _body(13, color: _C.muted)),
              ]),
            ),
            const Icon(Icons.chevron_right, color: _C.muted),
          ]),
        ).animate().fadeIn(duration: 350.ms, delay: (60 * i).ms).slideX(begin: 0.05),
      const SizedBox(height: 10),
      Row(children: [
        Expanded(child: Text('Breathe with the orb first (20 s)', style: _body(14, color: _C.muted))),
        Switch(value: breathe, activeColor: _C.cyan, onChanged: (v) => setState(() => breathe = v)),
      ]),
    ]);
  }
}

class _BreathScreen extends StatefulWidget {
  const _BreathScreen({required this.next, this.orb});
  final Widget next;
  final Map? orb;
  @override
  State<_BreathScreen> createState() => _BreathScreenState();
}

class _BreathScreenState extends State<_BreathScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _a = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat(reverse: false);
  Timer? _t;
  bool _left = false;

  @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(seconds: 20), _done);
  }

  void _done() {
    if (_left || !mounted) return;
    _left = true;
    _t?.cancel();
    Navigator.of(context).pushReplacement(_route(widget.next));
  }

  @override
  void dispose() {
    _t?.cancel();
    _a.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: Column(children: [
            Align(alignment: Alignment.topRight, child: TextButton(onPressed: _done, child: Text('Skip', style: _body(14, color: _C.muted)))),
            const Spacer(),
            AnimatedBuilder(
              animation: _a,
              builder: (_, __) {
                final t = _a.value; // 4 s in, 6 s out
                final inhale = t < 0.4;
                final scale = inhale ? 0.8 + 0.35 * (t / 0.4) : 1.15 - 0.35 * ((t - 0.4) / 0.6);
                return Column(children: [
                  Transform.scale(scale: scale, child: _Orb(orb: widget.orb, size: 200)),
                  const SizedBox(height: 28),
                  Text(inhale ? 'Breathe in' : 'Breathe out', style: _display(26)),
                ]);
              },
            ),
            const Spacer(flex: 2),
          ]),
        ),
      );
}

// ───────────────────────── 3 · Editor ─────────────────────────

class _EditorScreen extends StatefulWidget {
  const _EditorScreen({required this.store, required this.mode, this.seed});
  final _Store store;
  final String mode;
  final Map? seed;
  @override
  State<_EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<_EditorScreen> {
  final _body1 = TextEditingController();
  final _g = [TextEditingController(), TextEditingController(), TextEditingController()];
  String prompt = '';
  String placeholder = 'Begin your reflection…';
  String? energyCenter;
  bool saving = false;
  final _speech = stt.SpeechToText();
  bool listening = false;
  String transcript = '';

  Map get meta => _modeMeta[widget.mode]!;

  @override
  void initState() {
    super.initState();
    _loadPrompt();
  }

  Future<void> _loadPrompt() async {
    final r = await _api(context, 'POST', '/v1/journal/prompt', {
      'mode': widget.mode,
      if (widget.seed?['word'] != null) 'word': widget.seed!['word'],
      'personalize': widget.mode == 'guided',
    });
    if (r['ok'] == true && mounted) {
      final d = r['data'] as Map;
      setState(() {
        prompt = '${d['prompt']}';
        placeholder = '${d['placeholder'] ?? placeholder}';
      });
    }
  }

  Future<void> _toggleVoice() async {
    if (listening) {
      await _speech.stop();
      setState(() => listening = false);
      return;
    }
    final ok = await _speech.initialize(
      onStatus: (st) {
        if ((st == 'done' || st == 'notListening') && mounted) setState(() => listening = false);
      },
      onError: (_) {
        if (mounted) setState(() => listening = false);
      },
    );
    if (!ok || !mounted) return;
    final base = _body1.text;
    setState(() => listening = true);
    await _speech.listen(
      onResult: (res) {
        if (!mounted) return;
        transcript = res.recognizedWords;
        _body1.text = base.isEmpty ? transcript : '$base $transcript';
        _body1.selection = TextSelection.collapsed(offset: _body1.text.length);
        if (res.finalResult && mounted) setState(() => listening = false);
      },
    );
  }

  Future<void> _pickCenter() async {
    final pick = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _Glass(
        margin: const EdgeInsets.all(12),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const _Eyebrow('Tag an energy center'),
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final c in _centers.entries) _Pill(label: c.value, selected: energyCenter == c.key, onTap: () => Navigator.of(ctx).pop(c.key)),
          ]),
        ]),
      ),
    );
    if (pick != null) setState(() => energyCenter = pick);
  }

  Future<void> _save() async {
    final grat = _g.map((c) => c.text.trim()).where((t) => t.isNotEmpty).toList();
    final text = _body1.text.trim();
    if (widget.mode == 'gratitude' ? grat.isEmpty : text.isEmpty) return;
    setState(() => saving = true);
    final r = await _api(context, 'POST', '/v1/journal/entries', {
      'mode': widget.mode,
      'status': 'saved',
      if (widget.mode == 'ritual') 'intention': text else if (widget.mode != 'gratitude') 'body': text,
      if (widget.mode == 'gratitude') 'gratitude': grat,
      'prompt': prompt,
      if (widget.seed?['id'] != null) 'moodSeed': {'checkinId': widget.seed!['id']},
      if (energyCenter != null) 'energyCenter': energyCenter,
      if (transcript.isNotEmpty) 'voice': {'transcript': transcript},
    });
    if (!mounted) return;
    setState(() => saving = false);
    if (r['ok'] == true) {
      final d = r['data'] as Map;
      Navigator.of(context).pushReplacement(_route(_ReflectionScreen(store: widget.store, entry: d['entry'] as Map, coins: d['coinsAwarded'])));
    } else {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(content: Text('Couldn\'t save: ${r['error']}')));
    }
  }

  InputDecoration _dec(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: _body(15, color: _C.muted),
        border: InputBorder.none,
        isCollapsed: true,
      );

  @override
  void dispose() {
    _speech.cancel();
    _body1.dispose();
    for (final c in _g) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orb = widget.seed?['orb'] as Map? ?? (widget.store.orb?['orb'] as Map?);
    return _Page(
      bottom: _Cta(label: 'Done', busy: saving, onTap: _save),
      children: [
        Row(children: [
          _IconBtn(icon: Icons.chevron_left, semantic: 'Back', onTap: () => _back(context)),
          const Spacer(),
          _Pill(label: meta['label'] as String, icon: meta['icon'] as IconData, iconColor: meta['color'] as Color),
        ]),
        const SizedBox(height: 14),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _Orb(orb: orb, size: 48, heroTag: 'jv2-entry-orb'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const _Eyebrow('Lucille asks', color: _C.lilac),
              const SizedBox(height: 2),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Text(prompt.isEmpty ? '…' : prompt, key: ValueKey(prompt), style: _body(15)),
              ),
            ]),
          ),
        ]),
        const SizedBox(height: 14),
        if (widget.mode == 'gratitude')
          for (final (i, c) in _g.indexed)
            _Glass(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: TextField(controller: c, style: _body(15), decoration: _dec(['One good thing…', 'Another…', 'And one more…'][i])),
            )
        else
          _Glass(
            child: TextField(
              controller: _body1,
              style: _body(15, height: 1.55),
              minLines: widget.mode == 'ritual' ? 2 : 10,
              maxLines: null,
              autofocus: true,
              decoration: _dec(placeholder),
            ),
          ),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: [
          if (widget.mode != 'gratitude')
            _Pill(label: listening ? 'Listening… tap to stop' : 'Voice', icon: listening ? Icons.stop_circle_outlined : Icons.mic_none, iconColor: _C.ember, selected: listening, onTap: _toggleVoice),
          _Pill(label: energyCenter == null ? 'Energy center' : _centers[energyCenter]!, icon: Icons.blur_circular, iconColor: _C.lilac, onTap: _pickCenter),
        ]),
      ],
    );
  }
}

// ───────────────────────── 4 · Lucille reflects ─────────────────────────

class _ReflectionScreen extends StatefulWidget {
  const _ReflectionScreen({required this.store, required this.entry, this.coins});
  final _Store store;
  final Map entry;
  final dynamic coins;
  @override
  State<_ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<_ReflectionScreen> {
  Map? data;
  String? error;
  final _reframe = TextEditingController();
  String? moodAfter;
  String? feelChip;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (error != null) setState(() => error = null);
    final r = await _api(context, 'POST', '/v1/journal/entries/${widget.entry['id']}/reflect');
    if (!mounted) return;
    if (r['ok'] == true) {
      setState(() => data = r['data'] as Map);
    } else {
      setState(() => error = 'Lucille couldn\'t reflect right now. Your entry is saved.');
    }
  }

  Future<void> _finish() async {
    final patch = <String, dynamic>{
      if (_reframe.text.trim().isNotEmpty) 'userReframe': _reframe.text.trim(),
      if (moodAfter != null) 'moodAfter': moodAfter,
    };
    if (patch.isNotEmpty) {
      await _api(context, 'PATCH', '/v1/journal/entries/${widget.entry['id']}', patch);
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacement(_route(_SavedScreen(store: widget.store, entry: widget.entry, orb: data?['orb'] as Map?)));
  }

  @override
  void dispose() {
    _reframe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final refl = data?['reflection'] as Map?;
    final mood = (data?['mood'] ?? widget.entry['mood']) as Map?;
    final crisis = refl?['crisis'] == true;
    final sound = data?['soundscape'] as Map?;
    final sugg = (data?['suggestions'] as List?) ?? const [];
    return _Page(
      bottom: crisis
          ? null
          : Row(children: [
              if (widget.coins != null && widget.coins != 0) _Pill(label: '+${widget.coins} coins', icon: Icons.diamond_outlined, iconColor: _C.ember),
              const SizedBox(width: 12),
              Expanded(child: _Cta(label: 'Save entry', onTap: _finish)),
            ]),
      children: [
        Row(children: [
          _Orb(orb: data?['orb'] as Map?, size: 44, heroTag: 'jv2-entry-orb'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const _Eyebrow('Lucille reflects', color: _C.lilac),
              Text('${mood?['word'] ?? 'Thank you'}, and honest', style: _display(22)),
            ]),
          ),
        ]),
        const SizedBox(height: 14),
        if (data == null) _loadingOrError(error == null, error, _load),
        if (refl != null) ...[
          _Glass(child: Text('${refl['reflection']}', style: _body(14, height: 1.55))).animate().fadeIn(duration: 500.ms),
          if (crisis) ...[
            const SizedBox(height: 12),
            _Glass(
              tint: _C.ember,
              border: _C.ember.withOpacity(0.5),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const _Eyebrow('You deserve support right now', color: _C.ember),
                const SizedBox(height: 10),
                _Cta(label: 'Call 988', onTap: () => launchUrl(Uri.parse('tel:988'))),
                const SizedBox(height: 8),
                _Ghost(label: 'Text 988', onTap: () => launchUrl(Uri.parse('sms:988'))),
                const SizedBox(height: 8),
                _Ghost(label: 'Back to journal', onTap: () => Navigator.of(context).popUntil((r) => r.isFirst)),
              ]),
            ),
          ],
          if (refl['reframe'] != null) ...[
            const SizedBox(height: 12),
            _Glass(
              tint: _C.ember,
              border: _C.ember.withOpacity(0.4),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const _Eyebrow('A gentler way to hold it', color: _C.ember),
                const SizedBox(height: 6),
                Text('${refl['reframe']}', style: _body(14)),
                const SizedBox(height: 10),
                TextField(
                  controller: _reframe,
                  style: _body(14),
                  decoration: InputDecoration(
                    hintText: 'Make it yours…',
                    hintStyle: _body(14, color: _C.muted),
                    filled: true,
                    fillColor: _C.navy.withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                  ),
                ),
              ]),
            ).animate().fadeIn(duration: 500.ms, delay: 150.ms),
          ],
          if (!crisis) ...[
            const SizedBox(height: 12),
            const _Eyebrow('How do you feel now?'),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              for (final w in const ['Lighter', 'Calm', 'Same', 'Heavier'])
                _Pill(
                  label: w,
                  selected: feelChip == w,
                  onTap: () => setState(() {
                    feelChip = w;
                    moodAfter = {'Lighter': 'Hopeful', 'Calm': 'Calm', 'Same': '${mood?['word'] ?? 'Mixed'}', 'Heavier': 'Low'}[w];
                  }),
                ),
            ]),
          ],
          if (sound != null) ...[
            const SizedBox(height: 12),
            _Glass(
              onTap: () => _openDeeplink(context, sound['deeplink'] as Map?),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Tuned for this mood', style: _body(12, color: _C.muted)),
                    Text('${sound['title']}', style: _body(15, weight: FontWeight.w600)),
                  ]),
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [_C.cyan, _C.teal])),
                  child: const Icon(Icons.play_arrow_rounded, color: Color(0xFF06121F)),
                ),
              ]),
            ),
          ],
          for (final sg in sugg)
            _Glass(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              onTap: () => _openDeeplink(context, (sg as Map)['deeplink'] as Map?),
              child: Row(children: [
                Expanded(child: Text('${(sg as Map)['title']} · ${sg['minutes']} min', style: _body(14))),
                const Icon(Icons.chevron_right, color: _C.muted),
              ]),
            ),
          const SizedBox(height: 14),
          Text('${data?['disclosure'] ?? ''}', style: _body(11, color: _C.muted)),
        ],
      ],
    );
  }
}

// ───────────────────────── 5 · Saved ─────────────────────────

class _SavedScreen extends StatelessWidget {
  const _SavedScreen({required this.store, required this.entry, this.orb});
  final _Store store;
  final Map entry;
  final Map? orb;

  void _home(BuildContext context) {
    Navigator.of(context).popUntil((r) => r.isFirst);
    // refresh home so the orb reflects the new entry
    lucilleV1('GET', '/v1/journal/home?period=${store.period}', null).then((r) {
      if (r is Map && r['ok'] == true) store.set(Map<String, dynamic>.from(r['data'] as Map));
    });
  }

  @override
  Widget build(BuildContext context) {
    final word = (entry['mood'] as Map?)?['word']?.toString().toLowerCase() ?? 'honest';
    return _Page(
      bottom: _Cta(label: 'Done', onTap: () => _home(context)),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Center(child: _Orb(orb: orb, size: 130, heroTag: 'jv2-entry-orb')),
        const SizedBox(height: 22),
        Text('Saved · your orb just shifted', style: _display(26), textAlign: TextAlign.center).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 6),
        Text('This $word moment folds into your overall Mood Orb. Lucille will read it into your next Energy Scan.',
                style: _body(14, color: _C.muted), textAlign: TextAlign.center)
            .animate()
            .fadeIn(delay: 300.ms),
        const SizedBox(height: 22),
        _Glass(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const _Eyebrow('Keep it going', color: _C.lilac),
            const SizedBox(height: 10),
            _Ghost(label: 'Write to your future self', onTap: () => Navigator.of(context).pushReplacement(_route(_LetterScreen(store: store)))),
            const SizedBox(height: 8),
            _Ghost(label: 'See your mood stats', onTap: () => Navigator.of(context).pushReplacement(_route(_StatsScreen(store: store)))),
          ]),
        ).animate().fadeIn(delay: 400.ms),
      ],
    );
  }
}

// ───────────────────────── Mood Stats ─────────────────────────

class _StatsScreen extends StatefulWidget {
  const _StatsScreen({required this.store});
  final _Store store;
  @override
  State<_StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<_StatsScreen> {
  Map? stats;
  late String period = widget.store.period;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final r = await _api(context, 'GET', '/v1/mood/stats?period=$period');
    if (r['ok'] == true && mounted) setState(() => stats = r['data'] as Map);
  }

  @override
  Widget build(BuildContext context) {
    final sm = (stats?['summary'] ?? widget.store.orb) as Map?;
    final big = ((sm?['big'] ?? 150) as num).toDouble();
    return _Page(children: [
      _TopBar(eyebrow: 'Mood stats', title: 'Your $period, in one orb'),
      const SizedBox(height: 12),
      Row(children: [
        for (final p in const ['week', 'month', 'year'])
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: _Pill(
              label: p[0].toUpperCase() + p.substring(1),
              selected: period == p,
              onTap: () {
                setState(() => period = p);
                _load();
              },
            ),
          ),
      ]),
      const SizedBox(height: 14),
      Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: big,
          height: big,
          child: _Orb(orb: sm?['orb'] as Map?, size: big, heroTag: 'jv2-orb'),
        ),
      ),
      const SizedBox(height: 14),
      Center(child: Text('${sm?['word'] ?? ''}', style: _display(26))),
      const SizedBox(height: 4),
      Center(child: Text('${sm?['caption'] ?? ''}', style: _body(13, color: _C.muted), textAlign: TextAlign.center)),
      const SizedBox(height: 18),
      const _Eyebrow('Mood mix'),
      const SizedBox(height: 8),
      for (final m in (sm?['mix'] as List?) ?? const [])
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Container(width: 14, height: 14, decoration: BoxDecoration(shape: BoxShape.circle, color: _hex((m as Map)['color']))),
            const SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text('${m['label']}', style: _body(13))),
                  Text('${m['pct']}%', style: _body(13, color: _C.muted)),
                ]),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: ((m['pct'] ?? 0) as num).toDouble() / 100),
                    duration: const Duration(milliseconds: 700),
                    builder: (_, v, __) => LinearProgressIndicator(
                      value: v,
                      minHeight: 6,
                      backgroundColor: _C.ice.withOpacity(0.12),
                      valueColor: AlwaysStoppedAnimation(_hex(m['color'])),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      const SizedBox(height: 10),
      const _Eyebrow('Trend'),
      const SizedBox(height: 8),
      _Glass(child: _Bars(items: (sm?['trend'] as List?) ?? const [], height: 68)),
      const SizedBox(height: 14),
      Row(children: [
        for (final t in [
          ['${sm?['entries'] ?? 0}', 'check-ins'],
          ['${sm?['activeDays'] ?? 0}', 'days active'],
          ['${sm?['pleasantPct'] ?? 0}%', 'pleasant'],
        ])
          Expanded(
            child: _Glass(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(children: [
                Text(t[0], style: _body(20, weight: FontWeight.w600)),
                Text(t[1], style: _body(12, color: _C.muted)),
              ]),
            ),
          ),
      ]),
      const SizedBox(height: 14),
      _Ghost(label: 'Themes & what feeds your Energy Scan', onTap: () => Navigator.of(context).push(_route(_InsightsScreen(store: widget.store)))),
    ]);
  }
}

// ───────────────────────── Insights ─────────────────────────

class _InsightsScreen extends StatefulWidget {
  const _InsightsScreen({required this.store});
  final _Store store;
  @override
  State<_InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<_InsightsScreen> {
  Map? d;
  Map? weekly;
  String? error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final r = await _api(context, 'GET', '/v1/journal/insights?days=14');
    final w = await _api(context, 'GET', '/v1/journal/weekly');
    if (!mounted) return;
    setState(() {
      if (r['ok'] == true) {
        d = r['data'] as Map;
        error = null;
      } else {
        error = 'Couldn\'t load insights.';
      }
      if (w['ok'] == true) weekly = (w['data'] as Map)['weekly'] as Map?;
    });
  }

  @override
  Widget build(BuildContext context) => _Page(children: [
        const _TopBar(eyebrow: 'Insights', title: '14 days of you'),
        const SizedBox(height: 14),
        if (d == null) _loadingOrError(error == null, error, _load),
        if (d != null) ...[
          _Glass(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Mood, pleasant ↔ unpleasant', style: _body(12, color: _C.muted)),
              const SizedBox(height: 10),
              _Bars(items: (d!['spark'] as List?) ?? const [], height: 90),
            ]),
          ),
          const SizedBox(height: 14),
          const _Eyebrow('What keeps coming up'),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final t in (d!['themes'] as List?) ?? const []) _Pill(label: '${(t as Map)['theme']} · ${t['count']}'),
            if (((d!['themes'] as List?) ?? const []).isEmpty) Text('Write a few entries and themes will show up here.', style: _body(13, color: _C.muted)),
          ]),
          if (weekly != null) ...[
            const SizedBox(height: 14),
            _Glass(
              tint: _C.lilac,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const _Eyebrow('Lucille · this week', color: _C.lilac),
                const SizedBox(height: 6),
                Text('${weekly!['text']}', style: _body(14)),
              ]),
            ),
          ],
          const SizedBox(height: 14),
          _Glass(
            tint: _C.teal,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const _Eyebrow('Feeds your Energy Scan', color: _C.teal),
              const SizedBox(height: 6),
              Text(
                ((d!['energyCenters'] as List?) ?? const []).isEmpty
                    ? 'Your entries become part of what Lucille reads for your energy centers. Journaling every couple of days keeps the read fresh.'
                    : 'These entries feed your ${((d!['energyCenters'] as List).take(2).map((c) => _centers[(c as Map)['center']] ?? c['center']).join(' and '))} centers. Journaling every couple of days keeps the read fresh.',
                style: _body(14),
              ),
            ]),
          ),
        ],
      ]);
}

// ───────────────────────── Entries ─────────────────────────

class _EntriesScreen extends StatefulWidget {
  const _EntriesScreen({required this.store});
  final _Store store;
  @override
  State<_EntriesScreen> createState() => _EntriesScreenState();
}

class _EntriesScreenState extends State<_EntriesScreen> {
  List items = [];
  String? cursor;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load({bool more = false}) async {
    if (more && loading) return;
    loading = true;
    if (more) setState(() {});
    final r = await _api(context, 'GET', '/v1/journal/entries?limit=20${more && cursor != null ? '&cursor=${Uri.encodeQueryComponent(cursor!)}' : ''}');
    if (!mounted) return;
    setState(() {
      loading = false;
      if (r['ok'] == true) {
        final d = r['data'] as Map;
        items = more ? [...items, ...(d['items'] as List)] : List.from(d['items'] as List);
        cursor = d['nextCursor'] as String?;
      }
    });
  }

  @override
  Widget build(BuildContext context) => _Page(onRefresh: _load, children: [
        const _TopBar(eyebrow: 'Journal', title: 'Your entries'),
        const SizedBox(height: 14),
        if (items.isEmpty && !loading) Text('No entries yet. Your first one is a tap away.', style: _body(14, color: _C.muted)),
        for (final e in items)
          _Glass(
            margin: const EdgeInsets.only(bottom: 10),
            onTap: () async {
              final del = await Navigator.of(context).push(_route(_EntryDetailScreen(id: '${(e as Map)['id']}')));
              if (del == true) _load();
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon((_modeMeta[(e as Map)['mode']] ?? _modeMeta['free']!)['icon'] as IconData, color: (_modeMeta[e['mode']] ?? _modeMeta['free']!)['color'] as Color, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${e['localDay']} · ${(e['mood'] as Map?)?['word'] ?? ''}', style: _body(12, color: _C.muted)),
                  const SizedBox(height: 2),
                  Text('${e['preview']}', maxLines: 3, overflow: TextOverflow.ellipsis, style: _body(14)),
                ]),
              ),
            ]),
          ),
        if (cursor != null) _Pill(label: loading ? 'Loading…' : 'Load more', onTap: loading ? null : () => _load(more: true)),
      ]);
}

class _EntryDetailScreen extends StatefulWidget {
  const _EntryDetailScreen({required this.id});
  final String id;
  @override
  State<_EntryDetailScreen> createState() => _EntryDetailScreenState();
}

class _EntryDetailScreenState extends State<_EntryDetailScreen> {
  Map? e;
  String? error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (error != null) setState(() => error = null);
    final r = await _api(context, 'GET', '/v1/journal/entries/${widget.id}');
    if (!mounted) return;
    setState(() {
      if (r['ok'] == true) {
        e = r['data'] as Map;
      } else {
        error = 'Couldn\'t open this entry.';
      }
    });
  }

  Future<void> _delete() async {
    final sure = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _C.navy,
        title: Text('Delete this entry?', style: _display(20)),
        content: Text('This can\'t be undone.', style: _body(14, color: _C.muted)),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text('Keep', style: _body(14))),
          TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text('Delete', style: _body(14, color: _C.ember))),
        ],
      ),
    );
    if (sure != true || !mounted) return;
    final r = await _api(context, 'DELETE', '/v1/journal/entries/${widget.id}');
    if (r['ok'] == true && mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final refl = e?['reflection'] as Map?;
    final grat = (e?['gratitude'] as List?) ?? const [];
    return _Page(children: [
      _TopBar(
        eyebrow: '${(_modeMeta[e?['mode']] ?? _modeMeta['free']!)['label']}',
        title: '${e?['localDay'] ?? ''}',
        trailing: _IconBtn(icon: Icons.delete_outline, semantic: 'Delete entry', onTap: _delete),
      ),
      const SizedBox(height: 14),
      if (e == null) _loadingOrError(error == null, error, _load),
      if (e != null) ...[
        if ((e!['prompt'] ?? '').toString().isNotEmpty) Text('${e!['prompt']}', style: _body(13, color: _C.lilac)),
        const SizedBox(height: 8),
        _Glass(
          child: Text(
            [e!['body'], e!['intention'], ...grat.map((g) => '• $g')].where((x) => x != null && '$x'.isNotEmpty).join('\n'),
            style: _body(15, height: 1.55),
          ),
        ),
        if (refl != null) ...[
          const SizedBox(height: 12),
          _Glass(
            tint: _C.lilac,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const _Eyebrow('Lucille reflected', color: _C.lilac),
              const SizedBox(height: 6),
              Text('${refl['reflection']}', style: _body(14)),
              if (e!['userReframe'] != null) ...[
                const SizedBox(height: 8),
                Text('Your reframe: ${e!['userReframe']}', style: _body(13, color: _C.ember)),
              ],
            ]),
          ),
        ],
      ],
    ]);
  }
}

// ───────────────────────── Letter to future self ─────────────────────────

class _LetterScreen extends StatefulWidget {
  const _LetterScreen({required this.store});
  final _Store store;
  @override
  State<_LetterScreen> createState() => _LetterScreenState();
}

class _LetterScreenState extends State<_LetterScreen> {
  final _t = TextEditingController();
  int days = 30;
  bool saving = false;

  Future<void> _seal() async {
    if (_t.text.trim().isEmpty) return;
    setState(() => saving = true);
    final r = await _api(context, 'POST', '/v1/journal/letters', {'body': _t.text.trim(), 'deliverInDays': days});
    if (!mounted) return;
    setState(() => saving = false);
    if (r['ok'] == true) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(content: Text('Sealed. Lucille will bring it back in $days days.')));
      final nav = Navigator.of(context);
      if (nav.canPop()) {
        nav.popUntil((r) => r.isFirst);
      } else {
        _back(context);
      }
    }
  }

  @override
  void dispose() {
    _t.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _Page(
        bottom: _Cta(label: 'Seal it', busy: saving, onTap: _seal),
        children: [
          const _TopBar(eyebrow: 'Time capsule', title: 'Dear future me…', eyebrowColor: _C.lilac),
          const SizedBox(height: 8),
          Text('Lucille will deliver this back to you, with today\'s mood, when the time comes.', style: _body(14, color: _C.muted)),
          const SizedBox(height: 14),
          _Glass(
            child: TextField(
              controller: _t,
              minLines: 10,
              maxLines: null,
              style: _body(15, height: 1.55),
              decoration: InputDecoration(
                hintText: 'What do you want to remember? What are you hoping for?',
                hintStyle: _body(15, color: _C.muted),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const _Eyebrow('Deliver in'),
          const SizedBox(height: 8),
          Row(children: [
            for (final d in const [7, 30, 90])
              Padding(padding: const EdgeInsets.only(right: 8), child: _Pill(label: '$d days', selected: days == d, onTap: () => setState(() => days = d))),
          ]),
        ],
      );
}
