import '/components/yoga_poses_sounds_comp/yoga_poses_sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'yoga_pose_videos_widget.dart' show YogaPoseVideosWidget;
import 'package:flutter/material.dart';

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
