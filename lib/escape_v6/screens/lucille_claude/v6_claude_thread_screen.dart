// Escape v6 — Lucille (Claude edition): the thread.
//
// One ongoing conversation you can type into or speak into. Voice does not open a separate page:
// the mic transcribes on the phone and the words land in *this* thread, next to the typed ones,
// the way Duet works. The Mood Orb is Lucille's presence in the header and takes the real
// listening / thinking / speaking states.
//
// Behaviour is deliberately identical to the existing chat: same composer, same send, same back.
// The status line above a reply is informational only — it never blocks input or takes focus.
//
// Safety: detectDistress runs on the typed or transcribed words BEFORE anything leaves the phone.
// On a hit the safe reply is shown with the urgent Support sheet and no request is made.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '/escape_v6/v6.dart';
import '../lucille/v6_lucille_home_screen.dart' show V6LucilleHomeScreen;
import '../lucille/v6_lucille_parts.dart';
import 'v6_claude_cards.dart';
import 'v6_claude_events.dart';
import 'v6_claude_status.dart';
import 'v6_claude_stream.dart';
import 'v6_claude_threads.dart';

enum _Notice { none, micDenied, micUnavailable, notHeard }

class V6ClaudeThreadScreen extends StatefulWidget {
  const V6ClaudeThreadScreen({super.key, this.threadId, this.seed});

  /// Which thread to open. Null continues the most recent one (Duet's single ongoing thread).
  final String? threadId;

  /// A prompt handed over from another page; sent once.
  final String? seed;

  @override
  State<V6ClaudeThreadScreen> createState() => _V6ClaudeThreadScreenState();
}

class _V6ClaudeThreadScreenState extends State<V6ClaudeThreadScreen> {
  final _draft = TextEditingController();
  final _scroll = ScrollController();
  final _player = V6LucillePlayer();
  final _logs = V6ClaudeThreads.instance;
  final stt.SpeechToText _speech = stt.SpeechToText();

  late final V6ClaudeTurn _turn = V6ClaudeTurn(
    onSafety: _onSafety,
    onSession: _onSession,
    onDone: _onTurnDone,
  );

  V6ClaudeThread? _thread;
  _Notice _notice = _Notice.none;
  V6OrbState _orb = V6OrbState.idle;
  double _level = 0;
  bool _listening = false;
  bool _micBusy = false;
  String _heard = '';
  bool _alive = true;
  BuildContext? _inner; // a context inside V6Page (live palette for sheets)
  BuildContext get _ctx => (_inner != null && _inner!.mounted) ? _inner! : context;

  V6Store get _s => V6Store.instance;

  @override
  void initState() {
    super.initState();
    _turn.addListener(_onTurn);
    _logs.addListener(_onLogs);
    unawaited(V6SpeakReplies.load());
    unawaited(_openThread());
  }

  @override
  void dispose() {
    _alive = false;
    _turn.removeListener(_onTurn);
    _logs.removeListener(_onLogs);
    _turn.dispose();
    _draft.dispose();
    _scroll.dispose();
    unawaited(_player.dispose());
    try {
      unawaited(_speech.cancel());
    } catch (_) {}
    unawaited(_logs.save());
    super.dispose();
  }

