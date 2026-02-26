import '/components/set_goals_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'self_care_goals_version5_widget.dart' show SelfCareGoalsVersion5Widget;
import 'package:flutter/material.dart';

class SelfCareGoalsVersion5Model
    extends FlutterFlowModel<SelfCareGoalsVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for SetGoalsComp component.
  late SetGoalsCompModel setGoalsCompModel;

  @override
  void initState(BuildContext context) {
    setGoalsCompModel = createModel(context, () => SetGoalsCompModel());
  }

  @override
  void dispose() {
    setGoalsCompModel.dispose();
  }
}
