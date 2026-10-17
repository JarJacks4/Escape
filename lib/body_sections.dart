// Body section content: Yoga, Pilates, Yang Style Tai Chi and Exercise, 10 moves each.
//
// To add a move: append a BodyMove to a section below. To show its 3D model, paste the
// GLB link into `models` (first = main model; a second entry becomes a "Start / End" switch
// in the move preview). A move with no models yet shows the steps without a 3D model.
// To add a whole section: add a BodySection to `kBodySections`; the Body page picks it up.

import 'package:flutter/material.dart';

import '/backend/schema/structs/index.dart';

const _cl = 'https://res.cloudinary.com/djm6axyxz/image/upload';

class BodyMove {
  const BodyMove(
    this.name,
    this.cue,
    this.steps, {
    this.seconds = 30,
    this.reps = 0,
    this.models = const [],
    this.stepLabels = const [],
  });

  final String name;
  final String cue; // one line, shown in the session screens
  final List<String> steps; // "How to do it", shown in the preview
  final int seconds;
  final int reps;
  final List<String> models; // GLB links, in step order
  final List<String> stepLabels; // labels for `models` (e.g. Start, End)
}

class BodySection {
  const BodySection(this.id, this.title, this.tagline, this.type, this.icon, this.color, this.moves);

  final String id;
  final String title;
  final String tagline;
  final String type; // shown on each move card
  final IconData icon;
  final Color color;
  final List<BodyMove> moves;

  List<MoveStructStruct> toStructs() => moves
      .map((m) => MoveStructStruct(
            name: m.name,
            moveType: type,
            durationSeconds: m.seconds,
            repCount: m.reps,
            cueText: m.cue,
            modelUrl: m.models.isEmpty ? '' : m.models.first,
            accentColor: color,
          ))
      .toList();
}

BodyMove? bodyMoveNamed(String? name) {
  if (name == null) return null;
  for (final s in kBodySections) {
    for (final m in s.moves) {
      if (m.name == name) return m;
    }
  }
  return null;
}

BodySection bodySectionById(String id) =>
    kBodySections.firstWhere((s) => s.id == id, orElse: () => kBodySections.first);

