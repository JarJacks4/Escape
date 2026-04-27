import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/intro_walkthrough1_version5_widget.dart';
import '/components/intro_walkthrough2_version5_widget.dart';
import '/components/intro_walkthrough3_version5_widget.dart';
import '/components/intro_walkthrough4_version5_widget.dart';
import '/components/intro_walkthrough5_version5_widget.dart';
import '/components/intro_walkthrough6_version5_widget.dart';

// Focus widget keys for this walkthrough
final imageYxunjfxe = GlobalKey();
final rowCrlyk2v5 = GlobalKey();
final rowWy6kwc96 = GlobalKey();
final buttonUkofocq2 = GlobalKey();
final containerI9znmkfb = GlobalKey();
final container54qb5m7w = GlobalKey();

/// Intro Walkthrough
List<TargetFocus> createWalkthroughTargets(BuildContext context) {
  debugPrint('>>> rowCrlyk2v5 context: ${rowCrlyk2v5.currentContext}');
  debugPrint('>>> rowWy6kwc96 context: ${rowWy6kwc96.currentContext}');
  debugPrint('>>> buttonUkofocq2 context: ${buttonUkofocq2.currentContext}');
  debugPrint(
      '>>> containerI9znmkfb context: ${containerI9znmkfb.currentContext}');
  debugPrint(
      '>>> container54qb5m7w context: ${container54qb5m7w.currentContext}');
  debugPrint('>>> imageYxunjfxe context: ${imageYxunjfxe.currentContext}');

  final rowBox = rowCrlyk2v5.currentContext?.findRenderObject() as RenderBox?;
  final rowPos = rowBox?.localToGlobal(Offset.zero);
  final rowSize = rowBox?.size;
  debugPrint('>>> rowCrlyk2v5 position: $rowPos, size: $rowSize');

  return [
    /// Intro 1
    TargetFocus(
      keyTarget: rowCrlyk2v5,
      enableOverlayTab: true,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      color: Color(0x461C2444),
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, __) => IntroWalkthrough1Version5Widget(),
        ),
      ],
    ),

    /// Step 2
    TargetFocus(
      keyTarget: imageYxunjfxe,
      enableOverlayTab: true,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      color: Color(0x461C2444),
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, __) => IntroWalkthrough2Version5Widget(),
        ),
      ],
    ),

    /// Step 3
    TargetFocus(
      keyTarget: rowWy6kwc96,
      enableOverlayTab: true,
      alignSkip: Alignment.bottomCenter,
      shape: ShapeLightFocus.RRect,
      color: Color(0x461C2444),
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, __) => IntroWalkthrough3Version5Widget(),
        ),
      ],
    ),

    /// Step 4
    TargetFocus(
      keyTarget: buttonUkofocq2,
      enableOverlayTab: true,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.Circle,
      color: Color(0x461C2444),
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, __) => IntroWalkthrough4Version5Widget(),
        ),
      ],
    ),

    /// Step 5
    TargetFocus(
      keyTarget: containerI9znmkfb,
      enableOverlayTab: true,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      color: Color(0x461C2444),
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, __) => IntroWalkthrough5Version5Widget(),
        ),
      ],
    ),

    /// Step 6
    TargetFocus(
      keyTarget: container54qb5m7w,
      enableOverlayTab: true,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      color: Color(0x461C2444),
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, __) => IntroWalkthrough6Version5Widget(),
        ),
      ],
    ),
  ];
}
