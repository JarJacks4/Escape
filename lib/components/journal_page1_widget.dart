import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:record/record.dart';
import 'journal_page1_model.dart';
export 'journal_page1_model.dart';

/// New Component Gen
class JournalPage1Widget extends StatefulWidget {
  const JournalPage1Widget({super.key});

  @override
  State<JournalPage1Widget> createState() => _JournalPage1WidgetState();
}

class _JournalPage1WidgetState extends State<JournalPage1Widget> {
  late JournalPage1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPage1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'sfyapfa2' /* Recording in progress */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'WorkSans',
                              color: FlutterFlowTheme.of(context).primaryText,
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
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                      spreadRadius: 20.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: StreamBuilder<List<JournalRecord>>(
                    stream: queryJournalRecord(
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
                                    logFirebaseEvent(
                                        'LottieAnimation_start_audio_recording');
                                    await startAudioRecording(
                                      context,
                                      audioRecorder: _model.audioRecorder ??=
                                          AudioRecorder(),
                                    );

                                    logFirebaseEvent(
                                        'LottieAnimation_backend_call');

                                    await columnJournalRecord!.reference
                                        .update(createJournalRecordData(
                                      isAudioRecording: true,
                                    ));
                                  },
                                  onDoubleTap: () async {
                                    logFirebaseEvent(
                                        'JOURNAL_PAGE1_LottieAnimation_kukw10w1_O');
                                    logFirebaseEvent(
                                        'LottieAnimation_stop_audio_recording');
                                    await stopAudioRecording(
                                      audioRecorder: _model.audioRecorder,
                                      audioName: 'recordedFileBytes',
                                      onRecordingComplete:
                                          (audioFilePath, audioBytes) {
                                        _model.audioJournalRecording =
                                            audioFilePath;
                                        _model.recordedFileBytes = audioBytes;
                                      },
                                    );

                                    logFirebaseEvent(
                                        'LottieAnimation_update_component_state');
                                    _model.voiceNote =
                                        _model.audioJournalRecording;
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'LottieAnimation_a_i_agent');
                                    await callAiAgent(
                                      context: context,
                                      prompt:
                                          'Transcribe this audio recording exactly as spoken.\nPreserve natural pauses.\nDo not summarize.\nReturn only the raw transcription text.',
                                      audioUrl: _model.voiceNote,
                                      threadId: '1',
                                      agentCloudFunctionName:
                                          'lucilleJournalTranscription',
                                      provider: 'GOOGLE',
                                      agentJson:
                                          '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lucilleJournalTranscription\",\"key\":\"yzabi\"},\"name\":\"Lucille Journal Transcription\",\"description\":\"Lucille AI Agent for carrying out transcription of text\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-flash-lite\",\"parameters\":{\"temperature\":{\"inputValue\":0.2},\"maxTokens\":{\"inputValue\":8637},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Transcribe this audio recording exactly as spoken.\\r\\nPreserve natural pauses.\\r\\nDo not summarize.\\r\\nReturn only the raw transcription text.\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"AUDIO\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
                                      responseType: 'PLAINTEXT',
                                    ).then((generatedText) {
                                      safeSetState(() => _model
                                          .voiceTranscription = generatedText);
                                    });

                                    logFirebaseEvent(
                                        'LottieAnimation_update_component_state');
                                    _model.voiceNoteFile =
                                        _model.recordedFileBytes;
                                    _model.voiceNoteText =
                                        _model.voiceTranscription;
                                    _model.updateTranscriptWordsAtIndex(
                                      _model.currentWordIndex!,
                                      (_) => _model.voiceTranscription!,
                                    );
                                    _model.visibleText =
                                        _model.voiceTranscription;
                                    _model.isTyping =
                                        !(_model.isTyping ?? true);
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'LottieAnimation_backend_call');

                                    await columnJournalRecord!.reference
                                        .update({
                                      ...createJournalRecordData(
                                        voiceNoteContent: _model.voiceNoteText,
                                        isAudioStopped: true,
                                        isAudioRecording: false,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'TranscribeText':
                                              FieldValue.arrayUnion([
                                            _model.transcriptWords
                                                .elementAtOrNull(
                                                    _model.currentWordIndex!)
                                          ]),
                                        },
                                      ),
                                    });

                                    safeSetState(() {});
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
                      );
                    },
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
                                duration: Duration(milliseconds: 270),
                                curve: Curves.easeIn,
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.transcriptWords.firstOrNull,
                                    'Today I\'m feeling grateful for the small moments that brought me joy. The morning coffee tasted especially good, and I noticed how the sunlight filtered through my window in such a beautiful way.',
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            if (_model.isTyping ?? true)
                              AnimatedOpacity(
                                opacity: _model.isTyping! ? 0.0 : 1.0,
                                duration: _model.fadeStartIndex!.ms,
                                curve: Curves.easeOut,
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.transcriptWords.elementAtOrNull(
                                        _model.currentWordIndex!),
                                    'I think what I\'m learning is that happiness isn\'t always about the big achievements, but about being present for these quiet, peaceful moments...',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              Row(
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
                      logFirebaseEvent('IconButton_delete_data');
                      await FirebaseStorage.instance
                          .refFromURL(_model.recordedFileBytes.originalFilename)
                          .delete();
                    },
                  ),
                ].divide(SizedBox(width: 24.0)),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('JOURNAL_PAGE1_FINISH_RECORDING_BTN_ON_TA');
                  logFirebaseEvent('Button_show_snack_bar');
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
