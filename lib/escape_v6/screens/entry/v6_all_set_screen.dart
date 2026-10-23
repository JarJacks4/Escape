// Escape v6 — You're All Set (Figma Make: Entry.tsx AllSet).
// The end of onboarding: a calm reward moment, three things to know, then into the app.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '/escape_v6/v6.dart';
import '../checkin/v6_checkin_parts.dart';

class V6AllSetScreen extends StatefulWidget {
  const V6AllSetScreen({super.key});

  @override
  State<V6AllSetScreen> createState() => _V6AllSetScreenState();
}

class _V6AllSetScreenState extends State<V6AllSetScreen> {
  bool _leaving = false;

  void _enter() {
    if (_leaving) return;
    _leaving = true;
    HapticFeedback.mediumImpact();
    // Back to the tab shell root (route '/' builds NavBarPage when signed in).
    GoRouter.of(context).goNamed('_initialize');
  }

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _enter();
      },
      child: V6Page(
        child: V6Watch(builder: (context, s) {
          final name = s.firstName;
          final mood = s.currentMood;
          final minutes = s.profile.dailyGoalMin;
          return Column(children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(24, pad.top + 56, 24, 16),
                children: [
                  V6Rise(
                    index: 0,
                    child: Semantics(
                      header: true,
                      child: V6SmokeIn(
                        child: V6Display(
                          name.isEmpty ? "You're all set." : "You're all set, $name.",
                          size: 36,
                          align: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  V6Rise(
                    index: 1,
                    child: V6Text(
                      '${mood == null ? 'Your space is ready.' : 'Your space is tuned to ${moodOption(mood).label.toLowerCase()}.'} '
                      'Lucille will start with $minutes gentle minutes a day.',
                      ink: V6Ink.muted,
                      align: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const V6Rise(index: 2, child: V6Eyebrow("What's next")),
                  const SizedBox(height: 12),
                  const V6Rise(
                    index: 3,
                    child: _NextRow(
                      icon: Icons.wb_twilight_rounded,
                      title: 'Your daily check-in',
                      body: 'A 30-second hello each day. It tunes the whole app to how you feel.',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const V6Rise(
                    index: 4,
                    child: _NextRow(
                      icon: Icons.auto_awesome_rounded,
                      title: 'Lucille is one tap away',
                      body: 'The glowing orb in the tab bar. Talk or type, whenever you need.',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const V6Rise(
                    index: 5,
                    child: _NextRow(
                      icon: Icons.toll_rounded,
                      title: 'Sessions earn Escape Coins',
                      body: 'Finish a session to earn coins. Streaks pause, they never punish.',
                    ),
                  ),
                ],
              ),
            ),
            V6AnimatedHeroOrb(
              mood: mood,
              visible: 230,
              child: V6OrbCta(label: 'Enter Escape', onTap: _enter),
            ),
            SizedBox(height: pad.bottom * 0.4),
          ]);
        }),
      ),
    );
  }
}

class _NextRow extends StatelessWidget {
  const _NextRow({required this.icon, required this.title, required this.body});
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => V6Glass(
        radius: V6Space.radiusCard,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(children: [
          V6IconBadge(icon: icon),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              V6Text(title, weight: FontWeight.w600),
              const SizedBox(height: 2),
              V6Text(body, size: 13, ink: V6Ink.muted, height: 1.35),
            ]),
          ),
        ]),
      );
}
