// Escape v6 — Privacy & data (Figma Make: Profile.tsx PrivacyData) on the real /v1/privacy API:
//   GET  /v1/privacy/consents      {flags: {purpose: bool}, restricted, policyVersion, history}
//   GET  /v1/privacy/purposes      {purposes: [{key, label}]}
//   PUT  /v1/privacy/consents      {flags: {purpose: bool}}
//   GET  /v1/privacy/export        everything as JSON
//   DELETE /v1/privacy/data?scope= mood | journal | soundscapes | plans | all
//   POST /v1/privacy/delete-account {confirm: 'DELETE'}
//   GET  /v1/privacy/disclosure    {ai, notTherapy, stores, …}
import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/escape_v6/v6.dart';
import 'v6_profile_parts.dart';

class V6PrivacyScreen extends StatefulWidget {
  const V6PrivacyScreen({super.key});

  @override
  State<V6PrivacyScreen> createState() => _V6PrivacyScreenState();
}

class _V6PrivacyScreenState extends State<V6PrivacyScreen> {
  bool _loading = true;
  bool _offline = false;
  Map<String, bool> _flags = {};
  Map<String, String> _labels = {};
  final Set<String> _busy = {};
  String? _aiText;
  String? _notTherapy;
  bool _exporting = false;
  bool _deletingAccount = false;

