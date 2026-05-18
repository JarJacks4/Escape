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
import 'rewards_splash_page_model.dart';
export 'rewards_splash_page_model.dart';

class RewardsSplashPageWidget extends StatefulWidget {
  const RewardsSplashPageWidget({super.key});

  static String routeName = 'RewardsSplashPage';
  static String routePath = '/rewardsSplashPage';

  @override
  State<RewardsSplashPageWidget> createState() =>
      _RewardsSplashPageWidgetState();
}

class _RewardsSplashPageWidgetState extends State<RewardsSplashPageWidget>
    with TickerProviderStateMixin {
  late RewardsSplashPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardsSplashPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RewardsSplashPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REWARDS_SPLASH_RewardsSplashPage_ON_INIT');
      logFirebaseEvent('RewardsSplashPage_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('RewardsSplashPage_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(0.5);
      await _model.soundPlayer!
          .setAsset('assets/audios/universfield-level-up-04-243762.mp3')
          .then((_) => _model.soundPlayer!.play());

      logFirebaseEvent('RewardsSplashPage_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      logFirebaseEvent('RewardsSplashPage_navigate_to');

      context.pushNamed(
        ExplorePageVersion5Widget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 3),
          ),
        },
      );
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 500.0.ms,
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 874.99,
                decoration: BoxDecoration(),
                child: Lottie.asset(
                  'assets/jsons/Flying_Coin.json',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
