import '/components/button7_widget.dart';
import '/components/instruction_box_widget.dart';
import '/components/movement_preview_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'movement_bottom_sheet1_model.dart';
export 'movement_bottom_sheet1_model.dart';

class MovementBottomSheet1Widget extends StatefulWidget {
  const MovementBottomSheet1Widget({
    super.key,
    this.moveName,
    this.cueText,
    this.modelUrl,
    this.accentColor,
    this.duration,
  });

  final String? moveName;
  final String? cueText;
  final String? modelUrl;
  final Color? accentColor;
  final int? duration;

  @override
  State<MovementBottomSheet1Widget> createState() =>
      _MovementBottomSheet1WidgetState();
}

class _MovementBottomSheet1WidgetState
    extends State<MovementBottomSheet1Widget> {
  late MovementBottomSheet1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovementBottomSheet1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Container(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 32.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(9999.0),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.movementPreviewHeaderModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: MovementPreviewHeaderWidget(
                  subtitle: widget.duration?.toString(),
                  title: widget.moveName,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(24.0),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      ClipRect(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 40.0,
                            sigmaY: 40.0,
                          ),
                          child: Container(
                            width: 296.8,
                            height: 223.7,
                            decoration: BoxDecoration(
                              color: Color(0x4D96C8BF),
                              borderRadius: BorderRadius.circular(9999.0),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 171.62,
                        height: 178.3,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              FlutterFlowTheme.of(context).secondary,
                              Color(0x9996C8BF)
                            ],
                            stops: [0.0, 1.0],
                            center: Alignment(0.0, 0.0),
                            radius: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(9999.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.VectaryModelViewer(
                            width: double.infinity,
                            height: double.infinity,
                            assetPath: widget.modelUrl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.instructionBoxModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: InstructionBoxWidget(
                  instruction: widget.cueText,
                ),
              ),
              Spacer(),
              wrapWithModel(
                model: _model.buttonModel,
                updateCallback: () => safeSetState(() {}),
                child: Button7Widget(
                  icon: false,
                  iconPresent: false,
                  iconEnd: false,
                  iconEndPresent: false,
                  content: 'Got it',
                  variant: 'primary',
                  size: 'large',
                  fullWidth: true,
                  loading: false,
                  disabled: false,
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
