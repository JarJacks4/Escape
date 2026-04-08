import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:confetti_modualo_library_b75kfy/custom_code/actions/index.dart'
    as confetti_modualo_library_b75kfy_actions;
import 'package:confetti_modualo_library_b75kfy/custom_code/widgets/index.dart'
    as confetti_modualo_library_b75kfy_custom_widgets;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'confetti_page_third_eye_energy_center_comp_copy_model.dart';
export 'confetti_page_third_eye_energy_center_comp_copy_model.dart';

class ConfettiPageThirdEyeEnergyCenterCompCopyWidget extends StatefulWidget {
  const ConfettiPageThirdEyeEnergyCenterCompCopyWidget({
    super.key,
    required this.exerciseTitle,
  });

  final String? exerciseTitle;

  @override
  State<ConfettiPageThirdEyeEnergyCenterCompCopyWidget> createState() =>
      _ConfettiPageThirdEyeEnergyCenterCompCopyWidgetState();
}

class _ConfettiPageThirdEyeEnergyCenterCompCopyWidgetState
    extends State<ConfettiPageThirdEyeEnergyCenterCompCopyWidget> {
  late ConfettiPageThirdEyeEnergyCenterCompCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => ConfettiPageThirdEyeEnergyCenterCompCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONFETTI_THIRD_EYE_ENERGY_CENTER_COPY_Co');
      logFirebaseEvent('ConfettiPageThirdEyeEnergyCenterCompCopy');
      HapticFeedback.vibrate();
      logFirebaseEvent('ConfettiPageThirdEyeEnergyCenterCompCopy');
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(0.76);
      await _model.soundPlayer1!
          .setAsset(
              'assets/audios/ES_Achievement,_Level_Up,_Notification,_Goal_Achieved,_Positive_06_-_Epidemic_Sound.mp3')
          .then((_) => _model.soundPlayer1!.play());

      logFirebaseEvent('ConfettiPageThirdEyeEnergyCenterCompCopy');
      await confetti_modualo_library_b75kfy_actions.startConfetti(
        currentUserUid,
      );
    });
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

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child:
                  confetti_modualo_library_b75kfy_custom_widgets.CustomConfetti(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                id: currentUserUid,
                degree: 273,
                isExplosion: true,
                gravity: 5.0,
                emissionFrequency: 0.1,
                duration: 11,
                particleDrag: 0.0,
                shape: 6,
                numberOfParticles: 33,
                displayTarget: true,
                shouldLoop: false,
                colors: List.generate(random_data.randomInteger(5, 20),
                    (index) => random_data.randomColor()),
              ),
            ),
            Container(
              height: 801.0,
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Stack(
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Container(
                      width: 345.6,
                      height: 786.8,
                      decoration: BoxDecoration(
                        color: Color(0x48D0E3F7),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/1606779a83efe7eb4146074e600b2a83.gif',
                          ).image,
                        ),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 60.0,
                            sigmaY: 60.0,
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x3739519F),
                                  Color(0x573831C3),
                                  Color(0x8E6322CF)
                                ],
                                stops: [0.0, 0.5, 1.0],
                                begin: AlignmentDirectional(1.0, -0.64),
                                end: AlignmentDirectional(-1.0, 0.64),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: const CircleBorder(),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 1570),
                                        curve: Curves.easeIn,
                                        width: 199.3,
                                        height: 199.3,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFF8C00),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            image: Image.asset(
                                              'assets/images/1606779a83efe7eb4146074e600b2a83.gif',
                                            ).image,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 40.0,
                                              color: Color(0xFFF0D0F7),
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              spreadRadius: 3.0,
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0x3AEDF1F7),
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'dwyft55m' /* Congrats! */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'WorkSans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5g73hnpr' /* You completed */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'r7cps9cn' /* Third Eye Energy Center */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 1.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xCCEDF1F7),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 40.0,
                                              color: Color(0xFFF0D0F7),
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              spreadRadius: 3.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Color(0x3AEDF1F7),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kcoins,
                                                        color:
                                                            Color(0xFFFB9F00),
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lknjqurv' /* Coins Earned So Far */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      's66l3x3s' /* 6000 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'daykpyrk' /* Energy Center Unlocked */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ahpmk20r' /* Third Eye */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '97ilsa2s' /* Difficulty */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ce4ro56i' /* Expert */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'oyri48u4' /* Monthly Progress */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        '${FFAppState().pointsEarned.toString()}/7000',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 8.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child:
                                                        LinearPercentIndicator(
                                                      percent: valueOrDefault<
                                                          double>(
                                                        FFAppState()
                                                            .pointsEarnedPercentage,
                                                        0.0,
                                                      ),
                                                      width: 120.0,
                                                      lineHeight: 12.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                        'x4ctx678' /* Now that you have accumulated ... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/download_(40)_(1).gif',
                                              ).image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 40.0,
                                                color: Color(0xFFF0D0F7),
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 3.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CONFETTI_THIRD_EYE_ENERGY_CENTER_COPY_ST');
                                              logFirebaseEvent(
                                                  'Button_haptic_feedback');
                                              HapticFeedback.mediumImpact();
                                              logFirebaseEvent(
                                                  'Button_play_sound');
                                              _model.soundPlayer2 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer2!.playing) {
                                                await _model.soundPlayer2!
                                                    .stop();
                                              }
                                              _model.soundPlayer2!
                                                  .setVolume(0.75);
                                              _model.soundPlayer2!
                                                  .setAsset(
                                                      'assets/audios/ES_Ding,_Complex,_Shine_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer2!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().hasCleansedRoot =
                                                  true;
                                              FFAppState().update(() {});
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Congrats on your new achievement! You can directly access your journey progress on the Energy Scan! The Energy Scan can be found by tapping the help button in the upper right hand corner.',
                                                    style: TextStyle(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xD3FCC462),
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              await confetti_modualo_library_b75kfy_actions
                                                  .stopConfetti(
                                                currentUserUid,
                                              );
                                              logFirebaseEvent(
                                                  'Button_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                MindSacralChakraVersion5Widget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 2),
                                                  ),
                                                },
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'hlorr3nb' /* Start Crown Energy Center */,
                                            ),
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor: Colors.white,
                                              color: Color(0x00FF8C00),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
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
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CONFETTI_THIRD_EYE_ENERGY_CENTER_COPY_DI');
                                              logFirebaseEvent(
                                                  'Button_haptic_feedback');
                                              HapticFeedback.lightImpact();
                                              logFirebaseEvent(
                                                  'Button_play_sound');
                                              _model.soundPlayer3 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer3!.playing) {
                                                await _model.soundPlayer3!
                                                    .stop();
                                              }
                                              _model.soundPlayer3!
                                                  .setVolume(0.67);
                                              await _model.soundPlayer3!
                                                  .setAsset(
                                                      'assets/audios/ES_Button_Press_Click,_Tap,_Video_Game,_Back,_Return,_Negative_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer3!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Button_dismiss_dialog');
                                              Navigator.pop(context);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '0q6qxxzq' /* Dismiss */,
                                            ),
                                            icon: Icon(
                                              Icons.replay,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsets.all(15.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              color: Color(0xC61C2444),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 1.0,
                                              borderSide: BorderSide(
                                                color: Color(0x6ED0E3F7),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
