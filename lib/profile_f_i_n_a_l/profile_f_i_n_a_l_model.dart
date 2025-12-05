import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_f_i_n_a_l_widget.dart' show ProfileFINALWidget;
import 'package:flutter/material.dart';

class ProfileFINALModel extends FlutterFlowModel<ProfileFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
