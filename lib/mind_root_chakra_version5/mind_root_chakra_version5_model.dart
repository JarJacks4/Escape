import '/flutter_flow/flutter_flow_util.dart';
import 'mind_root_chakra_version5_widget.dart'
    show MindRootChakraVersion5Widget;
import 'package:flutter/material.dart';

class MindRootChakraVersion5Model
    extends FlutterFlowModel<MindRootChakraVersion5Widget> {
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
