import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _JournalPage1WidgetState extends State<JournalPage1Widget>
    with TickerProviderStateMixin {
  late JournalPage1Model _model;

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
      'audioPlayerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<JournalRecord>>(
      stream: queryJournalRecord(),
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
        List<JournalRecord> containerJournalRecordList = snapshot.data!;

        return Container(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown,
                },
              ),
              child: Scrollbar(
                controller: _model.columnController,
                child: SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
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
                            },
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '8spyuc37' /* Voice Ritual */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sfyapfa2' /* Recording in progress */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
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
                          color: Color(0xFFE3F2FD),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: FlutterFlowTheme.of(context).secondary,
                              offset: Offset(
                                0.0,
                                4.0,
                              ),
                              spreadRadius: 8.0,
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
                                          _model.stopAudioRitual =
                                              audioFilePath;
                                          _model.recordedFileBytes = audioBytes;
                                        },
                                      );

                                      logFirebaseEvent(
                                          'LottieAnimation_backend_call');

                                      await containerJournalRecordList
                                          .take(5)
                                          .toList()
                                          .firstOrNull!
                                          .reference
                                          .update(createJournalRecordData(
                                            journalVoiceNote:
                                                _model.stopAudioRitual,
                                          ));

                                      safeSetState(() {});
                                    },
                                    child: Lottie.asset(
                                      'assets/jsons/Enable_mic.json',
                                      width: 205.58,
                                      height: 110.3,
                                      fit: BoxFit.contain,
                                      animate: true,
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
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
                                    Icon(
                                      Icons.edit,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'low9boyr' /* Today I'm feeling grateful for... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Color(0xF0D0E3F7),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2fmsw1xr' /* I think what I'm learning is t... */,
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
                              ].divide(SizedBox(height: 12.0)),
                            ),
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
                          height: 88.81,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: FlutterFlowAudioPlayer(
                              audio: Audio.network(
                                _model.stopAudioRitual!,
                                metas: Metas(
                                  title: containerJournalRecordList
                                      .firstOrNull?.journalTitle,
                                ),
                              ),
                              titleTextStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'The Seasons',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    letterSpacing: 0.0,
                                  ),
                              playbackDurationTextStyle: FlutterFlowTheme.of(
                                      context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              fillColor: FlutterFlowTheme.of(context).primary,
                              playbackButtonColor:
                                  FlutterFlowTheme.of(context).accent1,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor: Color(0x741C2444),
                              elevation: 8.0,
                              pauseOnNavigate: false,
                              playInBackground: PlayInBackground.enabled,
                            ).animateOnPageLoad(animationsMap[
                                'audioPlayerOnPageLoadAnimation']!),
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
                              logFirebaseEvent(
                                  'JOURNAL_PAGE1_COMP_delete_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_delete_data');
                              await FirebaseStorage.instance
                                  .refFromURL(_model.stopAudioRitual!)
                                  .delete();
                            },
                          ),
                        ].divide(SizedBox(width: 24.0)),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'JOURNAL_PAGE1_FINISH_RECORDING_BTN_ON_TA');
                          logFirebaseEvent('Button_backend_call');

                          await containerJournalRecordList
                              .firstOrNull!.reference
                              .update(createJournalRecordData(
                            journalVoiceNote: _model.stopAudioRitual,
                          ));
                          logFirebaseEvent('Button_show_snack_bar');
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Voice Note Saved!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              action: SnackBarAction(
                                label: 'Click Here to Head Home!',
                                textColor:
                                    FlutterFlowTheme.of(context).alternate,
                                onPressed: () async {
                                  context.pushNamed(
                                    HomeVersion5Widget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
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
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.orange,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
            ),
          ),
        );
      },
    );
  }
}
