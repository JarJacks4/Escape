import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'journal_page1_model.dart';
export 'journal_page1_model.dart';

class JournalPage1Widget extends StatefulWidget {
  const JournalPage1Widget({super.key});

  @override
  State<JournalPage1Widget> createState() => _JournalPage1WidgetState();
}

class _JournalPage1WidgetState extends State<JournalPage1Widget>
    with TickerProviderStateMixin {
  late JournalPage1Model _model;

  // 新增：控制 "Recording in progress" badge 显示
  bool _isRecording = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPage1Model());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 320.0.ms,
            begin: 0.0,
            end: 1.0,
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

  Future<void> _saveToFirestore() async {
    try {
      final snapshot = await queryJournalRecord(singleRecord: true).first;
      DocumentReference ref;
      if (snapshot.isNotEmpty) {
        ref = snapshot.first.reference;
      } else {
        ref = await FirebaseFirestore.instance
            .collection('Journal')
            .add(createJournalRecordData(
              isAudioRecording: false,
              isAudioStopped: false,
            ));
      }
      await ref.update({
        ...createJournalRecordData(
          voiceNoteContent: _model.voiceNoteText,
          isAudioStopped: true,
          isAudioRecording: false,
        ),
        ...mapToFirestore(
          {
            'TranscribeText': FieldValue.arrayUnion(
              _model.transcriptWords,
            ),
          },
        ),
      });
    } catch (e) {
      print('Firestore save error: $e');
    }
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'JOURNAL_PAGE1_COMP_arrow_back_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                        logFirebaseEvent('IconButton_haptic_feedback');
                        HapticFeedback.lightImpact();
                      },
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '8spyuc37' /* Voice Ritual */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'The Seasons',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.keyboard_control,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'g3dldjhl' /* Speak your thoughts freely. I ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'WorkSans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),

              // 改动：原来是无条件显示，现在只在录音时显示
              if (_isRecording)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFCC80),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'sfyapfa2' /* Recording in progress */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),

              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Color(0x2DE3F2FD),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 40.0,
                      color: Color(0xFAEDF1F7),
                      offset: Offset(0.0, 0.0),
                      spreadRadius: 20.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 50.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'JOURNAL_PAGE1_LottieAnimation_kukw10w1_O');
                                HapticFeedback.heavyImpact();
                                _model.soundPlayer ??= AudioPlayer();
                                if (_model.soundPlayer!.playing) {
                                  await _model.soundPlayer!.stop();
                                }
                                _model.soundPlayer!.setVolume(1.0);
                                _model.soundPlayer!
                                    .setAsset(
                                        'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                    .then((_) => _model.soundPlayer!.play());

                                await startAudioRecording(
                                  context,
                                  audioRecorder:
                                      _model.audioRecorder ??= AudioRecorder(),
                                );

                                // 改动：开始录音时显示 badge
                                safeSetState(() {
                                  _isRecording = true;
                                });
                              },
                              onDoubleTap: () async {
                                logFirebaseEvent(
                                    'JOURNAL_PAGE1_LottieAnimation_kukw10w1_O');
                                HapticFeedback.heavyImpact();

                                await stopAudioRecording(
                                  audioRecorder: _model.audioRecorder,
                                  audioName: 'recordedFileBytes',
                                  onRecordingComplete:
                                      (audioFilePath, audioBytes) {
                                    _model.audioJournalRecording = audioFilePath;
                                    _model.recordedFileBytes = audioBytes;
                                  },
                                );

                                // 改动：停止录音时隐藏 badge
                                safeSetState(() {
                                  _isRecording = false;
                                  _model.voiceNote = _model.audioJournalRecording;
                                });

                                _model.voiceNoteFile = _model.recordedFileBytes;

                                _model.gorqTranscriptionResult =
                                    await EscapeAudioScriptCall.call(
                                  file: _model.voiceNoteFile,
                                  gorqKey: FFAppState().gorqKey,
                                );

                                print('succeeded: ${_model.gorqTranscriptionResult?.succeeded}');
                                print('bodyText: ${_model.gorqTranscriptionResult?.bodyText}');
                                print('jsonBody: ${_model.gorqTranscriptionResult?.jsonBody}');
                                print('statusCode: ${_model.gorqTranscriptionResult?.statusCode}');

                                if (_model.gorqTranscriptionResult?.succeeded ??
                                    false) {
                                  final transcribedText = getJsonField(
                                    _model.gorqTranscriptionResult?.jsonBody,
                                    r'''$.text''',
                                  ).toString().trim();

                                  _model.addToTranscriptWords(transcribedText);
                                  _model.visibleText = transcribedText;
                                  _model.isTyping = !(_model.isTyping ?? true);
                                  safeSetState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Transcription failed, please try again.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              },
                              child: Lottie.asset(
                                'assets/jsons/Enable_mic.json',
                                width: 205.58,
                                height: 110.3,
                                fit: BoxFit.cover,
                                reverse: true,
                                animate: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'dgtvicyc' /* Real-time Transcription */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                            AnimatedOpacity(
                              opacity: _model.visibleText != null &&
                                      _model.visibleText != ''
                                  ? 1.0
                                  : 0.0,
                              duration: 300.0.ms,
                              curve: Curves.easeInOut,
                              child: AnimatedDefaultTextStyle(
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xF0D0E3F7),
                                      letterSpacing: 0.0,
                                    ),
                                duration: Duration(milliseconds: 795),
                                curve: Curves.easeIn,
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.transcriptWords.lastOrNull,
                                    'Your transcription will appear here...',
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('JOURNAL_PAGE1_COMP_Row_3ff5bhws_ON_TAP');
                  _model.voiceNote = null;
                  _model.voiceNoteFile = null;
                  _model.transcriptWords.clear();
                  _model.visibleText = null;
                  safeSetState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 24.0,
                      buttonSize: 48.0,
                      fillColor: Color(0xFFE0E0E0),
                      icon: Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('JOURNAL_PAGE1_COMP_delete_ICN_ON_TAP');
                        _model.voiceNote = null;
                        _model.voiceNoteFile = null;
                        _model.recordedFileBytes = FFUploadedFile(
                          bytes: Uint8List.fromList([]),
                          originalFilename: '',
                        );
                        _model.transcriptWords.clear();
                        _model.visibleText = null;
                        _model.isTyping = false;
                        safeSetState(() {});
                      },
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('JOURNAL_PAGE1_FINISH_RECORDING_BTN_ON_TA');
                  await _saveToFirestore();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Voice Note Saved!',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                      action: SnackBarAction(
                        label: 'Click Here to Head Home!',
                        textColor: FlutterFlowTheme.of(context).alternate,
                        onPressed: () async {
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
                      ),
                    ),
                  );
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
                  'xwlxogy0' /* Finish Recording */,
                ),
                icon: Icon(
                  Icons.check,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconColor: FlutterFlowTheme.of(context).primary,
                  color: Colors.orange,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}