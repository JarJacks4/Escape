import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'loading_screen_animus_model.dart';
export 'loading_screen_animus_model.dart';

class LoadingScreenAnimusWidget extends StatefulWidget {
  const LoadingScreenAnimusWidget({super.key});

  static String routeName = 'LoadingScreenAnimus';
  static String routePath = 'loadingScreenAnimus';

  @override
  State<LoadingScreenAnimusWidget> createState() =>
      _LoadingScreenAnimusWidgetState();
}

class _LoadingScreenAnimusWidgetState extends State<LoadingScreenAnimusWidget>
    with TickerProviderStateMixin {
  late LoadingScreenAnimusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenAnimusModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoadingScreenAnimus'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_SCREEN_ANIMUS_LoadingScreenAnimu');
      logFirebaseEvent('LoadingScreenAnimus_custom_action');
      await actions.launchUnrealScene(
        'Animus',
      );
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
              Opacity(
                opacity: 0.4,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'LOADING_SCREEN_ANIMUS_Image_cafwybrf_ON_');
                      logFirebaseEvent('Image_navigate_to');

                      context.pushNamed(
                        LoginPageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/download_(18).gif',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.9,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 50.0,
                          color: FlutterFlowTheme.of(context).secondary,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 10.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0x3ED0E3F7),
                          FlutterFlowTheme.of(context).tertiary
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
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Logo_ESCAPE_White.png',
                          width: 200.0,
                          height: 82.31,
                          fit: BoxFit.contain,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
              Lottie.asset(
                'assets/jsons/Animation_-_1748148160953.json',
                width: 425.2,
                height: 628.67,
                fit: BoxFit.contain,
                animate: true,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 250.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Container(
                                  width: 140.0,
                                  height: 59.0,
                                  decoration: BoxDecoration(),
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: AnimatedDefaultTextStyle(
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'The Seasons',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeIn,
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'cvjat7sn' /* Loading... */,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
