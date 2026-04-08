import '/components/explore_screen_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'explore_page_version5_model.dart';
export 'explore_page_version5_model.dart';

class ExplorePageVersion5Widget extends StatefulWidget {
  const ExplorePageVersion5Widget({super.key});

  static String routeName = 'ExplorePageVersion5';
  static String routePath = 'ExplorePageVersion5';

  @override
  State<ExplorePageVersion5Widget> createState() =>
      _ExplorePageVersion5WidgetState();
}

class _ExplorePageVersion5WidgetState extends State<ExplorePageVersion5Widget>
    with TickerProviderStateMixin {
  late ExplorePageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExplorePageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ExplorePageVersion5'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EXPLORE_VERSION5_ExplorePageVersion5_ON_');
      logFirebaseEvent('ExplorePageVersion5_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('ExplorePageVersion5_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!
          .setAsset(
              'assets/audios/lucadialessandro-calm-ambient-intro-490646.mp3')
          .then((_) => _model.soundPlayer!.play());
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
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => safeSetState(() {}),
                child: SideNavWidget(),
              ),
            ),
          ),
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
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
                            FlutterFlowTheme.of(context).tertiary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: [0.0, 0.2, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: _model.columnController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Stack(
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
                                          'assets/images/Reset_All_Tab_(1).png',
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
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 917.39,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x78D0E3F7),
                                                Color(0x53D0E3F7),
                                                Color(0x75FFFFFF)
                                              ],
                                              stops: [0.0, 0.5, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 80.0,
                                                sigmaY: 80.0,
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                height: 66.59,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0x5339519F),
                                                      Color(0x9CD0E3F7),
                                                      Color(0x22E600F9)
                                                    ],
                                                    stops: [0.0, 0.5, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -0.64),
                                                    end: AlignmentDirectional(
                                                        -1.0, 0.64),
                                                  ),
                                                ),
                                                child: wrapWithModel(
                                                  model:
                                                      _model.exploreScreenModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: ExploreScreenWidget(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation']!),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
