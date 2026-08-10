import '/components/help_comp_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:material_palette/material_palette.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'explore_page_version5_f_i_n_a_l_model.dart';
export 'explore_page_version5_f_i_n_a_l_model.dart';

class ExplorePageVersion5FINALWidget extends StatefulWidget {
  const ExplorePageVersion5FINALWidget({super.key});

  static String routeName = 'ExplorePageVersion5FINAL';
  static String routePath = '/explorePageVersion5FINAL';

  @override
  State<ExplorePageVersion5FINALWidget> createState() =>
      _ExplorePageVersion5FINALWidgetState();
}

class _ExplorePageVersion5FINALWidgetState
    extends State<ExplorePageVersion5FINALWidget>
    with TickerProviderStateMixin {
  late ExplorePageVersion5FINALModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExplorePageVersion5FINALModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ExplorePageVersion5FINAL'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_ExplorePageVe');
      logFirebaseEvent('ExplorePageVersion5FINAL_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('ExplorePageVersion5FINAL_play_sound');
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(1.0);
      _model.soundPlayer1!
          .setAsset(
              'assets/audios/lucadialessandro-calm-ambient-intro-490646.mp3')
          .then((_) => _model.soundPlayer1!.play());
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
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
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1780.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 320.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation16': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation17': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation18': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'lottieAnimationOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: -0.06,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'mouseRegionOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.02, 1.0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(19.0, 27.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(3.5, 3.5),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation19': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.7,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation20': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.4,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.999999999999986, 19.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(2.0, 2.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation21': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.6,
            end: 1.0,
          ),
        ],
      ),
      'lottieAnimationOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: -0.06,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 874.09,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                    ).image,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x25EDF1F7),
                            Color(0x5AD0E3F7),
                            Color(0x8E1C2444)
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 50.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 46.0,
                                  height: 46.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        spreadRadius: 10.0,
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0x5CEDF1F7),
                                    ),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'EXPLORE_VERSION5_F_I_N_A_L_Icon_0hjjbxvb');
                                      logFirebaseEvent('Icon_haptic_feedback');
                                      HapticFeedback.lightImpact();
                                      logFirebaseEvent('Icon_play_sound');
                                      _model.soundPlayer2 ??= AudioPlayer();
                                      if (_model.soundPlayer2!.playing) {
                                        await _model.soundPlayer2!.stop();
                                      }
                                      _model.soundPlayer2!.setVolume(0.62);
                                      _model.soundPlayer2!
                                          .setAsset(
                                              'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                          .then((_) =>
                                              _model.soundPlayer2!.play());

                                      logFirebaseEvent('Icon_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SideNavWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Icon(
                                      Icons.menu_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation']!),
                                ),
                                AnimatedShaderParams(
                                    params: ShaderParams(values: {
                                      'angle': 14.0,
                                      'scale': 1.0,
                                      'offset': 0.0,
                                      'pixelSize': 5.11,
                                      'edgeWidth': 0.35,
                                      'scatter': 0.36,
                                      'noiseAmount': 0.93,
                                      'speed': 0.21
                                    }),
                                    duration:
                                        Duration(milliseconds: (140.0).round()),
                                    curve: Curves.easeIn,
                                    builder: (params, backgroundColor) =>
                                        PixelDissolveShaderWrap(
                                          params: params,
                                          animationMode:
                                              ShaderAnimationMode.explicit,
                                          animationConfig:
                                              ShaderAnimationConfig(
                                                  duration: Duration(
                                                      milliseconds:
                                                          (2400.0).round()),
                                                  curve: Curves.easeIn,
                                                  invert: true),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Hero(
                                              tag: 'logo',
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Logo_ESCAPE_White.png',
                                                  width: 166.1,
                                                  height: 52.8,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'imageOnPageLoadAnimation']!),
                                          ),
                                        )),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x5CFFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8.0,
                                            color: Color(0xB2F0831A),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                            spreadRadius: 3.0,
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'EXPLORE_VERSION5_F_I_N_A_L_LottieAnimati');
                                          logFirebaseEvent(
                                              'LottieAnimation_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'LottieAnimation_play_sound');
                                          _model.soundPlayer3 ??= AudioPlayer();
                                          if (_model.soundPlayer3!.playing) {
                                            await _model.soundPlayer3!.stop();
                                          }
                                          _model.soundPlayer3!.setVolume(0.67);
                                          _model.soundPlayer3!
                                              .setAsset(
                                                  'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer3!.play());

                                          logFirebaseEvent(
                                              'LottieAnimation_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: HelpCompWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Lottie.asset(
                                          'assets/jsons/question_mark_blue.json',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.contain,
                                          repeat: false,
                                          animate: true,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'lottieAnimationOnPageLoadAnimation']!),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Container(
                              width: 182.66,
                              height: 182.66,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.0,
                                    color: Color(0x7FEDF1F7),
                                    offset: Offset(
                                      0.0,
                                      0.0,
                                    ),
                                    spreadRadius: 5.0,
                                  )
                                ],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0x85EDF1F7),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 50.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'x6wy3cve' /* Below, I Have Brought Together... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 204.71,
                            child: CarouselSlider(
                              items: [
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/e3bedab340c6acae47e0f98a0b163900.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_yrlnwfh');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/e3bedab340c6acae47e0f98a0b163900.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation1']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation1']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/e3bedab340c6acae47e0f98a0b163900.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation2']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1jsk6xi0' /* ESCAPE */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'jmrj7cd9' /* Mind */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'di2s4v86' /* Expanding the mental &
 giving... */
                                                                                  ,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                38.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3BFFFFFF),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_Icon_swpgev8d');
                                                                                  logFirebaseEvent('Icon_haptic_feedback');
                                                                                  HapticFeedback.heavyImpact();
                                                                                  logFirebaseEvent('Icon_play_sound');
                                                                                  _model.soundPlayer4 ??= AudioPlayer();
                                                                                  if (_model.soundPlayer4!.playing) {
                                                                                    await _model.soundPlayer4!.stop();
                                                                                  }
                                                                                  _model.soundPlayer4!.setVolume(1.0);
                                                                                  _model.soundPlayer4!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer4!.play());

                                                                                  logFirebaseEvent('Icon_navigate_to');

                                                                                  context.pushNamed(
                                                                                    MindPageWidget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 7),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation3']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation2']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered1 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation3'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation3']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered1 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation3'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation1']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation1']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_l8p83pr');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation3']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation4']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/1e7b1929d83227c5a03d8823fa31a927.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation4']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '56hy688f' /* ESCAPE */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'bhd9b3sz' /* Body */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'w7qse12h' /* Enriching the physical vessel ... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                38.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3BFFFFFF),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_Icon_ien4parc');
                                                                                  logFirebaseEvent('Icon_haptic_feedback');
                                                                                  HapticFeedback.heavyImpact();
                                                                                  logFirebaseEvent('Icon_play_sound');
                                                                                  _model.soundPlayer5 ??= AudioPlayer();
                                                                                  if (_model.soundPlayer5!.playing) {
                                                                                    await _model.soundPlayer5!.stop();
                                                                                  }
                                                                                  _model.soundPlayer5!.setVolume(1.0);
                                                                                  _model.soundPlayer5!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer5!.play());

                                                                                  logFirebaseEvent('Icon_navigate_to');

                                                                                  context.pushNamed(
                                                                                    BodyPageVersion5Widget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 7),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation6']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation5']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered2 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation3'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation3']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation4'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation4']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation4'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation4']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation6']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation5']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered2 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation3'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation4'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation4']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation5']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation4'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation4']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation6']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation5']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation2']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation2']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_mylznlw');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation5']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation7']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/99b0cab3169105e49b347451207bee7e.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation6']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '61rhroz2' /* EFFECTS */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w200,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w200,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '0zwskr9s' /* Reset Mood */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'wnpzns9j' /* Create interactive components ... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_arrow-btn_ON_');
                                                                              logFirebaseEvent('arrow-btn_haptic_feedback');
                                                                              HapticFeedback.heavyImpact();
                                                                              logFirebaseEvent('arrow-btn_play_sound');
                                                                              _model.soundPlayer6 ??= AudioPlayer();
                                                                              if (_model.soundPlayer6!.playing) {
                                                                                await _model.soundPlayer6!.stop();
                                                                              }
                                                                              _model.soundPlayer6!.setVolume(1.0);
                                                                              _model.soundPlayer6!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer6!.play());

                                                                              logFirebaseEvent('arrow-btn_navigate_to');

                                                                              context.pushNamed(
                                                                                ResetPageCopyWidget.routeName,
                                                                                extra: <String, dynamic>{
                                                                                  '__transition_info__': TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 7),
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 38.0,
                                                                              height: 38.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x3BFFFFFF),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 32.0,
                                                                                height: 32.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation9']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation8']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered3 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation5']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation6']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation5']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation7']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation9'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation9']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation3'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation3']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation8'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation8']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered3 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation5']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation6']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation7']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation7']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation9'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation9']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation3'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation8'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation8']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation3']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation3']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_poufke9');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation7']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation10']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/d8b3cd809cf65ca8c4e3fb8c4a110b8f.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation8']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'l2arwxn3' /* ESCAPE */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'nu5nv8am' /* Journal */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'lbw49iu3' /* Create interactive components ... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                38.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3BFFFFFF),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_Icon_hoirs7jo');
                                                                                  logFirebaseEvent('Icon_haptic_feedback');
                                                                                  HapticFeedback.heavyImpact();
                                                                                  logFirebaseEvent('Icon_play_sound');
                                                                                  _model.soundPlayer7 ??= AudioPlayer();
                                                                                  if (_model.soundPlayer7!.playing) {
                                                                                    await _model.soundPlayer7!.stop();
                                                                                  }
                                                                                  _model.soundPlayer7!.setVolume(1.0);
                                                                                  _model.soundPlayer7!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer7!.play());

                                                                                  logFirebaseEvent('Icon_navigate_to');

                                                                                  context.pushNamed(
                                                                                    HealthJournalWidget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 7),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation12']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation11']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered4 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation7']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation8'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation8']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation6']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation10'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation10']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation12'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation12']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation4'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation4']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation11'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation11']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered4 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation7']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation8'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation8']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation6']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation10'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation10']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation12'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation12']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation4'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation4']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation11'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation11']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation4']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation4']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!),
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_tsx66sw');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation9']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation13']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Pi-Slices.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation10']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'fdvrpwb9' /* ESCAPE */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '7vf1vcsa' /* Quests */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'k0k5n6hc' /* Find out how you can earn more... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                38.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3BFFFFFF),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_Icon_jc97ustu');
                                                                                  logFirebaseEvent('Icon_haptic_feedback');
                                                                                  HapticFeedback.heavyImpact();
                                                                                  logFirebaseEvent('Icon_play_sound');
                                                                                  _model.soundPlayer8 ??= AudioPlayer();
                                                                                  if (_model.soundPlayer8!.playing) {
                                                                                    await _model.soundPlayer8!.stop();
                                                                                  }
                                                                                  _model.soundPlayer8!.setVolume(1.0);
                                                                                  _model.soundPlayer8!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer8!.play());

                                                                                  logFirebaseEvent('Icon_navigate_to');

                                                                                  context.pushNamed(
                                                                                    QuestsPageWidget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 7),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation15']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation14']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered5 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation9'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation9']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation10'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation10']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation7']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation13'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation13']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation15'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation15']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation5']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation14'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation14']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered5 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation9'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation9']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation10'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation10']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation7']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation13'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation13']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation15'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation15']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation5'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation5']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation14'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation14']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation5']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation5']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation5']!),
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_1uxy8bk');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation11']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation16']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation12']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2q9ggtxm' /* ESCAPE */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.cormorantSc(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'chmlon1o' /* Mood Scan
& Energy Scan */
                                                                            ,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '5a1himqb' /* Create interactive components ... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                38.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3BFFFFFF),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_Icon_zmko9zpa');
                                                                                  logFirebaseEvent('Icon_haptic_feedback');
                                                                                  HapticFeedback.heavyImpact();
                                                                                  logFirebaseEvent('Icon_play_sound');
                                                                                  _model.soundPlayer9 ??= AudioPlayer();
                                                                                  if (_model.soundPlayer9!.playing) {
                                                                                    await _model.soundPlayer9!.stop();
                                                                                  }
                                                                                  _model.soundPlayer9!.setVolume(1.0);
                                                                                  _model.soundPlayer9!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer9!.play());

                                                                                  logFirebaseEvent('Icon_navigate_to');

                                                                                  context.pushNamed(
                                                                                    MoodScanVersion5Widget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 7),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation18']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.9, -0.95),
                                                            child: Lottie.asset(
                                                              'assets/jsons/Scanning.json',
                                                              width: 78.92,
                                                              height: 101.7,
                                                              fit: BoxFit
                                                                  .contain,
                                                              animate: true,
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'lottieAnimationOnActionTriggerAnimation1']!,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation17']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered6 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation11'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation11']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation12'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation12']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation7']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation16'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation16']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation18'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation18']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation6']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation17'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation17']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered6 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation11'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation11']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation12'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation12']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation14'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation14']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation16'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation16']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation18'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation18']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation6'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation6']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation17'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation17']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation6']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation6']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation6']!),
                                Container(
                                  width: 250.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x49201E1E),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 15.0,
                                        sigmaY: 15.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MouseRegion(
                                          opaque: false,
                                          cursor: SystemMouseCursors.click ??
                                              MouseCursor.defer,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_VERSION5_F_I_N_A_L_Stack_zxw9tsv');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                ExplorePageVersion5FINALWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
                                                        height: 317.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation13']!,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 64.0,
                                                          color:
                                                              Color(0x26A474E9),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 250.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 125.0,
                                                          color:
                                                              Color(0x26BC8DFF),
                                                          offset: Offset(
                                                            0.0,
                                                            12.0,
                                                          ),
                                                        )
                                                      ],
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF150031),
                                                          Color(0xFF320A6F)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2D0C61),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation19']!,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 250.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    4.0, 4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/bf96634860de987cbec653483b4500e6.gif',
                                                                height: 576.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'imageOnActionTriggerAnimation14']!,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '9thuywn1' /* ESCAPE */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'The Seasons',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'n0gtrm9p' /* Marketplace */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ue4bgg1h' /* Use Your Escape Coins for item... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w200,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.6,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                38.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x3BFFFFFF),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_VERSION5_F_I_N_A_L_Icon_ptyo297p');
                                                                                  logFirebaseEvent('Icon_haptic_feedback');
                                                                                  HapticFeedback.heavyImpact();
                                                                                  logFirebaseEvent('Icon_play_sound');
                                                                                  _model.soundPlayer10 ??= AudioPlayer();
                                                                                  if (_model.soundPlayer10!.playing) {
                                                                                    await _model.soundPlayer10!.stop();
                                                                                  }
                                                                                  _model.soundPlayer10!.setVolume(1.0);
                                                                                  _model.soundPlayer10!.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => _model.soundPlayer10!.play());

                                                                                  logFirebaseEvent('Icon_navigate_to');

                                                                                  context.pushNamed(
                                                                                    MarketplaceVersion5Widget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 7),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.arrow_right_alt,
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['containerOnActionTriggerAnimation21']!,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.9, -0.95),
                                                            child: Lottie.asset(
                                                              'assets/jsons/Flying_Coin.json',
                                                              width: 56.58,
                                                              height: 101.7,
                                                              fit: BoxFit
                                                                  .contain,
                                                              animate: true,
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'lottieAnimationOnActionTriggerAnimation2']!,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation20']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onEnter: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered7 = true);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation13'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation13']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation14'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation14']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation14'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation14']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation19'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation19']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation21'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation21']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation7']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation20'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation20']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          onExit: ((event) async {
                                            safeSetState(() => _model
                                                .componentHovered7 = false);
                                            logFirebaseEvent(
                                                'EXPLORE_VERSION5_F_I_N_A_L_component_ON_');
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation13'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation13']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'imageOnActionTriggerAnimation14'] !=
                                                null) {
                                              animationsMap[
                                                      'imageOnActionTriggerAnimation14']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation19'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation19']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation19'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation19']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation21'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation21']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'mouseRegionOnActionTriggerAnimation7'] !=
                                                null) {
                                              animationsMap[
                                                      'mouseRegionOnActionTriggerAnimation7']!
                                                  .controller
                                                  .reverse();
                                            }
                                            logFirebaseEvent(
                                                'component_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation20'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation20']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'mouseRegionOnPageLoadAnimation7']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'mouseRegionOnActionTriggerAnimation7']!,
                                            ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation7']!),
                              ],
                              carouselController: _model.carouselController ??=
                                  CarouselSliderController(),
                              options: CarouselOptions(
                                initialPage: 1,
                                viewportFraction: 0.5,
                                disableCenter: false,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.25,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: false,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 360),
                                    curve: Curves.easeIn,
                                    width: 316.03,
                                    height: 54.6,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/056f792c2b04a5dfe8f08dfe8fcefa42.gif',
                                        ).image,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_VERSION5_F_I_N_A_L_LET_LUCILLE_C');
                                        logFirebaseEvent(
                                            'Button_haptic_feedback');
                                        HapticFeedback.lightImpact();
                                        logFirebaseEvent('Button_play_sound');
                                        _model.soundPlayer11 ??= AudioPlayer();
                                        if (_model.soundPlayer11!.playing) {
                                          await _model.soundPlayer11!.stop();
                                        }
                                        _model.soundPlayer11!.setVolume(1.0);
                                        _model.soundPlayer11!
                                            .setAsset(
                                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                            .then((_) =>
                                                _model.soundPlayer11!.play());

                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          LucilleSuggestionSplashPageWidget
                                              .routeName,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'yu9xld2y' /* Let Lucille Choose For Me */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.664,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xDE1C2444),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 5.0,
                                        borderSide: BorderSide(
                                          color: Color(0x7AEDF1F7),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        hoverColor: Color(0xC0F0831A),
                                        hoverBorderSide: BorderSide(
                                          color: Color(0x4CEDF1F7),
                                        ),
                                        hoverTextColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        hoverElevation: 8.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
