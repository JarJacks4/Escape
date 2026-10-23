// Escape v6 — first-visit tour content (Figma Make: src/data/help.ts) with spotlight targets.
// Every `target` must exist as a V6HelpTarget(id: ...) on that page.

class V6HelpTip {
  const V6HelpTip(this.title, this.body, {this.target});
  final String title;
  final String body;
  final String? target;
}

class V6PageHelpData {
  const V6PageHelpData(this.title, this.tips);
  final String title;
  final List<V6HelpTip> tips;
}

const kV6PageHelp = <String, V6PageHelpData>{
  'home': V6PageHelpData('Your home base', [
    V6HelpTip('Your day at a glance',
        'Widgets show your plan, minutes and water. Tap any of them to open the full page.',
        target: 'home.widgets'),
    V6HelpTip('How can I support you?', 'Pick what you need right now and Lucille takes you straight there.',
        target: 'home.support'),
    V6HelpTip('Lucille is always one tap away',
        'The glowing orb in the middle of the bar opens Lucille. Talk or type.',
        target: 'nav.lucille'),
    V6HelpTip('Day & night', 'Tap the sun or moon at the top to switch the mood of the whole app.',
        target: 'home.daynight'),
  ]),
  'explore': V6PageHelpData('Explore', [
    V6HelpTip('Every space in one place', 'Mind, Body, Reset, Soundscapes and Journal all start here.',
        target: 'explore.spaces'),
    V6HelpTip('Search anything', 'Try "sleep", "anxious" or "focus" to find the right session.',
        target: 'explore.search'),
    V6HelpTip('Filter by need', 'Chips narrow the list to sleep, focus, calm, energy or breath.',
        target: 'explore.chips'),
  ]),
  'mind': V6PageHelpData('Mind', [
    V6HelpTip('Guided sessions',
        'Breathing, meditation, focus and sleep. Each shows its length before you begin.',
        target: 'mind.sessions'),
    V6HelpTip('Energy centers', 'Tap an orb to learn what each center supports and start a short practice.',
        target: 'mind.centers'),
  ]),
  'reset': V6PageHelpData('Reset', [
    V6HelpTip('For hard moments', 'Short tools that work in a minute or two. No setup required.',
        target: 'reset.quick'),
    V6HelpTip('Need more support?', 'The "I need support now" card connects you to people who can help, any time.',
        target: 'reset.support'),
  ]),
  'body': V6PageHelpData('Body', [
    V6HelpTip('Start from how you feel',
        'Your body check shows heart rate and sleep from Health (if you connect it) so Lucille can suggest the right flow.',
        target: 'body.weather'),
    V6HelpTip('Four ways to move', 'Yoga, Pilates, Yang Tai Chi and Exercise. Each has 10 moves to start.',
        target: 'body.sections'),
    V6HelpTip('Preview before you move', 'Open a routine to see every move with its steps. Start when you are ready.',
        target: 'body.routines'),
  ]),
  'lucille': V6PageHelpData('Meet Lucille', [
    V6HelpTip('Talk or type',
        'Voice chat feels like a conversation. Text chat is there when you can\'t speak out loud.',
        target: 'lucille.modes'),
    V6HelpTip('What Lucille knows',
        'Only your check-in and what you share here. You can delete conversations any time in Privacy & data.'),
  ]),
  'lucilleClaude': V6PageHelpData('Lucille (Claude edition)', [
    V6HelpTip('One thread, two modes',
        'Type or tap the mic — both land in the same conversation, the way you naturally switch between voice and text.',
        target: 'claude.composer'),
    V6HelpTip('Self-care plans',
        'Lucille can build a multi-day plan around your goals. She always asks before changing anything.',
        target: 'claude.plans'),
    V6HelpTip('Thinking out loud',
        'The status line tells you what Lucille is doing — reading your history, drafting a plan — but it never blocks you from typing.',
        target: 'claude.status'),
  ]),
  'profile': V6PageHelpData('Your profile', [
    V6HelpTip('Progress without pressure', "Streaks pause, they don't punish. Missing a day never resets your coins.",
        target: 'profile.progress'),
    V6HelpTip("You're in control", 'Privacy & data lets you export or delete everything.',
        target: 'profile.privacy'),
  ]),
  'dailyPlan': V6PageHelpData('Daily plan', [
    V6HelpTip('Small on purpose',
        'Keep it to a few kind tasks. Lucille adds suggestions marked with a spark. Unfinished tasks roll into tomorrow.',
        target: 'plan.list'),
    V6HelpTip('Add your own', 'Type a task at the bottom and tap +.', target: 'plan.add'),
  ]),
  'plans': V6PageHelpData('Self-care plans', [
    V6HelpTip('Your days, in a strip',
        'Tap any day to see its steps. Today has a ring around it; the dots show what you have finished.',
        target: 'plans.days'),
    V6HelpTip('One big check each',
        'Tap the circle to mark a step done, or tap the step itself to go and do it. Each one shows how long it takes.',
        target: 'plans.today'),
    V6HelpTip('Why this plan',
        'Lucille says what she built it from. Each step can carry its own reason too.',
        target: 'plans.why'),
    V6HelpTip('Change it whenever',
        'Easier, more, or shift the days forward after a miss. It always asks before anything moves.',
        target: 'plans.adjust'),
  ]),
  'checkIn': V6PageHelpData('Daily check-in', [
    V6HelpTip('Pick the closest feeling', 'There are no wrong answers. The whole app shifts colour to match.',
        target: 'checkin.moods'),
    V6HelpTip('Energy', 'Slide to show how charged or drained you feel.', target: 'checkin.energy'),
  ]),
};
