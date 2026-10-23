// Escape v6 — Edit profile (Figma Make: Profile.tsx EditProfile).
//
// Saves locally first (instant), then sends the display name to PATCH /v1/me (the API accepts
// displayName, max 60 chars; pronouns, goals, daily goal and energy type stay on the phone).
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import '../entry/v6_onboarding_steps.dart' show kV6OnboardingGoals, kV6EnergyTypes;
import 'v6_profile_parts.dart';

const _kPronouns = <String>['she/her', 'he/him', 'they/them', 'she/they', 'he/they'];

class V6EditProfileScreen extends StatefulWidget {
  const V6EditProfileScreen({super.key});

  @override
  State<V6EditProfileScreen> createState() => _V6EditProfileScreenState();
}

class _V6EditProfileScreenState extends State<V6EditProfileScreen> {
  late final V6Profile _p = V6Store.instance.profile;
  late final _name = TextEditingController(text: _p.name);
  late final _pronounsOther =
      TextEditingController(text: _kPronouns.contains(_p.pronouns) ? '' : _p.pronouns);
  late String _pronouns = _p.pronouns;
  late final Set<String> _goals = {..._p.goals};
  late int _daily = _p.dailyGoalMin;
  late String? _energy = _p.energyType;
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _pronounsOther.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return; // double tap
    final name = _name.text.trim();
    final pronouns = _kPronouns.contains(_pronouns) ? _pronouns : _pronounsOther.text.trim();
    setState(() => _saving = true);
    final nameChanged = name != _p.name.trim();
    V6Store.instance.updateProfile((p) {
      p.name = name;
      p.pronouns = pronouns;
      p.goals = _goals.toList();
      p.dailyGoalMin = _daily;
      p.energyType = _energy;
    });
    var synced = true;
    if (nameChanged && name.isNotEmpty) {
      final r = await V6Api.updateMe({'displayName': name.length > 60 ? name.substring(0, 60) : name});
      synced = r.ok;
    }
    if (!mounted) return;
    setState(() => _saving = false);
    if (!synced) v6Snack(context, "Saved on this phone. We'll sync your name when you're back online.");
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final goals = <String>{...kV6OnboardingGoals, ..._goals}.toList();
    final otherPronouns = !_kPronouns.contains(_pronouns) && _pronouns.isNotEmpty;
    final energy = kV6EnergyTypes.where((e) => e.id == _energy).v6First;
    return V6Page(
      child: V6ActionPage(
        top: const V6TopBar(title: 'Edit profile'),
        footer: [V6PrimaryPill(label: 'Save changes', loading: _saving, onTap: _save)],
        children: [
          Center(
            child: V6Watch(
              builder: (context, s) => V6MoodOrb(
                mood: s.currentMood,
                size: 96,
                glow: true,
                live: true,
                heroTag: kV6ProfileOrbHeroTag,
                semanticLabel: 'Your Mood Orb',
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6Eyebrow('Name', ink: V6Ink.faint),
            const SizedBox(height: 8),
            V6TextField(
              controller: _name,
              hint: 'What should Lucille call you?',
              maxLength: 60,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6Eyebrow('Pronouns', ink: V6Ink.faint),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final p in _kPronouns)
                V6Chip(
                  label: p,
                  selected: _pronouns == p,
                  onTap: () => setState(() => _pronouns = _pronouns == p ? '' : p),
                ),
              V6Chip(
                label: 'Something else',
                selected: otherPronouns || (_pronouns == '_other'),
                onTap: () => setState(() => _pronouns = '_other'),
              ),
            ]),
            if (otherPronouns || _pronouns == '_other') ...[
              const SizedBox(height: 10),
              V6TextField(
                controller: _pronounsOther,
                hint: 'Your pronouns',
                maxLength: 30,
                onChanged: (v) => setState(() => _pronouns = v.trim().isEmpty ? '_other' : v.trim()),
              ),
            ],
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6Eyebrow('Goals', ink: V6Ink.faint),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final g in goals)
                V6Chip(
                  label: g,
                  selected: _goals.contains(g),
                  onTap: () => setState(() => _goals.contains(g) ? _goals.remove(g) : _goals.add(g)),
                ),
            ]),
          ]),
          // Figma: Daily goal chips 5 / 10 / 15 / 20 min (a Wrap so large text never overflows).
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6Eyebrow('Daily goal', ink: V6Ink.faint),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final m in <int>{5, 10, 15, 20, _daily}.toList()..sort())
                Semantics(
                  inMutuallyExclusiveGroup: true,
                  checked: _daily == m,
                  child: V6Chip(label: '$m min', selected: _daily == m, onTap: () => setState(() => _daily = m)),
                ),
            ]),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6Eyebrow('Energy type', ink: V6Ink.faint),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final e in kV6EnergyTypes)
                V6Chip(
                  label: e.id,
                  selected: _energy == e.id,
                  onTap: () => setState(() => _energy = _energy == e.id ? null : e.id),
                ),
            ]),
            const SizedBox(height: 8),
            V6Fade(
              child: V6Text(
                energy == null ? 'Optional. It shapes your Energy Journey in Mind.' : '${energy.id}: ${energy.hint}.',
                key: ValueKey(_energy),
                size: 12,
                ink: V6Ink.faint,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
