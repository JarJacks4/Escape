// Escape v6 — text chat with Lucille (Figma Make: Lucille.tsx LucilleText).
//
// Real replies only: every turn goes to the /chat pipeline (memory + server-side safety) via
// V6Api.chat. Before anything leaves the phone, detectDistress runs; a hit shows the safe reply
// and the urgent Support sheet and the message is NOT sent.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/custom_code/widgets/lucille_link_chips.dart' show LucilleLink, lucilleLinksFor;
import '/escape_v6/v6.dart';
import 'v6_lucille_home_screen.dart' show V6LucilleHomeScreen;
import 'v6_lucille_parts.dart';

class V6LucilleTextScreen extends StatefulWidget {
  const V6LucilleTextScreen({super.key, this.seed});

  /// A prompt handed over from another page; sent automatically once.
  final String? seed;

  @override
  State<V6LucilleTextScreen> createState() => _V6LucilleTextScreenState();
}

class _V6LucilleTextScreenState extends State<V6LucilleTextScreen> {
  final _draft = TextEditingController();
  final _scroll = ScrollController();
  final _player = V6LucillePlayer();
  bool _thinking = false;
  String? _failed; // text of a turn that couldn't reach Lucille (tap to retry)
  List<LucilleLink> _links = const [];
  int _lastCount = 0;
  bool _alive = true;
  BuildContext? _inner; // a context inside V6Page (live palette for sheets)
  BuildContext get _ctx => (_inner != null && _inner!.mounted) ? _inner! : context;

  V6Store get _s => V6Store.instance;

