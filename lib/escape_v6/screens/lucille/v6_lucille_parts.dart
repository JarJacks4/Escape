// Escape v6 — pieces shared by the Lucille text and voice pages (Figma Make: Lucille.tsx
// AiBadge, AiNotice, Bubble, TypingDots) plus Lucille's voice playback and the
// "speak replies aloud" preference.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart' show MediaItem;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/custom_code/widgets/lucille_link_chips.dart' show LucilleLink;
import '/escape_v6/v6.dart';

// ───────────────────────── preference ─────────────────────────

const kV6SpeakRepliesKey = 'v6_speak_replies';

/// "Speak replies aloud" in text chat (Settings > Lucille). Off by default: text chat is often
/// used exactly when someone can't have sound on.
class V6SpeakReplies {
  V6SpeakReplies._();
  static final ValueNotifier<bool> value = ValueNotifier<bool>(false);
  static bool _loaded = false;

  static Future<bool> load() async {
    if (_loaded) return value.value;
    try {
      final prefs = await SharedPreferences.getInstance();
      value.value = prefs.getBool(kV6SpeakRepliesKey) ?? false;
    } catch (_) {}
    _loaded = true;
    return value.value;
  }

  static Future<void> set(bool on) async {
    value.value = on;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kV6SpeakRepliesKey, on);
    } catch (_) {}
  }
}

// ───────────────────────── playback ─────────────────────────

/// Plays Lucille's voice (base64 mp3 from /v1/voice/converse or /v1/voice/speak) from a temp file.
/// One instance per page; [dispose] stops playback when the page goes away.
class V6LucillePlayer {
  final AudioPlayer _player = AudioPlayer();
  File? _file;
  bool _disposed = false;

  bool get playing => _player.playing;

  /// Resolves when playback finishes, is stopped, or fails. Returns false if nothing played.
  Future<bool> playBase64(String? b64, {String? mime}) async {
    if (_disposed || kIsWeb || b64 == null || b64.isEmpty) return false;
    File? f;
    try {
      final comma = b64.indexOf(',');
      final raw = b64.startsWith('data:') && comma > 0 ? b64.substring(comma + 1) : b64;
      final bytes = base64Decode(raw);
      final dir = await getTemporaryDirectory();
      final ext = (mime ?? '').contains('wav') ? 'wav' : 'mp3';
      f = File('${dir.path}/lucille_${DateTime.now().microsecondsSinceEpoch}.$ext');
      await f.writeAsBytes(bytes, flush: true);
      await stop();
      if (_disposed) return false;
      _file = f;
      // Tagged so playback also works if just_audio_background is ever initialised.
      await _player.setAudioSource(AudioSource.file(
        f.path,
        tag: MediaItem(id: 'lucille-${f.path.hashCode.toUnsigned(32)}', title: 'Lucille'),
      ));
      if (_disposed) return false;
      // just_audio: play() completes when playback completes, pauses or stops.
      await _player.play();
      return true;
    } catch (e) {
      debugPrint('V6LucillePlayer: $e');
      return false;
    } finally {
      if (f != null) {
        if (identical(_file, f)) _file = null;
        _delete(f);
      }
    }
  }

  static void _delete(File f) {
    f.delete().then((_) {}, onError: (_) {});
  }

  /// Fetches Lucille's voice for [text] and plays it.
  Future<bool> speak(String text) async {
    if (_disposed || kIsWeb || text.trim().isEmpty) return false;
    final r = await V6Api.speak(text);
    if (!r.ok || _disposed) return false;
    return playBase64(r.map['audio']?.toString(), mime: r.map['audioMime']?.toString());
  }

  Future<void> stop() async {
    try {
      await _player.stop();
    } catch (_) {}
  }

  void _cleanup() {
    final f = _file;
    _file = null;
    if (f != null) _delete(f);
  }

  Future<void> dispose() async {
    _disposed = true;
    await stop();
    try {
      await _player.dispose();
    } catch (_) {}
    _cleanup();
  }
}

// ───────────────────────── navigation ─────────────────────────

/// Back / close for the Lucille chat pages. Opened from a deep link or notification there may be
/// nothing to pop, so fall back to the app's start route instead of leaving the user stuck.
void v6LucilleLeave(BuildContext context) {
  final nav = Navigator.of(context);
  if (nav.canPop()) {
    nav.pop();
  } else {
    GoRouter.of(context).go('/');
  }
}

