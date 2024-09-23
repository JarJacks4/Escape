import '/components/yoga_poses_sounds_comp/yoga_poses_sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'yoga_pose_videos_widget.dart' show YogaPoseVideosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YogaPoseVideosModel extends FlutterFlowModel<YogaPoseVideosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for YogaPosesSoundsComp component.
  late YogaPosesSoundsCompModel yogaPosesSoundsCompModel;

  @override
  void initState(BuildContext context) {
    yogaPosesSoundsCompModel =
        createModel(context, () => YogaPosesSoundsCompModel());
  }

  @override
  void dispose() {
    yogaPosesSoundsCompModel.dispose();
  }
}
