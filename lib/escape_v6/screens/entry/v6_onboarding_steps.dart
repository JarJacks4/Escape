// Escape v6 — the individual onboarding steps (Figma Make: Entry.tsx AgeGate / Onboarding).
// Stateless: the flow state lives in V6OnboardingScreen.
import 'package:flutter/material.dart';

import '/escape_v6/v6.dart';
import '../checkin/v6_checkin_parts.dart';

const kV6OnboardingGoals = <String>[
  'Sleep better',
  'Feel less anxious',
  'Focus',
  'Move more',
  'Build habits',
  'Feel lighter',
];

class V6EnergyType {
  const V6EnergyType(this.id, this.color, this.hint);
  final String id;
  final Color color;
  final String hint;
}

const kV6EnergyTypes = <V6EnergyType>[
  V6EnergyType('Grounding', Color(0xFFE2654F), 'Steady, rooted, safe'),
  V6EnergyType('Creator', Color(0xFFF08A1D), 'Flow, play, expression'),
  V6EnergyType('Warrior', Color(0xFFE3C04A), 'Drive, courage, focus'),
  V6EnergyType('Healer', Color(0xFF5FBF8F), 'Care, warmth, connection'),
  V6EnergyType('Speaker', Color(0xFF5AA9E6), 'Honesty, voice, clarity'),
  V6EnergyType('Intuition', Color(0xFF7B6CF6), 'Insight, imagination'),
  V6EnergyType('Ascended', Color(0xFFC9B6F2), 'Stillness, perspective'),
];

const _kMonths = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const _kMonthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

/// Scrolling body of one step with a staggered rise-in.
class V6StepBody extends StatelessWidget {
  const V6StepBody({super.key, required this.children, this.gap = 18});
  final List<Widget> children;
  final double gap;

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        itemCount: children.length,
        separatorBuilder: (_, __) => SizedBox(height: gap),
        itemBuilder: (context, i) => V6Rise(index: i, child: children[i]),
      );
}

Widget _title(String t, {double size = 34}) => Semantics(header: true, child: V6SmokeIn(child: V6Display(t, size: size)));

// ───────────────────────── age gate ─────────────────────────

class V6ObAgeStep extends StatelessWidget {
  const V6ObAgeStep({
    super.key,
    required this.month,
    required this.year,
    required this.onMonth,
    required this.onYear,
    required this.teenNotice,
  });

  /// 0–11, null until picked (no default that implies an age).
  final int? month;
  final int? year;
  final ValueChanged<int> onMonth;
  final ValueChanged<int> onYear;
  final bool teenNotice;

  @override
  Widget build(BuildContext context) => V6Fade(
        child: teenNotice ? const _TeenNotice(key: ValueKey('teen')) : _picker(context),
      );

  Widget _picker(BuildContext context) {
    final p = V6Theme.of(context);
    final thisYear = DateTime.now().year;
    final years = List.generate(100, (i) => thisYear - 4 - i);
    return V6StepBody(key: const ValueKey('picker'), children: [
      const V6Eyebrow('Before we begin'),
      _title('When were you born?'),
      const V6Text('We ask everyone so Escape stays age-appropriate. Only the year is saved.', ink: V6Ink.muted),
      Semantics(
        label: 'Birth month',
        child: SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: 12,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) => Semantics(
              label: _kMonthNames[i],
              inMutuallyExclusiveGroup: true,
              checked: month == i,
              child: V6Chip(label: _kMonths[i], selected: month == i, onTap: () => onMonth(i)),
            ),
          ),
        ),
      ),
      V6Glass(
        padding: const EdgeInsets.all(6),
        radius: 22,
        child: SizedBox(
          height: 208,
          child: Semantics(
            label: 'Birth year',
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemExtent: 50,
              itemCount: years.length,
              itemBuilder: (context, i) {
                final y = years[i];
                final on = year == y;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Semantics(
                    inMutuallyExclusiveGroup: true,
                    checked: on,
                    child: V6Pressable(
                      onTap: () => onYear(y),
                      semanticLabel: '$y',
                      child: AnimatedContainer(
                        duration: V6Motion.quick,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: on ? p.ink : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('$y', style: V6Type.displayStyle(22, on ? p.onInk : p.ink)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ]);
  }
}

class _TeenNotice extends StatelessWidget {
  const _TeenNotice({super.key});

  @override
  Widget build(BuildContext context) => V6StepBody(children: [
        const V6Eyebrow('Teen account', ink: V6Ink.accent),
        _title('Welcome. A few extra protections are on.'),
        const V6Bullets([
          "Lucille reminds you more often that she's an AI, not a person.",
          'Real people are one tap away if things feel heavy.',
        ]),
      ]);
}

class V6ObUnder13 extends StatelessWidget {
  const V6ObUnder13({super.key, required this.onCall, required this.onSignOut, this.signingOut = false});
  final VoidCallback onCall;
  final VoidCallback onSignOut;
  final bool signingOut;

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(24, pad.top + 24, 24, pad.bottom + 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const V6Rise(index: 0, child: V6MoodOrb(mood: V6Mood.calm, size: 96, glow: true)),
              const SizedBox(height: 24),
              V6Rise(index: 1, child: _title('Escape is for people 13 and older.')),
              const SizedBox(height: 14),
              const V6Rise(
                index: 2,
                child: V6Text(
                  "We can't create an account for you yet, and we haven't saved anything you entered. "
                  'If something feels heavy right now, a trusted adult can help, and you can call or '
                  'text 988 any time.',
                  ink: V6Ink.muted,
                ),
              ),
            ],
          ),
        ),
        V6PrimaryPill(label: 'Call or text 988', icon: Icons.call_rounded, onTap: onCall),
        const SizedBox(height: 6),
        Center(child: V6Link(label: signingOut ? 'Signing out…' : 'Sign out', onTap: signingOut ? null : onSignOut)),
      ]),
    );
  }
}

