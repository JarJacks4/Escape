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
import 'respiration_component_model.dart';
export 'respiration_component_model.dart';

/// New Component Gen
class RespirationComponentWidget extends StatefulWidget {
  const RespirationComponentWidget({
    super.key,
    String? respiration,
  }) : this.respiration = respiration ?? 'Exhale';

  final String respiration;

  @override
  State<RespirationComponentWidget> createState() =>
      _RespirationComponentWidgetState();
}

class _RespirationComponentWidgetState
    extends State<RespirationComponentWidget> {
  late RespirationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RespirationComponentModel());
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 220.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF0F1E2E),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 18.0,
                            color: FlutterFlowTheme.of(context).primaryText,
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Color(0xFF2A4A5A),
                          width: 1.0,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.respiration,
                              'Exhale',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: Color(0xFFC8E8F0),
                                  fontSize: 30.0,
                                  letterSpacing: 7.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 32.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xA60D1B2A),
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: Color(0xFF1E3A4A),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0D1B2A),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(14.0),
                              border: Border.all(
                                color: Color(0xFF1E3A4A),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chevron_left,
                                    color: Color(0xFFC8E8F0),
                                    size: 18.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'y2n71ziy' /* Slower */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Color(0xFFC8E8F0),
                                          letterSpacing: 1.0,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF0D1B2A),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7.0,
                                color: FlutterFlowTheme.of(context).alternate,
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                            border: Border.all(
                              color: Color(0xFF2A5A7A),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'sis8l1hk' /* Next Pose */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Color(0xFFC8E8F0),
                                        letterSpacing: 1.0,
                                        lineHeight: 1.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0D1B2A),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(14.0),
                              border: Border.all(
                                color: Color(0xFF1E3A4A),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ozk220a1' /* Faster */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Color(0xFFC8E8F0),
                                          letterSpacing: 1.0,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFFC8E8F0),
                                    size: 18.0,
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1A3A5A),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            color: Color(0xDD39519F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(
                          color: Color(0xFF2A5A7A),
                          width: 1.0,
                        ),
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'RESPIRATION_COMPONENT_ENABLE_COACHING_BT');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            CoachingSessionPageWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'zo5sk8kz' /* Enable Coaching */,
                        ),
                        icon: Icon(
                          FFIcons.kvideoCamera,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x2326A4FF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 2.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF2A1A4A),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          'cjptj4z4' /* End */,
                        ),
                        icon: Icon(
                          FFIcons.kxCloseDelete,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x6439519F),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 2.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
