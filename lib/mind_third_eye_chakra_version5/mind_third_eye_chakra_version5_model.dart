import '/flutter_flow/flutter_flow_util.dart';
import 'mind_third_eye_chakra_version5_widget.dart'
    show MindThirdEyeChakraVersion5Widget;
import 'package:flutter/material.dart';

class MindThirdEyeChakraVersion5Model
    extends FlutterFlowModel<MindThirdEyeChakraVersion5Widget> {
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
