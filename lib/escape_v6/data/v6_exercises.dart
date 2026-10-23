// Escape v6 — Mind + Reset sessions (Figma Make: src/data/exercises.ts).
//
// Breath timings follow the published patterns: box 4-4-4-4, 4-7-8, resonance/long exhale 4-6,
// physiological sigh (double inhale, long exhale). Longer exhales than inhales lower arousal.
import 'package:flutter/material.dart';

import '../theme/v6_palettes.dart';

enum V6ExerciseKind { breath, meditation, grounding }

class V6Breath {
  const V6Breath(this.inhale, this.hold, this.exhale, this.rest);
  final int inhale;
  final int hold;
  final int exhale;
  final int rest;
  int get cycle => inhale + hold + exhale + rest;
  String get label => [
        'In $inhale',
        if (hold > 0) 'hold $hold',
        'out $exhale',
        if (rest > 0) 'hold $rest',
      ].join(' · ');
}

class V6Exercise {
  const V6Exercise({
    required this.id,
    required this.area,
    required this.group,
    required this.title,
    required this.category,
    required this.minutes,
    required this.kind,
    required this.palette,
    required this.summary,
    required this.needs,
    required this.steps,
    required this.benefits,
    this.breath,
    this.script = const [],
    this.image,
    this.taskId,
    this.tags = const [],
  });

  final String id;

  /// 'mind' | 'reset'
  final String area;
  final String group;
  final String title;
  final String category;
  final int minutes;
  final V6ExerciseKind kind;
  final V6PaletteId palette;
  final String summary;
  final String needs;
  final List<String> steps;
  final List<String> benefits;
  final V6Breath? breath;

  /// Narration lines for meditations, spread evenly across the session.
  final List<String> script;
  final String? image;

  /// Ticks this daily-plan task when finished.
  final String? taskId;

  /// Search words (Explore search).
  final List<String> tags;

  String get heroTag => 'exercise-$id';
}

String _img(String id) =>
    'https://images.unsplash.com/$id?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&q=80&w=900';

