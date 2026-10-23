// Escape v6 — Profile tab (Figma Make: Profile.tsx Profile). TAB BODY: no Scaffold.
//
// Header (orb + name + pronouns + Edit), a progress strip with server-owned streak and coins
// (shown as "—" until the server answers; never invented), then the account list.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import 'v6_profile_parts.dart';

class V6ProfileScreen extends StatelessWidget {
  const V6ProfileScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    final yes = await showV6Confirm(
      context,
      title: 'Sign out?',
      body: 'Your progress is saved to your account. You can sign back in any time.',
      confirmLabel: 'Sign out',
      cancelLabel: 'Stay signed in',
    );
    if (yes && context.mounted) await v6SignOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      V6Watch(builder: (context, s) {
        final name = s.profile.name.trim().isNotEmpty ? s.profile.name.trim() : s.firstName;
        final details = [
          if (s.ageBand == V6AgeBand.teen) 'Teen account',
          if (s.profile.pronouns.trim().isNotEmpty) s.profile.pronouns.trim(),
          if ((s.profile.energyType ?? '').isNotEmpty) s.profile.energyType!,
        ];
        return V6ScrollPage(gap: 22, children: [
          const V6TopBar(noBack: true, actions: [V6HelpButton(page: 'profile')]),
          // Header.
          Row(children: [
            V6MoodOrb(
              mood: s.currentMood,
              size: 72,
              glow: true,
              live: true,
              heroTag: kV6ProfileOrbHeroTag, // continues into Edit profile
              semanticLabel: s.currentMood == null
                  ? 'Your Mood Orb'
                  : 'Your Mood Orb, feeling ${moodOption(s.currentMood!).label.toLowerCase()}',
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Semantics(
                  header: true,
                  child: V6SmokeIn(child: V6Display(name.isEmpty ? 'Your profile' : name, size: 28, maxLines: 2)),
                ),
                if (details.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  V6Text(details.join(' · '), size: 13, ink: V6Ink.muted, maxLines: 2),
                ],
              ]),
            ),
            const SizedBox(width: 8),
            _EditButton(onTap: () => v6Open(context, V6Routes.editProfile)),
          ]),
          // Progress strip.
          V6HelpTarget(
            id: 'profile.progress',
            child: V6Glass(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              onTap: () => v6Open(context, V6Routes.progress),
              semanticLabel: 'Progress. '
                  '${s.streakDays == null ? 'Streak loading' : '${s.streakDays} day streak'}, '
                  '${s.coins == null ? 'coins loading' : '${s.coins} Escape Coins'}, '
                  '${s.minutesToday} of ${s.profile.dailyGoalMin} minutes today',
              child: ExcludeSemantics(
                child: Row(children: [
                  Expanded(
                    child: _Stat(
                      icon: Icons.local_fire_department_outlined,
                      value: s.streakDays == null ? '—' : '${s.streakDays}',
                      label: 'day streak',
                    ),
                  ),
                  _vline(context),
                  Expanded(
                    child: _Stat(
                      icon: Icons.toll_outlined,
                      value: s.coins == null ? '—' : _fmt(s.coins!),
                      label: 'Escape Coins',
                    ),
                  ),
                  _vline(context),
                  Expanded(
                    child: Column(children: [
                      V6Ring(
                        value: s.profile.dailyGoalMin <= 0 ? 0 : s.minutesToday / s.profile.dailyGoalMin,
                        size: 40,
                        stroke: 4,
                        child: V6Text('${s.minutesToday}', size: 13, weight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      V6Text('of ${s.profile.dailyGoalMin} min today', size: 12, ink: V6Ink.faint, align: TextAlign.center),
                    ]),
                  ),
                ]),
              ),
            ),
          ),
          // Account list.
          V6ListPanel(children: [
            V6Row(
              leading: const V6RowIcon(Icons.storefront_outlined),
              title: 'My Collection & Marketplace',
              subtitle: s.coins == null ? 'Spend the coins you earn' : '${_fmt(s.coins!)} Escape Coins to spend',
              onTap: () => v6Open(context, V6Routes.marketplace),
            ),
            V6Row(
              leading: const V6RowIcon(Icons.tune_rounded),
              title: 'Settings',
              subtitle: "Day & night, reminders, Lucille's voice",
              onTap: () => v6Open(context, V6Routes.settings),
            ),
            V6HelpTarget(
              id: 'profile.privacy',
              child: V6Row(
                leading: const V6RowIcon(Icons.shield_outlined),
                title: 'Privacy & data',
                subtitle: 'See, export or delete your data',
                onTap: () => v6Open(context, V6Routes.privacy),
              ),
            ),
            V6Row(
              leading: const V6RowIcon(Icons.support_outlined),
              title: 'Help & support',
              subtitle: 'Crisis lines, answers, contact us',
              onTap: () => v6Open(context, V6Routes.help),
            ),
            V6Row(
              leading: const V6RowIcon(Icons.auto_awesome_outlined),
              title: 'Replay page tours',
              subtitle: 'See the first-time guides again',
              onTap: () {
                s.resetWalkthrough();
                v6Snack(context, 'Tours are back on. Open any page to see its guide.');
              },
            ),
          ]),
          V6ListPanel(children: [
            V6Row(
              leading: const V6RowIcon(Icons.logout_rounded),
              title: 'Sign out',
              onTap: () => _signOut(context),
            ),
          ]),
          const Center(child: V6Eyebrow('Escape', ink: V6Ink.faint)),
        ]);
      }),
      const V6AutoHelp(page: 'profile'),
    ]);
  }

  static Widget _vline(BuildContext context) =>
      Container(width: 1, height: 44, color: V6Theme.of(context).glassBorder);

  static String _fmt(int n) {
    final s = n.toString();
    final b = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
      b.write(s[i]);
    }
    return b.toString();
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.value, required this.label});
  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return Column(children: [
      SizedBox(
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 18, color: p.accent),
          const SizedBox(width: 5),
          Flexible(child: V6Display(value, size: 24, maxLines: 1)),
        ]),
      ),
      const SizedBox(height: 6),
      V6Text(label, size: 12, ink: V6Ink.faint, align: TextAlign.center, maxLines: 1),
    ]);
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    return V6Pressable(
      onTap: onTap,
      semanticLabel: 'Edit profile',
      child: Container(
        constraints: const BoxConstraints(minHeight: V6Space.minTarget, minWidth: 64),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: p.glass[1],
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: p.glassBorder),
        ),
        child: V6Text('Edit', size: 14, weight: FontWeight.w600),
      ),
    );
  }
}
