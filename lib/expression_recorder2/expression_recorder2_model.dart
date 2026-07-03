import '/components/expression_recorder_camera_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'expression_recorder2_widget.dart' show ExpressionRecorder2Widget;
import 'package:flutter/material.dart';

class ExpressionRecorder2Model
    extends FlutterFlowModel<ExpressionRecorder2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for ExpressionRecorderCameraComp component.
  late ExpressionRecorderCameraCompModel expressionRecorderCameraCompModel;

  @override
  void initState(BuildContext context) {
    expressionRecorderCameraCompModel =
        createModel(context, () => ExpressionRecorderCameraCompModel());
  }

  @override
  void dispose() {
    expressionRecorderCameraCompModel.dispose();
  }
}
