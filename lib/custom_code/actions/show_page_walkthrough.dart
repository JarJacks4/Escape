// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// First-visit walkthrough for a page: a spotlight tour. Each step finds the real element on
/// screen (by its label or widget type), scrolls it into view and draws a circle or square around
/// it, with a short note on what to do or where to go. If an element can't be found, the note
/// shows on its own instead. Shows once per user per page (saved on the device).
///
/// Call from a page's on-load action:
///   await actions.showPageWalkthrough(context, 'explore');
/// Replay it (e.g. from a help button) with `force: true`.
///
/// Step keys: title, description, and optional `target`:
///   'Journal'            a Text whose content is exactly "Journal" (not case sensitive)
///   'Daily prompts*'     a Text that starts with "Daily prompts"
///   'Yoga|Pilates'       any of several
///   'type:TextField'     a widget by its class name (e.g. BottomNavigationBar, TextField)
Future<void> showPageWalkthrough(
  BuildContext context,
  String pageKey, {
  bool force = false,
}) async {
  final steps = _walkthroughSteps[pageKey];
  if (steps == null || steps.isEmpty) return;
  if (_activePages.contains(pageKey)) return;

  final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
  final prefKey = 'walkthrough_seen_${uid}_$pageKey';
  SharedPreferences? prefs;
  try {
    prefs = await SharedPreferences.getInstance();
    if (!force && (prefs.getBool(prefKey) ?? false)) return;
  } catch (_) {
    // If storage is unavailable, still show the tour once for this session.
    if (!force && _shownThisSession.contains(prefKey)) return;
  }

  _activePages.add(pageKey);
  try {
    // Wait for the page to be the one on screen (not a hidden tab, not covered by another page),
    // then give it a moment to finish its entry animation. Gives up after ~25 s.
    var ready = false;
    for (var i = 0; i < 50; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (!context.mounted) return;
      if (_pageVisible(context)) {
        ready = true;
        break;
      }
    }
    if (!ready) return;
    await Future.delayed(const Duration(milliseconds: 400));
    if (!context.mounted || !_pageVisible(context)) return;

    _shownThisSession.add(prefKey);
    try {
      await prefs?.setBool(prefKey, true);
    } catch (_) {}

    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'Walkthrough',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (ctx, _, __) => _WalkthroughOverlay(steps: steps),
      transitionBuilder: (ctx, anim, _, child) =>
          FadeTransition(opacity: anim, child: child),
    );
  } finally {
    _activePages.remove(pageKey);
  }
}

final Set<String> _shownThisSession = {};
final Set<String> _activePages = {};

bool _pageVisible(BuildContext context) {
  if (!context.mounted) return false;
  if (!TickerMode.of(context)) return false; // hidden tab or covered page
  final route = ModalRoute.of(context);
  return route == null || route.isCurrent;
}

// ---------------------------------------------------------------- finding the spot

bool _matchesTarget(Widget w, List<String> alts) {
  for (final raw in alts) {
    final a = raw.trim();
    if (a.startsWith('type:')) {
      if (w.runtimeType.toString() == a.substring(5)) return true;
    } else if (w is Text) {
      final t = (w.data ?? w.textSpan?.toPlainText() ?? '').trim().toLowerCase();
      if (t.isEmpty) continue;
      if (a.endsWith('*')) {
        if (t.startsWith(a.substring(0, a.length - 1).toLowerCase())) return true;
      } else if (t == a.toLowerCase()) {
        return true;
      }
    }
  }
  return false;
}

bool _onScreenElement(Element e) {
  if (!TickerMode.of(e)) return false;
  var visible = true;
  e.visitAncestorElements((a) {
    final w = a.widget;
    if (w is Offstage && w.offstage) {
      visible = false;
      return false;
    }
    return true;
  });
  if (!visible) return false;
  final ro = e.renderObject;
  return ro is RenderBox && ro.attached && ro.hasSize && !ro.size.isEmpty;
}

Rect _rectOf(Element e) {
  final ro = e.renderObject as RenderBox;
  return ro.localToGlobal(Offset.zero) & ro.size;
}

