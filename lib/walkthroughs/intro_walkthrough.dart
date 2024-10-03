import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final containerZevhydwe = GlobalKey();
final containerT7xx1zl4 = GlobalKey();

/// Intro Walkthrough
///
/// Walkthrough to help the initial user know what Escape is!
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Home Page Intro: Welcome to Escape! We are glad to have you and want to start you off by showing you how to navigate our self-care app. Tap the menu button on the upper left for the User's Menu. Tap the Escape Icon to always revert back to the home page!
      TargetFocus(
        keyTarget: containerZevhydwe,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughCompWidget(),
          ),
        ],
      ),

      /// App Navigation: Below, we have our Navigation Menu where you can start or continue escaping into your own world! Tap or swipe to see what else we have to offer our users!
      TargetFocus(
        keyTarget: containerT7xx1zl4,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, __) => const WalkthroughCompWidget(),
          ),
        ],
      ),
    ];
