import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'movement_preview_header_model.dart';
export 'movement_preview_header_model.dart';

class MovementPreviewHeaderWidget extends StatefulWidget {
  const MovementPreviewHeaderWidget({
    super.key,
    String? subtitle,
    String? title,
  })  : this.subtitle = subtitle ?? '8 reps · unhurried',
        this.title = title ?? 'Gentle Burpee';

  final String subtitle;
  final String title;

  @override
  State<MovementPreviewHeaderWidget> createState() =>
      _MovementPreviewHeaderWidgetState();
}

class _MovementPreviewHeaderWidgetState
    extends State<MovementPreviewHeaderWidget> {
  late MovementPreviewHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovementPreviewHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.title,
                'Gentle Burpee',
              ),
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.subtitle,
                '8 reps · unhurried',
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodySmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    lineHeight: 1.5,
                  ),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
        FlutterFlowIconButton(
          borderRadius: 9999.0,
          buttonSize: 40.0,
          fillColor: Color(0xFFE1E4F0),
          icon: Icon(
            Icons.close_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
          onPressed: () async {
            logFirebaseEvent('MOVEMENT_PREVIEW_HEADER_IconButton_ON_TA');
            logFirebaseEvent('IconButton_bottom_sheet');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
