import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'coaching_session_model.dart';
export 'coaching_session_model.dart';

/// New Component Gen
class CoachingSessionWidget extends StatefulWidget {
  const CoachingSessionWidget({super.key});

  @override
  State<CoachingSessionWidget> createState() => _CoachingSessionWidgetState();
}

class _CoachingSessionWidgetState extends State<CoachingSessionWidget> {
  late CoachingSessionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachingSessionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 48.0, 16.0, 0.0),
                    child: Container(
                      width: 80.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x5E1A2942),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ddrv6io4' /* 0:04 */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                    child: Container(
                      width: 140.0,
                      height: 91.3,
                      decoration: BoxDecoration(
                        color: Color(0x8C1A2942),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 9.0,
                            color: Color(0x7139519F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                            spreadRadius: 4.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Color(0x4AD0E3F7),
                          width: 2.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'z35kmx1e' /* ALIGNMENT */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '4alui0ki' /* 66% */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: 200.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: Color(0xA01C2C62),
                              borderRadius: BorderRadius.circular(28.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).tertiary,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'prmsbe0s' /* Find Your  Center */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 2.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'COACHING_SESSION_END_SESSION_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(MoodSaverPageWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'imxzyglp' /* End Session */,
                          ),
                          icon: Icon(
                            FFIcons.kxCloseDelete,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 160.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x5B1C2444),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w300,
                                  shadows: [
                                    Shadow(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 4.0,
                                    )
                                  ],
                                  lineHeight: 2.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0xA61C2444),
                            ),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 556.0))
                    .addToStart(SizedBox(height: 12.0))
                    .addToEnd(SizedBox(height: 4.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
