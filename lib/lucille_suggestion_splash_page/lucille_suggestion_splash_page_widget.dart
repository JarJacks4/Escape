import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'lucille_suggestion_splash_page_model.dart';
export 'lucille_suggestion_splash_page_model.dart';

class LucilleSuggestionSplashPageWidget extends StatefulWidget {
  const LucilleSuggestionSplashPageWidget({super.key});

  static String routeName = 'LucilleSuggestionSplashPage';
  static String routePath = '/lucilleSuggestionSplashPage';

  @override
  State<LucilleSuggestionSplashPageWidget> createState() =>
      _LucilleSuggestionSplashPageWidgetState();
}

class _LucilleSuggestionSplashPageWidgetState
    extends State<LucilleSuggestionSplashPageWidget> {
  late LucilleSuggestionSplashPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleSuggestionSplashPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleSuggestionSplashPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LUCILLE_SUGGESTION_SPLASH_LucilleSuggest');
      logFirebaseEvent('LucilleSuggestionSplashPage_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(0.5);
      _model.soundPlayer!
          .setAsset('assets/audios/krnbeatz-dawn-logo-430179.mp3')
          .then((_) => _model.soundPlayer!.play());

      logFirebaseEvent('LucilleSuggestionSplashPage_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      logFirebaseEvent('LucilleSuggestionSplashPage_navigate_to');

      context.pushNamed(
        LucilleSuggestionsWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 7),
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 874.99,
              decoration: BoxDecoration(),
              child: Lottie.asset(
                'assets/jsons/Transition_01.json',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fill,
                repeat: false,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
