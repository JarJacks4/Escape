import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mood_saver_component_model.dart';
export 'mood_saver_component_model.dart';

/// New Component Gen
class MoodSaverComponentWidget extends StatefulWidget {
  const MoodSaverComponentWidget({super.key});

  @override
  State<MoodSaverComponentWidget> createState() =>
      _MoodSaverComponentWidgetState();
}

class _MoodSaverComponentWidgetState extends State<MoodSaverComponentWidget> {
  late MoodSaverComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodSaverComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 22.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'z431hkoa' /* Notice your state. */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).displaySmall.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 36.0,
                    letterSpacing: 8.0,
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).displaySmall.fontStyle,
                    lineHeight: 2.0,
                  ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'hy1yzk2m' /* Save Mood */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 56.0,
                  padding: EdgeInsets.all(12.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x4F1A2942),
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    shadows: [
                      Shadow(
                        color: Color(0xAF39519F),
                        offset: Offset(1.0, 2.0),
                        blurRadius: 22.0,
                      )
                    ],
                  ),
                  elevation: 1.0,
                  borderSide: BorderSide(
                    color: Color(0x4864C8FF),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                  hoverColor: Color(0x6139519F),
                  hoverBorderSide: BorderSide(
                    color: Color(0x4E4D6CD0),
                    width: 1.0,
                  ),
                  hoverElevation: 3.0,
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'e7gehqun' /* Finish */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 56.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x7139519F),
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  elevation: 1.0,
                  borderSide: BorderSide(
                    color: Color(0x2864C8FF),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                  hoverColor: Color(0x6139519F),
                  hoverBorderSide: BorderSide(
                    color: Color(0x4D2679AC),
                    width: 1.0,
                  ),
                  hoverElevation: 2.0,
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ].divide(SizedBox(height: 48.0)),
      ),
    );
  }
}
