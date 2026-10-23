// Escape v6 — Help & support (Figma Make: Profile.tsx Help).
//
// Crisis lines first (one tap to call or text), then plain answers, page guides and contact.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/escape_v6/v6.dart';
import 'v6_profile_parts.dart';

/// The support address the app already uses (components/contact_us_comp_widget.dart).
const kV6SupportEmail = 'support@escapeapp.ai';

const _kFaqs = <(String, String)>[
  (
    'What is Lucille?',
    "Lucille is an AI companion. She listens, reflects back what she hears and suggests small "
        'things that might help, like a breathing exercise or a journal prompt. She explains why '
        'she suggests something, and you can always say it doesn\'t fit.'
  ),
  (
    "What Lucille isn't",
    "She isn't a person, a therapist or a crisis service. She can't diagnose or treat anything. "
        'If you might be in danger, please use the crisis lines at the top of this page.'
  ),
  (
    'How do Escape Coins work?',
    'Coins are earned, never bought: finishing sessions, checking in and completing your plan all '
        'add a few. Missing a day pauses your streak but never takes coins away. Spend them in the '
        'Marketplace.'
  ),
  (
    'How is my data used?',
    'Your check-ins, journal and conversations are used only to run Escape for you. Lucille\'s replies '
        "are not used to train models. You choose each permission in Privacy & data, where you can also "
        'download or delete everything.'
  ),
  (
    'How do page tours work?',
    'The first time you open a main page, a short tour points out what matters. Tap "?" at the top of '
        'any page to see it again, or replay every tour from your Profile.'
  ),
];

const _kGuides = <(String, String)>[
  ('home', 'Getting around Home'),
  ('lucille', 'How Lucille works'),
  ('mind', 'Mind sessions & energy centers'),
  ('profile', 'Your profile & progress'),
];

class V6HelpScreen extends StatelessWidget {
  const V6HelpScreen({super.key});

  Future<void> _open(BuildContext context, String uri) async {
    var ok = false;
    try {
      ok = await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
    } catch (_) {}
    if (!ok && context.mounted) v6Snack(context, "Couldn't open that on this device.");
  }

  @override
  Widget build(BuildContext context) {
    final guides = _kGuides.where((g) => kV6PageHelp.containsKey(g.$1)).toList();
    return V6Page(
      // Builder: a context inside V6Page, so the tour overlay and snacks get the live palette.
      child: Builder(builder: (context) => V6ScrollPage(withNav: false, gap: 20, children: [
        const V6TopBar(title: 'Help & support'),
        // Crisis first.
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Semantics(header: true, child: const V6Display('Need someone right now?', size: 24)),
          const SizedBox(height: 6),
          const V6Text('Free, confidential and open 24/7. Tap to call or text.', size: 14, ink: V6Ink.muted),
          const SizedBox(height: 12),
          for (final l in kCrisisLines)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: V6Glass(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                radius: 18,
                onTap: () => _open(context, l.uri),
                semanticLabel: '${l.label}. ${l.detail}',
                child: Row(children: [
                  V6IconBadge(
                    icon: l.uri.startsWith('tel')
                        ? Icons.call_rounded
                        : l.uri.startsWith('sms')
                            ? Icons.sms_rounded
                            : Icons.public_rounded,
                    color: V6Brand.emberLight,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      V6Text(l.label, weight: FontWeight.w600),
                      V6Text(l.detail, size: 13, ink: V6Ink.faint),
                    ]),
                  ),
                ]),
              ),
            ),
        ]),
        // FAQs.
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const V6SectionHeader('Questions'),
          const SizedBox(height: 12),
          V6ListPanel(children: [for (final f in _kFaqs) _Faq(q: f.$1, a: f.$2)]),
        ]),
        // Guides.
        if (guides.isNotEmpty)
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6SectionHeader('Page guides'),
            const SizedBox(height: 12),
            V6ListPanel(children: [
              for (final g in guides)
                V6Row(
                  leading: const V6RowIcon(Icons.auto_awesome_outlined),
                  title: g.$2,
                  subtitle: '${kV6PageHelp[g.$1]!.tips.length} quick tips',
                  onTap: () => showV6Help(context, g.$1),
                ),
              V6Row(
                leading: const V6RowIcon(Icons.replay_rounded),
                title: 'Replay every tour',
                subtitle: 'First-time tips on every page',
                onTap: () {
                  V6Store.instance.resetWalkthrough();
                  v6Snack(context, 'Tours are back on. Open any page to see its guide.');
                },
              ),
            ]),
          ]),
        // Contact.
        V6ListPanel(children: [
          V6Row(
            leading: const V6RowIcon(Icons.mail_outline_rounded),
            title: 'Contact us',
            subtitle: '$kV6SupportEmail · we reply within a day',
            onTap: () => _open(context, 'mailto:$kV6SupportEmail?subject=${Uri.encodeComponent('Escape support')}'),
          ),
        ]),
        const V6Text(
          'Lucille is an AI companion, not a crisis service or a licensed therapist.',
          size: 12,
          ink: V6Ink.faint,
          align: TextAlign.center,
        ),
      ])),
    );
  }
}

class _Faq extends StatefulWidget {
  const _Faq({required this.q, required this.a});
  final String q;
  final String a;

  @override
  State<_Faq> createState() => _FaqState();
}

class _FaqState extends State<_Faq> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Semantics(
      expanded: _open,
      child: V6Pressable(
        onTap: () => setState(() => _open = !_open),
        semanticLabel: widget.q,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Row(children: [
                Expanded(child: V6Text(widget.q, weight: FontWeight.w600)),
                AnimatedRotation(
                  turns: _open ? 0.5 : 0,
                  duration: V6Motion.quick,
                  child: Icon(Icons.expand_more_rounded, color: p.inkFaint),
                ),
              ]),
            ),
            AnimatedSize(
              duration: V6Theme.motionOff(context) ? Duration.zero : const Duration(milliseconds: 260),
              curve: V6Motion.ease,
              alignment: Alignment.topCenter,
              child: _open
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: V6Text(widget.a, size: 14, ink: V6Ink.muted),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ]),
        ),
      ),
    );
  }
}