  Future<void> _openThread() async {
    // Only reachable with the Claude edition on. A stale deeplink (or an old notification)
    // closes again instead of showing an edition this account isn't on.
    if (!_s.v6ClaudeEdition) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_alive && mounted) v6LucilleLeave(context);
      });
      return;
    }
    await _logs.load();
    if (!_alive) return;
    final id = widget.threadId;
    final t = (id == null ? null : _logs.byId(id)) ?? _logs.ongoing();
    // A conversation that starts empty always opens with the AI disclosure, as the existing chat
    // does (startConversationIfNeeded clears the same clock).
    if (t.messages.isEmpty) _s.lastAiNoticeAt = null;
    setState(() => _thread = t);
    final seed = (widget.seed?.trim().isNotEmpty ?? false) ? widget.seed!.trim() : _s.lucilleSeed;
    _s.lucilleSeed = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_alive) return;
      _toBottom(animate: false);
      if (seed != null && seed.isNotEmpty) unawaited(_send(seed));
    });
  }

  void _onTurn() {
    if (!_alive) return;
    setState(() {
      final v = _turn.value;
      if (v.active && _orb != V6OrbState.listening) _orb = V6OrbState.thinking;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
  }

  void _onLogs() {
    if (_alive) setState(() {});
  }

  void _toBottom({bool animate = true}) {
    if (!_alive || !mounted || !_scroll.hasClients) return;
    final end = _scroll.position.maxScrollExtent;
    final off = _s.reduceMotion || (MediaQuery.maybeOf(context)?.disableAnimations ?? false);
    if (!animate || off) {
      _scroll.jumpTo(end);
    } else {
      _scroll.animateTo(end, duration: const Duration(milliseconds: 360), curve: V6Motion.ease);
    }
  }

  // ───────────────────────── turn ─────────────────────────

  void _onSafety(V6ClaudeSafetyEvent e) {
    if (!_alive) return;
    unawaited(showV6Support(_ctx, e.urgent ? V6SupportLevel.urgent : V6SupportLevel.gentle));
  }

  void _onSession(String sessionId, String? title) {
    final t = _thread;
    if (t == null) return;
    t.sessionId = sessionId;
    if (title != null && title.trim().isNotEmpty) t.title = title.trim();
    _logs.touch(t);
  }

  /// Folds a finished turn into the thread so it is saved and scrolls like any other message.
  void _onTurnDone(V6ClaudeTurnState v) {
    final t = _thread;
    if (t == null || !_alive) return;
    if (v.hasError) {
      // The turn broke. Whatever arrived stays on screen next to the retry row, but a half
      // answer is never written into the thread as if it were the whole reply.
      setState(() => _orb = V6OrbState.idle);
      return;
    }
    if (v.isEmpty) {
      setState(() => _orb = V6OrbState.idle);
      return;
    }
    final m = V6ClaudeMessage(
      id: v.messageId ?? _logs.nextMessageId(),
      fromLucille: true,
      text: v.text.trim(),
      at: DateTime.now(),
      statuses: [...v.statuses],
      artifacts: [...v.artifacts],
      actions: [...v.actions],
      approvals: [...v.approvals],
      plan: v.plan,
      disclosure: _disclosureFor(v.disclosure),
    );
    t.messages.add(m);
    _logs.touch(t);
    final speak = v.text.trim();
    _turn.reset();
    setState(() => _orb = V6OrbState.idle);
    if (speak.isNotEmpty && V6SpeakReplies.value.value) unawaited(_speakReply(speak));
    WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
  }

  /// The server owns the disclosure cadence (`disclosure` frames). If a turn carries none, the
  /// app's own clock still applies — the periodic notice is a legal requirement, not a nicety —
  /// and both editions share the one clock in the store, so it can't double up.
  String? _disclosureFor(String? fromServer) {
    if (fromServer != null && fromServer.trim().isNotEmpty) {
      _s.lastAiNoticeAt = DateTime.now();
      _s.turnsSinceAiNotice = 0;
      return fromServer.trim();
    }
    _s.turnsSinceAiNotice += 1;
    if (!aiNoticeDue(_s.ageBand, _s.lastAiNoticeAt, _s.turnsSinceAiNotice)) return null;
    _s.lastAiNoticeAt = DateTime.now();
    _s.turnsSinceAiNotice = 0;
    return kAiNoticeText;
  }

  Future<void> _speakReply(String text) async {
    if (!_alive) return;
    setState(() => _orb = V6OrbState.speaking);
    await _player.speak(text);
    if (_alive && _orb == V6OrbState.speaking) setState(() => _orb = V6OrbState.idle);
  }

  Future<void> _send(String raw, {bool voice = false}) async {
    final text = raw.trim();
    final t = _thread;
    if (text.isEmpty || t == null || _turn.busy) return;
    setState(() => _notice = _Notice.none);

    t.messages.add(V6ClaudeMessage(
      id: _logs.nextMessageId(),
      fromLucille: false,
      text: text,
      at: DateTime.now(),
      voice: voice,
    ));
    _logs.touch(t);

    // Safety first: nothing distressing leaves the phone.
    if (detectDistress(text)) {
      t.messages.add(V6ClaudeMessage(
        id: _logs.nextMessageId(),
        fromLucille: true,
        text: kDistressReply,
        at: DateTime.now(),
      ));
      _logs.touch(t);
      unawaited(showV6Support(_ctx, V6SupportLevel.urgent));
      WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
    await _turn.send(
      message: text,
      sessionId: t.sessionId,
      mode: voice ? 'voice' : 'text',
      speak: voice || V6SpeakReplies.value.value,
      clientContext: {
        'screen': 'lucille',
        if (_s.currentMood != null) 'mood': _s.currentMood!.name,
      },
    );
  }

  void _submit() {
    final text = _draft.text;
    if (text.trim().isEmpty || _turn.busy) return;
    _draft.clear();
    setState(() {});
    unawaited(_send(text));
  }

  // ───────────────────────── voice ─────────────────────────

  /// Records into the same thread: the phone transcribes, the distress check runs on the words,
  /// and the transcript is sent as an ordinary turn in voice mode.
  Future<void> _micTap() async {
    if (_micBusy) return;
    _micBusy = true;
    try {
      if (_listening) {
        await _stopListening(send: true);
      } else {
        await _startListening();
      }
    } finally {
      _micBusy = false;
    }
  }

  Future<void> _startListening() async {
    if (kIsWeb) {
      setState(() => _notice = _Notice.micUnavailable);
      return;
    }
    if (_turn.busy) return;
    await _player.stop();
    var ready = false;
    try {
      ready = await _speech.initialize(
        onStatus: (status) {
          // 'done' / 'notListening' also arrive when the platform stops on its own.
          if (!_alive || !_listening) return;
          if (status == 'done' || status == 'notListening') unawaited(_stopListening(send: true));
        },
        onError: (error) {
          if (!_alive) return;
          debugPrint('V6Claude mic: ${error.errorMsg}');
          unawaited(_stopListening(send: false, notice: _Notice.notHeard));
        },
      );
    } catch (e) {
      debugPrint('V6Claude mic: initialize failed ($e)');
      ready = false;
    }
    if (!_alive) return;
    if (!ready) {
      setState(() => _notice = _speech.hasPermission ? _Notice.micUnavailable : _Notice.micDenied);
      return;
    }
    _heard = '';
    setState(() {
      _notice = _Notice.none;
      _listening = true;
      _orb = V6OrbState.listening;
      _level = 0;
    });
    try {
      await _speech.listen(
        onResult: (result) {
          if (!_alive) return;
          setState(() => _heard = result.recognizedWords);
          if (result.finalResult) unawaited(_stopListening(send: true));
        },
        onSoundLevelChange: (level) {
          if (!_alive || !_listening) return;
          // Platform scales differ; this only drives the orb's swell.
          final l = ((level + 2) / 12).clamp(0.0, 1.0);
          setState(() => _level = _level * 0.5 + l * 0.5);
        },
        listenFor: const Duration(seconds: 60),
        pauseFor: const Duration(seconds: 3),
      );
    } catch (e) {
      debugPrint('V6Claude mic: listen failed ($e)');
      await _stopListening(send: false, notice: _Notice.micUnavailable);
    }
  }

  Future<void> _stopListening({required bool send, _Notice notice = _Notice.none}) async {
    if (!_listening) return;
    _listening = false;
    try {
      await _speech.stop();
    } catch (_) {}
    final text = _heard.trim();
    _heard = '';
    if (!_alive) return;
    setState(() {
      _level = 0;
      _orb = V6OrbState.idle;
      _notice = notice;
    });
    if (!send) return;
    if (text.isEmpty) {
      setState(() => _notice = _Notice.notHeard);
      return;
    }
    await _send(text, voice: true);
  }

  // ───────────────────────── build ─────────────────────────

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    final t = _thread;
    return V6Page(
      child: Stack(fit: StackFit.expand, children: [
        Column(children: [
          SizedBox(height: pad.top + 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(V6Space.gutter, 0, V6Space.gutter, 8),
            child: _Header(
              title: t?.displayTitle,
              orb: _orb,
              level: _level,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.translucent,
              child: V6Watch(builder: (context, s) {
                _inner = context;
                return Semantics(
                  container: true,
                  label: 'Conversation with Lucille',
                  child: _list(context, t),
                );
              }),
            ),
          ),
          if (_notice != _Notice.none)
            Padding(
              padding: const EdgeInsets.fromLTRB(V6Space.gutter, 0, V6Space.gutter, 6),
              child: _NoticeRow(notice: _notice, onDismiss: () => setState(() => _notice = _Notice.none)),
            ),
          _composer(context, pad),
        ]),
        const V6AutoHelp(page: 'lucilleClaude'),
      ]),
    );
  }

  Widget _list(BuildContext context, V6ClaudeThread? t) {
    final items = <Widget>[];
    if (t != null) {
      for (final m in t.messages) {
        items.add(_MessageBlock(
          key: ValueKey(m.id),
          message: m,
          onApproval: (id, state) {
            final i = m.approvals.indexWhere((a) => a.id == id);
            if (i < 0) return;
            m.approvals = [...m.approvals]..[i] = m.approvals[i].copyWith(state: state);
            _logs.changed();
          },
        ));
      }
    }

    final v = _turn.value;
    if (v.active || !v.isEmpty || v.hasError) {
      items.add(_LiveTurn(
        state: v,
        onApproval: (id, state) => _turn.markApproval(id, state),
      ));
    }
    if (v.hasError) {
      items.add(Align(
        alignment: Alignment.centerLeft,
        child: V6Link(
          label: v.errorMessage == null
              ? "Couldn't reach Lucille. Tap to try again."
              : '${v.errorMessage!} Tap to try again.',
          onTap: () => unawaited(_turn.retry()),
        ),
      ));
    }
    if (items.isEmpty) {
      items.add(const _EmptyThread());
    }

    return ListView.separated(
      controller: _scroll,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(V6Space.gutter, 8, V6Space.gutter, 12),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) => items[i],
    );
  }

  Widget _composer(BuildContext context, EdgeInsets pad) {
    final busy = _turn.busy;
    return V6HelpTarget(
      id: 'claude.composer',
      child: Padding(
        padding: EdgeInsets.fromLTRB(V6Space.gutter, 8, V6Space.gutter,
            12 + (MediaQuery.viewInsetsOf(context).bottom > 0 ? 0 : pad.bottom)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          _MicButton(listening: _listening, onTap: () => unawaited(_micTap())),
          const SizedBox(width: 10),
          Expanded(
            child: V6TextField(
              controller: _draft,
              hint: _listening ? 'Listening…' : 'Message Lucille',
              label: null,
              maxLines: 4,
              maxLength: 2000,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.send,
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) => _submit(),
            ),
          ),
          const SizedBox(width: 10),
          _SendButton(enabled: _draft.text.trim().isNotEmpty && !busy, onTap: _submit),
        ]),
      ),
    );
  }
}

