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
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'confetti_beginner_exerices_model.dart';
export 'confetti_beginner_exerices_model.dart';

/// New Component Gen
class ConfettiBeginnerExericesWidget extends StatefulWidget {
  const ConfettiBeginnerExericesWidget({super.key});

  @override
  State<ConfettiBeginnerExericesWidget> createState() =>
      _ConfettiBeginnerExericesWidgetState();
}

class _ConfettiBeginnerExericesWidgetState
    extends State<ConfettiBeginnerExericesWidget> {
  late ConfettiBeginnerExericesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfettiBeginnerExericesModel());
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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        child: Material(
          color: Colors.transparent,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Container(
            width: 345.6,
            height: 786.75,
            decoration: BoxDecoration(
              color: Color(0x48D0E3F7),
              boxShadow: [
                BoxShadow(
                  blurRadius: 80.0,
                  color: FlutterFlowTheme.of(context).primary,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                  spreadRadius: 20.0,
                )
              ],
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: Color(0x84EDF1F7),
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 199.29,
                        height: 199.29,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF8C00),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/win.gif',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40.0,
                              color: FlutterFlowTheme.of(context).accent3,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              spreadRadius: 20.0,
                            )
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0x3AEDF1F7),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '7imwad7j' /* Well Done! */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'dgu9sul6' /* You completed */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'rus4x9wu' /* Forest Walk */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xCCEDF1F7),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40.0,
                              color: Color(0xFFD0E3F7),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                              spreadRadius: 10.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: Color(0x3AEDF1F7),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.kcoins,
                                        color: Color(0xFFFB9F00),
                                        size: 20.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '3339zg1k' /* Coins Earned */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                  Text(
                                    '+50',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'uwdbemdm' /* Duration */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '53n98i0q' /* N/A */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '7mwwcj93' /* Difficulty */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'u5k5q7we' /* Beginner */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qpdk2ufb' /* Monthly Progress */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        '${FFAppState().pointsEarned.toString()}/7000',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: LinearPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        FFAppState().pointsEarnedPercentage,
                                        0.0,
                                      ),
                                      width: 120.0,
                                      lineHeight: 12.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'lfcnw0ic' /* Great start! Beginner practice... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).alternate,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 100.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: FlutterFlowTheme.of(context).accent1,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                spreadRadius: 3.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CONFETTI_BEGINNER_EXERICES_SEE_EXPLORE_B');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.mediumImpact();
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().pointsEarned =
                                  FFAppState().pointsEarned + 50;
                              FFAppState().hasCompletedGoal = true;
                              FFAppState().update(() {});
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Self-Care Goals and Progress Points Updated!',
                                    style: TextStyle(
                                      fontFamily: 'WorkSans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              logFirebaseEvent('Button_navigate_to');
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                RewardsSplashPageWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 3),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'fp5dmqc8' /* See Explore Page! */,
                            ),
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: Color(0xFFFF8C00),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Color(0x67EDF1F7),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Color(0xD51C2444),
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                spreadRadius: 5.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CONFETTI_BEGINNER_EXERICES_TRY_AGAIN_BTN');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Button_bottom_sheet');
                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              'r5awkyfs' /* Try Again */,
                            ),
                            icon: Icon(
                              Icons.replay,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: EdgeInsets.all(15.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: FlutterFlowTheme.of(context).primary,
                              color: Color(0xC61C2444),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 1.0,
                              borderSide: BorderSide(
                                color: Color(0x6ED0E3F7),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
