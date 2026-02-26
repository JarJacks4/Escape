import '/components/community_guidelines_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_guidelines_copy_widget.dart'
    show CommunityGuidelinesCopyWidget;
import 'package:flutter/material.dart';

class CommunityGuidelinesCopyModel
    extends FlutterFlowModel<CommunityGuidelinesCopyWidget> {
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
