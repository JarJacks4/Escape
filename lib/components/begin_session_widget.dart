import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'begin_session_model.dart';
export 'begin_session_model.dart';

/// New Component Gen
class BeginSessionWidget extends StatefulWidget {
  const BeginSessionWidget({
    super.key,
    this.currentIndex,
  });

  final int? currentIndex;

  @override
  State<BeginSessionWidget> createState() => _BeginSessionWidgetState();
}

class _BeginSessionWidgetState extends State<BeginSessionWidget> {
  late BeginSessionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeginSessionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 100.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 178.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Color(0xFF2A3050),
                        borderRadius: 22.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        fillColor: Color(0xFF1A2035),
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'BEGIN_SESSION_arrow_back_rounded_ICN_ON_');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 60.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'h5se0u3k' /* Move with the flow. */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.cormorantSc(
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 48.0,
                                    letterSpacing: 15.0,
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                    lineHeight: 1.1,
                                  ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 76.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF0D1A2E),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 15.0,
                                    color: Color(0x9539519F),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                    spreadRadius: 3.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(28.0),
                                border: Border.all(
                                  color: Color(0xFF2A7A8A),
                                  width: 0.5,
                                ),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'BEGIN_SESSION_COMP_Btn_ON_TAP');
                                  logFirebaseEvent('Btn_navigate_to');

                                  context.pushNamed(
                                    BodyMovement3Widget.routeName,
                                    queryParameters: {
                                      'moves': serializeParam(
                                        FFAppState().todaysMoves.firstOrNull,
                                        ParamType.DataStruct,
                                      ),
                                      'currentIndex': serializeParam(
                                        widget.currentIndex,
                                        ParamType.int,
                                      ),
                                      'sessionStartTime': serializeParam(
                                        getCurrentTimestamp,
                                        ParamType.DateTime,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  '5p7h5xgz' /* Begin  Session */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x901C2444),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 3.0,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Color(0xFF4B68C8),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                  hoverColor: Color(0x7939519F),
                                  hoverBorderSide: BorderSide(
                                    color: Color(0xFF6583E7),
                                    width: 1.0,
                                  ),
                                  hoverElevation: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 52.0)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo_ESCAPE_White.png',
                    width: 200.0,
                    height: 80.41,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
