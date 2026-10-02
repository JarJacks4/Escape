import '/components/active_challenge_card_comp_widget.dart';
import '/components/challenge_detail_sheet_comp_widget.dart';
import '/components/help_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'quest_comp_version5_model.dart';
export 'quest_comp_version5_model.dart';

/// New Component Gen
class QuestCompVersion5Widget extends StatefulWidget {
  const QuestCompVersion5Widget({super.key});

  @override
  State<QuestCompVersion5Widget> createState() =>
      _QuestCompVersion5WidgetState();
}

class _QuestCompVersion5WidgetState extends State<QuestCompVersion5Widget>
    with TickerProviderStateMixin {
  late QuestCompVersion5Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestCompVersion5Model());

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 620.0.ms,
            duration: 1820.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.524,
          ),
        ],
      ),
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: SingleChildScrollView(
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 25.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'QUEST_VERSION5_arrow_back_ios_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('IconButton_play_sound');
                        _model.soundPlayer1 ??= AudioPlayer();
                        if (_model.soundPlayer1!.playing) {
                          await _model.soundPlayer1!.stop();
                        }
                        _model.soundPlayer1!.setVolume(1.0);
                        _model.soundPlayer1!
                            .setAsset(
                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                            .then((_) => _model.soundPlayer1!.play());

                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'c101bqoc' /* Quests */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.cormorantSc(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x5CFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            color: Color(0xB2F0831A),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                            spreadRadius: 3.0,
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'QUEST_VERSION5_LottieAnimation_k4tf24z0_');
                            logFirebaseEvent('LottieAnimation_haptic_feedback');
                            HapticFeedback.lightImpact();
                            logFirebaseEvent('LottieAnimation_play_sound');
                            _model.soundPlayer2 ??= AudioPlayer();
                            if (_model.soundPlayer2!.playing) {
                              await _model.soundPlayer2!.stop();
                            }
                            _model.soundPlayer2!.setVolume(0.76);
                            _model.soundPlayer2!
                                .setAsset(
                                    'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_0000-1106.wav')
                                .then((_) => _model.soundPlayer2!.play());

                            logFirebaseEvent('LottieAnimation_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: HelpCompWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Lottie.asset(
                            'assets/jsons/question_mark_blue.json',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                            repeat: false,
                            animate: true,
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 146.1,
                    height: 146.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/win.gif',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: FlutterFlowTheme.of(context).primary,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          spreadRadius: 10.0,
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5tbimcoy' /* Quest Challenges */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.cormorantSc(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'f1a58a11' /* Compete, achieve, grow */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.flash_on,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 20.0,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '68f4oxw2' /* Active Challenge */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.cormorantSc(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'QUEST_VERSION5_Container_ch158j8t_ON_TAP');
                    logFirebaseEvent('Container_haptic_feedback');
                    HapticFeedback.selectionClick();
                    logFirebaseEvent('Container_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ChallengeDetailSheetCompWidget(
                              challengeID: 'emotion_mastery_7',
                              title: '7-Day Emotion Mastery',
                              subtitle: 'Complete 7 consecutive daily quests',
                              totalDays: 7,
                              coins: 500,
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    width: 337.3,
                    height: 331.0,
                    decoration: BoxDecoration(
                      color: Color(0xE5FFFFFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: FlutterFlowTheme.of(context).secondary,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          spreadRadius: 5.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      't5xf5kiv' /* 7-Day Emotion 
Mastery */
                                      ,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 16.0,
                                    buttonSize: 64.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    icon: FaIcon(
                                      FontAwesomeIcons.trophy,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'iconButtonOnPageLoadAnimation']!),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'wf7y9sug' /* Complete 7 consecutive 
daily ... */
                              ,
                            ),
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fhxyy08p' /* Progress */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions.percentLabel(
                                      functions.challengeProgress(
                                          functions.challengeStreak(FFAppState()
                                              .questCheckIns
                                              .toList()),
                                          7)),
                                  '0%',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: LinearPercentIndicator(
                              percent: functions.challengeProgress(
                                  functions.challengeStreak(
                                      FFAppState().questCheckIns.toList()),
                                  7)!,
                              width: 120.0,
                              lineHeight: 8.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).accent3,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              center: Text(
                                functions.percentLabel(
                                    functions.challengeProgress(
                                        functions.challengeStreak(FFAppState()
                                            .questCheckIns
                                            .toList()),
                                        7))!,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.fade,
                              ),
                              barRadius: Radius.circular(15.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  thickness: 0.2,
                                  indent: 20.0,
                                  endIndent: 20.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions
                                          .challengeStreak(FFAppState()
                                              .questCheckIns
                                              .toList())
                                          .toString(),
                                      '0',
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
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ufivfv04' /* Days Done */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  thickness: 0.2,
                                  indent: 20.0,
                                  endIndent: 20.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions
                                          .daysLeft(
                                              functions.challengeStreak(
                                                  FFAppState()
                                                      .questCheckIns
                                                      .toList()),
                                              7)
                                          .toString(),
                                      '0',
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
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'sp14u7yo' /* Days Left */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  thickness: 0.2,
                                  indent: 20.0,
                                  endIndent: 20.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'vrycz6m3' /* 500 */,
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
                                              .accent3,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '2ad7ag8q' /* XP Reward */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  thickness: 0.2,
                                  indent: 20.0,
                                  endIndent: 20.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.explore,
                    color: FlutterFlowTheme.of(context).accent4,
                    size: 20.0,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '75yp49e3' /* Available Challenges */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.cormorantSc(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Flexible(
                flex: 1,
                child: wrapWithModel(
                  model: _model.activeChallengeCardCompModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: ActiveChallengeCardCompWidget(
                    challengeID: 'Vulnerability Explorer',
                    title: 'Vulnerability Explorer',
                    description:
                        'Share 3 authentic emotional moments this week',
                    reward: 'Reward: 250 Escape Coins',
                  ),
                ),
              ),
              Container(
                height: 200.0,
                child: wrapWithModel(
                  model: _model.activeChallengeCardCompModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: ActiveChallengeCardCompWidget(
                    challengeID: 'Mindful Morning',
                    title: 'Mindful Morning',
                    description:
                        'Complete a morning emotion check-in for 14 days',
                    reward: 'Reward: 300 Escape Coins',
                  ),
                ),
              ),
              Container(
                height: 200.0,
                child: wrapWithModel(
                  model: _model.activeChallengeCardCompModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: ActiveChallengeCardCompWidget(
                    challengeID: 'Community Connection',
                    title: 'Community Connection',
                    description:
                        'Add 5 supportive echoes to other explorers\' quests',
                    reward: 'Reward: 500 Escape Coins',
                  ),
                ),
              ),
              Container(
                height: 200.0,
                child: wrapWithModel(
                  model: _model.activeChallengeCardCompModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: ActiveChallengeCardCompWidget(
                    challengeID: 'Streak Master',
                    title: 'Streak Master',
                    description: 'Maintain a 30-day quest completion streak',
                    reward: 'Reward: 1000 Escape Coins',
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'rsfc0fs9' /* Progress tracked on-device • P... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'QUEST_VERSION5_BACK_TO_HOME_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        HomeVersion5Widget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 2),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'zqxij5gj' /* Back to Home */,
                    ),
                    icon: Icon(
                      Icons.home,
                      size: 22.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 200.0,
              ),
              Container(
                height: 200.0,
              ),
              Container(
                height: 200.0,
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