// ───────────────────────── widgets ─────────────────────────

/// Small "AI" pill next to Lucille's name (required by companion-chatbot disclosure laws).
class V6AiBadge extends StatelessWidget {
  const V6AiBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      label: 'Lucille is an AI',
      child: ExcludeSemantics(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: p.accentSoft.withOpacity(0.35),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: p.glassBorder),
          ),
          child: Text('AI',
              style: V6Type.body(10, p.ink, weight: FontWeight.w700, height: 1.2).copyWith(letterSpacing: 0.8)),
        ),
      ),
    );
  }
}

/// The periodic "Lucille is an AI" notice card.
class V6AiNotice extends StatelessWidget {
  const V6AiNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      container: true,
      label: kAiNoticeText,
      child: ExcludeSemantics(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: p.glass[2],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: p.glassBorder),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Icon(Icons.shield_outlined, size: 15, color: p.inkMuted),
              ),
              const SizedBox(width: 8),
              const Expanded(child: V6Text(kAiNoticeText, size: 12, ink: V6Ink.muted, height: 1.4)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// A chat bubble: Lucille on the left in glass, the user on the right in ink.
class V6ChatBubble extends StatelessWidget {
  const V6ChatBubble({super.key, required this.message});
  final V6ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final mine = !message.fromLucille;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomLeft: Radius.circular(mine ? 20 : 6),
      bottomRight: Radius.circular(mine ? 6 : 20),
    );
    final text = Text(
      message.text,
      style: V6Type.body(15, mine ? p.onInk : p.ink),
    );
    final bubble = mine
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: p.ink, borderRadius: radius),
            child: text,
          )
        : ClipRRect(
            borderRadius: radius,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: radius,
                gradient: LinearGradient(
                  begin: const Alignment(-0.85, -1),
                  end: const Alignment(0.85, 1),
                  colors: [p.glass[0], p.glass[1], p.glass[2]],
                  stops: const [0.15, 0.25, 1.0],
                ),
                border: Border.all(color: p.glassBorder),
              ),
              child: text,
            ),
          );
    return Semantics(
      label: mine ? 'You said' : 'Lucille said',
      child: Align(
        alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.84,
          alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
          child: Align(alignment: mine ? Alignment.centerRight : Alignment.centerLeft, child: bubble),
        ),
      ),
    );
  }
}

/// Three bouncing dots while Lucille is writing.
class V6TypingDots extends StatefulWidget {
  const V6TypingDots({super.key});

  @override
  State<V6TypingDots> createState() => _V6TypingDotsState();
}

class _V6TypingDotsState extends State<V6TypingDots> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final off = V6Theme.motionOff(context);
    Widget dot(int i) => AnimatedBuilder(
          animation: _c,
          builder: (context, _) {
            var t = 0.0;
            if (!off) {
              final phase = (_c.value - i * 0.17) % 1.0;
              t = phase < 0.5 ? Curves.easeInOut.transform(phase * 2) : Curves.easeInOut.transform((1 - phase) * 2);
            }
            return Transform.translate(
              offset: Offset(0, -4 * t),
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(shape: BoxShape.circle, color: p.ink.withOpacity(0.45 + 0.55 * t)),
              ),
            );
          },
        );
    return Semantics(
      liveRegion: true,
      label: 'Lucille is typing',
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: p.glass[1],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(color: p.glassBorder),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            dot(0),
            const SizedBox(width: 6),
            dot(1),
            const SizedBox(width: 6),
            dot(2),
          ]),
        ),
      ),
    );
  }
}

/// App shortcuts that match what was said (reuses the matching rules of the existing
/// LucilleLinkChips, rendered as v6 chips).
class V6LucilleLinkRow extends StatelessWidget {
  const V6LucilleLinkRow({super.key, required this.links});
  final List<LucilleLink> links;

  @override
  Widget build(BuildContext context) {
    if (links.isEmpty) return const SizedBox.shrink();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
      child: Row(children: [
        for (var i = 0; i < links.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          V6Chip(
            label: links[i].label,
            icon: links[i].icon,
            onTap: () => links[i].open(context),
          ),
        ],
      ]),
    );
  }
}

/// Quick prompts offered at the start of a conversation.
const kV6LucillePrompts = <String>["I can't switch off", 'Help me focus', "I'm feeling flat"];
