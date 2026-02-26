import '/flutter_flow/flutter_flow_util.dart';
import 'habits_version5_widget.dart' show HabitsVersion5Widget;
import 'package:flutter/material.dart';

class HabitsVersion5Model extends FlutterFlowModel<HabitsVersion5Widget> {
  ///  State fields for stateful widgets in this component.

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
