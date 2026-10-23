// Escape v6 — Lucille tab (Figma Make: Lucille.tsx LucilleHome). TAB BODY: no Scaffold.
//
// One big live orb (today's mood), a plain AI disclosure, and two equal choices: talk or type.
// The orb flies into the voice page (Hero 'lucille-voice-orb').
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import '../lucille_claude/v6_claude_threads.dart';
import 'v6_lucille_parts.dart';

class V6LucilleHomeScreen extends StatelessWidget {
  const V6LucilleHomeScreen({super.key});

  static const orbHeroTag = 'lucille-voice-orb';

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      V6Watch(builder: (context, s) {
        final name = s.firstName;
        final lastLucille = s.lucilleMessages.reversed.where((m) => m.fromLucille).v6First;
        final hasConversation = s.lucilleMessages.where((m) => !m.fromLucille).isNotEmpty;
        return V6ScrollPage(gap: 22, children: [
          const V6TopBar(
            noBack: true,
            title: 'Lucille',
            actions: [V6HelpButton(page: 'lucille')],
          ),
          // Orb + greeting.
          Column(children: [
            const SizedBox(height: 4),
            V6MoodOrb(
              mood: s.currentMood ?? V6Mood.calm,
              size: 150,
              glow: true,
              live: true,
              heroTag: orbHeroTag,
              onTap: () => v6Open(context, V6Routes.lucilleVoice),
              semanticLabel: 'Start a voice chat with Lucille',
            ),
            const SizedBox(height: 18),
            Semantics(
              header: true,
              child: V6SmokeIn(
                child: V6Display(
                  name.isEmpty ? 'What do you need\nright now?' : 'What do you need\nright now, $name?',
                  size: 30,
                  align: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              V6AiBadge(),
              SizedBox(width: 8),
              Flexible(
                child: V6Text(
                  "An AI companion, not a person or a licensed therapist. She can't diagnose or treat conditions.",
                  size: 13,
                  ink: V6Ink.muted,
                  align: TextAlign.center,
                ),
              ),
            ]),
          ]),
          // Talk or type.
          V6HelpTarget(
            id: 'lucille.modes',
            child: Row(children: [
              Expanded(
                child: _ModeCard(
                  title: 'Voice chat',
                  subtitle: 'Talk it out loud',
                  icon: Icons.mic_none_rounded,
                  filled: true,
                  onTap: () => v6Open(context, V6Routes.lucilleVoice),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _ModeCard(
                  title: 'Text chat',
                  subtitle: "When you can't speak",
                  icon: Icons.chat_bubble_outline_rounded,
                  filled: false,
                  onTap: () => v6Open(context, V6Routes.lucilleText),
                ),
              ),
            ]),
          ),
          if (s.v6ClaudeEdition) _ClaudeContinueCard() else if (hasConversation && lastLucille != null)
            V6Glass(
              padding: const EdgeInsets.all(18),
              onTap: () => v6Open(context, V6Routes.lucilleText),
              semanticLabel: 'Continue where you left off',
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const V6Eyebrow('Continue where you left off', ink: V6Ink.faint),
                const SizedBox(height: 8),
                V6Text(lastLucille.text, maxLines: 2),
              ]),
            ),
          // Quick prompts.
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const V6Eyebrow('Or start with'),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final p in kV6LucillePrompts)
                V6Chip(
                  label: p,
                  onTap: () => v6Open(context, '${V6Routes.lucilleText}?seed=${Uri.encodeQueryComponent(p)}'),
                ),
            ]),
          ]),
          // Shortcuts.
          V6Glass(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            child: Column(children: [
              V6Row(
                leading: const V6IconBadge(icon: Icons.auto_awesome_rounded),
                title: 'Mood Scan',
                subtitle: 'A guided check-in of mood & energy',
                onTap: () => v6Open(context, 'moodScan'),
              ),
              Divider(height: 1, color: V6Theme.of(context).glassBorder),
              V6Row(
                leading: const V6IconBadge(icon: Icons.edit_note_rounded),
                title: 'Voice journal',
                subtitle: 'Speak, and Lucille writes it down',
                onTap: () => v6Open(context, 'journal'),
              ),
            ]),
          ),
          Center(
            child: V6Pressable(
              onTap: () => v6Open(context, V6Routes.privacy),
              semanticLabel: 'What Lucille remembers, and how to delete it',
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: V6Space.minTarget),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.shield_outlined, size: 15, color: V6Theme.of(context).inkFaint),
                  const SizedBox(width: 8),
                  const Flexible(
                    child: V6Text('What Lucille remembers, and how to delete it', size: 12, ink: V6Ink.faint),
                  ),
                ]),
              ),
            ),
          ),
        ]);
      }),
      const V6AutoHelp(page: 'lucille'),
    ]);
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Glass(
      padding: const EdgeInsets.all(18),
      radius: 24,
      onTap: onTap,
      semanticLabel: '$title. $subtitle',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? p.ink : p.accentSoft.withOpacity(0.3),
            border: filled ? null : Border.all(color: p.glassBorder),
          ),
          child: Icon(icon, size: 22, color: filled ? p.onInk : p.ink),
        ),
        const SizedBox(height: 18),
        V6Text(title, size: 16, weight: FontWeight.w600),
        V6Text(subtitle, size: 12, ink: V6Ink.faint, maxLines: 1),
      ]),
    );
  }
}

/// "Continue where you left off" that reads Claude threads instead of the OpenAI message log.
class _ClaudeContinueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logs = V6ClaudeThreads.instance;
    if (!logs.loaded || logs.threads.isEmpty) return const SizedBox.shrink();
    final recent = logs.byRecency.first;
    final preview = recent.preview;
    if (preview.isEmpty) return const SizedBox.shrink();
    return V6Glass(
      padding: const EdgeInsets.all(18),
      onTap: () => v6Open(context, '${V6Routes.claudeThread}?threadId=${recent.id}'),
      semanticLabel: 'Continue where you left off',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const V6Eyebrow('Continue where you left off', ink: V6Ink.faint),
        const SizedBox(height: 8),
        V6Text(preview, maxLines: 2),
      ]),
    );
  }
}
