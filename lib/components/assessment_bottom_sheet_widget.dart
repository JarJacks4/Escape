import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'assessment_bottom_sheet_model.dart';
export 'assessment_bottom_sheet_model.dart';

/// New Component Gen
class AssessmentBottomSheetWidget extends StatefulWidget {
  const AssessmentBottomSheetWidget({super.key});

  @override
  State<AssessmentBottomSheetWidget> createState() =>
      _AssessmentBottomSheetWidgetState();
}

class _AssessmentBottomSheetWidgetState
    extends State<AssessmentBottomSheetWidget> {
  late AssessmentBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.69,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/pexels-bobbynlazyjim-32187615.jpg',
              ).image,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.0),
              topRight: Radius.circular(26.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.0),
              topRight: Radius.circular(26.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 80.0,
                sigmaY: 80.0,
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x27EDF1F7),
                      Color(0x59D0E3F7),
                      Color(0x80673AB7)
                    ],
                    stops: [0.0, 0.5, 1.0],
                    begin: AlignmentDirectional(1.0, -0.64),
                    end: AlignmentDirectional(-1.0, 0.64),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 500.0,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) => safeSetState(() {}),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 24.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'nq7jdapo' /* Mental Health Check-in */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.cormorantSc(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Container(
                                            width: 41.1,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 20.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                  spreadRadius: 5.0,
                                                )
                                              ],
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Color(0x27EDF1F7),
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0x29EDF1F7),
                                              icon: Icon(
                                                Icons.cancel_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                                logFirebaseEvent(
                                                    'IconButton_haptic_feedback');
                                                HapticFeedback.heavyImpact();
                                                logFirebaseEvent(
                                                    'IconButton_play_sound');
                                                _model.soundPlayer1 ??=
                                                    AudioPlayer();
                                                if (_model
                                                    .soundPlayer1!.playing) {
                                                  await _model.soundPlayer1!
                                                      .stop();
                                                }
                                                _model.soundPlayer1!
                                                    .setVolume(1.0);
                                                _model.soundPlayer1!
                                                    .setAsset(
                                                        'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                    .then((_) => _model
                                                        .soundPlayer1!
                                                        .play());

                                                logFirebaseEvent(
                                                    'IconButton_bottom_sheet');
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 24.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 72.0,
                                            height: 72.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                                ).image,
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFE8A0BF),
                                                  Color(0xFFA78BFA)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '7lz137b0' /* We Are Here For You */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.cormorantSc(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4nl0l4e0' /* It looks like you might be goi... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'i7dn9hie' /* Takes about 2 minutes • Comple... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0x41EDF1F7),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0x30EDF1F7),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r7a9cspm' /* What to expect: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.check_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 18.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'jg7rwfri' /* 6 simple questions about your ... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.check_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 18.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yr104uf8' /* Personalized self-care recomme... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.check_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 18.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'b5ndsiil' /* Connect to helpful resources i... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_Container_0gftyw');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Container_play_sound');
                                              _model.soundPlayer2 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer2!.playing) {
                                                await _model.soundPlayer2!
                                                    .stop();
                                              }
                                              _model.soundPlayer2!
                                                  .setVolume(1.0);
                                              _model.soundPlayer2!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer2!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Container_page_view');
                                              await _model.pageViewController
                                                  ?.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x43EDF1F7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 20.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      offset: Offset(
                                                        0.0,
                                                        0.0,
                                                      ),
                                                      spreadRadius: 3.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  border: Border.all(
                                                    color: Color(0x3BEDF1F7),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'gbe3wstd' /* Start Assessment */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.start,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7r3218r3' /* Mental Health Check-in */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Container(
                                          width: 41.1,
                                          height: 38.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0x27EDF1F7),
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x29EDF1F7),
                                            icon: Icon(
                                              Icons.cancel_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                              logFirebaseEvent(
                                                  'IconButton_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'IconButton_play_sound');
                                              _model.soundPlayer3 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer3!.playing) {
                                                await _model.soundPlayer3!
                                                    .stop();
                                              }
                                              _model.soundPlayer3!
                                                  .setVolume(1.0);
                                              _model.soundPlayer3!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer3!
                                                      .play());

                                              logFirebaseEvent(
                                                  'IconButton_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A4760),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: LinearPercentIndicator(
                                      percent: _model.pageViewCurrentIndex
                                          .toDouble(),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      lineHeight: 5.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      center: Text(
                                        FFLocalizations.of(context).getText(
                                          'gkvt4vpa' /* 50% */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      barRadius: Radius.circular(50.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 25.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 56.0,
                                          height: 56.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4A4760),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 40.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Lottie.asset(
                                            'assets/jsons/question_mark_blue.json',
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'nr1p8m1v' /* Question 1 of 6 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '1qyqn81a' /* How Are You Feeling Today? */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.cormorantSc(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'x7mt69zf' /* Select the emoji that best rep... */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color: Color(0xBAD0E3F7),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/happy.gif',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/happy_(1).gif',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/straight-face.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/sad.gif',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/sad_(1).gif',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 8.0, 15.0, 25.0),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      min: 0.0,
                                      max: 5.0,
                                      value: _model.feelingsScoreValue ??= 2.5,
                                      onChanged: (newValue) {
                                        newValue = double.parse(
                                            newValue.toStringAsFixed(2));
                                        safeSetState(() => _model
                                            .feelingsScoreValue = newValue);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ASSESSMENT_BOTTOM_SHEET_Container_olfyxw');
                                        logFirebaseEvent(
                                            'Container_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent(
                                            'Container_play_sound');
                                        _model.soundPlayer4 ??= AudioPlayer();
                                        if (_model.soundPlayer4!.playing) {
                                          await _model.soundPlayer4!.stop();
                                        }
                                        _model.soundPlayer4!.setVolume(1.0);
                                        _model.soundPlayer4!
                                            .setAsset(
                                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                            .then((_) =>
                                                _model.soundPlayer4!.play());

                                        logFirebaseEvent('Container_page_view');
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x43EDF1F7),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 3.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color: Color(0x3BEDF1F7),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'i7j00xhz' /* Next */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.directions_run,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 20.0,
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'waaltopz' /* Mental Health Check-in */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Container(
                                          width: 41.1,
                                          height: 38.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0x27EDF1F7),
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x29EDF1F7),
                                            icon: Icon(
                                              Icons.cancel_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                              logFirebaseEvent(
                                                  'IconButton_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'IconButton_play_sound');
                                              _model.soundPlayer5 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer5!.playing) {
                                                await _model.soundPlayer5!
                                                    .stop();
                                              }
                                              _model.soundPlayer5!
                                                  .setVolume(1.0);
                                              _model.soundPlayer5!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer5!
                                                      .play());

                                              logFirebaseEvent(
                                                  'IconButton_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A4760),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: LinearPercentIndicator(
                                      percent: _model.pageViewCurrentIndex
                                          .toDouble(),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      lineHeight: 5.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      center: Text(
                                        FFLocalizations.of(context).getText(
                                          'h060hi38' /* 50% */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      barRadius: Radius.circular(50.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 15.0, 16.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 107.2,
                                            height: 85.91,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 40.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Lottie.asset(
                                              'assets/jsons/Animation_-_1708891000222.json',
                                              width: 200.0,
                                              height: 190.42,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5gwpwtm0' /* Question 2 of 6 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '10romxoz' /* How Has Your Sleep Been? */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.cormorantSc(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'bcd65liw' /* Over the past week */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x4BE8E8EE),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 80.0,
                                              color: Color(0x65EDF1F7),
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Color(0x35EDF1F7),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8tjak9ko' /* Rate your sleep quality */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/happy.gif',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/happy_(1).gif',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/straight-face.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/sad.gif',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/sad_(1).gif',
                                                      fit: BoxFit.cover,
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
                                                  Flexible(
                                                    flex: 1,
                                                    child: Slider(
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      inactiveColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      min: 0.0,
                                                      max: 5.0,
                                                      value: _model
                                                              .sleepScoreValue ??=
                                                          2.5,
                                                      onChanged: (newValue) {
                                                        newValue = double.parse(
                                                            newValue
                                                                .toStringAsFixed(
                                                                    2));
                                                        safeSetState(() => _model
                                                                .sleepScoreValue =
                                                            newValue);
                                                      },
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
                                                      'zvvgj67c' /* Great! */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(35.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'x3a5gqqk' /* Neutral */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1j7x2j6q' /* In Shambles */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 32.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_BACK_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Button_play_sound');
                                              _model.soundPlayer6 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer6!.playing) {
                                                await _model.soundPlayer6!
                                                    .stop();
                                              }
                                              _model.soundPlayer6!
                                                  .setVolume(1.0);
                                              _model.soundPlayer6!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer6!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Button_navigate_back');
                                              context.safePop();
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'bs1axr88' /* Back */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 50.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x87D0E3F7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Color(0x40EDF1F7),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_Container_394gzo');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Container_play_sound');
                                              _model.soundPlayer7 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer7!.playing) {
                                                await _model.soundPlayer7!
                                                    .stop();
                                              }
                                              _model.soundPlayer7!
                                                  .setVolume(1.0);
                                              _model.soundPlayer7!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer7!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Container_page_view');
                                              await _model.pageViewController
                                                  ?.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x43EDF1F7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 20.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      offset: Offset(
                                                        0.0,
                                                        0.0,
                                                      ),
                                                      spreadRadius: 3.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  border: Border.all(
                                                    color: Color(0x3BEDF1F7),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vkk2t62u' /* Next */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.directions_run,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'co3d4duz' /* Mental Health Check-in */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Container(
                                          width: 41.1,
                                          height: 38.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0x27EDF1F7),
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x29EDF1F7),
                                            icon: Icon(
                                              Icons.cancel_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                              logFirebaseEvent(
                                                  'IconButton_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'IconButton_play_sound');
                                              _model.soundPlayer8 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer8!.playing) {
                                                await _model.soundPlayer8!
                                                    .stop();
                                              }
                                              _model.soundPlayer8!
                                                  .setVolume(1.0);
                                              _model.soundPlayer8!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer8!
                                                      .play());

                                              logFirebaseEvent(
                                                  'IconButton_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A4760),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: LinearPercentIndicator(
                                      percent: _model.pageViewCurrentIndex
                                          .toDouble(),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      lineHeight: 5.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      center: Text(
                                        FFLocalizations.of(context).getText(
                                          '5brlyxwo' /* 50% */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      barRadius: Radius.circular(50.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 15.0, 16.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 107.2,
                                            height: 63.31,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 40.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Lottie.asset(
                                              'assets/jsons/Animation_-_1708891000222.json',
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ms7uj0gz' /* Question 3 of 6 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'edoeemgn' /* What Are Your Energy Levels Li... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'kg5964vr' /* How Energized Do You Feel? */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x4BE8E8EE),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 80.0,
                                              color: Color(0x65EDF1F7),
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Color(0x35EDF1F7),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lo4hm19c' /* Rate your energy */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (FFAppState().isEnergyScore
                                                      ? false
                                                      : true)
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        safeSetState(() => FFAppState()
                                                                .isEnergyScore =
                                                            !FFAppState()
                                                                .isEnergyScore);
                                                        logFirebaseEvent(
                                                            'ASSESSMENT_BOTTOM_SHEET_ToggleIcon_ssh9f');
                                                        logFirebaseEvent(
                                                            'ToggleIcon_update_app_state');
                                                        FFAppState()
                                                            .energyScore = 1;
                                                        safeSetState(() {});
                                                      },
                                                      value: FFAppState()
                                                          .isEnergyScore,
                                                      onIcon: Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 36.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.star_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 36.0,
                                                      ),
                                                    ),
                                                  if (FFAppState().isEnergyScore
                                                      ? false
                                                      : true)
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        safeSetState(() => FFAppState()
                                                                .isEnergyScore =
                                                            !FFAppState()
                                                                .isEnergyScore);
                                                      },
                                                      value: FFAppState()
                                                          .isEnergyScore,
                                                      onIcon: Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 36.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.star_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 36.0,
                                                      ),
                                                    ),
                                                  if (FFAppState().isEnergyScore
                                                      ? false
                                                      : true)
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        safeSetState(() => FFAppState()
                                                                .isEnergyScore =
                                                            !FFAppState()
                                                                .isEnergyScore);
                                                      },
                                                      value: FFAppState()
                                                          .isEnergyScore,
                                                      onIcon: Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 36.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.star_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 36.0,
                                                      ),
                                                    ),
                                                  if (FFAppState().isEnergyScore
                                                      ? false
                                                      : true)
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        safeSetState(() => FFAppState()
                                                                .isEnergyScore =
                                                            !FFAppState()
                                                                .isEnergyScore);
                                                      },
                                                      value: FFAppState()
                                                          .isEnergyScore,
                                                      onIcon: Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 36.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.star_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 36.0,
                                                      ),
                                                    ),
                                                  if (FFAppState().isEnergyScore
                                                      ? false
                                                      : true)
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        safeSetState(() => FFAppState()
                                                                .isEnergyScore =
                                                            !FFAppState()
                                                                .isEnergyScore);
                                                      },
                                                      value: FFAppState()
                                                          .isEnergyScore,
                                                      onIcon: Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 36.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.star_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 36.0,
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
                                                  Flexible(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '1umk3ezu' /* Poor */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'be1oltfo' /* Average */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'v4c5idik' /* Excellent */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 32.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_BACK_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Button_play_sound');
                                              _model.soundPlayer9 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer9!.playing) {
                                                await _model.soundPlayer9!
                                                    .stop();
                                              }
                                              _model.soundPlayer9!
                                                  .setVolume(1.0);
                                              _model.soundPlayer9!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer9!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Button_page_view');
                                              await _model.pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '8bjns42f' /* Back */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 50.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x87D0E3F7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: StreamBuilder<
                                              List<CheckInRecord>>(
                                            stream: queryCheckInRecord(
                                              parent: currentUserReference,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    child: SpinKitWave(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      size: 100.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CheckInRecord>
                                                  containerCheckInRecordList =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ASSESSMENT_BOTTOM_SHEET_Container_qvtxv7');
                                                  logFirebaseEvent(
                                                      'Container_haptic_feedback');
                                                  HapticFeedback.heavyImpact();
                                                  logFirebaseEvent(
                                                      'Container_play_sound');
                                                  _model.soundPlayer10 ??=
                                                      AudioPlayer();
                                                  if (_model
                                                      .soundPlayer10!.playing) {
                                                    await _model.soundPlayer10!
                                                        .stop();
                                                  }
                                                  _model.soundPlayer10!
                                                      .setVolume(1.0);
                                                  _model.soundPlayer10!
                                                      .setAsset(
                                                          'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                      .then((_) => _model
                                                          .soundPlayer10!
                                                          .play());

                                                  logFirebaseEvent(
                                                      'Container_page_view');
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.7,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x43EDF1F7),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 20.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          offset: Offset(
                                                            0.0,
                                                            0.0,
                                                          ),
                                                          spreadRadius: 3.0,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x3BEDF1F7),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '9r9asxo4' /* Next */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .directions_run,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 16.0, 24.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '31lrtm8k' /* Mental Health Check-in */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        Container(
                                          width: 41.1,
                                          height: 38.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0x27EDF1F7),
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x29EDF1F7),
                                            icon: Icon(
                                              Icons.cancel_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                              logFirebaseEvent(
                                                  'IconButton_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'IconButton_play_sound');
                                              _model.soundPlayer11 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer11!.playing) {
                                                await _model.soundPlayer11!
                                                    .stop();
                                              }
                                              _model.soundPlayer11!
                                                  .setVolume(1.0);
                                              _model.soundPlayer11!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer11!
                                                      .play());

                                              logFirebaseEvent(
                                                  'IconButton_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A4760),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: LinearPercentIndicator(
                                      percent: _model.pageViewCurrentIndex
                                          .toDouble(),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      lineHeight: 5.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      center: Text(
                                        FFLocalizations.of(context).getText(
                                          'hhdya2a9' /* 50% */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      barRadius: Radius.circular(50.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 25.0, 24.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '372ytkyy' /* Question 4 of 6 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'uywhgx8a' /* How Stressed Do You Feel? */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'tnes0lk7' /* Current stress level */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 25.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0x4BE8E8EE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 80.0,
                                                    color: Color(0x65EDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: Color(0x35EDF1F7),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'b4uuqlko' /* Rate your stress level */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/happy.gif',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/happy_(1).gif',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/straight-face.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/sad.gif',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/sad_(1).gif',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child: Slider(
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              inactiveColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              min: 0.0,
                                                              max: 10.0,
                                                              value: _model
                                                                      .stressScoreValue ??=
                                                                  5.0,
                                                              divisions: 10,
                                                              onChanged:
                                                                  (newValue) {
                                                                newValue = double
                                                                    .parse(newValue
                                                                        .toStringAsFixed(
                                                                            2));
                                                                safeSetState(() =>
                                                                    _model.stressScoreValue =
                                                                        newValue);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'b4qlcb1a' /* Excellent */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ml45qu2a' /* Average */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'x1xdt5kq' /* Poor */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 16.0, 24.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ASSESSMENT_BOTTOM_SHEET_BACK_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_haptic_feedback');
                                            HapticFeedback.heavyImpact();
                                            logFirebaseEvent(
                                                'Button_play_sound');
                                            _model.soundPlayer12 ??=
                                                AudioPlayer();
                                            if (_model.soundPlayer12!.playing) {
                                              await _model.soundPlayer12!
                                                  .stop();
                                            }
                                            _model.soundPlayer12!
                                                .setVolume(1.0);
                                            _model.soundPlayer12!
                                                .setAsset(
                                                    'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                .then((_) => _model
                                                    .soundPlayer12!
                                                    .play());

                                            logFirebaseEvent(
                                                'Button_page_view');
                                            await _model.pageViewController
                                                ?.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'cpxuifa1' /* Back */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 48.0,
                                            padding: EdgeInsets.all(8.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x87D0E3F7),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0x2EEDF1F7),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_Container_1sp8e0');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Container_play_sound');
                                              _model.soundPlayer13 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer13!.playing) {
                                                await _model.soundPlayer13!
                                                    .stop();
                                              }
                                              _model.soundPlayer13!
                                                  .setVolume(1.0);
                                              _model.soundPlayer13!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer13!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Container_page_view');
                                              await _model.pageViewController
                                                  ?.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x43EDF1F7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 20.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      offset: Offset(
                                                        0.0,
                                                        0.0,
                                                      ),
                                                      spreadRadius: 3.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  border: Border.all(
                                                    color: Color(0x3BEDF1F7),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'd1fqmsyz' /* Next */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.directions_run,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '94375ivr' /* Mental Health Check-in */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Container(
                                      width: 41.1,
                                      height: 38.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            offset: Offset(
                                              0.0,
                                              0.0,
                                            ),
                                            spreadRadius: 5.0,
                                          )
                                        ],
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Color(0x27EDF1F7),
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x29EDF1F7),
                                        icon: Icon(
                                          Icons.cancel_sharp,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                          logFirebaseEvent(
                                              'IconButton_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent(
                                              'IconButton_play_sound');
                                          _model.soundPlayer14 ??=
                                              AudioPlayer();
                                          if (_model.soundPlayer14!.playing) {
                                            await _model.soundPlayer14!.stop();
                                          }
                                          _model.soundPlayer14!.setVolume(1.0);
                                          _model.soundPlayer14!
                                              .setAsset(
                                                  'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer14!.play());

                                          logFirebaseEvent(
                                              'IconButton_bottom_sheet');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4A4760),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: LinearPercentIndicator(
                                  percent:
                                      _model.pageViewCurrentIndex.toDouble(),
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  lineHeight: 5.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  center: Text(
                                    FFLocalizations.of(context).getText(
                                      'cc2kftjx' /* 50% */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  barRadius: Radius.circular(50.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 25.0, 24.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'wtvbbvgt' /* Question 5 of 6 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'zhv41vlc' /* Do You Have Support? */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ej90jkrl' /* People You Can Talk To */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 25.0, 16.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x4BE8E8EE),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 80.0,
                                          color: Color(0x65EDF1F7),
                                          offset: Offset(
                                            0.0,
                                            0.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Color(0x35EDF1F7),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'm4a63his' /* Rate Your Support */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/happy.gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/happy_(1).gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/straight-face.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/sad.gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/sad_(1).gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Slider(
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    inactiveColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    min: 0.0,
                                                    max: 10.0,
                                                    value: _model
                                                            .suppportScoreValue ??=
                                                        5.0,
                                                    divisions: 10,
                                                    onChanged: (newValue) {
                                                      newValue = double.parse(
                                                          newValue
                                                              .toStringAsFixed(
                                                                  2));
                                                      safeSetState(() => _model
                                                              .suppportScoreValue =
                                                          newValue);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6b1e52b2' /* Much Support */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'i2xjvxbg' /* Average */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5pi3md3i' /* No Support */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ASSESSMENT_BOTTOM_SHEET_BACK_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent('Button_play_sound');
                                        _model.soundPlayer15 ??= AudioPlayer();
                                        if (_model.soundPlayer15!.playing) {
                                          await _model.soundPlayer15!.stop();
                                        }
                                        _model.soundPlayer15!.setVolume(1.0);
                                        _model.soundPlayer15!
                                            .setAsset(
                                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                            .then((_) =>
                                                _model.soundPlayer15!.play());

                                        logFirebaseEvent('Button_page_view');
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'y5rlx5ju' /* Back */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 48.0,
                                        padding: EdgeInsets.all(8.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x87D0E3F7),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0x2EEDF1F7),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ASSESSMENT_BOTTOM_SHEET_Container_klw6dr');
                                          logFirebaseEvent(
                                              'Container_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent(
                                              'Container_play_sound');
                                          _model.soundPlayer16 ??=
                                              AudioPlayer();
                                          if (_model.soundPlayer16!.playing) {
                                            await _model.soundPlayer16!.stop();
                                          }
                                          _model.soundPlayer16!.setVolume(1.0);
                                          _model.soundPlayer16!
                                              .setAsset(
                                                  'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer16!.play());

                                          logFirebaseEvent(
                                              'Container_page_view');
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x43EDF1F7),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 20.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                  spreadRadius: 3.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              border: Border.all(
                                                color: Color(0x3BEDF1F7),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wd8cvcj6' /* Next */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.directions_run,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'wpnjel6u' /* Mental Health Check-in */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Container(
                                      width: 41.1,
                                      height: 38.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            offset: Offset(
                                              0.0,
                                              0.0,
                                            ),
                                            spreadRadius: 5.0,
                                          )
                                        ],
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Color(0x27EDF1F7),
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x29EDF1F7),
                                        icon: Icon(
                                          Icons.cancel_sharp,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ASSESSMENT_BOTTOM_SHEET_cancel_sharp_ICN');
                                          logFirebaseEvent(
                                              'IconButton_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent(
                                              'IconButton_play_sound');
                                          _model.soundPlayer17 ??=
                                              AudioPlayer();
                                          if (_model.soundPlayer17!.playing) {
                                            await _model.soundPlayer17!.stop();
                                          }
                                          _model.soundPlayer17!.setVolume(1.0);
                                          _model.soundPlayer17!
                                              .setAsset(
                                                  'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer17!.play());

                                          logFirebaseEvent(
                                              'IconButton_bottom_sheet');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4A4760),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: LinearPercentIndicator(
                                  percent:
                                      _model.pageViewCurrentIndex.toDouble(),
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  lineHeight: 5.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  center: Text(
                                    FFLocalizations.of(context).getText(
                                      '51a7rkfj' /* 50% */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  barRadius: Radius.circular(50.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 16.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 107.2,
                                        height: 63.31,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 40.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Lottie.asset(
                                          'assets/jsons/Animation_-_1708891000222.json',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'q3mi4fxl' /* Question 6 of 6 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'a5cs8van' /* Are You Enjoying Activities Wi... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'y36bcruh' /* Things You Enjoy With our App */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x4BE8E8EE),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 80.0,
                                          color: Color(0x65EDF1F7),
                                          offset: Offset(
                                            0.0,
                                            0.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Color(0x35EDF1F7),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'f37lq287' /* Rate your enjoyment level */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/happy.gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/happy_(1).gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/straight-face.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/sad.gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/sad_(1).gif',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Slider(
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    inactiveColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    min: 0.0,
                                                    max: 10.0,
                                                    value: _model
                                                            .overallScoreValue ??=
                                                        5.0,
                                                    divisions: 10,
                                                    onChanged: (newValue) {
                                                      newValue = double.parse(
                                                          newValue
                                                              .toStringAsFixed(
                                                                  2));
                                                      safeSetState(() => _model
                                                              .overallScoreValue =
                                                          newValue);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bcfxx9tb' /* Excellent */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'm0yfzfmm' /* Average */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '67v6cc97' /* Poor */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 32.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ASSESSMENT_BOTTOM_SHEET_BACK_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent('Button_play_sound');
                                          _model.soundPlayer18 ??=
                                              AudioPlayer();
                                          if (_model.soundPlayer18!.playing) {
                                            await _model.soundPlayer18!.stop();
                                          }
                                          _model.soundPlayer18!.setVolume(1.0);
                                          _model.soundPlayer18!
                                              .setAsset(
                                                  'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer18!.play());

                                          logFirebaseEvent('Button_page_view');
                                          await _model.pageViewController
                                              ?.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '8bf6m0ss' /* Back */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x87D0E3F7),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: StreamBuilder<List<CheckInRecord>>(
                                        stream: queryCheckInRecord(
                                          parent: currentUserReference,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 100.0,
                                                height: 100.0,
                                                child: SpinKitWave(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 100.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<CheckInRecord>
                                              containerCheckInRecordList =
                                              snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ASSESSMENT_BOTTOM_SHEET_Container_ldnlft');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Container_play_sound');
                                              _model.soundPlayer19 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer19!.playing) {
                                                await _model.soundPlayer19!
                                                    .stop();
                                              }
                                              _model.soundPlayer19!
                                                  .setVolume(1.0);
                                              _model.soundPlayer19!
                                                  .setAsset(
                                                      'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer19!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await containerCheckInRecordList
                                                  .firstOrNull!.reference
                                                  .update(
                                                      createCheckInRecordData(
                                                feelingsScore:
                                                    _model.feelingsScoreValue,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                sleepPatterns:
                                                    _model.sleepScoreValue,
                                                energyLevelScore: FFAppState()
                                                    .energyScore
                                                    .toDouble(),
                                                stressLevel: formatNumber(
                                                  _model.stressScoreValue,
                                                  formatType:
                                                      FormatType.percent,
                                                ),
                                                supportLevel: formatNumber(
                                                  _model.suppportScoreValue,
                                                  formatType:
                                                      FormatType.percent,
                                                ),
                                                overallRating:
                                                    _model.overallScoreValue,
                                              ));
                                              logFirebaseEvent(
                                                  'Container_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 190),
                                                curve: Curves.easeOut,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x43EDF1F7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 20.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      offset: Offset(
                                                        0.0,
                                                        0.0,
                                                      ),
                                                      spreadRadius: 3.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  border: Border.all(
                                                    color: Color(0x3BEDF1F7),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        flex: 1,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'r9nief7b' /* Complete */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .flagCheckered,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 7,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              safeSetState(() {});
                            },
                            effect: smooth_page_indicator.SlideEffect(
                              spacing: 8.0,
                              radius: 50.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              dotColor: FlutterFlowTheme.of(context).primary,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).accent1,
                              paintStyle: PaintingStyle.fill,
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
        ),
      ),
    );
  }
}