final kV6Exercises = <V6Exercise>[
  // ── Mind ────────────────────────────────────────────────────────────────
  const V6Exercise(
    id: 'basic-breathing',
    area: 'mind',
    group: 'Breathe',
    title: 'Basic Breathing',
    category: 'Breathwork',
    minutes: 3,
    kind: V6ExerciseKind.breath,
    palette: V6PaletteId.calm,
    summary: 'An easy, even rhythm to bring you back into your body.',
    needs: 'Anywhere · eyes open or closed',
    steps: ['Sit or lie comfortably', 'Breathe in through your nose for 4', 'Breathe out slowly for 4', 'Let the orb set the pace'],
    benefits: ['Slows heart rate', 'Quiets racing thoughts'],
    breath: V6Breath(4, 0, 4, 0),
    taskId: 'breathe',
    tags: ['breathe', 'calm', 'anxious', 'stress'],
  ),
  const V6Exercise(
    id: 'box-breathing',
    area: 'mind',
    group: 'Breathe',
    title: 'Box Breathing',
    category: 'Breathwork',
    minutes: 4,
    kind: V6ExerciseKind.breath,
    palette: V6PaletteId.focused,
    summary: 'Four equal sides: in, hold, out, hold. Used by pilots and first responders.',
    needs: 'Seated · 4 minutes',
    steps: ['In for 4', 'Hold for 4', 'Out for 4', 'Hold for 4'],
    benefits: ['Steadies nerves before pressure', 'Sharpens attention'],
    breath: V6Breath(4, 4, 4, 4),
    taskId: 'breathe',
    tags: ['focus', 'nerves', 'breathe', 'presentation'],
  ),
  V6Exercise(
    id: 'anxiety-relief',
    area: 'mind',
    group: 'Meditate',
    title: 'Anxiety Relief',
    category: 'Meditation',
    minutes: 6,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.calm,
    summary: 'A guided settle for when your chest feels tight and thoughts speed up.',
    needs: 'Quiet spot · headphones help',
    steps: const [
      'Notice where anxiety lives in your body',
      'Breathe into that place',
      'Name the feeling without fixing it',
      'Let Lucille guide you back'
    ],
    benefits: const ['Reduces physical tension', 'Creates space from worry'],
    script: const [
      'Let your shoulders drop away from your ears.',
      "Notice where the tightness sits. You don't need to change it.",
      'Breathe toward it, slowly, like warm water.',
      'Thoughts will come. Let them pass like headlights.',
      'You are safe in this moment.',
      "When you're ready, wiggle your fingers and come back.",
    ],
    image: _img('photo-1510297895683-0f27794412d5'),
    tags: const ['anxious', 'anxiety', 'worry', 'panic', 'calm'],
  ),
  const V6Exercise(
    id: 'adhd-overthinking',
    area: 'mind',
    group: 'Meditate',
    title: 'ADHD & Overthinking',
    category: 'Meditation',
    minutes: 5,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.restless,
    summary: 'Short, moving anchors for a busy mind. No long silences.',
    needs: 'Anywhere · 5 minutes',
    steps: ['Pick one sound to follow', 'Count breaths to five, then restart', 'Wandering is part of it'],
    benefits: ['Builds attention gently', 'No guilt for drifting'],
    script: [
      'Pick one sound around you. Follow it.',
      'Count one breath. Then two. Up to five.',
      "Drifted? That's the practice. Start again at one.",
      'Notice your feet. Notice your hands.',
      'One more round of five.',
    ],
    tags: ['adhd', 'overthinking', 'restless', 'focus'],
  ),
  V6Exercise(
    id: 'increase-focus',
    area: 'mind',
    group: 'Focus',
    title: 'Increase Focus',
    category: 'Focus',
    minutes: 10,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.focused,
    summary: 'A primer before deep work: clear the desk in your head.',
    needs: 'Desk · phone face down',
    steps: const ["Write the one thing you'll do", 'Three slow breaths', 'Focus soundscape fades in'],
    benefits: const ['Easier to start', 'Fewer context switches'],
    script: const [
      'Say your one task quietly to yourself.',
      "Imagine the moment it's done. How does it feel?",
      'Breathe in clarity. Breathe out the rest of the list.',
      'Everything else can wait for the next hour.',
      'Open your eyes. Begin.',
    ],
    image: _img('photo-1643287146701-93c795880dda'),
    tags: const ['focus', 'work', 'study', 'productivity'],
  ),
  V6Exercise(
    id: 'deep-sleep',
    area: 'mind',
    group: 'Sleep',
    title: 'Deep Sleep',
    category: 'Sleep',
    minutes: 15,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.sleep,
    summary: 'A slow body scan that hands you to sleep.',
    needs: 'In bed · lights low',
    steps: const ['Lie down', 'Scan from toes to forehead', 'Let the voice fade out'],
    benefits: const ['Falls asleep faster', 'Calms nighttime worry'],
    script: const [
      'Let the bed hold all of your weight.',
      'Soften your toes. Your ankles. Your calves.',
      'Let your hips sink. Your belly rise and fall.',
      'Your jaw unclenches. Your eyes grow heavy.',
      'There is nothing left to do today.',
    ],
    image: _img('photo-1477840539360-4a1d23071046'),
    tags: const ['sleep', 'insomnia', 'night', 'tired'],
  ),
  const V6Exercise(
    id: 'microcosmic-orbit',
    area: 'mind',
    group: 'Energy',
    title: 'Microcosmic Orbit',
    category: 'Energy',
    minutes: 8,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.calm,
    summary: 'Circulate breath up the spine and down the front of the body.',
    needs: 'Seated · spine tall',
    steps: ['Breathe up the back', 'Pause at the crown', 'Breathe down the front', 'Rest at the navel'],
    benefits: ['Feels warming and centering', 'Links breath and body'],
    script: [
      'Sit tall. Rest your tongue at the roof of your mouth.',
      'Inhale: imagine warmth rising up your spine.',
      'Pause at the crown of your head.',
      'Exhale: let it flow down your face, chest, belly.',
      'Rest the warmth just below your navel.',
    ],
    tags: ['energy', 'qi', 'centering'],
  ),
  // ── Reset ───────────────────────────────────────────────────────────────
  const V6Exercise(
    id: 'one-minute-reset',
    area: 'reset',
    group: 'Quick reset',
    title: 'One-Minute Reset',
    category: 'Quick reset',
    minutes: 1,
    kind: V6ExerciseKind.breath,
    palette: V6PaletteId.calm,
    summary: 'Two sighs and a long exhale. The fastest way down from a spike.',
    needs: 'Anywhere · 60 seconds',
    steps: ['Double inhale through the nose', 'Long sigh out through the mouth', 'Repeat five times'],
    benefits: ['Fastest stress drop', 'Works mid-meeting'],
    breath: V6Breath(3, 1, 6, 0),
    taskId: 'breathe',
    tags: ['stress', 'panic', 'quick', 'sigh'],
  ),
  const V6Exercise(
    id: 'calm-478',
    area: 'reset',
    group: 'Breathing',
    title: 'Calm Breathing 4·7·8',
    category: 'Breathwork',
    minutes: 3,
    kind: V6ExerciseKind.breath,
    palette: V6PaletteId.calm,
    summary: 'A long hold and longer exhale switch on your rest response.',
    needs: 'Seated or lying',
    steps: ['In for 4', 'Hold for 7', 'Out for 8'],
    benefits: ['Eases anxiety', 'Helps before sleep'],
    breath: V6Breath(4, 7, 8, 0),
    taskId: 'breathe',
    tags: ['anxious', 'sleep', 'calm', '478'],
  ),
  const V6Exercise(
    id: 'long-exhale',
    area: 'reset',
    group: 'Breathing',
    title: 'Long Exhale',
    category: 'Breathwork',
    minutes: 2,
    kind: V6ExerciseKind.breath,
    palette: V6PaletteId.low,
    summary: 'In for 4, out for 6. Gentle enough for heavy days.',
    needs: 'Anywhere',
    steps: ['In for 4', 'Out for 6', 'Let your shoulders fall'],
    benefits: ['Lowers arousal', 'Easy to remember'],
    breath: V6Breath(4, 0, 6, 0),
    taskId: 'breathe',
    tags: ['low', 'sad', 'heavy', 'breathe'],
  ),
  const V6Exercise(
    id: 'grounding-54321',
    area: 'reset',
    group: 'Grounding',
    title: '5·4·3·2·1 Grounding',
    category: 'Grounding',
    minutes: 3,
    kind: V6ExerciseKind.grounding,
    palette: V6PaletteId.focused,
    summary: "Use your senses to come back to the room you're in.",
    needs: 'Eyes open',
    steps: ['5 things you can see', '4 things you can feel', '3 things you can hear', '2 things you can smell', '1 thing you can taste'],
    benefits: ['Interrupts panic', 'Anchors you in the present'],
    tags: ['panic', 'grounding', 'anxious', 'overwhelmed'],
  ),
  V6Exercise(
    id: 'water-meditation',
    area: 'reset',
    group: 'Nature',
    title: 'Water Meditation',
    category: 'Nature',
    minutes: 7,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.focused,
    summary: 'Let a slow tide carry your thoughts out and back.',
    needs: 'Headphones',
    steps: const ['Listen for the waves', 'Breathe with the tide', 'Let thoughts drift out'],
    benefits: const ['Soothes overstimulation', 'Restores attention'],
    script: const [
      'Hear the water arrive. And leave.',
      'Breathe in as the wave rises.',
      'Breathe out as it pulls back to sea.',
      'Each thought is a leaf on the water.',
      'Watch it float away.',
    ],
    image: _img('photo-1518837695005-2083093ee35b'),
    tags: const ['nature', 'water', 'calm', 'ocean'],
  ),
  V6Exercise(
    id: 'forest-meditation',
    area: 'reset',
    group: 'Nature',
    title: 'Misty Forest',
    category: 'Nature',
    minutes: 8,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.low,
    summary: 'Fog, pines and quiet. A walk without moving.',
    needs: 'Headphones',
    steps: const ['Picture the path', 'Feel the cool air', 'Rest by a tree'],
    benefits: const ['Calms the nervous system', 'Lifts low mood'],
    script: const [
      'The air is cool and smells of pine.',
      'Each step is soft on the moss.',
      'Mist moves between the trees, slow and unhurried.',
      'Lean against a trunk. Feel how steady it is.',
      'Borrow some of that steadiness.',
    ],
    image: _img('photo-1669669530583-f64e801e94ed'),
    tags: const ['nature', 'forest', 'low', 'calm'],
  ),
  V6Exercise(
    id: 'rain-reset',
    area: 'reset',
    group: 'Nature',
    title: 'Rain Reset',
    category: 'Nature',
    minutes: 5,
    kind: V6ExerciseKind.meditation,
    palette: V6PaletteId.restless,
    summary: 'Steady rain to wash out a noisy afternoon.',
    needs: 'Headphones',
    steps: const ['Listen to the rain', 'Match your breath to it', 'Let it rinse the day'],
    benefits: const ['Masks distractions', 'Softens irritability'],
    script: const [
      'Listen to the rain on glass.',
      'Every drop is one less thing to hold.',
      'Let your breath slow to the rhythm.',
      'The noise of the day gets quieter.',
    ],
    image: _img('photo-1515694346937-94d85e41e6f0'),
    tags: const ['rain', 'restless', 'irritable', 'nature'],
  ),
];

