import '/components/community_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_new_widget.dart' show CommunityNewWidget;
import 'package:flutter/material.dart';

class CommunityNewModel extends FlutterFlowModel<CommunityNewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CommunityAppBar component.
  late CommunityAppBarModel communityAppBarModel;

  @override
  void initState(BuildContext context) {
    communityAppBarModel = createModel(context, () => CommunityAppBarModel());
  }

  @override
  void dispose() {
    communityAppBarModel.dispose();
  }
}
