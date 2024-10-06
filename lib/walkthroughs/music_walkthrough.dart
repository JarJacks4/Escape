import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_music_comp_widget.dart';
import '/components/walkthrough_more_content_music_comp_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final iconButtonFq6fwln9 = GlobalKey();
final listViewN9pdskrq = GlobalKey();

/// Music Walkthrough
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Cancel Button: Use this button to go back or exit out of our video page. Enjoy!
      TargetFocus(
        keyTarget: iconButtonFq6fwln9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughMusicCompWidget(),
          ),
        ],
      ),

      /// New Videos: Tap here to see more of the content we have available for you!
      TargetFocus(
        keyTarget: listViewN9pdskrq,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) =>
                const WalkthroughMoreContentMusicCompCopyWidget(),
          ),
        ],
      ),
    ];