// ───────────────────────── header ─────────────────────────

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.orb, required this.level});
  final String? title;
  final V6OrbState orb;
  final double level;

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      final mood = s.currentMood;
      final sub = switch (orb) {
        V6OrbState.listening => 'Listening…',
        V6OrbState.thinking => 'Working on it…',
        V6OrbState.speaking => 'Speaking…',
        V6OrbState.idle => mood != null
            ? "Knows you're feeling ${moodOption(mood).label.toLowerCase()}"
            : 'Your AI companion',
      };
      return Row(children: [
        V6IconButton(
          icon: Icons.arrow_back_rounded,
          label: 'Back',
          onTap: () => v6LucilleLeave(context),
        ),
        const SizedBox(width: 12),
        // The orb carries in from the Lucille tab.
        V6MoodOrb(
          mood: mood ?? V6Mood.calm,
          size: 36,
          glow: true,
          state: orb,
          level: level,
          heroTag: V6LucilleHomeScreen.orbHeroTag,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              Flexible(
                child: Semantics(
                  header: true,
                  child: V6SmokeIn(
                    key: ValueKey('claude-title-${title ?? ''}'),
                    drift: 8,
                    child: V6Text(
                      title == null || title!.isEmpty ? 'Lucille' : title!,
                      size: 16,
                      weight: FontWeight.w600,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const V6AiBadge(),
            ]),
            Semantics(
              liveRegion: true,
              child: V6Fade(child: V6Text(sub, key: ValueKey(sub), size: 12, ink: V6Ink.faint, maxLines: 1)),
            ),
          ]),
        ),
        V6HelpButton(page: 'lucilleClaude'),
        const SizedBox(width: 4),
        V6IconButton(
          icon: Icons.forum_outlined,
          label: 'All threads',
          onTap: () => v6Open(context, V6Routes.claudeThreads),
        ),
      ]);
    });
  }
}

