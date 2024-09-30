import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final containerWlqc10m7 = GlobalKey();

/// Meditation Walkthrough
///
/// With our self-care streaming, we have made it easier for you to browse our videos and content. Tap one of the icons to see more content on our Meditation and even Body page below!
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Meditation Bar: With our self-care streaming, we have made it easier for you to browse our videos and content. Tap one of the icons to see more content on our Meditation and even Body page below!
      TargetFocus(
        keyTarget: containerWlqc10m7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughCompWidget(),
          ),
        ],
      ),
    ];
