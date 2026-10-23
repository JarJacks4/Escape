// Escape v6 — on-device safety and compliance rules.
//
// detectDistress runs before any text leaves the phone (chat, voice transcript, check-in note,
// journal). A match opens the urgent Support sheet; that turn is never used for recommendations.
// AI disclosure follows CA SB 243 / NY S-3008C style rules: at the start of every conversation,
// then every 3 h or 12 turns (teens: 1 h or 5 turns).

final List<RegExp> _distress = [
  RegExp(r"\b(kill|hurt|harm)\s+(myself|me)\b", caseSensitive: false),
  RegExp(r"\bself[-\s]?harm", caseSensitive: false),
  RegExp(r"\bwant(ed)? to die\b", caseSensitive: false),
  RegExp(r"\b(cutting|cut) myself\b", caseSensitive: false),
  RegExp(r"\boverdose\b", caseSensitive: false),
  RegExp(r"\bsuicid", caseSensitive: false),
  RegExp(r"\b(end|ending)\s+(it|my life|everything)\b", caseSensitive: false),
  RegExp(r"\bdon'?t want to (be here|live|wake up|exist)\b", caseSensitive: false),
  RegExp(r"\bcan'?t (go on|do this anymore|keep going)\b", caseSensitive: false),
  RegExp(r"\bno reason to live\b", caseSensitive: false),
  RegExp(r"\bbetter off without me\b", caseSensitive: false),
  RegExp(r"\bhopeless\b", caseSensitive: false),
];

bool detectDistress(String text) {
  // Curly apostrophes from iOS keyboards: normalise so "don’t" matches "don't".
  final t = text.replaceAll('’', "'");
  return _distress.any((p) => p.hasMatch(t));
}

const kDistressReply =
    "I'm really glad you told me. That sounds incredibly heavy, and you deserve support from a "
    "real person right now. I've opened a few ways to reach someone. I'm still here with you too.";

const kAiNoticeText =
    'Reminder: Lucille is an AI companion, not a person or a licensed therapist. '
    "She can't diagnose or treat anything.";

enum V6AgeBand { adult, teen, under13 }

const kMinAge = 13;
const kAdultAge = 18;

int ageFrom(int year, int month, [DateTime? now]) {
  final n = now ?? DateTime.now();
  var age = n.year - year;
  if (n.month < month) age -= 1;
  return age;
}

V6AgeBand bandForAge(int age) {
  if (age < kMinAge) return V6AgeBand.under13;
  if (age < kAdultAge) return V6AgeBand.teen;
  return V6AgeBand.adult;
}

bool aiNoticeDue(V6AgeBand? band, DateTime? lastAt, int turns, [DateTime? now]) {
  final teen = band == V6AgeBand.teen;
  final hours = teen ? 1 : 3;
  final maxTurns = teen ? 5 : 12;
  if (lastAt == null) return true;
  final n = now ?? DateTime.now();
  return turns >= maxTurns || n.difference(lastAt) >= Duration(hours: hours);
}

/// Crisis lines shown on the Support sheet. US numbers; the sheet also links to
/// findahelpline.com for everyone else.
class V6CrisisLine {
  const V6CrisisLine(this.label, this.detail, this.uri);
  final String label;
  final String detail;
  final String uri;
}

const kCrisisLines = <V6CrisisLine>[
  V6CrisisLine('Call or text 988', 'Suicide & Crisis Lifeline · 24/7 · US', 'tel:988'),
  V6CrisisLine('Text HOME to 741741', 'Crisis Text Line · 24/7 · US', 'sms:741741?body=HOME'),
  V6CrisisLine('Call 911', 'If you are in immediate danger', 'tel:911'),
  V6CrisisLine('Outside the US', 'Find a free, confidential line near you',
      'https://findahelpline.com'),
];
