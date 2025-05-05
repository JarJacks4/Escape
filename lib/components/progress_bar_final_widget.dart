import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_bar_final_model.dart';
export 'progress_bar_final_model.dart';

class ProgressBarFinalWidget extends StatefulWidget {
  const ProgressBarFinalWidget({super.key});

  @override
  State<ProgressBarFinalWidget> createState() => _ProgressBarFinalWidgetState();
}

class _ProgressBarFinalWidgetState extends State<ProgressBarFinalWidget> {
  late ProgressBarFinalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarFinalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: 51.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            color: FlutterFlowTheme.of(context).primaryBackground,
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PROGRESS_BAR_FINAL_Image_yzyz94b6_ON_TAP');
                      logFirebaseEvent('Image_update_app_state');
                      FFAppState().ProfilePicture = currentUserPhoto;
                      safeSetState(() {});
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.network(
                        currentUserPhoto,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      valueOrDefault<String>(
                        currentUserDisplayName,
                        'Jane Doe',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'The Seasons',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 190.6,
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                      child: LinearPercentIndicator(
                        percent: FFAppState().pointsEarned.toDouble(),
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        lineHeight: 25.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).accent1,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        center: Text(
                          valueOrDefault<String>(
                            FFAppState().pointsEarned.toString(),
                            '0',
                          ).maybeHandleOverflow(
                            maxChars: 50,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        barRadius: Radius.circular(80.0),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: VerticalDivider(
                    thickness: 1.0,
                    indent: 8.0,
                    endIndent: 8.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '7yop5jem' /* Points */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'The Seasons',
                            color: FlutterFlowTheme.of(context).accent1,
                            fontSize: 11.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        FFAppState().pointsEarned.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
