import '/components/profile_page_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_f_i_n_a_l_widget.dart' show ProfileFINALWidget;
import 'package:flutter/material.dart';

class ProfileFINALModel extends FlutterFlowModel<ProfileFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for ProfilePageVersion5 component.
  late ProfilePageVersion5Model profilePageVersion5Model;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    profilePageVersion5Model =
        createModel(context, () => ProfilePageVersion5Model());
  }

  @override
  void dispose() {
    columnController?.dispose();
    profilePageVersion5Model.dispose();
  }
}