Element? _findTarget(String spec, Size screen) {
  final root = WidgetsBinding.instance.rootElement;
  if (root == null) return null;
  final alts = spec.split('|');
  final found = <Element>[];
  void visit(Element e) {
    if (found.length >= 12) return;
    final w = e.widget;
    if (w is _WalkthroughOverlay) return; // never match our own tooltip
    if (_matchesTarget(w, alts) && _onScreenElement(e)) {
      found.add(e);
      return;
    }
    e.visitChildren(visit);
  }

  root.visitChildren(visit);
  if (found.isEmpty) return null;
  final screenRect = Offset.zero & screen;
  for (final e in found) {
    if (screenRect.overlaps(_rectOf(e))) return e;
  }
  return found.first;
}

// ---------------------------------------------------------------- the overlay

class _WalkthroughOverlay extends StatefulWidget {
  const _WalkthroughOverlay({required this.steps});

  final List<Map<String, String>> steps;

  @override
  State<_WalkthroughOverlay> createState() => _WalkthroughOverlayState();
}

class _WalkthroughOverlayState extends State<_WalkthroughOverlay> {
  int _i = 0;
  Rect? _rect;
  Timer? _timer;
  bool _scrolling = false;

  Map<String, String> get _step => widget.steps[_i];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _enterStep());
    _timer = Timer.periodic(const Duration(milliseconds: 150), (_) => _refresh());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _enterStep() async {
    if (!mounted) return;
    final spec = _step['target'];
    if (spec == null || spec.isEmpty) {
      setState(() => _rect = null);
      return;
    }
    final size = MediaQuery.sizeOf(context);
    final el = _findTarget(spec, size);
    if (el == null) {
      setState(() => _rect = null);
      return;
    }
    final pad = MediaQuery.paddingOf(context);
    final r = _rectOf(el);
    final comfortable = Rect.fromLTRB(0, pad.top + 40, size.width, size.height - pad.bottom - 220);
    if (!comfortable.contains(r.center)) {
      _scrolling = true;
      try {
        await Scrollable.ensureVisible(el,
            alignment: 0.3, duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
      } catch (_) {}
      await Future.delayed(const Duration(milliseconds: 120));
      _scrolling = false;
    }
    _refresh();
  }

  void _refresh() {
    if (!mounted || _scrolling) return;
    final spec = _step['target'];
    if (spec == null || spec.isEmpty) return;
    final el = _findTarget(spec, MediaQuery.sizeOf(context));
    final next = el == null ? null : _rectOf(el);
    final prev = _rect;
    final changed = (prev == null) != (next == null) ||
        (prev != null &&
            next != null &&
            ((prev.left - next.left).abs() > 1 ||
                (prev.top - next.top).abs() > 1 ||
                (prev.width - next.width).abs() > 1 ||
                (prev.height - next.height).abs() > 1));
    if (changed) setState(() => _rect = next);
  }

  void _go(int to) {
    if (to < 0) return;
    if (to >= widget.steps.length) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _i = to;
      _rect = null;
    });
    _enterStep();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final pad = MediaQuery.paddingOf(context);
    final rect = _rect;
    final last = _i == widget.steps.length - 1;
    const navy = Color(0xFF1C2444);
    const orange = Color(0xFFF0831A);

    final card = Material(
      color: Colors.white,
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_i + 1} of ${widget.steps.length}',
                style: const TextStyle(fontSize: 12, color: orange, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(_step['title'] ?? '',
                style: const TextStyle(fontSize: 18, color: navy, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Flexible(
              child: SingleChildScrollView(
                child: Text(_step['description'] ?? '',
                    style: const TextStyle(fontSize: 14.5, color: Color(0xFF3B4268), height: 1.4)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Skip', style: TextStyle(color: Color(0xFF6A7194))),
                ),
                const Spacer(),
                if (_i > 0)
                  TextButton(
                    onPressed: () => _go(_i - 1),
                    child: const Text('Back', style: TextStyle(color: navy)),
                  ),
                const SizedBox(width: 6),
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: orange),
                  onPressed: () => _go(_i + 1),
                  child: Text(last ? 'Got it' : 'Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    final maxCard = size.height * 0.42;
    Widget positioned;
    if (rect == null) {
      positioned = Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, pad.bottom + 16),
          child: ConstrainedBox(constraints: BoxConstraints(maxHeight: maxCard), child: card),
        ),
      );
    } else if (rect.center.dy > size.height * 0.5) {
      positioned = Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, pad.top + 12, 16, 0),
          child: ConstrainedBox(constraints: BoxConstraints(maxHeight: maxCard), child: card),
        ),
      );
    } else {
      positioned = Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, pad.bottom + 16),
          child: ConstrainedBox(constraints: BoxConstraints(maxHeight: maxCard), child: card),
        ),
      );
    }

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Dim everything except the spotlight; absorbs taps so the page underneath can't be used mid-tour.
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: CustomPaint(painter: _SpotlightPainter(rect)),
          ),
          positioned,
        ],
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  _SpotlightPainter(this.target);

  final Rect? target;

  @override
  void paint(Canvas canvas, Size size) {
    final full = Path()..addRect(Offset.zero & size);
    final scrim = Paint()..color = Colors.black.withOpacity(0.72);
    final t = target;
    if (t == null) {
      canvas.drawPath(full, scrim);
      return;
    }
    final hole = t.inflate(8);
    final round = hole.shortestSide <= 72 && (hole.width / hole.height).clamp(0.0, 10.0) < 1.6 &&
        (hole.height / hole.width) < 1.6;
    final RRect shape = round
        ? RRect.fromRectAndRadius(
            Rect.fromCenter(center: hole.center, width: hole.longestSide, height: hole.longestSide),
            Radius.circular(hole.longestSide / 2))
        : RRect.fromRectAndRadius(hole, const Radius.circular(16));
    final cut = Path()..addRRect(shape);
    canvas.drawPath(Path.combine(PathOperation.difference, full, cut), scrim);
    canvas.drawRRect(
      shape,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = const Color(0xFFF0831A),
    );
  }

  @override
  bool shouldRepaint(_SpotlightPainter old) => old.target != target;
}

