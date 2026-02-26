import '/flutter_flow/flutter_flow_util.dart';
import 'mind_heart_chakra_version5_widget.dart'
    show MindHeartChakraVersion5Widget;
import 'package:flutter/material.dart';

class MindHeartChakraVersion5Model
    extends FlutterFlowModel<MindHeartChakraVersion5Widget> {
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