const kBodySections = <BodySection>[
  BodySection('yoga', 'Yoga', 'Strength, balance and calm', 'Yoga', Icons.self_improvement_rounded, Color(0xFF7C4DFF), [
    BodyMove('Mountain Pose', 'Stand tall, feet grounded, breathing slowly.', [
      'Stand with feet hip-width apart and weight even on both feet.',
      'Lengthen your spine and let your arms hang by your sides, palms forward.',
      'Soften your shoulders and breathe slowly through your nose.',
    ], seconds: 30),
    BodyMove('Cat-Cow', 'Move your spine with your breath.', [
      'Start on hands and knees, wrists under shoulders, knees under hips.',
      'Inhale: drop your belly and lift your chest and tailbone (Cow).',
      'Exhale: round your back and tuck your chin and tailbone (Cat).',
      'Flow between the two at the pace of your breath.',
    ], seconds: 45, reps: 8),
    BodyMove('Downward-Facing Dog', 'Press the floor away and lengthen your back.', [
      'From hands and knees, tuck your toes and lift your hips up and back.',
      'Spread your fingers wide and press firmly through your palms.',
      'Bend your knees as much as you need to keep your back long.',
      'Let your head hang between your arms and breathe.',
    ], seconds: 30),
    BodyMove("Child's Pose", 'Rest, fold forward and breathe.', [
      'Kneel and sit your hips back toward your heels.',
      'Fold forward and rest your forehead on the mat.',
      'Reach your arms forward or rest them by your feet.',
      'Breathe into your back for the whole hold.',
    ], seconds: 45),
    BodyMove('Warrior I', 'Strong legs, lifted chest, arms overhead.', [
      'Step one foot back about a leg-length, back foot turned out slightly.',
      'Bend your front knee over your ankle, hips facing forward.',
      'Reach your arms overhead and lift your chest.',
      'Hold, then switch sides.',
    ], seconds: 40),
    BodyMove('Warrior II', 'Open your hips and gaze over your front hand.', [
      'From a wide stance, turn your front foot out and bend that knee.',
      'Open your hips and chest to the side and stretch your arms out level.',
      'Look over your front fingertips and keep your shoulders relaxed.',
      'Hold, then switch sides.',
    ], seconds: 40),
    BodyMove('Tree Pose', 'Find your balance with a steady gaze.', [
      'Stand on one foot and place the other foot on your calf or inner thigh, never on the knee.',
      'Press foot and leg gently together and bring your hands to your chest.',
      'Fix your eyes on one still point and breathe.',
      'Switch sides.',
    ], seconds: 40),
    BodyMove('Cobra Pose', 'Open your chest and strengthen your back.', [
      'Lie on your belly with hands under your shoulders.',
      'Press into your hands and lift your chest, keeping your hips down.',
      'Keep your elbows slightly bent and shoulders away from your ears.',
      'Lower slowly when you are ready.',
    ], seconds: 30),
    BodyMove('Seated Forward Fold', 'Hinge from the hips and let your back lengthen.', [
      'Sit with legs straight out in front of you.',
      'Inhale and lengthen your spine.',
      'Exhale and hinge forward from the hips, hands on your legs.',
      'Stop where you feel a gentle stretch and breathe.',
    ], seconds: 45),
    BodyMove('Corpse Pose', 'Lie still and let your body settle.', [
      'Lie on your back with legs relaxed and arms by your sides, palms up.',
      'Close your eyes and let your breath return to normal.',
      'Relax your body part by part, from your feet up to your face.',
    ], seconds: 60),
  ]),
  BodySection('pilates', 'Pilates', 'Core control and posture', 'Pilates', Icons.accessibility_new_rounded, Color(0xFF2196F3), [
    BodyMove('The Hundred', 'Pump your arms and breathe steadily.', [
      'Lie on your back, lift your head and shoulders, and raise your legs to a tabletop or extend them.',
      'Reach your arms long by your sides, just off the mat.',
      'Pump your arms in small beats, inhaling for 5 beats and exhaling for 5.',
      'Stop and rest your head down if your neck tires.',
    ], seconds: 60),
    BodyMove('Roll Up', 'Peel your spine up and down, one bone at a time.', [
      'Lie flat with legs long and arms overhead.',
      'Inhale, bring your arms up, then exhale and curl your head, shoulders and spine off the mat.',
      'Reach over your legs, then slowly roll back down.',
    ], seconds: 40, reps: 6),
    BodyMove('Single Leg Circle', 'Draw a small circle with your leg and keep your hips still.', [
      'Lie on your back with one leg extended to the ceiling and the other long on the mat.',
      'Circle the raised leg across your body, down, out and up.',
      'Keep your pelvis steady. Do 5 one way, then reverse. Switch legs.',
    ], seconds: 60, reps: 5),
    BodyMove('Rolling Like a Ball', 'Round your back and rock smoothly.', [
      'Sit and hug your knees, heels near your seat, balanced on your tailbone.',
      'Tuck your chin and round your back.',
      'Inhale and roll back to your shoulder blades, exhale and roll back up to balance.',
    ], seconds: 40, reps: 8),
    BodyMove('Single Leg Stretch', 'Switch legs with a steady core.', [
      'Lie back with head and shoulders lifted, one knee hugged in and the other leg extended.',
      'Switch legs, drawing the other knee in.',
      'Keep your lower back anchored and breathe in a steady rhythm.',
    ], seconds: 45, reps: 10),
    BodyMove('Double Leg Stretch', 'Reach out long, then circle back in.', [
      'Lie back with head and shoulders lifted, knees hugged in.',
      'Inhale and stretch your arms overhead and legs out long.',
      'Exhale and circle your arms around to hug your knees back in.',
    ], seconds: 45, reps: 8),
    BodyMove('Spine Stretch Forward', 'Sit tall, then curl over an imaginary ball.', [
      'Sit tall with legs apart, flexed feet and arms reaching forward.',
      'Exhale and curl forward from the top of your head, scooping your belly in.',
      'Inhale and stack your spine back up tall.',
    ], seconds: 40, reps: 6),
    BodyMove('Shoulder Bridge', 'Lift your hips and keep your hips level.', [
      'Lie on your back with knees bent and feet flat, hip-width apart.',
      'Press into your feet and lift your hips one vertebra at a time.',
      'Hold, then slowly roll down from the upper back to the tailbone.',
    ], seconds: 40, reps: 8),
    BodyMove('Swan Prep', 'Lift your chest and lengthen your spine.', [
      'Lie on your belly with hands under your shoulders and legs together.',
      'Press into your hands and lift your chest, drawing your belly in.',
      'Keep your neck long, then lower slowly.',
    ], seconds: 40, reps: 6),
    BodyMove('Pilates Teaser Prep', 'Balance on your tailbone with a long spine.', [
      'Sit with knees bent, feet flat and hands behind your thighs.',
      'Lean back slightly with a long spine and lift one foot, then the other, into tabletop.',
      'Hold the balance, breathe, and lower with control.',
    ], seconds: 40),
  ]),
  BodySection('taichi', 'Tai Chi', 'Yang style, slow and flowing', 'Yang Style Tai Chi', Icons.waves_rounded, Color(0xFF1DE9B6), [
    BodyMove('Commencing Form', 'Raise and lower your arms with your breath.', [
      'Stand with feet shoulder-width apart, knees soft, weight even.',
      'Slowly raise your arms to shoulder height as you inhale.',
      'Bend your knees slightly and lower your hands as you exhale.',
    ], seconds: 45, reps: 3),
    BodyMove("Parting the Wild Horse's Mane", 'Shift your weight and part your hands like a mane.', [
      'Turn your waist and hold an imaginary ball, then step out to the side.',
      'Shift your weight forward as one hand rises and the other presses down.',
      'Keep the movement smooth and continuous. Repeat on the other side.',
    ], seconds: 60, reps: 3),
    BodyMove('White Crane Spreads Its Wings', 'Lift one hand high and sink the other low.', [
      'Shift your weight onto your back leg with your hands crossed in front.',
      'Rise slightly as one hand lifts to forehead height and the other presses down.',
      'Place your front foot lightly, heel up, and keep your chest relaxed.',
    ], seconds: 45),
    BodyMove('Brush Knee',
        'Free up the lower spine and balance the left and right sides of the body.',
        [
          'Turn your waist and sweep one hand down in front of your knee.',
          'Step forward as the other hand pushes forward at chest height.',
          'Keep your shoulders loose and your back upright. Repeat on the other side.',
        ],
        seconds: 60,
        reps: 3,
        models: ['$_cl/v1787557244/Jared_tai_Chi_form1_animation_mtt13b.glb']),
    BodyMove('Play the Lute', 'Hold a gentle posture, hands as if holding a lute.', [
      'Shift your weight back and bring your front foot in, heel on the floor.',
      'Hold your hands in front of you, one forward and one at your elbow.',
      'Sit into your back leg and keep your breathing slow.',
    ], seconds: 45),
    BodyMove('Repulse Monkey', 'Step back gently while your hands flow forward and back.', [
      'Turn your palm up and draw one hand back as the other pushes forward.',
      'Step back softly with your toes first, then shift your weight.',
      'Alternate sides, moving slowly and smoothly.',
    ], seconds: 60, reps: 4),
    BodyMove("Grasp the Bird's Tail (Left)", 'Ward off, roll back, press and push.', [
      'Sweep one arm up in a rounded shape to ward off.',
      'Shift back and roll both hands down and back.',
      'Press forward with your hands together, then separate and push gently.',
    ], seconds: 75),
    BodyMove("Grasp the Bird's Tail (Right)", 'The same flow on the other side.', [
      'Turn and repeat the ward off with the other arm.',
      'Shift back to roll, then forward to press.',
      'Separate your hands, sit back, then push gently forward.',
    ], seconds: 75),
    BodyMove('Single Whip', 'Hook one hand, open the other.', [
      'Make a loose hook with one hand and extend it out to the side.',
      'Step to the side with the other foot and turn your palm outward.',
      'Sink your weight and keep your shoulders relaxed.',
    ], seconds: 45),
    BodyMove('Wave Hands Like Clouds', 'Shift side to side while your hands circle.', [
      'Stand with feet shoulder-width apart and shift your weight to one side.',
      'Let your hands circle in front of you like passing clouds as you turn your waist.',
      'Side-step slowly and keep your eyes following your leading hand.',
    ], seconds: 75, reps: 6),
  ]),
  BodySection('exercise', 'Exercise', 'Strength and cardio basics', 'Exercise', Icons.fitness_center_rounded, Color(0xFFFF9800), [
    BodyMove('Arm Stretching', 'Warm up your shoulders slowly and gently.', [
      'Stand tall and reach one arm across your chest.',
      'Hold it with the other arm and breathe.',
      'Swap sides, then reach both arms overhead. Do not force any stretch.',
    ], seconds: 20, models: ['$_cl/v1787561554/Arm_Stretching_kreq6h.glb']),
    BodyMove('Jumping Jacks', 'Jump your feet out and your arms up, then back in.', [
      'Stand with feet together and arms by your sides.',
      'Jump your feet apart as your arms sweep overhead.',
      'Jump back to the start. Land softly on the balls of your feet.',
    ], seconds: 30, reps: 20),
    BodyMove('Air Squat', 'Sit your hips back and keep your chest up.', [
      'Stand with feet shoulder-width apart.',
      'Sit your hips back and down as if sitting into a chair.',
      'Keep your chest up and knees over your toes.',
      'Push through your feet to stand tall.',
    ], seconds: 30, reps: 10, models: ['$_cl/v1787561551/Air_Squat_kkpmkk.glb']),
    BodyMove('Air Squat Bent Arms', 'Bend your arms in front and lower into a squat.', [
      'Bend your elbows and hold your hands in front of your chest.',
      'Lower into a squat with your chest up.',
      'Push through your feet to stand.',
    ], seconds: 30, reps: 10, models: ['$_cl/v1787561556/Air_Squat_Bent_Arms_gmcqhz.glb']),
    BodyMove('Overhead Squat', 'Keep your arms extended overhead as you squat.', [
      'Stand with feet slightly wider than shoulders and arms overhead.',
      'Lower into a squat while keeping your arms straight and ribs down.',
      'Stand back up tall. Reduce your depth if your back arches.',
    ], seconds: 30, reps: 10, models: ['$_cl/v1787561551/Air_Squat_kkpmkk.glb']),
    BodyMove('Push-Up', 'Lower your chest to the floor and press back up.', [
      'Start in a high plank with hands under your shoulders.',
      'Lower your chest toward the floor, elbows about 45 degrees from your body.',
      'Press back up, keeping your body in one line. Drop to your knees if needed.',
    ], seconds: 30, reps: 8),
    BodyMove('Reverse Lunge', 'Step back and lower your back knee.', [
      'Stand tall with hands on your hips.',
      'Step one foot back and lower until both knees are bent.',
      'Push through your front heel to return. Alternate legs.',
    ], seconds: 40, reps: 10),
    BodyMove('Plank', 'Hold a strong line from head to heels.', [
      'Place your hands or forearms on the floor under your shoulders.',
      'Extend your legs behind you with your toes tucked.',
      'Keep your core tight and your hips level. Breathe steadily.',
      'Lower your knees to finish.',
    ], seconds: 30, models: [
      '$_cl/v1787561551/Start_Plank_s4cawo.glb',
      '$_cl/v1787561545/End_Plank_h6i41h.glb',
    ], stepLabels: ['Start', 'End']),
    BodyMove('Burpee', 'Drop, jump back, then jump up with energy.', [
      'Stand tall, then squat and place your hands on the floor.',
      'Jump or step your feet back into a plank.',
      'Return your feet to your hands and jump up with your arms overhead.',
      'Slow the pace to a step version if you need to.',
    ], seconds: 30, reps: 6, models: [
      '$_cl/v1787561553/Burpee_Start_d3yy9m.glb',
      '$_cl/v1787561553/Burpee_End_q5qvjj.glb',
    ], stepLabels: ['Start', 'End']),
    BodyMove('Glute Bridge', 'Lift your hips and squeeze your glutes.', [
      'Lie on your back with knees bent and feet flat.',
      'Press through your heels and lift your hips until your body is in a line.',
      'Squeeze at the top, then lower slowly.',
    ], seconds: 40, reps: 12),
  ]),
];

/// A Body page collection ("Morning Mobility"…): hand-picked moves from the sections above,
/// shown as their own group under the collection's name. Before this the collection card
/// opened the session with whatever was left in today's list (the old mixed default), so
/// moves from every category showed up together.
BodySection bodyCollection(String id, String title, String tagline, IconData icon,
    Color color, List<String> moveNames) {
  final moves = <BodyMove>[
    for (final n in moveNames)
      if (bodyMoveNamed(n) != null) bodyMoveNamed(n)!,
  ];
  return BodySection(id, title, tagline, title, icon, color, moves);
}

final kMorningMobility = bodyCollection(
  'morning_mobility',
  'Morning Mobility',
  'Start your body gently',
  Icons.wb_sunny_rounded,
  const Color(0xFFFFB74D),
  const [
    'Mountain Pose',
    'Cat-Cow',
    'Arm Stretching',
    'Commencing Form',
    'Wave Hands Like Clouds',
    'Downward-Facing Dog',
    'Tree Pose',
    "Child's Pose",
  ],
);
