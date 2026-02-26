import '/components/community_guidelines_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_guidelines_widget.dart' show CommunityGuidelinesWidget;
import 'package:flutter/material.dart';

class CommunityGuidelinesModel
    extends FlutterFlowModel<CommunityGuidelinesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CommunityGuidelinesComp component.
  late CommunityGuidelinesCompModel communityGuidelinesCompModel;

  @override
  void initState(BuildContext context) {
    communityGuidelinesCompModel =
        createModel(context, () => CommunityGuidelinesCompModel());
  }

  @override
  void dispose() {
    communityGuidelinesCompModel.dispose();
  }
}
