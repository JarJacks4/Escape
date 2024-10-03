import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final containerHvg4gmsi = GlobalKey();

/// Provider Community Walkthrough
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Community Tab Bar: Being a subscriber, we want our users to be able to have an easy path to sharing their definition of self-care. Tap or swipe the Tab Bar below to explore our different sections of the Provider Community of Escape!
      TargetFocus(
        keyTarget: containerHvg4gmsi,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughCompWidget(),
          ),
        ],
      ),
    ];