// ───────────────────────── messages ─────────────────────────

/// A saved message plus whatever came with it (status receipt, cards, AI notice).
class _MessageBlock extends StatelessWidget {
  const _MessageBlock({super.key, required this.message, required this.onApproval});
  final V6ClaudeMessage message;
  final void Function(String id, V6ClaudeApprovalState state) onApproval;

  @override
  Widget build(BuildContext context) {
    final m = message;
    final children = <Widget>[];
    if (m.fromLucille && m.statuses.isNotEmpty) {
      children.add(V6ClaudeStatusLine(statuses: m.statuses, active: false));
    }
    if (m.text.isNotEmpty) children.add(_Bubble(text: m.text, mine: !m.fromLucille, voice: m.voice));
    if (m.plan != null) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudePlanCard(plan: m.plan!));
    }
    for (final a in m.artifacts) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudeArtifactCard(artifact: a));
    }
    for (final a in m.approvals) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudeApprovalCard(
        approval: a,
        onAnswered: (state) => onApproval(a.id, state),
      ));
    }
    if (m.actions.isNotEmpty) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudeActionRow(actions: m.actions));
    }
    if (m.disclosure != null) {
      children.add(const SizedBox(height: 10));
      children.add(V6ClaudeInlineNotice(text: m.disclosure!));
    }
    return V6Rise(
      offset: 8,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
    );
  }
}