// ───────────────────────── Lucille ─────────────────────────

class V6ObLucilleStep extends StatelessWidget {
  const V6ObLucilleStep({super.key, required this.teen});
  final bool teen;

  @override
  Widget build(BuildContext context) => V6StepBody(children: [
        const V6Eyebrow('Meet your companion'),
        _title("Hi, I'm Lucille.", size: 36),
        const V6Text(
          "I'm an AI companion, not a person or a therapist. I'll listen, notice patterns, and "
          "suggest small ways to feel a little better, and I'll always tell you why I'm suggesting something.",
          ink: V6Ink.muted,
        ),
        V6Bullets([
          "I can't diagnose or treat anything.",
          'If things ever feel heavy, I will point you to real people who can help, any time.',
          if (teen) "Because you're under 18, I'll remind you more often that I'm an AI.",
        ]),
      ]);
}

// ───────────────────────── mood ─────────────────────────

class V6ObMoodStep extends StatelessWidget {
  const V6ObMoodStep({super.key, required this.mood, required this.onMood});
  final V6Mood? mood;
  final ValueChanged<V6Mood> onMood;

  @override
  Widget build(BuildContext context) => V6StepBody(children: [
        const V6Eyebrow('Your first check-in'),
        _title('How are you feeling?'),
        const V6Text('Pick the orb that feels closest. Watch your space respond.', ink: V6Ink.muted),
        V6CheckInMoodRow(value: mood, onChanged: onMood),
        Semantics(
          liveRegion: true,
          child: V6Fade(
            child: V6Text(
              mood == null ? 'There are no wrong answers.' : moodOption(mood!).line,
              key: ValueKey(mood),
              ink: V6Ink.faint,
              size: 13,
            ),
          ),
        ),
      ]);
}

// ───────────────────────── personalize ─────────────────────────

class V6ObPersonalizeStep extends StatelessWidget {
  const V6ObPersonalizeStep({
    super.key,
    required this.name,
    required this.goals,
    required this.onGoal,
    required this.dailyGoal,
    required this.onDailyGoal,
    required this.energyType,
    required this.onEnergyType,
  });

  final TextEditingController name;
  final Set<String> goals;
  final ValueChanged<String> onGoal;
  final int dailyGoal;
  final ValueChanged<int> onDailyGoal;
  final String? energyType;
  final ValueChanged<String?> onEnergyType;

  @override
  Widget build(BuildContext context) {
    final energy = kV6EnergyTypes.where((e) => e.id == energyType).v6First;
    return V6StepBody(children: [
      _title("Let's personalize your journey"),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6Eyebrow('What should I call you?', ink: V6Ink.faint),
        const SizedBox(height: 8),
        V6TextField(
          controller: name,
          hint: 'Your first name',
          maxLength: 40,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
        ),
      ]),
      const V6Eyebrow('What brings you here?'),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final g in kV6OnboardingGoals) V6Chip(label: g, selected: goals.contains(g), onTap: () => onGoal(g)),
      ]),
      V6Glass(
        radius: 22,
        padding: const EdgeInsets.fromLTRB(18, 12, 12, 12),
        child: Row(children: [
          const Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              V6Text('Daily goal', weight: FontWeight.w600),
              V6Text('Minutes a day', size: 12, ink: V6Ink.faint),
            ]),
          ),
          for (final m in const [5, 15, 20]) ...[
            const SizedBox(width: 6),
            Semantics(
              label: '$m minutes',
              inMutuallyExclusiveGroup: true,
              checked: dailyGoal == m,
              child: V6Chip(label: '$m', selected: dailyGoal == m, onTap: () => onDailyGoal(m)),
            ),
          ],
        ]),
      ),
      const V6Eyebrow('Which energy resonates with you most?'),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final e in kV6EnergyTypes)
          _EnergyChip(
            type: e,
            selected: energyType == e.id,
            onTap: () => onEnergyType(energyType == e.id ? null : e.id),
          ),
      ]),
      V6Fade(
        child: V6Text(
          energy == null
              ? 'Optional. It shapes your Energy Journey in Mind.'
              : '${energy.id}: ${energy.hint}. Lucille uses this to shape your Energy Journey.',
          key: ValueKey(energyType),
          size: 12,
          ink: V6Ink.faint,
        ),
      ),
    ]);
  }
}