  @override
  void initState() {
    super.initState();
    _lastCount = _s.lucilleMessages.length;
    _s.addListener(_onStore);
    unawaited(V6SpeakReplies.load());
    final seed = (widget.seed?.trim().isNotEmpty ?? false) ? widget.seed!.trim() : _s.lucilleSeed;
    _s.lucilleSeed = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_alive) return;
      // Not in initState: it notifies the store, which must not happen during build.
      _s.startConversationIfNeeded();
      _toBottom(animate: false);
      if (seed != null && seed.trim().isNotEmpty) _send(seed);
    });
  }

  @override
  void dispose() {
    _alive = false;
    _s.removeListener(_onStore);
    _draft.dispose();
    _scroll.dispose();
    unawaited(_player.dispose());
    super.dispose();
  }

  void _onStore() {
    final n = _s.lucilleMessages.length;
    if (n != _lastCount) {
      _lastCount = n;
      WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
    }
  }

  void _toBottom({bool animate = true}) {
    // Post-frame callbacks can land after the page closed: never touch a dead context.
    if (!_alive || !mounted || !_scroll.hasClients) return;
    final end = _scroll.position.maxScrollExtent;
    final off = V6Store.instance.reduceMotion || (MediaQuery.maybeOf(context)?.disableAnimations ?? false);
    if (!animate || off) {
      _scroll.jumpTo(end);
    } else {
      _scroll.animateTo(end, duration: const Duration(milliseconds: 360), curve: V6Motion.ease);
    }
  }

  Future<void> _send(String raw, {bool retry = false}) async {
    final text = raw.trim();
    if (text.isEmpty || _thinking) return;
    if (!retry) _s.pushLucille(text, fromLucille: false);
    setState(() {
      _failed = null;
      _links = const [];
    });

    // Safety first: nothing distressing leaves the phone.
    if (detectDistress(text)) {
      _s.pushLucille(kDistressReply, fromLucille: true);
      setState(() => _links = const []);
      unawaited(showV6Support(_ctx, V6SupportLevel.urgent));
      return;
    }

    setState(() => _thinking = true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
    final r = await V6Api.chat(text);
    if (!_alive) return;
    final reply = r.ok ? (r.map['response']?.toString().trim() ?? '') : '';
    if (reply.isEmpty) {
      setState(() {
        _thinking = false;
        _failed = text;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _toBottom());
      return;
    }
    _s.pushLucille(reply, fromLucille: true);
    setState(() {
      _thinking = false;
      _links = lucilleLinksFor(text, reply: reply);
    });
    if (V6SpeakReplies.value.value) unawaited(_player.speak(reply));
  }

  void _submit() {
    final t = _draft.text;
    if (t.trim().isEmpty || _thinking) return;
    _draft.clear();
    setState(() {});
    _send(t);
  }

  void _toVoice() {
    unawaited(_player.stop());
    GoRouter.of(context).pushReplacementNamed(V6Routes.lucilleVoice);
  }

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return V6Page(
      child: Column(children: [
        SizedBox(height: pad.top + 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(V6Space.gutter, 0, V6Space.gutter, 8),
          child: _Header(thinking: _thinking, onVoice: _toVoice),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.translucent,
            child: V6Watch(builder: (context, s) {
              _inner = context;
              final msgs = s.lucilleMessages;
              final items = <Widget>[];
              for (var i = 0; i < msgs.length; i++) {
                final m = msgs[i];
                if (m.aiNotice) items.add(const V6AiNotice());
                final bubble = V6Rise(key: ValueKey(m.id), offset: 8, child: V6ChatBubble(message: m));
                // Only Lucille's newest reply is announced; the whole log is not re-read on each turn.
                items.add(i == msgs.length - 1 && m.fromLucille ? Semantics(liveRegion: true, child: bubble) : bubble);
              }
              if (_thinking) items.add(const V6TypingDots());
              if (_failed != null) {
                items.add(Align(
                  alignment: Alignment.centerLeft,
                  child: V6Link(
                    label: "Couldn't reach Lucille. Tap to try again.",
                    onTap: () => _send(_failed!, retry: true),
                  ),
                ));
              }
              return Semantics(
                container: true,
                label: 'Conversation with Lucille',
                child: ListView.separated(
                  controller: _scroll,
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(V6Space.gutter, 8, V6Space.gutter, 12),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => items[i],
                ),
              );
            }),
          ),
        ),
        V6Watch(builder: (context, s) {
          final onlyGreeting = s.lucilleMessages.where((m) => !m.fromLucille).isEmpty;
          if (_thinking) return const SizedBox.shrink();
          if (onlyGreeting) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: V6Space.gutter),
                child: Row(children: [
                  for (var i = 0; i < kV6LucillePrompts.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    V6Chip(label: kV6LucillePrompts[i], onTap: () => _send(kV6LucillePrompts[i])),
                  ],
                ]),
              ),
            );
          }
          return V6Fade(
            child: Padding(
              key: ValueKey(_links.map((l) => l.id).join(',')),
              padding: EdgeInsets.only(bottom: _links.isEmpty ? 0 : 4),
              child: V6LucilleLinkRow(links: _links),
            ),
          );
        }),
        Padding(
          padding: EdgeInsets.fromLTRB(
              V6Space.gutter, 8, V6Space.gutter, 12 + (MediaQuery.viewInsetsOf(context).bottom > 0 ? 0 : pad.bottom)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(
              child: V6TextField(
                controller: _draft,
                hint: 'Message Lucille',
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
            _SendButton(enabled: _draft.text.trim().isNotEmpty && !_thinking, onTap: _submit),
          ]),
        ),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.thinking, required this.onVoice});
  final bool thinking;
  final VoidCallback onVoice;

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      final mood = s.currentMood;
      final status = thinking
          ? 'typing…'
          : mood != null
              ? "Knows you're feeling ${moodOption(mood).label.toLowerCase()}"
              : 'Your AI companion';
      return Row(children: [
        V6IconButton(icon: Icons.arrow_back_rounded, label: 'Back', onTap: () => v6LucilleLeave(context)),
        const SizedBox(width: 12),
        // Same orb as the Lucille tab / voice page: it shrinks into the header (Hero).
        V6MoodOrb(mood: mood ?? V6Mood.calm, size: 36, glow: true, heroTag: V6LucilleHomeScreen.orbHeroTag),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              Semantics(header: true, child: const V6Text('Lucille', size: 16, weight: FontWeight.w600)),
              const SizedBox(width: 6),
              const V6AiBadge(),
            ]),
            Semantics(
              liveRegion: true,
              child: V6Fade(child: V6Text(status, key: ValueKey(status), size: 12, ink: V6Ink.faint, maxLines: 1)),
            ),
          ]),
        ),
        V6IconButton(icon: Icons.mic_none_rounded, label: 'Switch to voice', onTap: onVoice),
      ]);
    });
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
