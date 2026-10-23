// Escape v6 — export a plan (`POST /v2/plans/{id}/document`).
//
// Pick a format and what goes in it, the server renders the file (ReportLab PDF, Markdown or
// Word, with the same charts embedded), and the phone downloads it and hands it to the OS.
//
// Sharing: this app has no `share_plus`, and the brief says not to add packages. So the file is
// downloaded into the app's documents directory and handed to the OS with `url_launcher` —
// `Uri.file(...)` first (the system preview sheet, which carries its own Share / Save As), and
// the signed https URL as the fallback when the platform will not open a file URI. Everything is
// honest about what happened: no "shared!" message unless the OS actually took it.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '/escape_v6/v6.dart';
import 'v6_plans_api.dart';

/// Opens the export sheet for [plan].
Future<void> showV6PlanDocumentSheet(BuildContext context, V6Plan plan) =>
    showV6Sheet<void>(context, title: 'Export your plan', builder: (ctx) => _DocumentBody(plan: plan));

enum _Phase { choosing, making, downloading, ready, failed }

const _formats = [
  ('pdf', 'PDF', 'Reads well anywhere', Icons.picture_as_pdf_rounded),
  ('md', 'Markdown', 'Plain text, easy to paste', Icons.notes_rounded),
  ('docx', 'Word', 'Edit it yourself', Icons.description_rounded),
];

const _sections = [
  ('schedule', 'The schedule', 'Every day and every step'),
  ('progress', 'How it is going', 'Your real adherence and mood, with the charts'),
  ('notes', 'Why this plan', "Lucille's reasons, and your own note"),
];

class _DocumentBody extends StatefulWidget {
  const _DocumentBody({required this.plan});
  final V6Plan plan;

  @override
  State<_DocumentBody> createState() => _DocumentBodyState();
}

class _DocumentBodyState extends State<_DocumentBody> {
  String _format = 'pdf';
  final _include = <String>{'schedule', 'progress', 'notes'};
  _Phase _phase = _Phase.choosing;
  String? _error;
  V6PlanDocument? _doc;
  File? _file;
  int _received = 0;
  int? _total;
  bool _opening = false;
  String? _openNote;

  bool get _canMake => _include.isNotEmpty && V6PlansApi.claudeEdition != false;

  Future<void> _make() async {
    if (!_canMake) return;
    HapticFeedback.selectionClick();
    setState(() {
      _phase = _Phase.making;
      _error = null;
      _doc = null;
      _file = null;
      _received = 0;
      _total = null;
      _openNote = null;
    });
    final res = await V6PlansApi.document(
      planId: widget.plan.id,
      format: _format,
      include: _sections.map((sec) => sec.$1).where(_include.contains).toList(),
    );
    if (!mounted) return;
    final doc = res.document;
    if (!res.ok || doc == null) {
      setState(() {
        _phase = _Phase.failed;
        _error = res.error ?? 'The file could not be made.';
      });
      return;
    }
    setState(() {
      _doc = doc;
      _phase = _Phase.downloading;
      _total = doc.bytes > 0 ? doc.bytes : null;
    });
    final file = await V6PlansApi.downloadDocument(
      doc,
      onProgress: (received, total) {
        if (!mounted) return;
        setState(() {
          _received = received;
          _total = total ?? _total;
        });
      },
    );
    if (!mounted) return;
    if (file == null) {
      setState(() {
        _phase = _Phase.failed;
        _error = 'The file was made but would not download. Try again?';
      });
      return;
    }
    HapticFeedback.lightImpact();
    setState(() {
      _file = file;
      _phase = _Phase.ready;
    });
  }

  /// Hands the file to the OS. The system sheet is where sharing and saving happen.
  Future<void> _open() async {
    final file = _file;
    final doc = _doc;
    if (_opening || (file == null && doc == null)) return;
    setState(() {
      _opening = true;
      _openNote = null;
    });
    var ok = false;
    if (file != null) {
      try {
        ok = await launchUrl(Uri.file(file.path), mode: LaunchMode.externalApplication);
      } catch (_) {
        ok = false;
      }
    }
    if (!ok && doc != null && !doc.needsAuth) {
      try {
        final uri = Uri.tryParse(doc.url);
        if (uri != null) ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (_) {
        ok = false;
      }
    }
    if (!mounted) return;
    setState(() {
      _opening = false;
      _openNote = ok
          ? null
          : 'Nothing on this phone offered to open a ${_format.toUpperCase()}. '
              'It is saved in Escape, under ${_shortPath(file)}.';
    });
  }

  static String _shortPath(File? f) {
    if (f == null) return 'your documents';
    final parts = f.path.split('/');
    return parts.isEmpty ? f.path : parts.last;
  }

  @override
  Widget build(BuildContext context) {
    final catalogOnly = V6PlansApi.claudeEdition == false;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (catalogOnly) ...[
        V6Text(
          'Plan documents come from the new plans service, which is off on this build. '
          'Your plan is still here, and nothing about it leaves the app.',
          ink: V6Ink.muted,
        ),
        const SizedBox(height: 18),
        V6GhostPill(label: 'Close', onTap: () => Navigator.of(context).maybePop()),
      ] else ...[
        const V6Eyebrow('Format'),
        const SizedBox(height: 10),
        for (final f in _formats) ...[
          _FormatRow(
            label: f.$2,
            detail: f.$3,
            icon: f.$4,
            selected: _format == f.$1,
            onTap: _phase == _Phase.making || _phase == _Phase.downloading
                ? null
                : () => setState(() {
                      _format = f.$1;
                      if (_phase == _Phase.ready || _phase == _Phase.failed) {
                        _phase = _Phase.choosing;
                      }
                    }),
          ),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 10),
        const V6Eyebrow('What goes in it'),
        const SizedBox(height: 4),
        for (final sec in _sections)
          V6Row(
            title: sec.$2,
            subtitle: sec.$3,
            trailing: V6Toggle(
              on: _include.contains(sec.$1),
              label: sec.$2,
              onChanged: (on) => setState(() {
                if (on) {
                  _include.add(sec.$1);
                } else {
                  _include.remove(sec.$1);
                }
                if (_phase == _Phase.ready || _phase == _Phase.failed) _phase = _Phase.choosing;
              }),
            ),
          ),
        if (_include.isEmpty)
          Semantics(
            liveRegion: true,
            child: const V6Text('Pick at least one thing to include.', size: 13, ink: V6Ink.accent),
          ),
        const SizedBox(height: 10),
        _Status(
          phase: _phase,
          format: _format,
          received: _received,
          total: _total,
          error: _error,
          openNote: _openNote,
          filename: _shortPath(_file),
        ),
        const SizedBox(height: 18),
        if (_phase == _Phase.ready)
          V6PrimaryPill(
            label: 'Open or share it',
            icon: Icons.ios_share_rounded,
            loading: _opening,
            onTap: _open,
          )
        else
          V6PrimaryPill(
            label: _phase == _Phase.failed ? 'Try again' : 'Make the file',
            icon: Icons.file_download_outlined,
            loading: _phase == _Phase.making || _phase == _Phase.downloading,
            onTap: _canMake ? _make : null,
          ),
        const SizedBox(height: 10),
        V6Text(
          'The file is made for you and kept behind a private link for 24 hours. '
          'Nothing about your plan is public.',
          size: 12,
          ink: V6Ink.faint,
          align: TextAlign.center,
        ),
      ],
    ]);
  }
}

