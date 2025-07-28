import '/auth/firebase_auth/auth_util.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'mood_analyzer_success_comp_model.dart';
export 'mood_analyzer_success_comp_model.dart';

class MoodAnalyzerSuccessCompWidget extends StatefulWidget {
  const MoodAnalyzerSuccessCompWidget({super.key});

  @override
  State<MoodAnalyzerSuccessCompWidget> createState() =>
      _MoodAnalyzerSuccessCompWidgetState();
}

class _MoodAnalyzerSuccessCompWidgetState
    extends State<MoodAnalyzerSuccessCompWidget> with TickerProviderStateMixin {
  late MoodAnalyzerSuccessCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodAnalyzerSuccessCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MOOD_ANALYZER_SUCCESS_MoodAnalyzerSucces');
      logFirebaseEvent('MoodAnalyzerSuccessComp_gemini');
      await geminiGenerateText(
        context,
        'Could I get a 200 character reccommendation on what I can do to improve my {CurrentMood} today within Escapeapp.ai Mobile app. Here is my mood: ${valueOrDefault(currentUserDocument?.currentMood, '')}',
      ).then((generatedText) {
        safeSetState(
            () => _model.moodDescriptionBottomSheetAction = generatedText);
      });
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
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
      'textOnPageLoadAnimation2': AnimationInfo(
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
      'buttonOnPageLoadAnimation1': AnimationInfo(
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
      'buttonOnPageLoadAnimation2': AnimationInfo(
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
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 3600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(5.0, 5.0),
            end: Offset(1.0, 1.0),
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
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Material(
            color: Colors.transparent,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 560.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100.0,
                    color: Color(0x7FD0E3F7),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.214,
                        height: MediaQuery.sizeOf(context).height * 0.093,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 200.0,
                            height: 200.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault(
                                  currentUserDocument?.currentMood, ''),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    fontSize: 36.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: AnimatedDefaultTextStyle(
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  lineHeight: 1.5,
                                ),
                            duration: Duration(milliseconds: 1185),
                            curve: Curves.easeIn,
                            child: Text(
                              valueOrDefault<String>(
                                _model.moodDescriptionBottomSheetAction,
                                'It is amazing that you have taken the time to Escape help you uplift your day for the better. Tap Go Home to navigate to Home. If you have any last minute adjustments or would like to change your mood, tap the Back button.',
                              ).maybeHandleOverflow(
                                maxChars: 300,
                                replacement: '…',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 154.99,
                                height: 47.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MOOD_ANALYZER_SUCCESS_BACK_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_back');
                                    context.pop();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '8zuuz72j' /* Back */,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 28.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconAlignment: IconAlignment.start,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    color: Color(0xA639519F),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    elevation: 1.0,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'buttonOnPageLoadAnimation1']!),
                              ),
                              Container(
                                width: 161.01,
                                height: 47.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MOOD_ANALYZER_SUCCESS_GO_HOME_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      HomeVersion4Widget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 1),
                                        ),
                                      },
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'dm6e51rh' /* Go Home */,
                                  ),
                                  icon: Icon(
                                    Icons.home,
                                    size: 28.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconAlignment: IconAlignment.end,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    elevation: 3.0,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'buttonOnPageLoadAnimation2']!),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Logo_ESCAPE_DarkBlue.png',
                            width: 115.9,
                            height: 32.3,
                            fit: BoxFit.contain,
                            alignment: Alignment(0.0, 0.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                    ].divide(SizedBox(height: 6.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Lottie.asset(
          'assets/jsons/Animation_-_1738955750147.json',
          width: 435.2,
          height: 304.42,
          fit: BoxFit.contain,
          animate: true,
        ).animateOnPageLoad(
            animationsMap['lottieAnimationOnPageLoadAnimation']!),
      ],
    );
  }
}
