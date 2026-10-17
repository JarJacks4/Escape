// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// First-visit walkthrough for a page: a short card tour of what to do on the page and where
/// to go next. Shows once per user per page (saved on the device), then never again.
///
/// Call from a page's on-load action:
///   await actions.showPageWalkthrough(context, 'explore');
/// Replay it (e.g. from a help button) with `force: true`.
Future<void> showPageWalkthrough(
  BuildContext context,
  String pageKey, {
  bool force = false,
}) async {
  final steps = _walkthroughSteps[pageKey];
  if (steps == null || steps.isEmpty) return;

  final uid = await _resolveAuthenticatedUid();
  final prefKey = uid == null
      ? 'walkthrough_session_$pageKey'
      : 'walkthrough_seen_${uid}_$pageKey';

  SharedPreferences? prefs;
  if (uid != null) {
    try {
      prefs = await SharedPreferences.getInstance();
      if (!force && (prefs.getBool(prefKey) ?? false)) return;
    } catch (_) {
      // If storage is unavailable, still show the tour once for this session.
      if (!force && _shownThisSession.contains(prefKey)) return;
    }
  } else {
    // Never persist an authenticated page walkthrough under a shared "guest"
    // key. If auth is still unavailable, keep this attempt session-only.
    if (!force && _shownThisSession.contains(prefKey)) return;
  }
  _shownThisSession.add(prefKey);

  // Let the page finish its first frame and any entry animation.
  await Future.delayed(const Duration(milliseconds: 600));
  if (!context.mounted) return;

  await showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'Walkthrough',
    barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (ctx, _, __) => _WalkthroughCards(steps: steps),
    transitionBuilder: (ctx, anim, _, child) =>
        FadeTransition(opacity: anim, child: child),
  );

  try {
    if (uid != null) await prefs?.setBool(prefKey, true);
  } catch (_) {}
}

/// Firebase can emit the authenticated user a moment after the destination
/// page is mounted. Wait briefly so completion is always scoped to the real
/// account instead of being read from or written to a shared guest key.
Future<String?> _resolveAuthenticatedUid() async {
  final immediate = FirebaseAuth.instance.currentUser?.uid;
  if (immediate != null && immediate.isNotEmpty) return immediate;

  try {
    final user = await FirebaseAuth.instance
        .authStateChanges()
        .firstWhere((candidate) => candidate != null)
        .timeout(const Duration(seconds: 3));
    return user?.uid;
  } on TimeoutException {
    debugPrint('[Walkthrough] auth UID unavailable after 3 seconds');
    return null;
  } catch (error) {
    debugPrint('[Walkthrough] could not resolve auth UID: $error');
    return null;
  }
}

final Set<String> _shownThisSession = {};