class _FormatRow extends StatelessWidget {
  const _FormatRow({
    required this.label,
    required this.detail,
    required this.icon,
    required this.selected,
    this.onTap,
  });
  final String label;
  final String detail;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      selected: selected,
      child: V6Pressable(
        onTap: onTap,
        semanticLabel: '$label. $detail',
        child: AnimatedContainer(
          duration: V6Motion.quick,
          constraints: const BoxConstraints(minHeight: V6Space.minTarget),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? p.accentSoft : p.glass[1],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: selected ? p.accent : p.glassBorder),
          ),
          child: Row(children: [
            Icon(icon, size: 20, color: selected ? p.accent : p.inkMuted),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                V6Text(label, size: 15, weight: FontWeight.w600),
                V6Text(detail, size: 12, ink: V6Ink.faint, maxLines: 1),
              ]),
            ),
            if (selected) Icon(Icons.check_rounded, size: 18, color: p.accent),
          ]),
        ),
      ),
    );
  }
}

/// The honest status line: what is happening now, with the real byte count while it downloads.
class _Status extends StatelessWidget {
  const _Status({
    required this.phase,
    required this.format,
    required this.received,
    required this.total,
    required this.error,
    required this.openNote,
    required this.filename,
  });

  final _Phase phase;
  final String format;
  final int received;
  final int? total;
  final String? error;
  final String? openNote;
  final String filename;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    Widget? body;
    if (phase == _Phase.making) {
      body = Column(key: const ValueKey('making'), crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          V6Text('Making your ${format.toUpperCase()}…', size: 13, ink: V6Ink.muted),
          const SizedBox(height: 8),
          // Indeterminate on purpose: the server has not told us how far along it is.
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              minHeight: 6,
              backgroundColor: p.glass[2],
              color: p.accent,
            ),
          ),
      ]);
    } else if (phase == _Phase.downloading) {
      final t = total;
      final frac = t == null || t <= 0 ? null : (received / t).clamp(0.0, 1.0);
      body = Column(key: const ValueKey('down'), crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          V6Text(
            t == null
                ? 'Downloading… ${v6Kb(received)}'
                : 'Downloading… ${v6Kb(received)} of ${v6Kb(t)}',
            size: 13,
            ink: V6Ink.muted,
          ),
          const SizedBox(height: 8),
          if (frac == null)
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                  minHeight: 6, backgroundColor: p.glass[2], color: p.accent),
            )
          else
            V6ProgressBar(value: frac, semanticLabel: 'Download progress'),
      ]);
    } else if (phase == _Phase.ready) {
      body = Column(key: const ValueKey('ready'), crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.check_circle_outline_rounded, size: 18, color: p.accent),
            const SizedBox(width: 8),
            Expanded(child: V6Text('Your ${format.toUpperCase()} is ready', weight: FontWeight.w600)),
          ]),
          const SizedBox(height: 4),
          V6Text(filename, size: 12, ink: V6Ink.faint, maxLines: 1),
          if (openNote != null) ...[
            const SizedBox(height: 6),
            V6Text(openNote!, size: 12, ink: V6Ink.muted),
          ],
      ]);
    } else if (phase == _Phase.failed) {
      body = Row(key: const ValueKey('failed'), crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(Icons.error_outline_rounded, size: 18, color: V6Brand.danger),
        const SizedBox(width: 8),
        Expanded(child: V6Text(error ?? 'That did not work.', size: 13, ink: V6Ink.muted)),
      ]);
    }
    return Semantics(
      liveRegion: true,
      child: V6Fade(child: body ?? const SizedBox(key: ValueKey('idle'), height: 0)),
    );
  }
}

/// "12 KB" / "1.4 MB" — only ever a real byte count.
String v6Kb(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).round()} KB';
  return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
}
