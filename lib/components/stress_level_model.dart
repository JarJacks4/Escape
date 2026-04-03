import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'stress_level_widget.dart' show StressLevelWidget;
import 'package:flutter/material.dart';

class StressLevelModel extends FlutterFlowModel<StressLevelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ModeratelyStressed widget.
  FormFieldController<String>? moderatelyStressedValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get moderatelyStressedValue =>
      moderatelyStressedValueController?.value;
}
