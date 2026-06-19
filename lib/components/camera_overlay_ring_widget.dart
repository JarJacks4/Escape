import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'camera_overlay_ring_model.dart';
export 'camera_overlay_ring_model.dart';

class CameraOverlayRingWidget extends StatefulWidget {
  const CameraOverlayRingWidget({super.key});

  @override
  State<CameraOverlayRingWidget> createState() =>
      _CameraOverlayRingWidgetState();
}

class _CameraOverlayRingWidgetState extends State<CameraOverlayRingWidget> {
  late CameraOverlayRingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraOverlayRingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 280.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Container(
            width: 280.0,
            height: 280.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Color(0x4DFFFFFF),
                width: 2.0,
              ),
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 240.0,
                height: 240.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 4.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.person_outline_rounded,
              color: Color(0x66FFFFFF),
              size: 120.0,
            ),
          ),
        ],
      ),
    );
  }
}