/// The turn that is streaming right now: the status line, then the bubble, then its cards.
class _LiveTurn extends StatelessWidget {
  const _LiveTurn({required this.state, required this.onApproval});
  final V6ClaudeTurnState state;
  final void Function(String id, V6ClaudeApprovalState state) onApproval;

  @override
  Widget build(BuildContext context) {
    final v = state;
    final children = <Widget>[];
    if (v.statuses.isNotEmpty) {
      children.add(V6HelpTarget(
        id: 'claude.status',
        child: V6ClaudeStatusLine(statuses: v.statuses, active: v.active),
      ));
    }
    if (v.text.isNotEmpty) {
      // Smoked ONCE when the bubble appears (keyed on the session, not the text), then the
      // deltas simply append — a smoke pass per token would read as a fault.
      children.add(V6SmokeIn(
        key: ValueKey('claude-live-${v.seq}'),
        drift: 10,
        child: Semantics(
          liveRegion: true,
          child: _Bubble(text: v.text, mine: false, voice: false),
        ),
      ));
    } else if (v.active && v.statuses.isEmpty) {
      children.add(const Align(alignment: Alignment.centerLeft, child: V6TypingDots()));
    }
    if (v.plan != null) {
      children.add(const SizedBox(height: 8));
      children.add(V6HelpTarget(id: 'claude.plans', child: V6ClaudePlanCard(plan: v.plan!)));
    }
    for (final a in v.artifacts) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudeArtifactCard(artifact: a));
    }
    for (final a in v.approvals) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudeApprovalCard(
        approval: a,
        onAnswered: (s) => onApproval(a.id, s),
      ));
    }
    if (v.actions.isNotEmpty) {
      children.add(const SizedBox(height: 8));
      children.add(V6ClaudeActionRow(actions: v.actions));
    }
    if (v.disclosure != null) {
      children.add(const SizedBox(height: 10));
      children.add(V6ClaudeInlineNotice(text: v.disclosure!));
    }
    if (children.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children);
  }
}

