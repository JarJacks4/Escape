import '/components/camera_overlay_ring_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'expression_recorder_camera_comp_widget.dart'
    show ExpressionRecorderCameraCompWidget;
import 'package:flutter/material.dart';

class ExpressionRecorderCameraCompModel
    extends FlutterFlowModel<ExpressionRecorderCameraCompWidget> {
  ///  State fields for stateful widgets in this component.

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
