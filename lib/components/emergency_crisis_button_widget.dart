import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emergency_crisis_button_model.dart';
export 'emergency_crisis_button_model.dart';

class EmergencyCrisisButtonWidget extends StatefulWidget {
  const EmergencyCrisisButtonWidget({super.key});

  @override
  State<EmergencyCrisisButtonWidget> createState() =>
      _EmergencyCrisisButtonWidgetState();
}

class _EmergencyCrisisButtonWidgetState
    extends State<EmergencyCrisisButtonWidget> {
  late EmergencyCrisisButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencyCrisisButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '6iwusxm3' /* 24/7 Crisis Hotline */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'WorkSans',
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'w4s3eykh' /* If you're experiencing a crisi... */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'WorkSans',
                      letterSpacing: 0.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  '0ahlgm2u' /* Call Now: 1-800-273-8255 */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent1,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
