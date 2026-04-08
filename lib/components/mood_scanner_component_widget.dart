import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_scanner_component_model.dart';
export 'mood_scanner_component_model.dart';

/// New Component Gen
class MoodScannerComponentWidget extends StatefulWidget {
  const MoodScannerComponentWidget({super.key});

  @override
  State<MoodScannerComponentWidget> createState() =>
      _MoodScannerComponentWidgetState();
}

class _MoodScannerComponentWidgetState
    extends State<MoodScannerComponentWidget> {
  late MoodScannerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodScannerComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 13.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A2535),
                      borderRadius: BorderRadius.circular(22.0),
                      border: Border.all(
                        color: Color(0xFF2A3A4A),
                        width: 1.0,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MOOD_SCANNER_COMPONENT_Icon_rtfj1u1e_ON_');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 32.0, 18.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'l3vvlxz7' /* Mood Scanner */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'The Seasons',
                                color: Colors.white,
                                fontSize: 24.0,
                                letterSpacing: 4.0,
                                fontWeight: FontWeight.w300,
                                lineHeight: 2.0,
                              ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'f48e7v7k' /* Take a breath and let's check ... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: Color(0xFF8899AA),
                            letterSpacing: 0.5,
                            lineHeight: 2.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
              child: Container(
                width: 300.0,
                height: 300.0,
                child: Stack(
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150.0),
                      ),
                      child: Container(
                        width: 350.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Color(0x8D1A1F3A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 14.0,
                              color: FlutterFlowTheme.of(context).tertiary,
                              offset: Offset(
                                2.0,
                                2.0,
                              ),
                              spreadRadius: 3.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(150.0),
                          border: Border.all(
                            color: Color(0x772AD4D4),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xFF2AD4D4),
                            size: 63.0,
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'wmei1laa' /* Simulated mode */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xFF8899AA),
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.85),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.85),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.85, 0.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.85, 0.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.6, -0.7),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.6, -0.7),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.6, 0.7),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.6, 0.7),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF2AD4D4),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 21.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'MOOD_SCANNER_COMPONENT_SCAN_MOOD_BTN_ON_');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(MoodResultPageWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'wkaq0koy' /* Scan Mood */,
                    ),
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 63.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: Color(0xFF2AD4D4),
                      color: Color(0x891A2535),
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                letterSpacing: 4.0,
                                fontWeight: FontWeight.w300,
                                shadows: [
                                  Shadow(
                                    color: Color(0x6939519F),
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                                lineHeight: 2.0,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xFF2A3A4A),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(28.0),
                      hoverColor: Color(0x7739519F),
                      hoverBorderSide: BorderSide(
                        color: Color(0xA939519F),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 0.0)),
        ),
      ),
    );
  }
}
