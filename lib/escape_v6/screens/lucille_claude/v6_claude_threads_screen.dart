// Escape v6 — Lucille (Claude edition): the thread list.
//
// Duet's channels: separate threads for separate things, all sharing the same memory (the memory
// is server-side and shared with the OpenAI edition, so a new thread never starts from nothing).
// Each row shows the title, the last line and when it was last touched.
import 'dart:async';

import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_claude_brief.dart';
import 'v6_claude_threads.dart';

class V6ClaudeThreadsScreen extends StatefulWidget {
  const V6ClaudeThreadsScreen({super.key});

  @override
  State<V6ClaudeThreadsScreen> createState() => _V6ClaudeThreadsScreenState();
}

class _V6ClaudeThreadsScreenState extends State<V6ClaudeThreadsScreen> {
  final _logs = V6ClaudeThreads.instance;

  @override
  void initState() {
    super.initState();
    _logs.addListener(_onLogs);
    // Only reachable with the Claude edition on (see V6Store.v6ClaudeEdition).
    if (!V6Store.instance.v6ClaudeEdition) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) Navigator.of(context).maybePop();
      });
      return;
    }
    unawaited(_logs.load());
  }

  @override
  void dispose() {
    _logs.removeListener(_onLogs);
    super.dispose();
  }

  void _onLogs() {
    if (mounted) setState(() {});
  }

  Future<void> _newThread() async {
    final t = _logs.create();
    if (!mounted) return;
    await v6Open(context, '${V6Routes.claudeThread}?threadId=${Uri.encodeQueryComponent(t.id)}');
  }

  Future<void> _confirmDelete(V6ClaudeThread t) async {
    final yes = await showV6Sheet<bool>(
      context,
      title: 'Delete this thread?',
      builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        V6Text(
          'This removes "${t.displayTitle}" from this phone. What Lucille remembers about you is '
          'separate — you can review and delete that under Privacy & data.',
          size: 14,
          ink: V6Ink.muted,
        ),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(
            child: V6GhostPill(label: 'Keep it', onTap: () => Navigator.of(ctx).pop(false)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: V6PrimaryPill(label: 'Delete', onTap: () => Navigator.of(ctx).pop(true)),
          ),
        ]),
        const SizedBox(height: 8),
      ]),
    );
    if (yes != true || !mounted) return;
    _logs.remove(t.id);
  }

  @override
  Widget build(BuildContext context) {
    final threads = _logs.byRecency;
    return V6Page(
      child: V6ScrollPage(
        withNav: false,
        gap: 12,
        children: [
          V6TopBar(
            title: 'Threads',
            subtitle: 'Separate topics, one memory',
            actions: [
              V6IconButton(
                icon: Icons.add_rounded,
                label: 'New thread',
                onTap: () => unawaited(_newThread()),
              ),
            ],
          ),
          const V6ClaudeBriefCard(),
          if (!_logs.loaded)
            const SizedBox(height: 40)
          else if (threads.isEmpty)
            const _NoThreads()
          else
            for (final t in threads)
              _ThreadRow(
                thread: t,
                onOpen: () => v6Open(
                  context,
                  '${V6Routes.claudeThread}?threadId=${Uri.encodeQueryComponent(t.id)}',
                ),
                onDelete: () => unawaited(_confirmDelete(t)),
              ),
          if (_logs.loaded)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: V6PrimaryPill(
                label: 'New thread',
                icon: Icons.add_rounded,
                onTap: () => unawaited(_newThread()),
              ),
            ),
        ],
      ),
    );
  }
}

class _ThreadRow extends StatelessWidget {
  const _ThreadRow({required this.thread, required this.onOpen, required this.onDelete});
  final V6ClaudeThread thread;
  final VoidCallback onOpen;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final preview = thread.preview;
    final when = v6ClaudeWhen(thread.updatedAt);
    return V6Glass(
      padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
      onTap: onOpen,
      semanticLabel: '${thread.displayTitle}. $preview. $when',
      child: Row(children: [
        Expanded(
          child: ExcludeSemantics(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(child: V6Text(thread.displayTitle, size: 15, weight: FontWeight.w600, maxLines: 1)),
                const SizedBox(width: 8),
                V6Text(when, size: 11, ink: V6Ink.faint, maxLines: 1),
              ]),
              if (preview.isNotEmpty) ...[
                const SizedBox(height: 3),
                V6Text(preview, size: 13, ink: V6Ink.muted, maxLines: 1),
              ],
            ]),
          ),
        ),
        V6IconButton(
          icon: Icons.delete_outline_rounded,
          label: 'Delete ${thread.displayTitle}',
          size: V6Space.minTarget,
          onTap: onDelete,
          child: Icon(Icons.delete_outline_rounded, size: 18, color: p.inkFaint),
        ),
      ]),
    );
  }
}

class _NoThreads extends StatelessWidget {
  const _NoThreads();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Column(children: [
          V6Text(
            'No threads yet.',
            size: 15,
            weight: FontWeight.w600,
            align: TextAlign.center,
          ),
          const SizedBox(height: 6),
          const V6Text(
            'Start one for anything on your mind — sleep, a hard week, a plan. '
            'Lucille carries what she already knows into every thread.',
            size: 13,
            ink: V6Ink.muted,
            align: TextAlign.center,
          ),
        ]),
      );
}