// ---------------------------------------------------------------- the tours

/// Page key -> steps. Keep each step to one short sentence. `target` is optional (see above).
const Map<String, List<Map<String, String>>> _walkthroughSteps = {
  'lucille_home': [
    {'title': 'Meet Lucille', 'description': 'Lucille is your AI self-care companion. She learns from your mood scans and journal to suggest what helps.'},
    {'title': 'Talk or type', 'description': 'Tap Chat to talk with Lucille any time. She can suggest a breathing exercise, a soundscape or a journal prompt.', 'target': 'Chat*|Ask Lucille*|type:TextField'},
    {'title': 'Lucille\'s picks', 'description': 'Open Lucille Suggestions for three sessions picked for how you feel right now.', 'target': 'Lucille Suggestions*|Lucille\'s Suggestion*'},
  ],
  'explore': [
    {'title': 'Everything in one place', 'description': 'Explore holds every exercise: Mind, Body, Journal, Sounds, Reset and Mood Scan.', 'target': 'Mind'},
    {'title': 'Pick a card', 'description': 'Tap any card to start. Each finished session earns Escape Coins.', 'target': 'Body'},
    {'title': 'Marketplace', 'description': 'Tap the Marketplace card to open the Market tab and add Lucille\'s starter items to My Collection.', 'target': 'Marketplace*'},
    {'title': 'Come back to Home', 'description': 'Use the tab bar at the bottom to get back to Home, Lucille, Sounds and Market.', 'target': 'type:BottomNavigationBar|type:NavigationBar'},
  ],
  'journal': [
    {'title': 'Your journal', 'description': 'Your Mood Orb at the top blends every check-in for the week, month or year. Tap it for your Mood Stats.'},
    {'title': 'Choose how to reflect', 'description': 'Write freely, follow a guided prompt, list what you\'re grateful for, or try a Ritual Spark.', 'target': 'Gratitude*|Guided*|Write*'},
    {'title': 'Lucille reflects back', 'description': 'After you save, Lucille reflects on your entry and suggests a soundscape that fits.'},
  ],
  'mood_scan': [
    {'title': 'Daily Mood Scan', 'description': 'Take a quick selfie with the front camera. Lucille reads your facial expression to estimate your mood for the day. It powers your suggestions and Mood Orb.'},
    {'title': 'The science', 'description': 'Facial expressions carry emotion cues that people read across cultures (Ekman\'s research on basic emotions). An AI model trained on labelled faces scores these cues, such as happy, calm, sad or tense, and Lucille turns them into your mood word. It\'s an estimate: a face doesn\'t always show how you feel inside, so treat it as a starting point, not a verdict.'},
    {'title': 'Your photo', 'description': 'Your photo is uploaded securely to your account so the model can read your expression. Face the camera in good light; if the scan can\'t read your mood, you can try again.'},
    {'title': 'Wellness, not medicine', 'description': 'The Mood Scan is for self-reflection, not a medical diagnosis. Naming how you feel can itself ease strong emotions (affect labeling research, UCLA 2007).'},
  ],
  'mind': [
    {'title': 'Mind & energy centers', 'description': 'Each card is one of your seven energy centers, from Root to Crown.', 'target': 'Root*'},
    {'title': 'Open a center', 'description': 'Tap a center for its guided sessions, affirmations and a soundscape to play while you focus.', 'target': 'Crown*'},
  ],
  'body': [
    {'title': 'Move your body', 'description': 'Pick Yoga, Pilates, Yang Tai Chi or Exercise. Each section has 10 moves with steps and a 3D model.', 'target': 'Yoga*|Pilates*'},
    {'title': 'Preview, then start', 'description': 'Tap a move to preview it and read the steps, then tap Start Session. Each move has its own timer.', 'target': 'Tai Chi*|Yang*|Exercise*'},
  ],
  'breathing': [
    {'title': 'Follow the circle', 'description': 'Breathe in while the circle grows and breathe out while it shrinks. The timings are in the description.'},
    {'title': 'Finish when ready', 'description': 'Tap Finish when you\'re done to collect your Escape Coins.', 'target': 'Finish*|Done*'},
  ],
  'reset': [
    {'title': 'Quick resets', 'description': 'Short exercises to shift your mood in a few minutes, anywhere.'},
    {'title': 'Pick what you need', 'description': 'Tap a reset to start. Breathing, sounds and journaling resets each earn Escape Coins.'},
  ],
  'marketplace': [
    {'title': 'Lucille\'s starter items', 'description': 'Browse items picked by Lucille and tap Add to put one in your collection.', 'target': 'Add*'},
    {'title': 'Your collection', 'description': 'Everything you add lives in My Collection, in the side menu.', 'target': 'My Collection*'},
  ],
  'quests': [
    {'title': 'Quests', 'description': 'Complete quests to build habits. Your progress saves automatically.'},
  ],
  'dashboard': [
    {'title': 'Your progress', 'description': 'See your streak, coins and completed sessions in one place.'},
  ],
  'energy_centers': [
    {'title': 'Energy Centers guide', 'description': 'Learn what each of the seven centers governs, where it sits and its affirmation.'},
  ],
  'lucille_chat': [
    {'title': 'Chat with Lucille', 'description': 'Type a message and Lucille replies as she thinks. Tap a reply to copy it.', 'target': 'type:TextField'},
    {'title': 'Shortcuts to what helps', 'description': 'Tell Lucille what you need, like sleep, focus or calming down, and tap the shortcut chips above the box to jump straight to that exercise.'},
    {'title': 'Not a crisis service', 'description': 'Lucille is an AI companion, not a therapist. In a crisis, call or text 988 in the US.'},
  ],
  'soundscapes': [
    {'title': 'Soundscapes', 'description': 'Music and nature sounds for focus, calm and sleep, in nine categories.'},
    {'title': 'Tap to play', 'description': 'Tap any card to play it. Use the tabs to switch categories and See all for the full list.', 'target': 'See all*'},
    {'title': 'Playlists', 'description': 'Tap the playlist button in the lower right to open playlists.'},
  ],
  'lucille_suggestions': [
    {'title': 'Lucille\'s suggestions', 'description': 'Swipe through three sessions picked for your mood. Tap Why this session? to see her reason.', 'target': 'Why this session*'},
    {'title': 'Start or ask for more', 'description': 'Tap Start Exercise to begin, or swipe for more options.', 'target': 'Start Exercise*'},
  ],
};
