import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/lucille_v1.dart';

/// Saves what the person just did to Lucille's long-term memory
/// (POST /users/{uid}/memories), so she learns from every exercise, session and scan,
/// not only from chat. Used by Flutter pages and, through the Soundscapes plugin, by the
/// native module.
///
/// Only with the person's AI consent (ai_reflection or personalization), never while
/// processing is restricted; the same rule as journal entries. Fire and forget: a failure
/// never affects the exercise itself.
class LucilleMemory {
  LucilleMemory._();

  static bool? _allowed;
  static DateTime? _checkedAt;
  static final Map<String, DateTime> _recent = {};

  static Future<bool> _consentOk() async {
    final now = DateTime.now();
    if (_allowed != null &&
        _checkedAt != null &&
        now.difference(_checkedAt!) < const Duration(minutes: 10)) {
      return _allowed!;
    }
    final c = await lucilleV1('GET', '/v1/privacy/consents', null);
    final data = c is Map ? c['data'] : null;
    final flags = data is Map ? data['flags'] : null;
    final ok = flags is Map &&
        data['restricted'] != true &&
        (flags['ai_reflection'] == true || flags['personalization'] == true);
    _allowed = ok;
    _checkedAt = now;
    return ok;
  }

  static String _today() {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final d = DateTime.now();
    final h = d.hour % 12 == 0 ? 12 : d.hour % 12;
    final m = d.minute.toString().padLeft(2, '0');
    return '${months[d.month - 1]} ${d.day}, $h:$m ${d.hour < 12 ? 'AM' : 'PM'}';
  }

  /// [content] is one plain sentence about what happened ("Finished the Yoga Body
  /// session: 4 moves, about 3 minutes."). The date is added here. [kind] goes into the
  /// tags (e.g. 'exercise', 'body', 'soundscape', 'mood_scan').
  static Future<void> remember(
    String content, {
    required String kind,
    List<String> tags = const [],
    int importance = 5,
  }) async {
    try {
      final uid = currentUserUid;
      final text = content.trim();
      if (uid.isEmpty || text.isEmpty) return;
      // Same event twice within a minute (double tap, retry): save once.
      final key = '$kind|$text';
      final last = _recent[key];
      if (last != null &&
          DateTime.now().difference(last) < const Duration(minutes: 1)) {
        return;
      }
      _recent[key] = DateTime.now();
      if (!await _consentOk()) return;
      final clipped = text.length > 1500 ? '${text.substring(0, 1500)}…' : text;
      await lucilleV1('POST', '/users/$uid/memories', {
        'content': '${_today()}: $clipped',
        'memory_type': 'episodic',
        'importance': importance.clamp(1, 10),
        'tags': [kind, ...tags.where((t) => t.trim().isNotEmpty)],
      });
    } catch (_) {}
  }
}
