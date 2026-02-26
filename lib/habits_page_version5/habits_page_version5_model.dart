import '/components/habits_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'habits_page_version5_widget.dart' show HabitsPageVersion5Widget;
import 'package:flutter/material.dart';

class HabitsPageVersion5Model
    extends FlutterFlowModel<HabitsPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for habitsVersion5 component.
  late HabitsVersion5Model habitsVersion5Model;

  @override
  void initState(BuildContext context) {
    habitsVersion5Model = createModel(context, () => HabitsVersion5Model());
  }

  @override
  void dispose() {
    habitsVersion5Model.dispose();
  }
}
