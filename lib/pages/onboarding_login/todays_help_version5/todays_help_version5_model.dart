import '/components/todays_help_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'todays_help_version5_widget.dart' show TodaysHelpVersion5Widget;
import 'package:flutter/material.dart';

class TodaysHelpVersion5Model
    extends FlutterFlowModel<TodaysHelpVersion5Widget> {
  ///  Local state fields for this page.

  String? profilePicture;

  bool interests = false;

  ///  State fields for stateful widgets in this page.

  // Model for TodaysHelpVersion5Comp component.
  late TodaysHelpVersion5CompModel todaysHelpVersion5CompModel;

  @override
  void initState(BuildContext context) {
    todaysHelpVersion5CompModel =
        createModel(context, () => TodaysHelpVersion5CompModel());
  }

  @override
  void dispose() {
    todaysHelpVersion5CompModel.dispose();
  }
}
