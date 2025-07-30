import '/components/customdrawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_copy_widget.dart' show CommunityHomeCopyWidget;
import 'package:flutter/material.dart';

class CommunityHomeCopyModel extends FlutterFlowModel<CommunityHomeCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customdrawer component.
  late CustomdrawerModel customdrawerModel;

  @override
  void initState(BuildContext context) {
    customdrawerModel = createModel(context, () => CustomdrawerModel());
  }

  @override
  void dispose() {
    customdrawerModel.dispose();
  }
}
