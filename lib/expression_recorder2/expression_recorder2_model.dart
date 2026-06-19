import '/components/camera_overlay_ring_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'expression_recorder2_widget.dart' show ExpressionRecorder2Widget;
import 'package:flutter/material.dart';

class ExpressionRecorder2Model
    extends FlutterFlowModel<ExpressionRecorder2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CameraOverlayRing.
  late CameraOverlayRingModel cameraOverlayRingModel;

  @override
  void initState(BuildContext context) {
    cameraOverlayRingModel =
        createModel(context, () => CameraOverlayRingModel());
  }

  @override
  void dispose() {
    cameraOverlayRingModel.dispose();
  }
}