  /// A context inside V6Page (so sheets and snacks get the live palette).
  BuildContext? _inner;
  BuildContext get _ctx => (_inner != null && _inner!.mounted) ? _inner! : context;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final results = await Future.wait([
      V6Api.consents(),
      V6Api.call('GET', '/v1/privacy/purposes'),
      V6Api.call('GET', '/v1/privacy/disclosure'),
    ]);
    if (!mounted) return;
    final c = results[0];
    final purposes = results[1];
    final disc = results[2];
    setState(() {
      _loading = false;
      _offline = !c.ok;
      final f = c.map['flags'];
      if (f is Map) _flags = f.map((k, v) => MapEntry(k.toString(), v == true));
      final list = purposes.map['purposes'];
      if (list is List) {
        _labels = {
          for (final p in list.whereType<Map>()) p['key'].toString(): (p['label'] ?? p['key']).toString(),
        };
      }
      if (disc.ok) {
        _aiText = disc.map['ai']?.toString();
        _notTherapy = disc.map['notTherapy']?.toString();
      }
    });
  }

  Future<void> _toggleConsent(String purpose, bool on) async {
    final before = _flags[purpose] ?? false;
    setState(() {
      _flags[purpose] = on;
      _busy.add(purpose);
    });
    final r = await V6Api.setConsent(purpose, on);
    if (!mounted) return;
    setState(() {
      _busy.remove(purpose);
      final f = r.map['flags'];
      if (r.ok && f is Map) {
        _flags = f.map((k, v) => MapEntry(k.toString(), v == true));
      } else if (!r.ok) {
        _flags[purpose] = before;
      }
    });
    if (!r.ok) v6Snack(_ctx, "Couldn't save that change. Check your connection and try again.");
  }

  Future<void> _export() async {
    setState(() => _exporting = true);
    final r = await V6Api.exportData();
    if (!mounted) return;
    setState(() => _exporting = false);
    if (!r.ok || r.data == null) {
      v6Snack(_ctx, "Couldn't prepare your export. Try again in a moment.");
      return;
    }
    final json = const JsonEncoder.withIndent('  ').convert(r.data);
    final bytes = utf8.encode(json).length;
    final sections = <String>[];
    final escape = r.map['escape'];
    if (escape is Map) sections.addAll(escape.keys.map((k) => k.toString()));
    if (r.map['lucilleLegacy'] is Map && (r.map['lucilleLegacy'] as Map)['error'] == null) {
      sections.add('Lucille conversations & memory');
    }
    // Nothing is put on the clipboard unless the user asks (other apps can read it).
    await showV6Sheet<void>(
      _ctx,
      title: 'Your data',
      builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        V6Text('Your export is ready: ${_size(bytes)} of JSON. Save it as a file, or copy it to paste into a note.',
            ink: V6Ink.muted),
        const SizedBox(height: 16),
        if (sections.isNotEmpty) ...[
          const V6Eyebrow('Includes'),
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final s in sections) V6Chip(label: _pretty(s)),
          ]),
          const SizedBox(height: 20),
        ],
        V6PrimaryPill(
          label: 'Save as a file',
          icon: Icons.download_rounded,
          onTap: () async {
            final nav = Navigator.of(ctx);
            final saved = await _saveFile(json);
            if (!mounted) return;
            if (saved == true) {
              nav.pop();
              v6Snack(_ctx, 'Saved your data.');
            } else if (saved == null) {
              v6Snack(_ctx, "Couldn't save a file here. Try Copy instead.");
            }
          },
        ),
        const SizedBox(height: 10),
        V6GhostPill(
          label: 'Copy to clipboard',
          icon: Icons.copy_rounded,
          onTap: () async {
            final nav = Navigator.of(ctx);
            await Clipboard.setData(ClipboardData(text: json));
            if (!mounted) return;
            nav.pop();
            v6Snack(_ctx, 'Copied. Paste it somewhere safe, then clear your clipboard.');
          },
        ),
      ]),
    );
  }

  /// true = saved, false = the user cancelled the picker, null = saving isn't possible here.
  Future<bool?> _saveFile(String json) async {
    try {
      final d = DateTime.now();
      final stamp = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
      final path = await FilePicker.platform.saveFile(
        dialogTitle: 'Save your Escape data',
        fileName: 'escape-data-$stamp.json',
        type: FileType.custom,
        allowedExtensions: const ['json'],
        bytes: Uint8List.fromList(utf8.encode(json)),
      );
      return path != null;
    } catch (e) {
      debugPrint('V6 privacy export save: $e');
      return null;
    }
  }

  static String _size(int b) {
    if (b < 1024) return '$b bytes';
    if (b < 1024 * 1024) return '${(b / 1024).toStringAsFixed(1)} KB';
    return '${(b / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  static String _pretty(String key) {
    final spaced = key.replaceAll('_', ' ');
    return spaced.isEmpty ? key : spaced[0].toUpperCase() + spaced.substring(1);
  }

  Future<void> _deleteConversations() async {
    final yes = await showV6Confirm(
      _ctx,
      title: 'Clear conversations?',
      body: 'This clears your chat with Lucille on this phone and starts a fresh session. '
          "Lucille's long-term memory is erased when you delete your account.",
      confirmLabel: 'Clear conversations',
      cancelLabel: 'Keep them',
      safeFirst: true,
    );
    if (!yes || !mounted) return;
    V6Store.instance.clearLucille();
    v6Snack(_ctx, 'Conversations cleared.');
  }

  Future<void> _deleteScope(String scope, String what) async {
    if (_busy.contains('scope:$scope')) return; // already deleting (double tap)
    final yes = await showV6Confirm(
      _ctx,
      title: 'Delete $what?',
      body: 'This permanently erases your $what from Escape. It can\'t be undone. '
          'You can download a copy first.',
      confirmLabel: 'Delete $what',
      cancelLabel: 'Keep it',
      safeFirst: true,
    );
    if (!yes || !mounted) return;
    setState(() => _busy.add('scope:$scope'));
    final r = await V6Api.deleteData(scope);
    if (!mounted) return;
    setState(() => _busy.remove('scope:$scope'));
    if (r.ok) {
      if (scope == 'mood') {
        V6Store.instance.checkIn = const V6CheckIn();
        V6Store.instance.updateProfile((_) {}); // notify + save
      }
      v6Snack(_ctx, '${what[0].toUpperCase()}${what.substring(1)} deleted.');
    } else {
      v6Snack(_ctx, "Couldn't delete right now. Check your connection and try again.");
    }
  }

  Future<void> _deleteAccount() async {
    final yes = await showV6Confirm(
      _ctx,
      title: 'Delete your account?',
      body: 'Your check-ins, journal, conversations, progress, coins and account will be permanently '
          "erased. This can't be undone. You can download a copy of your data first.",
      confirmLabel: 'Delete permanently',
      cancelLabel: 'Keep my account',
      safeFirst: true,
    );
    if (!yes || !mounted) return;
    setState(() => _deletingAccount = true);
    final r = await V6Api.call('POST', '/v1/privacy/delete-account', {'confirm': 'DELETE'});
    if (!mounted) return;
    if (!r.ok) {
      setState(() => _deletingAccount = false);
      v6Snack(_ctx, "Couldn't delete your account right now. Nothing was removed. Please try again.");
      return;
    }
    await V6Store.instance.deleteLocalData();
    V6Api.resetChat(); // the deleted account's Lucille session must not carry over
    if (!mounted) return;
    await v6SignOut(_ctx, saveState: false);
  }

  @override
  Widget build(BuildContext context) {
    final purposes = <String>{..._labels.keys, ..._flags.keys}.toList();
    return V6Page(
      child: Stack(fit: StackFit.expand, children: [
        V6Watch(builder: (context, s) {
          _inner = context;
          final userMsgs = s.lucilleMessages.where((m) => !m.fromLucille).length;
          return V6ScrollPage(withNav: false, gap: 20, children: [
            const V6TopBar(title: 'Privacy & data', subtitle: 'Your inner world stays yours'),
            // What Lucille remembers.
            V6Glass(
              padding: const EdgeInsets.all(18),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Semantics(header: true, child: const V6Display('What Lucille knows', size: 20)),
                const SizedBox(height: 12),
                _kv("Today's check-in", s.currentMood == null ? 'None' : moodOption(s.currentMood!).label),
                _kv("Messages you've sent here", '$userMsgs'),
                _kv('Your goals', s.profile.goals.isEmpty ? 'None' : s.profile.goals.join(', ')),
                const SizedBox(height: 8),
                V6Text(
                  _aiText ?? kAiNoticeText,
                  size: 12,
                  ink: V6Ink.faint,
                ),
                if (_notTherapy != null) ...[
                  const SizedBox(height: 6),
                  V6Text(_notTherapy!, size: 12, ink: V6Ink.faint),
                ],
              ]),
            ),
            // Consents.
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const V6SectionHeader('Your permissions'),
              const SizedBox(height: 6),
              const V6Text('Nothing here is required. Features that need one ask at the moment you use them.',
                  size: 13, ink: V6Ink.faint),
              const SizedBox(height: 12),
              V6Fade(
                child: _loading
                    ? const SizedBox(
                        key: ValueKey('loading'),
                        height: 80,
                        child: Center(child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))),
                      )
                    : _offline || purposes.isEmpty
                        ? V6Glass(
                            key: const ValueKey('offline'),
                            padding: const EdgeInsets.all(16),
                            child: Row(children: [
                              const Expanded(
                                child: V6Text("Couldn't load your permissions. Check your connection.",
                                    size: 14, ink: V6Ink.muted),
                              ),
                              V6Link(
                                label: 'Retry',
                                ink: V6Ink.accent,
                                onTap: () {
                                  setState(() => _loading = true);
                                  _load();
                                },
                              ),
                            ]),
                          )
                        : V6ListPanel(
                            key: const ValueKey('consents'),
                            children: [
                              for (final k in purposes)
                                V6Row(
                                  title: _labels[k] ?? _pretty(k),
                                  subtitle: kV6ConsentCopy[k],
                                  trailing: V6Toggle(
                                    on: _flags[k] ?? false,
                                    label: _labels[k] ?? _pretty(k),
                                    onChanged: (v) {
                                      if (!_busy.contains(k)) _toggleConsent(k, v);
                                    },
                                  ),
                                ),
                            ],
                          ),
              ),
            ]),
            // Your data.
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const V6SectionHeader('Your data'),
              const SizedBox(height: 12),
              V6ListPanel(children: [
                V6Row(
                  leading: const V6RowIcon(Icons.download_rounded),
                  title: 'Download my data',
                  subtitle: 'Everything we hold, as JSON',
                  trailing: _exporting ? const _Spinner() : null,
                  onTap: _exporting ? null : _export,
                ),
                V6Row(
                  leading: const V6RowIcon(Icons.chat_bubble_outline_rounded),
                  title: 'Delete conversations',
                  subtitle: '${s.lucilleMessages.length} messages on this phone',
                  onTap: _deleteConversations,
                ),
                V6Row(
                  leading: const V6RowIcon(Icons.mood_rounded),
                  title: 'Delete mood history',
                  subtitle: 'Check-ins and your Mood Orb history',
                  trailing: _busy.contains('scope:mood') ? const _Spinner() : null,
                  onTap: () => _deleteScope('mood', 'mood history'),
                ),
                V6Row(
                  leading: const V6RowIcon(Icons.menu_book_outlined),
                  title: 'Delete journal',
                  subtitle: "Entries, letters and Lucille's reflections",
                  trailing: _busy.contains('scope:journal') ? const _Spinner() : null,
                  onTap: () => _deleteScope('journal', 'journal'),
                ),
                V6Row(
                  leading: const V6RowIcon(Icons.graphic_eq_rounded),
                  title: 'Delete listening history',
                  subtitle: 'Soundscapes you played and saved',
                  trailing: _busy.contains('scope:soundscapes') ? const _Spinner() : null,
                  onTap: () => _deleteScope('soundscapes', 'listening history'),
                ),
                V6Row(
                  leading: const V6RowIcon(Icons.delete_outline_rounded, danger: true),
                  title: 'Delete account',
                  subtitle: "Permanent. Erases everything. This can't be undone.",
                  danger: true,
                  trailing: _deletingAccount ? const _Spinner() : null,
                  onTap: _deletingAccount ? null : _deleteAccount,
                ),
              ]),
            ]),
            const V6Text(
              'Moments flagged as distress are kept only for that session and never shape recommendations.',
              size: 12,
              ink: V6Ink.faint,
              align: TextAlign.center,
            ),
          ]);
        }),
      ]),
    );
  }

  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: V6Text(k, size: 14, ink: V6Ink.muted)),
          const SizedBox(width: 12),
          Flexible(child: V6Text(v, size: 14, weight: FontWeight.w600, align: TextAlign.right)),
        ]),
      );
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: V6Theme.of(context).ink),
      );
}
