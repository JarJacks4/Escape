// Escape v6 — voice chat with Lucille (Figma Make: Lucille.tsx LucilleVoice; founder reference:
// "Calm AI" voice page).
//
// idle → listening (record; the Mood Orb swells with the mic level) → thinking (orb turns) →
// speaking (orb pulses, captions of the reply). Tap the orb or the mic to stop and send, or to
// interrupt Lucille. Every turn is a real /v1/voice/converse round trip; both turns join the
// same conversation as text chat.
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' show openAppSettings;
import 'package:record/record.dart';

import '/escape_v6/v6.dart';
import 'v6_lucille_home_screen.dart' show V6LucilleHomeScreen;
import 'v6_lucille_parts.dart';

enum _Notice { none, micDenied, unavailable, notHeard, failed }

class V6LucilleVoiceScreen extends StatefulWidget {
  const V6LucilleVoiceScreen({super.key});

  @override
  State<V6LucilleVoiceScreen> createState() => _V6LucilleVoiceScreenState();
}

class _V6LucilleVoiceScreenState extends State<V6LucilleVoiceScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final AudioRecorder _rec = AudioRecorder();
  final V6LucillePlayer _player = V6LucillePlayer();
  late final AnimationController _rings =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

  V6OrbState _state = V6OrbState.idle;
  _Notice _notice = _Notice.none;
  double _level = 0;
  StreamSubscription<Amplitude>? _ampSub;
  String? _path;
  DateTime? _startedAt;
  bool _heardSpeech = false;
  DateTime? _quietSince;
  Timer? _maxTimer;
  bool _alive = true;
  bool _busy = false; // a mic start/stop is in flight (double taps, auto-stop racing a tap)
  int _turn = 0; // bumps on interrupt so stale replies are ignored
  bool _motionOff = false; // refreshed in build
  BuildContext? _inner; // a context inside V6Page (live palette for sheets)
  BuildContext get _ctx => (_inner != null && _inner!.mounted) ? _inner! : context;

  V6Store get _s => V6Store.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // After the first frame: it notifies the store, which must not happen during build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_alive) _s.startConversationIfNeeded();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      if (_state == V6OrbState.listening) unawaited(_cancelRecording());
      if (_state == V6OrbState.speaking) _interrupt();
    }
  }

  @override
  void dispose() {
    _alive = false;
    WidgetsBinding.instance.removeObserver(this);
    _maxTimer?.cancel();
    _ampSub?.cancel();
    _rings.dispose();
    unawaited(_teardown());
    super.dispose();
  }

  Future<void> _teardown() async {
    try {
      if (await _rec.isRecording()) await _rec.stop();
    } catch (_) {}
    try {
      await _rec.dispose();
    } catch (_) {}
    await _player.dispose();
    _deleteTemp();
  }

  void _deleteTemp() {
    final p = _path;
    _path = null;
    if (p == null || kIsWeb) return;
    File(p).delete().then((_) {}, onError: (_) {});
  }

  void _set(V6OrbState s) {
    if (!_alive) return;
    setState(() => _state = s);
    if (s == V6OrbState.listening && !_motionOff) {
      _rings.repeat();
    } else {
      _rings.stop();
      _rings.value = 0;
    }
  }

  // ───────────────────────── mic ─────────────────────────

  Future<void> _onMic() async {
    switch (_state) {
      case V6OrbState.idle:
        await _startListening();
      case V6OrbState.listening:
        await _stopAndSend();
      case V6OrbState.speaking:
        // Barge-in: stop Lucille and listen straight away.
        _interrupt();
        await _startListening();
      case V6OrbState.thinking:
        break;
    }
  }

  Future<void> _startListening() async {
    if (kIsWeb) {
      setState(() => _notice = _Notice.unavailable);
      return;
    }
    if (_busy || _state != V6OrbState.idle) return;
    _busy = true;
    try {
      await _startListeningInner();
    } finally {
      _busy = false;
    }
  }

  Future<void> _startListeningInner() async {
    setState(() => _notice = _Notice.none);
    bool allowed = false;
    try {
      allowed = await _rec.hasPermission();
    } catch (_) {}
    if (!_alive) return;
    if (!allowed) {
      setState(() => _notice = _Notice.micDenied);
      return;
    }
    try {
      final dir = await getTemporaryDirectory();
      _path = '${dir.path}/lucille_turn_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _rec.start(const RecordConfig(encoder: AudioEncoder.aacLc, numChannels: 1), path: _path!);
    } catch (e) {
      debugPrint('V6 voice: start failed $e');
      _deleteTemp();
      if (_alive) setState(() => _notice = _Notice.micDenied);
      return;
    }
    if (!_alive) {
      // The page closed while the recorder was starting.
      try {
        await _rec.stop();
      } catch (_) {}
      _deleteTemp();
      return;
    }
    _startedAt = DateTime.now();
    _heardSpeech = false;
    _quietSince = null;
    _level = 0;
    _set(V6OrbState.listening);
    _ampSub?.cancel();
    _ampSub = _rec.onAmplitudeChanged(const Duration(milliseconds: 120)).listen(_onAmp);
    _maxTimer?.cancel();
    _maxTimer = Timer(const Duration(seconds: 60), () {
      if (_state == V6OrbState.listening) _stopAndSend();
    });
  }

  /// dBFS (-160…0) → 0…1, plus a simple end-of-speech detector (1.6 s of quiet after speech).
  /// "Quiet" sits at about -35 dBFS so ordinary room noise (fan, traffic) still counts as quiet;
  /// if nothing that sounds like speech arrives within 10 s the turn is dropped, not sent.
  void _onAmp(Amplitude a) {
    if (!_alive || _state != V6OrbState.listening) return;
    final db = a.current.isFinite ? a.current : -160.0;
    final l = ((db + 50) / 45).clamp(0.0, 1.0);
    setState(() => _level = _level * 0.5 + l * 0.5);
    final now = DateTime.now();
    if (l > 0.45) {
      _heardSpeech = true;
      _quietSince = null;
    } else if (_heardSpeech && l < 0.33) {
      _quietSince ??= now;
      if (now.difference(_quietSince!) > const Duration(milliseconds: 1600)) _stopAndSend();
    } else if (_heardSpeech) {
      _quietSince = null;
    } else if (_startedAt != null && now.difference(_startedAt!) > const Duration(seconds: 10) && !_busy) {
      _startedAt = null; // fire once; later amplitude events must not cancel again
      unawaited(_cancelRecording().then((_) {
        if (_alive) setState(() => _notice = _Notice.notHeard);
      }));
    }
  }

  Future<void> _cancelRecording() async {
    _maxTimer?.cancel();
    await _ampSub?.cancel();
    _ampSub = null;
    try {
      await _rec.stop();
    } catch (_) {}
    _deleteTemp();
    _level = 0;
    _set(V6OrbState.idle);
  }

  Future<void> _stopAndSend() async {
    // Silence auto-stop, the 60 s cap and a tap can all land in the same moment: send once.
    if (_state != V6OrbState.listening || _busy) return;
    _busy = true;
    List<int>? bytes;
    try {
      bytes = await _stopAndRead();
    } finally {
      _busy = false;
    }
    // Outside the busy guard, so a tap while Lucille speaks can still interrupt her.
    if (bytes != null) await _converse(bytes);
  }

  /// Stops the recorder and returns the recording, or null (and resets the UI) when there is none.
  Future<List<int>?> _stopAndRead() async {
    _maxTimer?.cancel();
    await _ampSub?.cancel();
    _ampSub = null;
    String? path;
    try {
      path = await _rec.stop();
    } catch (_) {}
    path ??= _path;
    _level = 0;
    final tooShort = _startedAt == null || DateTime.now().difference(_startedAt!) < const Duration(milliseconds: 700);
    if (path == null || tooShort) {
      _deleteTemp();
      _set(V6OrbState.idle);
      if (_alive && !tooShort) setState(() => _notice = _Notice.notHeard);
      return null;
    }
    _set(V6OrbState.thinking);
    List<int> bytes;
    try {
      bytes = await File(path.replaceFirst('file://', '')).readAsBytes();
    } catch (_) {
      bytes = const [];
    }
    _deleteTemp();
    if (bytes.isEmpty) {
      _set(V6OrbState.idle);
      if (_alive) setState(() => _notice = _Notice.notHeard);
      return null;
    }
    return bytes;
  }

  // ───────────────────────── turn ─────────────────────────

  Future<void> _converse(List<int> audio, {bool consentRetried = false}) async {
    final turn = ++_turn;
    final r = await V6Api.converse(audio: audio, filename: 'turn.m4a');
    if (!_alive || turn != _turn) return;

    if (!r.ok) {
      // V6Api.converse reports `error: 'consent'` + consentPurpose; the API's own 403 body is
      // {detail: {code: consent_required, purpose}} — accept both shapes.
      final m = r.map;
      final detail = m['detail'] is Map ? Map<String, dynamic>.from(m['detail'] as Map) : const <String, dynamic>{};
      final purpose = (m['consentPurpose'] ?? m['purpose'] ?? detail['purpose'])?.toString();
      final isConsent = r.error == 'consent' ||
          (r.status == 403 && (m['code'] == 'consent_required' || detail['code'] == 'consent_required'));
      if (isConsent && purpose != null && !consentRetried) {
        final yes = await showV6Consent(_ctx, purpose);
        if (!_alive) return;
        if (yes) {
          await V6Api.setConsent(purpose, true);
          if (!_alive) return;
          await _converse(audio, consentRetried: true);
          return;
        }
        _set(V6OrbState.idle);
        return;
      }
      _set(V6OrbState.idle);
      setState(() => _notice = (r.status == 404 || r.status == 503) ? _Notice.unavailable : _Notice.failed);
      return;
    }

    final d = r.map;
    final transcript = d['transcript']?.toString().trim() ?? '';
    final serverReply = d['reply']?.toString().trim() ?? '';
    if (transcript.isEmpty) {
      _set(V6OrbState.idle);
      setState(() => _notice = _Notice.notHeard);
      return;
    }
    final serverDistress = d['distress'] == true;
    final localDistress = detectDistress(transcript);
    _s.pushLucille(transcript, fromLucille: false);

    if (serverDistress || localDistress) {
      // The server's reply is already the safe message; if only the phone caught it, use ours.
      final safe = serverDistress && serverReply.isNotEmpty ? serverReply : kDistressReply;
      _s.pushLucille(safe, fromLucille: true);
      unawaited(showV6Support(_ctx, V6SupportLevel.urgent));
      if (serverDistress && d['audio'] != null) {
        await _play(d['audio']?.toString(), d['audioMime']?.toString(), turn);
      } else {
        _set(V6OrbState.idle);
      }
      return;
    }

    if (serverReply.isEmpty) {
      _set(V6OrbState.idle);
      setState(() => _notice = _Notice.failed);
      return;
    }
    _s.pushLucille(serverReply, fromLucille: true);
    final audioB64 = d['audio']?.toString();
    if (audioB64 == null || audioB64.isEmpty) {
      _set(V6OrbState.idle); // captions only this turn
      return;
    }
    await _play(audioB64, d['audioMime']?.toString(), turn);
  }

  Future<void> _play(String? b64, String? mime, int turn) async {
    _set(V6OrbState.speaking);
    await _player.playBase64(b64, mime: mime);
    if (_alive && turn == _turn && _state == V6OrbState.speaking) _set(V6OrbState.idle);
  }

  void _interrupt() {
    _turn++;
    unawaited(_player.stop());
    _set(V6OrbState.idle);
  }

  void _toText() {
    if (_state == V6OrbState.listening) unawaited(_cancelRecording());
    _interrupt();
    GoRouter.of(context).pushReplacementNamed(V6Routes.lucilleText);
  }

  void _close() {
    _interrupt();
    v6LucilleLeave(context);
  }

  // ───────────────────────── ui ─────────────────────────

  String get _status => switch (_state) {
        V6OrbState.listening => "I'm listening",
        V6OrbState.thinking => 'Thinking',
        V6OrbState.speaking => 'Lucille is speaking',
        V6OrbState.idle => 'Tap to speak',
      };

  String get _micCaption => switch (_state) {
        V6OrbState.listening => 'Tap to send',
        V6OrbState.thinking => 'One moment',
        V6OrbState.speaking => 'Tap to interrupt and speak',
        V6OrbState.idle => 'Tap to speak',
      };

  String get _micLabel => switch (_state) {
        V6OrbState.listening => 'Stop and send',
        V6OrbState.thinking => 'Lucille is thinking',
        V6OrbState.speaking => 'Interrupt Lucille',
        V6OrbState.idle => 'Start speaking',
      };

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return V6Page(
      showMedia: false,
      child: V6Watch(builder: (context, s) {
        // Palette + reduce motion come from the V6Theme that V6Page provides (below this State).
        _inner = context;
        final p = V6Theme.of(context);
        _motionOff = V6Theme.motionOff(context);
        final msgs = s.lucilleMessages;
        final lastUserIdx = msgs.lastIndexWhere((m) => !m.fromLucille);
        final userWords = lastUserIdx < 0 ? null : msgs[lastUserIdx];
        V6ChatMessage? reply;
        for (var i = msgs.length - 1; i > lastUserIdx; i--) {
          if (msgs[i].fromLucille) {
            reply = msgs[i];
            break;
          }
        }
        // While listening or thinking the last turn's words would read as stale: show "…" only.
        final waiting = _state == V6OrbState.listening || _state == V6OrbState.thinking;
        final big = waiting ? '…' : (userWords?.text ?? '');
        final showReply = !waiting && reply != null;

        return Padding(
          padding: EdgeInsets.fromLTRB(V6Space.gutter, pad.top + 8, V6Space.gutter, pad.bottom + 20),
          child: Column(children: [
            // Title.
            SizedBox(
              height: 48,
              child: Row(children: [
                V6IconButton(icon: Icons.arrow_back_rounded, label: 'Back', onTap: _close),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Semantics(header: true, child: const V6Text('Lucille', size: 17, weight: FontWeight.w600)),
                    const SizedBox(width: 6),
                    ExcludeSemantics(child: V6Text('✦', size: 14, ink: V6Ink.accent)),
                    const SizedBox(width: 8),
                    const V6AiBadge(),
                  ]),
                ),
                const SizedBox(width: V6Space.minTarget),
              ]),
            ),
            const SizedBox(height: 10),
            Semantics(
              liveRegion: true,
              child: V6Fade(child: V6Text(_status, key: ValueKey(_status), size: 17, ink: V6Ink.muted)),
            ),
            if (reply != null && reply.aiNotice) ...[
              const SizedBox(height: 12),
              const V6AiNotice(),
            ],
            // Orb.
            Expanded(
              flex: 5,
              child: Center(
                child: _OrbStage(
                  state: _state,
                  level: _level,
                  mood: s.currentMood ?? V6Mood.calm,
                  onTap: _state == V6OrbState.thinking ? null : _onMic,
                  label: _micLabel,
                ),
              ),
            ),
            // Captions: the user's last words big, Lucille's reply below.
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Semantics(
                  liveRegion: true,
                  child: Column(children: [
                    V6Fade(
                      child: V6Display(
                        big,
                        key: ValueKey('u$big'),
                        size: 26,
                        align: TextAlign.center,
                      ),
                    ),
                    if (showReply) ...[
                      const SizedBox(height: 14),
                      V6Fade(
                        child: V6Text(
                          reply.text,
                          key: ValueKey(reply.id),
                          size: 16,
                          ink: V6Ink.muted,
                          align: TextAlign.center,
                        ),
                      ),
                    ],
                    if (_notice != _Notice.none) ...[
                      const SizedBox(height: 16),
                      _NoticeCard(notice: _notice, onType: _toText, onSettings: () => unawaited(openAppSettings())),
                    ],
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Thumb zone: keyboard · mic · close.
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: V6IconButton(icon: Icons.keyboard_alt_outlined, label: 'Switch to text', size: 52, onTap: _toText),
              ),
              _MicButton(
                state: _state,
                rings: _rings,
                onTap: _state == V6OrbState.thinking ? null : _onMic,
                label: _micLabel,
                color: _state == V6OrbState.listening ? p.accent : p.ink,
                iconColor: p.onInk,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: V6IconButton(icon: Icons.close_rounded, label: 'End voice chat', size: 52, onTap: _close),
              ),
            ]),
            const SizedBox(height: 8),
            V6Fade(child: V6Text(_micCaption, key: ValueKey(_micCaption), size: 13, ink: V6Ink.faint)),
          ]),
        );
      }),
    );
  }
}

