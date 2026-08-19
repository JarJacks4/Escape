import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:material_palette/material_palette.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'active_voice_journaling_model.dart';
export 'active_voice_journaling_model.dart';

class ActiveVoiceJournalingWidget extends StatefulWidget {
  const ActiveVoiceJournalingWidget({super.key});

  static String routeName = 'ActiveVoiceJournaling';
  static String routePath = '/activeVoiceJournaling';

  @override
  State<ActiveVoiceJournalingWidget> createState() =>
      _ActiveVoiceJournalingWidgetState();
}

class _ActiveVoiceJournalingWidgetState
    extends State<ActiveVoiceJournalingWidget> {
  late ActiveVoiceJournalingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveVoiceJournalingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActiveVoiceJournaling'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return RadialTurbulenceGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: 1000.0,
                  params: ShaderParams(values: {
                    'gradientCenterX': 0.5,
                    'gradientCenterY': 0.3,
                    'gradientScale': 2.03,
                    'gradientOffset': -0.02,
                    'noiseIntensity': 0.51,
                    'ditherStrength': 0.0,
                    'ditherScale': 1.0,
                    'animSpeed': 0.75,
                    'octaves': 3.02,
                    'baseFrequency': 1.94,
                    'noiseScale': 3.9,
                    'colorCount': 3.0,
                    'softness': 1.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'bumpStrength': 1.68,
                    'lightDirX': 0.17,
                    'lightDirY': 0.5,
                    'lightDirZ': 1.0,
                    'lightIntensity': 1.62,
                    'ambient': 0.67,
                    'specular': 0.06,
                    'shininess': 35.72,
                    'metallic': 0.0,
                    'roughness': 1.0,
                    'edgeFade': 2.3,
                    'edgeFadeMode': 1.0
                  }, colors: {
                    'color3': Color(0x00808080),
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080),
                    'color1': FlutterFlowTheme.of(context).tertiary,
                    'color0': FlutterFlowTheme.of(context).secondary,
                    'color2': FlutterFlowTheme.of(context).accent1
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                height: 873.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xCC1C2444), Colors.transparent],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(35.0),
                    child: StreamBuilder<List<JournalRecord>>(
                      stream: queryJournalRecord(
                        parent: currentUserReference,
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: SpinKitWave(
                                color: FlutterFlowTheme.of(context).accent1,
                                size: 100.0,
                              ),
                            ),
                          );
                        }
                        List<JournalRecord> columnJournalRecordList =
                            snapshot.data!;
                        final columnJournalRecord =
                            columnJournalRecordList.isNotEmpty
                                ? columnJournalRecordList.first
                                : null;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'aw9n2qnv' /* Say anything that's on your mi... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.playfairDisplay(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(9999.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 12.0,
                                        sigmaY: 12.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x33FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(9999.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0x4DFFFFFF),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 16.0),
                                          child: Container(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't6s66ls5' /* Ready */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font: GoogleFonts.workSans(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 240.0,
                                height: 216.91,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Lottie.network(
                                        'https://dimg.dreamflow.cloud/v1/lottie/soft+glowing+circular+pulse+animation+in+orange+and+yellow',
                                        width: 240.0,
                                        height: 240.0,
                                        fit: BoxFit.contain,
                                        animate: true,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ACTIVE_VOICE_JOURNALING_Container_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent(
                                            'Container_play_sound');
                                        _model.soundPlayer ??= AudioPlayer();
                                        if (_model.soundPlayer!.playing) {
                                          await _model.soundPlayer!.stop();
                                        }
                                        _model.soundPlayer!.setVolume(1.0);
                                        _model.soundPlayer!
                                            .setAsset(
                                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                            .then((_) =>
                                                _model.soundPlayer!.play());

                                        logFirebaseEvent(
                                            'Container_start_audio_recording');
                                        await startAudioRecording(
                                          context,
                                          audioRecorder:
                                              _model.audioRecorder ??=
                                                  AudioRecorder(),
                                        );
                                        _model.timerController.onStartTimer();

                                        logFirebaseEvent(
                                            'Container_backend_call');

                                        await columnJournalRecord!.reference
                                            .update(createJournalRecordData(
                                          isAudioRecording: true,
                                        ));
                                      },
                                      onDoubleTap: () async {
                                        logFirebaseEvent(
                                            'ACTIVE_VOICE_JOURNALING_Container_ON_DOU');
                                        logFirebaseEvent(
                                            'Container_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent(
                                            'Container_stop_audio_recording');
                                        await stopAudioRecording(
                                          audioRecorder: _model.audioRecorder,
                                          audioName: 'recordedFileBytes',
                                          onRecordingComplete:
                                              (audioFilePath, audioBytes) {
                                            _model.audioJournalRecording =
                                                audioFilePath;
                                            _model.recordedFileBytes =
                                                audioBytes;
                                          },
                                        );
                                        _model.timerController.onStopTimer();

                                        logFirebaseEvent(
                                            'Container_backend_call');
                                        _model.gorqTranscriptionResult =
                                            await EscapeAudioScriptCall.call(
                                          file: _model.recordedFileBytes,
                                          gorqKey: FFAppState().gorqKey,
                                        );

                                        logFirebaseEvent(
                                            'Container_backend_call');

                                        await columnJournalRecord!.reference
                                            .update({
                                          ...createJournalRecordData(
                                            isAudioStopped: true,
                                            isAudioRecording: false,
                                            journalVoiceNote:
                                                _model.audioJournalRecording,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'TranscribeText':
                                                  FieldValue.arrayUnion([
                                                TheoryOfMindLucilleGroup
                                                    .lucilleChatMainCall
                                                    .response(
                                                  (_model.transcribedMood
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                              ]),
                                            },
                                          ),
                                        });
                                        if ((_model
                                                .transcribedMood?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Container_backend_call');

                                          await columnJournalRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'TranscribeText':
                                                    FieldValue.arrayUnion([
                                                  (EscapeAudioScriptCall
                                                          .text(_model
                                                              .gorqTranscriptionResult
                                                              ?.jsonBody) ??
                                                      '')
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'Container_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Trannscrip',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(9999.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0x33FFFFFF),
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.mic_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 32.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/jsons/waves.json',
                                  width: 355.51,
                                  height: 89.9,
                                  fit: BoxFit.contain,
                                  animate:
                                      columnJournalRecord?.isAudioRecording ??
                                          false,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 15.0,
                                      sigmaY: 15.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x26FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x66FFFFFF),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 16.0, 24.0, 16.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: FlutterFlowTimer(
                                            initialTime:
                                                _model.timerInitialTimeMs,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller: _model.timerController,
                                            updateStateInterval:
                                                Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate)
                                                safeSetState(() {});
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 9999.0,
                                        borderWidth: 1.0,
                                        buttonSize: 48.0,
                                        fillColor: Color(0x33F0831A),
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 32.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ACTIVE_VOICE_JOURNALING_IconButton_ON_TA');
                                          logFirebaseEvent(
                                              'IconButton_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'zt9fx5kb' /* Cancel */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.workSans(
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
                                                .alternate,
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 9999.0,
                                        buttonSize: 56.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .success,
                                        icon: Icon(
                                          Icons.check_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 40.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ACTIVE_VOICE_JOURNALING_IconButton_ON_TA');
                                          logFirebaseEvent(
                                              'IconButton_haptic_feedback');
                                          HapticFeedback.heavyImpact();
                                          logFirebaseEvent(
                                              'IconButton_backend_call');
                                          _model.transcribedMood =
                                              await TheoryOfMindLucilleGroup
                                                  .lucilleChatMainCall
                                                  .call(
                                            sessionId:
                                                FFAppState().chatSessionId,
                                            userId: currentUserUid,
                                            message:
                                                'Hey Lucille, could you summarize the mood from the following transcribed words? We only need the mood in one word: ${(EscapeAudioScriptCall.text(_model.gorqTranscriptionResult?.jsonBody) ?? '')}',
                                          );

                                          logFirebaseEvent(
                                              'IconButton_backend_call');
                                          _model.transcriptionTitle =
                                              await TheoryOfMindLucilleGroup
                                                  .lucilleChatMainCall
                                                  .call(
                                            sessionId:
                                                FFAppState().chatSessionId,
                                            userId: currentUserUid,
                                            message:
                                                'Hey Lucille, could you summarize the a 3 Word Title from the following transcribed words? We only need the title in one word: ${(EscapeAudioScriptCall.text(_model.gorqTranscriptionResult?.jsonBody) ?? '')}',
                                          );

                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.pushNamed(
                                            VoiceJournalResultCopyWidget
                                                .routeName,
                                            queryParameters: {
                                              'transcribedWords':
                                                  serializeParam(
                                                (EscapeAudioScriptCall
                                                        .text(_model
                                                            .gorqTranscriptionResult
                                                            ?.jsonBody) ??
                                                    ''),
                                                ParamType.String,
                                              ),
                                              'detectedMood': serializeParam(
                                                TheoryOfMindLucilleGroup
                                                    .lucilleChatMainCall
                                                    .response(
                                                  (_model.transcribedMood
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'journalVoiceNote':
                                                  serializeParam(
                                                _model.audioJournalRecording,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 2),
                                              ),
                                            },
                                          );

                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ufeu7bs8' /* Finish */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.workSans(
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
                                                .alternate,
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
                              ].divide(SizedBox(width: 32.0)),
                            ),
                          ].divide(SizedBox(height: 32.0)),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
