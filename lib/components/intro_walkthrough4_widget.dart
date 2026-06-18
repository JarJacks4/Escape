import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro_walkthrough4_model.dart';
export 'intro_walkthrough4_model.dart';

class IntroWalkthrough4Widget extends StatefulWidget {
  const IntroWalkthrough4Widget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<IntroWalkthrough4Widget> createState() =>
      _IntroWalkthrough4WidgetState();
}

class _IntroWalkthrough4WidgetState extends State<IntroWalkthrough4Widget> {
  late IntroWalkthrough4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroWalkthrough4Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                ).image,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 80.0,
                  color: Color(0x75EDF1F7),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 20.0,
                )
              ],
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).secondary
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(1.0, 1.0),
                end: AlignmentDirectional(-1.0, -1.0),
              ),
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: Color(0x75EDF1F7),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 40.0,
                  sigmaY: 40.0,
                ),
                child: Container(
                  width: 117.6,
                  height: 100.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 80.0,
                        color: Color(0x75EDF1F7),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        spreadRadius: 20.0,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0x3CEDF1F7),
                        Color(0x3FD0E3F7),
                        Color(0x82673AB7)
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: AlignmentDirectional(1.0, -0.64),
                      end: AlignmentDirectional(-1.0, 0.64),
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x33FFFFFF),
                              icon: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'INTRO_WALKTHROUGH4_close_rounded_ICN_ON_');
                                logFirebaseEvent('IconButton_haptic_feedback');
                                HapticFeedback.lightImpact();
                                logFirebaseEvent('IconButton_dismiss_dialog');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'snvdxk35' /* Your Progress, Your Story */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'huzqly5f' /* I keep track of your journey i... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedDefaultTextStyle(
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                              duration: Duration(milliseconds: 465),
                              curve: Curves.easeIn,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'iu0fqizj' /* 4 of 7 */,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
