import '/flutter_flow/flutter_flow_util.dart';
import 'mind_crown_chakra_version5_widget.dart'
    show MindCrownChakraVersion5Widget;
import 'package:flutter/material.dart';

class MindCrownChakraVersion5Model
    extends FlutterFlowModel<MindCrownChakraVersion5Widget> {
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
