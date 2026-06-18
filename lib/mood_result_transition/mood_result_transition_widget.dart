import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'mood_result_transition_model.dart';
export 'mood_result_transition_model.dart';

class MoodResultTransitionWidget extends StatefulWidget {
  const MoodResultTransitionWidget({
    super.key,
    required this.moodResult,
    double? stressLevel,
    String? energyLevel,
    this.moodPhoto,
  })  : this.stressLevel = stressLevel ?? 0.5,
        this.energyLevel = energyLevel ?? 'Moderate';

  final String? moodResult;
  final double stressLevel;
  final String energyLevel;
  final String? moodPhoto;

  static String routeName = 'MoodResultTransition';
  static String routePath = '/moodResultTransition';

  @override
  State<MoodResultTransitionWidget> createState() =>
      _MoodResultTransitionWidgetState();
}

class _MoodResultTransitionWidgetState
    extends State<MoodResultTransitionWidget> {
  late MoodResultTransitionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodResultTransitionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodResultTransition'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MOOD_RESULT_TRANSITION_MoodResultTransit');
      logFirebaseEvent('MoodResultTransition_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('MoodResultTransition_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(0.5);
      await _model.soundPlayer!
          .setAsset('assets/audios/krnbeatz-dawn-logo-430179.mp3')
          .then((_) => _model.soundPlayer!.play());

      logFirebaseEvent('MoodResultTransition_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 5000,
        ),
      );
      if (widget.moodResult != null && widget.moodResult != '') {
        logFirebaseEvent('MoodResultTransition_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Mood Scan Success!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x8EF0831A),
          ),
        );
        logFirebaseEvent('MoodResultTransition_hide_snack_bar');
        ScaffoldMessenger.of(context).clearSnackBars();
      } else {
        logFirebaseEvent('MoodResultTransition_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Mood Scan Failure, please make sure to retake your picture so that we can get a good read on your mood!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).accent3,
          ),
        );
        logFirebaseEvent('MoodResultTransition_navigate_back');
        context.safePop();
        logFirebaseEvent('MoodResultTransition_hide_snack_bar');
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        return;
      }

      logFirebaseEvent('MoodResultTransition_navigate_to');

      context.pushNamed(
        MoodResultPageWidget.routeName,
        queryParameters: {
          'moodResult': serializeParam(
            widget.moodResult,
            ParamType.String,
          ),
          'energyLevel': serializeParam(
            widget.energyLevel,
            ParamType.String,
          ),
          'stressLevel': serializeParam(
            widget.stressLevel,
            ParamType.double,
          ),
          'moodPhoto': serializeParam(
            widget.moodPhoto,
            ParamType.String,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 3),
          ),
        },
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0x08000000),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 946.37,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                      ).image,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x25EDF1F7),
                              Color(0x5CD0E3F7),
                              FlutterFlowTheme.of(context).secondary
                            ],
                            stops: [0.0, 0.75, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Lottie.asset(
                                'assets/jsons/Scan_Matrix.json',
                                width: 480.1,
                                height: 1058.7,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 80.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'g61wp8e6' /* Step 2 of 3 */,
                                          ),
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
                                                color: Color(0xCCFFFFFF),
                                                fontSize: 16.0,
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
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 25.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'd0sffowi' /* Mood Is Scanning... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'The Seasons',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '871l821p' /* Scanning Your Mood For the Day */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w200,
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
                                                    fontWeight: FontWeight.w200,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ].divide(SizedBox(height: 32.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 300.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Logo_ESCAPE_Black.png',
                                      width: 200.0,
                                      height: 143.9,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
