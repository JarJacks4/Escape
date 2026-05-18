import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'splash_screen_version5_model.dart';
export 'splash_screen_version5_model.dart';

class SplashScreenVersion5Widget extends StatefulWidget {
  const SplashScreenVersion5Widget({super.key});

  static String routeName = 'splashScreenVersion5';
  static String routePath = '/splashScreenVersion5';

  @override
  State<SplashScreenVersion5Widget> createState() =>
      _SplashScreenVersion5WidgetState();
}

class _SplashScreenVersion5WidgetState extends State<SplashScreenVersion5Widget>
    with TickerProviderStateMixin {
  late SplashScreenVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'splashScreenVersion5'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_SCREEN_VERSION5_splashScreenVersi');
      logFirebaseEvent('splashScreenVersion5_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('splashScreenVersion5_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!
          .setAsset(
              'assets/audios/samuelfjohanns-aeolian-futuristics-atmo-track-119821.mp3')
          .then((_) => _model.soundPlayer!.play());
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
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
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1610.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1490.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1730.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        backgroundColor: Color(0xFF1C2444),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'SPLASH_SCREEN_VERSION5_Image_xd31kjpi_ON');
                    logFirebaseEvent('Image_haptic_feedback');
                    HapticFeedback.heavyImpact();
                    logFirebaseEvent('Image_stop_sound');
                    _model.soundPlayer?.stop();
                    logFirebaseEvent('Image_navigate_to');

                    context.pushNamed(
                      NewSignInVersion5Widget.routeName,
                      queryParameters: {
                        'tabIndexLogin': serializeParam(
                          0,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 9),
                        ),
                      },
                    );
                  },
                  child: Hero(
                    tag: 'background',
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ),
              Opacity(
                opacity: 0.7,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 219.1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 50.0,
                          color: Colors.white,
                          offset: Offset(
                            8.0,
                            8.0,
                          ),
                          spreadRadius: 10.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.only(),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 238.5,
                        height: 176.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Lottie.asset(
                          'assets/jsons/Untitled_file_(1).json',
                          width: 200.0,
                          height: 154.51,
                          fit: BoxFit.cover,
                          repeat: false,
                          animate: true,
                        ),
                      ),
                      Opacity(
                        opacity: 0.8,
                        child: AnimatedDefaultTextStyle(
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            shadows: [
                              Shadow(
                                color: FlutterFlowTheme.of(context).primary,
                                offset: Offset(8.0, 8.0),
                                blurRadius: 8.0,
                              )
                            ],
                          ),
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2u5pnwww' /* Tap the Screen Above to Procee... */,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
      ),
    );
  }
}