/// Page key -> steps (title, what to do / where to go). Keep each step to one short sentence.
const Map<String, List<Map<String, String>>> _walkthroughSteps = {
  'lucille_home': [
    {
      'title': 'Meet Lucille',
      'description':
          'Lucille is your AI self-care companion. She learns from your mood scans and journal to suggest what helps.'
    },
    {
      'title': 'Talk or type',
      'description':
          'Tap Chat to talk with Lucille any time. She can suggest a breathing exercise, a soundscape or a journal prompt.'
    },
    {
      'title': 'Lucille\'s picks',
      'description':
          'Open Lucille Suggestions for three sessions picked for how you feel right now.'
    },
  ],
  'explore': [
    {
      'title': 'Everything in one place',
      'description':
          'Explore holds every exercise: Mind, Body, Journal, Sounds, Reset and Mood Scan.'
    },
    {
      'title': 'Pick a card',
      'description':
          'Tap any card to start. Each finished session earns Escape Coins.'
    },
    {
      'title': 'Come back to Home',
      'description':
          'Use the tab bar at the bottom to get back to Home, Lucille, Sounds and Market.'
    },
  ],
  'journal': [
    {
      'title': 'Your journal',
      'description':
          'Your Mood Orb at the top blends every check-in for the week, month or year. Tap it for your Mood Stats.'
    },
    {
      'title': 'Choose how to reflect',
      'description':
          'Write freely, follow a guided prompt, list what you\'re grateful for, or try a Ritual Spark.'
    },
    {
      'title': 'Lucille reflects back',
      'description':
          'After you save, Lucille reflects on your entry and suggests a soundscape that fits.'
    },
  ],
  'mood_scan': [
    {
      'title': 'Daily Mood Scan',
      'description':
          'Take a quick selfie with the front camera. Lucille reads your facial expression to estimate your mood for the day. It powers your suggestions and Mood Orb.'
    },
    {
      'title': 'The science',
      'description':
          'Facial expressions carry emotion cues that people read across cultures (Ekman\'s research on basic emotions). An AI model trained on labelled faces scores these cues, such as happy, calm, sad or tense, and Lucille turns them into your mood word.'
    },
    {
      'title': 'Your photo',
      'description':
          'Your photo is uploaded securely to your account so the model can read your expression. Face the camera in good light; if the scan can\'t read your mood, you can try again.'
    },
    {
      'title': 'Wellness, not medicine',
      'description':
          'The Mood Scan is for self-reflection, not a medical diagnosis. Naming how you feel can itself ease strong emotions (affect labeling research, UCLA 2007).'
    },
  ],
  'mind': [
    {
      'title': 'Mind & energy centers',
      'description':
          'Each card is one of your seven energy centers, from Root to Crown.'
    },
    {
      'title': 'Open a center',
      'description':
          'Tap a center for its guided sessions, affirmations and a soundscape to play while you focus.'
    },
  ],
  'body': [
    {
      'title': 'Move your body',
      'description':
          'Body sessions guide you through short movements, one at a time.'
    },
    {
      'title': 'Preview, then start',
      'description':
          'Tap a move to preview it, then tap Start Session. Each move has its own timer.'
    },
  ],
  'breathing': [
    {
      'title': 'Follow the circle',
      'description':
          'Breathe in while the circle grows and breathe out while it shrinks. The timings are in the description.'
    },
    {
      'title': 'Finish when ready',
      'description':
          'Tap Finish when you\'re done to collect your Escape Coins.'
    },
  ],
  'reset': [
    {
      'title': 'Quick resets',
      'description':
          'Short exercises to shift your mood in a few minutes, anywhere.'
    },
    {
      'title': 'Pick what you need',
      'description':
          'Tap a reset to start. Breathing, sounds and journaling resets each earn Escape Coins.'
    },
  ],
  'community': [
    {
      'title': 'Community',
      'description':
          'Watch short guided videos for meditation, breathing and movement.'
    },
    {
      'title': 'Switch feeds',
      'description':
          'Use the tabs at the top to switch between For You, Breathing and Body.'
    },
  ],
  'marketplace': [
    {
      'title': 'Marketplace',
      'description':
          'Spend the Escape Coins you earn on rewards and offers from our partners.'
    },
  ],
  'quests': [
    {
      'title': 'Quests',
      'description':
          'Complete quests to build habits. Your progress saves automatically.'
    },
  ],
  'dashboard': [
    {
      'title': 'Your progress',
      'description':
          'See your streak, coins and completed sessions in one place.'
    },
  ],
  'energy_centers': [
    {
      'title': 'Energy Centers guide',
      'description':
          'Learn what each of the seven centers governs, where it sits and its affirmation.'
    },
  ],
  'lucille_chat': [
    {
      'title': 'Chat with Lucille',
      'description':
          'Type a message and Lucille replies as she thinks. Tap a reply to copy it.'
    },
    {
      'title': 'Shortcuts to what helps',
      'description':
          'Tell Lucille what you need, like sleep, focus or calming down, and tap the shortcut chips above the box to jump straight to that exercise.'
    },
    {
      'title': 'Not a crisis service',
      'description':
          'Lucille is an AI companion, not a therapist. In a crisis, call or text 988 in the US.'
    },
  ],
  'soundscapes': [
    {
      'title': 'Soundscapes',
      'description':
          'Music and nature sounds for focus, calm and sleep, in nine categories.'
    },
    {
      'title': 'Tap to play',
      'description':
          'Tap any card to play it. Use the tabs to switch categories and See all for the full list.'
    },
  ],
  'lucille_suggestions': [
    {
      'title': 'Lucille\'s suggestions',
      'description':
          'Swipe through three sessions picked for your mood. Tap Why this session? to see her reason.'
    },
    {
      'title': 'Start or ask for more',
      'description':
          'Tap Start Exercise to begin, or swipe for more options.'
    },
  ],
};

class _WalkthroughCards extends StatefulWidget {
  const _WalkthroughCards({required this.steps});

  final List<Map<String, String>> steps;

  @override
  State<_WalkthroughCards> createState() => _WalkthroughCardsState();
}

class _WalkthroughCardsState extends State<_WalkthroughCards> {
  int _i = 0;

  void _next() {
    if (_i < widget.steps.length - 1) {
      setState(() => _i++);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[_i];
    final last = _i == widget.steps.length - 1;
    const navy = Color(0xFF1C2444);
    const orange = Color(0xFFF0831A);
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
          child: Material(
            color: Colors.transparent,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Container(
                key: ValueKey(_i),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 4)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${_i + 1} of ${widget.steps.length}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12)),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('Skip',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(step['title'] ?? '',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: navy)),
                    const SizedBox(height: 8),
                    Text(step['description'] ?? '',
                        style: const TextStyle(
                            fontSize: 14, height: 1.4, color: navy)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _next,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: navy,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(last ? 'Got it' : 'Next',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
