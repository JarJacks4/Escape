import '/components/nav_button_center_n_e_w_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_version5_widget.dart' show CommunityHomeVersion5Widget;
import 'package:flutter/material.dart';

class CommunityHomeVersion5Model
    extends FlutterFlowModel<CommunityHomeVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavButtonCenterNEW component.
  late NavButtonCenterNEWModel navButtonCenterNEWModel;

  @override
  void initState(BuildContext context) {
    navButtonCenterNEWModel =
        createModel(context, () => NavButtonCenterNEWModel());
  }

  @override
  void dispose() {
    navButtonCenterNEWModel.dispose();
  }
}
