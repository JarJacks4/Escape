import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/intro_walkthrough1_widget.dart';
import '/components/intro_walkthrough2_widget.dart';
import '/components/intro_walkthrough3_widget.dart';
import '/components/intro_walkthrough4_widget.dart';
import '/components/intro_walkthrough5_widget.dart';
import '/components/intro_walkthrough6_widget.dart';
import '/components/intro_walkthrough7_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final rowF58gzr5e = GlobalKey();
final containerQxoadm15 = GlobalKey();
final container42rk8lms = GlobalKey();
final containerIurmljfr = GlobalKey();
final buttonUkofocq2 = GlobalKey();
final lottieAnimationOiibrsns = GlobalKey();
final containerI9znmkfb = GlobalKey();

/// Intro Walkthrough
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Intro 1
      TargetFocus(
        keyTarget: rowF58gzr5e,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Color(0x461C2444),
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => IntroWalkthrough1Widget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerQxoadm15,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.Circle,
        color: Color(0xE31C2444),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroWalkthrough2Widget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: container42rk8lms,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroWalkthrough3Widget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerIurmljfr,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroWalkthrough4Widget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: buttonUkofocq2,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroWalkthrough5Widget(),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: lottieAnimationOiibrsns,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => IntroWalkthrough6Widget(),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: containerI9znmkfb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroWalkthrough7Widget(),
          ),
        ],
      ),
    ];