class _OrbStage extends StatelessWidget {
  const _OrbStage({required this.state, required this.level, required this.mood, required this.onTap, required this.label});
  final V6OrbState state;
  final double level;
  final V6Mood mood;
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return LayoutBuilder(builder: (context, box) {
      // Figma: a 210 orb inside a 260 tap area; shrink on short phones so the stage always fits.
      final room = box.maxHeight.isFinite ? box.maxHeight : 260.0;
      final size = (room - 50).clamp(120.0, 210.0);
      return V6Pressable(
        onTap: onTap,
        semanticLabel: label,
        scale: 0.96,
        child: SizedBox(
          width: size + 50,
          height: size + 50,
          child: Stack(alignment: Alignment.center, children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: state == V6OrbState.thinking ? 1 : 0,
              child: Container(
                width: size + 24,
                height: size + 24,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: p.inkFaint, width: 1.5)),
              ),
            ),
            V6MoodOrb(
              mood: mood,
              size: size,
              glow: true,
              live: true,
              state: state,
              level: level,
              heroTag: V6LucilleHomeScreen.orbHeroTag,
            ),
          ]),
        ),
      );
    });
  }
}

class _MicButton extends StatelessWidget {
  const _MicButton({
    required this.state,
    required this.rings,
    required this.onTap,
    required this.label,
    required this.color,
    required this.iconColor,
  });
  final V6OrbState state;
  final AnimationController rings;
  final VoidCallback? onTap;
  final String label;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final listening = state == V6OrbState.listening;
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(alignment: Alignment.center, children: [
        // Static rings (reference: two thin circles around the mic).
        Container(
          width: 112,
          height: 112,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: p.glassBorder)),
        ),
        Container(
          width: 98,
          height: 98,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: p.glassBorder)),
        ),
        // Ripples while listening.
        if (listening)
          AnimatedBuilder(
            animation: rings,
            builder: (context, _) => Stack(alignment: Alignment.center, children: [
              for (final offset in const [0.0, 0.5])
                Builder(builder: (context) {
                  final t = (rings.value + offset) % 1.0;
                  return Opacity(
                    opacity: (1 - t) * 0.8,
                    child: Container(
                      width: 84 + 36 * t,
                      height: 84 + 36 * t,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: p.accent, width: 1.5),
                      ),
                    ),
                  );
                }),
            ]),
          ),
        V6Pressable(
          onTap: onTap,
          semanticLabel: label,
          scale: 0.92,
          child: AnimatedOpacity(
            duration: V6Motion.quick,
            opacity: onTap == null ? 0.5 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 84,
              height: 84,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Icon(
                state == V6OrbState.speaking ? Icons.stop_rounded : Icons.mic_none_rounded,
                size: 32,
                color: iconColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({required this.notice, required this.onType, required this.onSettings});
  final _Notice notice;
  final VoidCallback onType;
  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    final (title, body, offerText) = switch (notice) {
      _Notice.unavailable => ("Voice isn't available right now — let's type", 'Text chat works the same way.', true),
      _Notice.micDenied => (
          "I can't hear you yet",
          'Allow microphone access for Escape in your phone settings, or type instead.',
          true
        ),
      _Notice.notHeard => ("I didn't catch that", 'Tap the mic and try again, a little closer to the phone.', false),
      _Notice.failed => ("I couldn't reach Lucille", 'Check your connection and try again, or type instead.', true),
      _Notice.none => ('', '', false),
    };
    return V6Glass(
      padding: const EdgeInsets.all(16),
      radius: 20,
      child: Column(children: [
        V6Text(title, weight: FontWeight.w600, align: TextAlign.center),
        const SizedBox(height: 4),
        V6Text(body, size: 13, ink: V6Ink.muted, align: TextAlign.center),
        if (notice == _Notice.micDenied) ...[
          const SizedBox(height: 12),
          V6GhostPill(label: 'Open settings', icon: Icons.settings_outlined, onTap: onSettings),
        ],
        if (offerText) ...[
          const SizedBox(height: 10),
          V6GhostPill(label: 'Type instead', icon: Icons.keyboard_alt_outlined, onTap: onType),
        ],
      ]),
    );
  }
}