V6Exercise? v6Exercise(String? id) {
  for (final e in kV6Exercises) {
    if (e.id == id) return e;
  }
  return null;
}

class V6EnergyCenter {
  const V6EnergyCenter(this.id, this.name, this.focus, this.color, this.affirmation, this.exerciseId);
  final String id;
  final String name;
  final String focus;
  final Color color;
  final String affirmation;

  /// Short practice started from the energy-center sheet.
  final String exerciseId;
}

const kV6EnergyCenters = <V6EnergyCenter>[
  V6EnergyCenter('root', 'Root', 'Safety & grounding', Color(0xFFC2410C), 'I am safe. I am here.', 'grounding-54321'),
  V6EnergyCenter('sacral', 'Sacral', 'Creativity & flow', Color(0xFFEF7702), 'I let myself feel and create.', 'water-meditation'),
  V6EnergyCenter('solar', 'Solar Plexus', 'Confidence', Color(0xFFF0A55A), 'I trust my own strength.', 'box-breathing'),
  V6EnergyCenter('heart', 'Heart', 'Compassion', Color(0xFF34D399), 'I give and receive kindness.', 'anxiety-relief'),
  V6EnergyCenter('throat', 'Throat', 'Expression', Color(0xFF38BDF8), 'I speak with honesty and care.', 'long-exhale'),
  V6EnergyCenter('third-eye', 'Third Eye', 'Intuition', Color(0xFF8E7CD9), 'I listen to what I know.', 'increase-focus'),
  V6EnergyCenter('crown', 'Crown', 'Connection', Color(0xFFB9A3F0), 'I am part of something larger.', 'microcosmic-orbit'),
];

/// One line from Lucille for the current mood (Home card when the server has no suggestion yet).
const kV6LucilleNotes = <String, String>{
  'none': 'Whatever today brings, you can come back here to breathe.',
  'calm': 'Hold on to this softness. Notice what made it possible.',
  'energized': "Spend this spark on the thing you've been putting off.",
  'focused': 'Guard your clarity: one task, one lane, one hour.',
  'restless': "Restless energy wants a job. Let's give it a slow one.",
  'tired': 'Rest is productive too. Let today be lighter.',
  'low': "You showed up. That's enough for right now.",
};

/// Session suggested for a mood (check-in result, support sheet, Home fallback).
String v6ExerciseForMood(V6Mood? m) => switch (m) {
      V6Mood.restless => 'one-minute-reset',
      V6Mood.tired => 'long-exhale',
      V6Mood.low => 'long-exhale',
      V6Mood.focused => 'increase-focus',
      V6Mood.energized => 'box-breathing',
      V6Mood.calm => 'basic-breathing',
      null => 'basic-breathing',
    };