class _EnergyChip extends StatelessWidget {
  const _EnergyChip({required this.type, required this.selected, required this.onTap});
  final V6EnergyType type;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = V6Theme.of(context);
    final fg = selected ? p.onInk : p.ink;
    return Semantics(
      selected: selected,
      child: V6Pressable(
        onTap: onTap,
        semanticLabel: '${type.id}. ${type.hint}',
        child: AnimatedContainer(
          duration: V6Motion.quick,
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? p.ink : p.glass[1],
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: selected ? p.ink : p.glassBorder),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: type.color,
                boxShadow: [BoxShadow(color: type.color, blurRadius: 8)],
              ),
            ),
            const SizedBox(width: 8),
            Text(type.id,
                style: V6Type.body(14, fg, weight: selected ? FontWeight.w600 : FontWeight.w500, height: 1.2)),
          ]),
        ),
      ),
    );
  }
}

// ───────────────────────── reminders ─────────────────────────

class V6ObRemindersStep extends StatelessWidget {
  const V6ObRemindersStep({
    super.key,
    required this.reminder,
    required this.onReminder,
    required this.timeLabel,
    required this.onPickTime,
    required this.notifications,
    required this.onNotifications,
    required this.denied,
  });

  final bool reminder;
  final ValueChanged<bool> onReminder;
  final String timeLabel;
  final VoidCallback onPickTime;
  final bool notifications;
  final ValueChanged<bool> onNotifications;
  final bool denied;

  @override
  Widget build(BuildContext context) => V6StepBody(children: [
        _title('Stay in touch with yourself'),
        V6Glass(
          radius: 22,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Column(children: [
            V6Row(
              title: 'Mood Check Reminder',
              subtitle: 'One gentle nudge a day',
              trailing: V6Toggle(on: reminder, onChanged: onReminder, label: 'Mood Check Reminder'),
            ),
            AnimatedSize(
              duration: V6Motion.quick,
              curve: V6Motion.ease,
              child: reminder
                  ? V6Row(
                      title: 'Reminder time',
                      onTap: onPickTime,
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        V6Text(timeLabel, weight: FontWeight.w600, ink: V6Ink.accent),
                        const SizedBox(width: 4),
                        Icon(Icons.chevron_right_rounded, color: V6Theme.of(context).inkFaint),
                      ]),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ]),
        ),
        V6Glass(
          radius: 22,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: V6Text("We'll remind you gently, no spam.", weight: FontWeight.w600),
            ),
            V6Row(
              title: 'Allow Notifications',
              subtitle: 'You can turn these off any time in Settings',
              trailing: V6Toggle(on: notifications, onChanged: onNotifications, label: 'Allow Notifications'),
            ),
          ]),
        ),
        Semantics(
          liveRegion: true,
          child: V6Fade(
            child: denied
                ? const V6Text(
                    'Notifications are off for Escape in your phone settings. You can allow them there later.',
                    key: ValueKey('denied'),
                    size: 13,
                    ink: V6Ink.faint,
                  )
                : reminder && !notifications
                    ? const V6Text(
                        'Allow notifications so your reminder can reach you.',
                        key: ValueKey('hint'),
                        size: 13,
                        ink: V6Ink.faint,
                      )
                    : const SizedBox(key: ValueKey('none')),
          ),
        ),
      ]);
}

// ───────────────────────── privacy ─────────────────────────

class V6ObPrivacyStep extends StatelessWidget {
  const V6ObPrivacyStep({
    super.key,
    required this.wellbeing,
    required this.ai,
    required this.personal,
    required this.onWellbeing,
    required this.onAi,
    required this.onPersonal,
  });

  final bool wellbeing;
  final bool ai;
  final bool personal;
  final ValueChanged<bool> onWellbeing;
  final ValueChanged<bool> onAi;
  final ValueChanged<bool> onPersonal;

  @override
  Widget build(BuildContext context) => V6StepBody(children: [
        _title('Your inner world stays yours.'),
        const V6Bullets([
          'Mood and journal data are encrypted and never sold.',
          'You can delete your conversations with Lucille any time.',
          'Moments of distress are never used for recommendations.',
          'Export or erase everything from Privacy & data.',
        ]),
        const V6Eyebrow('You choose'),
        V6Glass(
          radius: 22,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Column(children: [
            V6Row(
              title: 'Save my check-ins',
              subtitle: kV6ConsentCopy['wellbeing_data'],
              trailing: V6Toggle(on: wellbeing, onChanged: onWellbeing, label: 'Save my check-ins'),
            ),
            V6Row(
              title: 'Let Lucille read what I write',
              subtitle: kV6ConsentCopy['ai_reflection'],
              trailing: V6Toggle(on: ai, onChanged: onAi, label: 'Let Lucille read what I write'),
            ),
            V6Row(
              title: 'Personalize from my mood',
              subtitle: kV6ConsentCopy['personalization'],
              trailing: V6Toggle(on: personal, onChanged: onPersonal, label: 'Personalize from my mood'),
            ),
          ]),
        ),
        const V6Text(
          'Everything here can be changed later in Profile > Privacy & data.',
          size: 13,
          ink: V6Ink.faint,
        ),
      ]);
}