/// A chat bubble: Lucille on the left in glass, the user on the right in ink (same geometry as
/// the existing chat so switching editions doesn't move anything).
class _Bubble extends StatelessWidget {
  const _Bubble({required this.text, required this.mine, required this.voice});
  final String text;
  final bool mine;
  final bool voice;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomLeft: Radius.circular(mine ? 20 : 6),
      bottomRight: Radius.circular(mine ? 6 : 20),
    );
    final body = Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (voice) ...[
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Icon(Icons.graphic_eq_rounded, size: 14, color: (mine ? p.onInk : p.ink).withOpacity(0.7)),
        ),
        const SizedBox(width: 8),
      ],
      Flexible(child: Text(text, style: V6Type.body(15, mine ? p.onInk : p.ink))),
    ]);
    final bubble = mine
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: p.ink, borderRadius: radius),
            child: body,
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
              child: body,
            ),
          );
    return Semantics(
      label: mine ? (voice ? 'You said, by voice' : 'You said') : 'Lucille said',
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

/// The periodic AI disclosure, in the server's own words, as a quiet inline notice.
class V6ClaudeInlineNotice extends StatelessWidget {
  const V6ClaudeInlineNotice({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      container: true,
      label: text,
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
              Expanded(child: V6Text(text, size: 12, ink: V6Ink.muted, height: 1.4)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// A brand-new thread: Lucille's own opening line is never faked, so this is just an invitation.
class _EmptyThread extends StatelessWidget {
  const _EmptyThread();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Column(children: [
          V6SmokeIn(
            child: V6Display(
              'What do you need\nright now?',
              size: 26,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          const V6Text(
            'Type it, or hold the mic and say it. She remembers what you told her before.',
            size: 13,
            ink: V6Ink.muted,
            align: TextAlign.center,
          ),
        ]),
      );
}

// ───────────────────────── composer parts ─────────────────────────

class _NoticeRow extends StatelessWidget {
  const _NoticeRow({required this.notice, required this.onDismiss});
  final _Notice notice;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final text = switch (notice) {
      _Notice.micDenied => 'Microphone access is off. You can still type.',
      _Notice.micUnavailable => "Voice isn't available on this device. You can still type.",
      _Notice.notHeard => "I didn't catch that. Try again, or type it.",
      _Notice.none => '',
    };
    if (text.isEmpty) return const SizedBox.shrink();
    return Semantics(
      liveRegion: true,
      child: V6Pressable(
        onTap: onDismiss,
        haptic: false,
        semanticLabel: '$text Tap to dismiss.',
        child: ExcludeSemantics(
          child: Row(children: [
            Icon(Icons.info_outline_rounded, size: 14, color: V6Theme.of(context).inkFaint),
            const SizedBox(width: 6),
            Expanded(child: V6Text(text, size: 12, ink: V6Ink.faint, maxLines: 2)),
          ]),
        ),
      ),
    );
  }
}

class _MicButton extends StatelessWidget {
  const _MicButton({required this.listening, required this.onTap});
  final bool listening;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: V6Pressable(
        onTap: onTap,
        semanticLabel: listening ? 'Stop recording and send' : 'Record a voice message',
        scale: 0.92,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: listening ? p.accent.withOpacity(0.9) : p.glass[1],
            border: Border.all(color: listening ? Colors.transparent : p.glassBorder),
          ),
          child: Icon(
            listening ? Icons.stop_rounded : Icons.mic_none_rounded,
            size: 22,
            color: listening ? p.onInk : p.ink,
          ),
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.enabled, required this.onTap});
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: V6Pressable(
        onTap: enabled ? onTap : null,
        semanticLabel: 'Send',
        scale: 0.92,
        child: AnimatedOpacity(
          duration: V6Motion.quick,
          opacity: enabled ? 1 : 0.35,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle, color: p.ink),
            child: Icon(Icons.arrow_upward_rounded, size: 22, color: p.onInk),
          ),
        ),
      ),
    );
  }
}
