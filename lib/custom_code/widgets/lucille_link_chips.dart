// Lucille → in-app deep links.
//
// After someone tells Lucille what they need ("I can't sleep", "I'm so anxious", "I want to
// journal"), the chat shows up to three tappable shortcuts to the screens in Escape that help
// with exactly that. Matching runs on the phone (no extra API call), from the person's own
// words and Lucille's reply. Crisis language always puts the 988 shortcut first.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/soundscapes/soundscapes_launcher.dart';

class LucilleLink {
  const LucilleLink(this.id, this.label, this.icon, this.open);

  final String id;
  final String label;
  final IconData icon;
  final Future<void> Function(BuildContext context) open;
}

Future<void> _push(BuildContext context, String route,
        [Map<String, String> query = const {}]) async =>
    context.pushNamed(route, queryParameters: query);

/// Topic -> keywords -> link. Order matters: earlier topics win when several match.
final List<(List<String>, LucilleLink)> _rules = [
  (
    ['suicid', 'kill myself', 'end my life', 'self harm', 'self-harm', 'hurt myself', 'want to die'],
    LucilleLink('crisis', 'Call or text 988 now', Icons.phone_in_talk_rounded,
        (c) => launchUrl(Uri.parse('tel:988'))),
  ),
  (
    ['panic', 'anxious', 'anxiety', 'nervous', 'worried', 'worry', 'stress', 'overwhelm', 'on edge'],
    LucilleLink('anxiety', 'Anxiety relief (binaural)', Icons.spa_rounded,
        (c) => _push(c, AnxietyReliefGoalWidget.routeName)),
  ),
  (
    ['can\'t sleep', 'cant sleep', 'insomnia', 'awake at night', 'trouble sleeping', 'up all night'],
    LucilleLink('insomnia', 'Insomnia relief', Icons.bedtime_rounded,
        (c) => _push(c, InsomniaGoalWidget.routeName)),
  ),
  (
    ['sleep', 'tired', 'exhausted', 'bedtime', 'rest'],
    LucilleLink('sleep', 'Deep sleep session', Icons.nights_stay_rounded,
        (c) => _push(c, DeepSleepGoalWidget.routeName)),
  ),
  (
    ['nap', 'naps', 'recharge'],
    LucilleLink('nap', 'Power nap', Icons.battery_charging_full_rounded,
        (c) => _push(c, SmallNapGoalWidget.routeName)),
  ),
  (
    ['overthink', 'racing thoughts', 'can\'t stop thinking', 'adhd', 'scattered'],
    LucilleLink('overthinking', 'Calm overthinking', Icons.psychology_rounded,
        (c) => _push(c, ADHDAndOverthinkingGoalWidget.routeName)),
  ),
  (
    ['focus', 'concentrat', 'distracted', 'study', 'productive', 'work'],
    LucilleLink('focus', 'Increase focus', Icons.center_focus_strong_rounded,
        (c) => _push(c, IncreaseFocusGoalWidget.routeName)),
  ),
  (
    ['breath', 'breathe', 'calm down', 'relax'],
    LucilleLink('breathing', 'Guided breathing', Icons.air_rounded,
        (c) => _push(c, BreathingChoicePageWidget.routeName)),
  ),
  (
    ['sad', 'down', 'lonely', 'depress', 'cry', 'crying', 'hopeless', 'grief', 'heartbroken'],
    LucilleLink('journal_low', 'Write it out in your journal', Icons.edit_note_rounded,
        (c) => _push(c, JournalHomeV2Widget.routeName, {'mode': 'guided'})),
  ),
  (
    ['grateful', 'gratitude', 'thankful'],
    LucilleLink('gratitude', 'Gratitude journal', Icons.favorite_rounded,
        (c) => _push(c, JournalHomeV2Widget.routeName, {'mode': 'gratitude'})),
  ),
  (
    ['journal', 'write', 'vent', 'diary'],
    LucilleLink('journal', 'Open your journal', Icons.menu_book_rounded,
        (c) => _push(c, JournalHomeV2Widget.routeName, {'mode': 'free'})),
  ),
  (
    ['music', 'sound', 'soundscape', 'noise', 'listen', 'song'],
    LucilleLink('soundscapes', 'Soundscapes', Icons.graphic_eq_rounded,
        (c) => SoundscapesLauncher.openOrFallback(c)),
  ),
  (
    ['move', 'moving', 'stretch', 'exercise', 'body', 'tense', 'stiff', 'tai chi', 'workout'],
    LucilleLink('body', 'Body movement', Icons.self_improvement_rounded,
        (c) => _push(c, BodyPageVersion5Widget.routeName)),
  ),
  (
    ['energy', 'chakra', 'grounded', 'balance', 'meditat'],
    LucilleLink('mind', 'Mind & energy centers', Icons.blur_circular_rounded,
        (c) => _push(c, MindPageWidget.routeName)),
  ),
  (
    ['mood', 'feel', 'feeling', 'how am i', 'check in', 'check-in'],
    LucilleLink('mood_scan', 'Take a Mood Scan', Icons.favorite_border_rounded,
        (c) => SoundscapesLauncher.openMoodScan(c)),
  ),
  (
    ['reset', 'quick break', 'few minutes'],
    LucilleLink('reset', 'Quick reset', Icons.restart_alt_rounded,
        (c) => _push(c, ResetPageCopyWidget.routeName)),
  ),
];

