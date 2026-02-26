import '/components/profile_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_version5_widget.dart' show ProfileVersion5Widget;
import 'package:flutter/material.dart';

class ProfileVersion5Model extends FlutterFlowModel<ProfileVersion5Widget> {
  ///  Local state fields for this page.

  String? newProfilePic;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for ProfileVersion5Comp component.
  late ProfileVersion5CompModel profileVersion5CompModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    profileVersion5CompModel =
        createModel(context, () => ProfileVersion5CompModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    profileVersion5CompModel.dispose();
  }
}
