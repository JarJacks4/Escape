import '/backend/api_requests/api_calls.dart';
import '/components/new_home_version5_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'home_version5_model.dart';
export 'home_version5_model.dart';

class HomeVersion5Widget extends StatefulWidget {
  const HomeVersion5Widget({super.key});

  static String routeName = 'HomeVersion5';
  static String routePath = 'homeVersion5';

  @override
  State<HomeVersion5Widget> createState() => _HomeVersion5WidgetState();
}

class _HomeVersion5WidgetState extends State<HomeVersion5Widget>
    with TickerProviderStateMixin {
  late HomeVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomeVersion5'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_VERSION5_HomeVersion5_ON_INIT_STATE');
      logFirebaseEvent('HomeVersion5_backend_call');
      _model.createSession =
          await LucilleStreamingGroup.createNewSessionCall.call();

      logFirebaseEvent('HomeVersion5_update_app_state');
      FFAppState().chatSessionId =
          LucilleStreamingGroup.createNewSessionCall.sessionID(
        (_model.createSession?.jsonBody ?? ''),
      )!;
      FFAppState().update(() {});
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 190.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 190.0.ms,
            duration: 1220.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1680.0.ms,
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
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideNavModel,
              updateCallback: () => safeSetState(() {}),
              child: SideNavWidget(),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 815.48,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            color: Colors.white,
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                            spreadRadius: 20.0,
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
                      ),
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
                                Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.5,
                                      child: Hero(
                                        tag: 'background',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/spiritual-chakra-pensive-man-face-purple-blue-mist-4k-2025-08-29-06-28-30-utc.gif',
                                            width: 409.6,
                                            height: 876.8,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation']!),
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 872.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xB8EDF1F7),
                                                    Colors.white,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary
                                                  ],
                                                  stops: [0.0, 0.8, 1.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .newHomeVersion5Model,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      NewHomeVersion5Widget(),
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation']!),
                                          ),
                                        ),
                                      ],
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
        ),
      ),
    );
  }
}