/// Phrases match anywhere; single words must start a word (so "anxi" matches "anxious"), and
/// short words (4 letters or fewer, e.g. "rest", "nap", "cry") must be the whole word, so
/// "interest", "snap" and "crypto" don't trigger anything.
bool _mentions(String text, String w) {
  if (w.contains(' ') || w.contains('\'')) return text.contains(w);
  final pattern = w.length <= 4 ? '\\b${RegExp.escape(w)}\\b' : '\\b${RegExp.escape(w)}';
  return RegExp(pattern).hasMatch(text);
}

/// Up to [max] shortcuts for what the person said (and Lucille's reply). Crisis always first.
List<LucilleLink> lucilleLinksFor(String userText, {String reply = '', int max = 3}) {
  final text = '${userText.toLowerCase()} ${reply.toLowerCase()}';
  final user = userText.toLowerCase();
  final out = <LucilleLink>[];
  for (final (words, link) in _rules) {
    // Crisis and Mood Scan come only from the person's own words; Lucille's reply can add others.
    final source = (link.id == 'crisis' || link.id == 'mood_scan') ? user : text;
    if (words.any((w) => _mentions(source, w)) && out.every((l) => l.id != link.id)) {
      out.add(link);
      if (out.length >= max) break;
    }
  }
  return out;
}

/// The row of shortcut chips shown above the chat input.
class LucilleLinkChips extends StatelessWidget {
  const LucilleLinkChips({super.key, required this.links, this.onOpened});

  final List<LucilleLink> links;
  final VoidCallback? onOpened;

  @override
  Widget build(BuildContext context) {
    if (links.isEmpty) return const SizedBox.shrink();
    const navy = Color(0xFF1C2444);
    const orange = Color(0xFFF0831A);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 6),
            child: Text('Lucille suggests in Escape',
                style: TextStyle(fontSize: 12, color: navy, fontWeight: FontWeight.w600)),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: links.map((l) {
              final crisis = l.id == 'crisis';
              return ActionChip(
                avatar: Icon(l.icon, size: 18, color: crisis ? Colors.white : navy),
                label: Text(l.label,
                    style: TextStyle(
                        color: crisis ? Colors.white : navy,
                        fontWeight: FontWeight.w600,
                        fontSize: 13)),
                backgroundColor: crisis ? const Color(0xFFD64545) : Colors.white,
                side: BorderSide(color: crisis ? const Color(0xFFD64545) : orange),
                shape: const StadiumBorder(),
                onPressed: () async {
                  await l.open(context);
                  onOpened?.call();
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
