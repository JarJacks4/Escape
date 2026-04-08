import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'splash_home_screen_model.dart';
export 'splash_home_screen_model.dart';

class SplashHomeScreenWidget extends StatefulWidget {
  const SplashHomeScreenWidget({super.key});

  static String routeName = 'SplashHomeScreen';
  static String routePath = 'splashHomeScreen';

  @override
  State<SplashHomeScreenWidget> createState() => _SplashHomeScreenWidgetState();
}

class _SplashHomeScreenWidgetState extends State<SplashHomeScreenWidget> {
  late SplashHomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashHomeScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SplashHomeScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_HOME_SCREEN_SplashHomeScreen_ON_I');
      logFirebaseEvent('SplashHomeScreen_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('SplashHomeScreen_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!
          .setAsset(
              'assets/audios/lucadialessandro-calm-ambient-intro-490646.mp3')
          .then((_) => _model.soundPlayer!.play());

      logFirebaseEvent('SplashHomeScreen_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 8000,
        ),
      );
      logFirebaseEvent('SplashHomeScreen_navigate_to');

      context.goNamed(
        HomeVersion5Widget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 11),
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
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Welcome_to_Escape.gif',
                  ).image,
                ),
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 80.0,
                      color: Color(0x37EDF1F7),
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0x2BEDF1F7), Color(0x68D0E3F7)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(1.0, -0.64),
                    end: AlignmentDirectional(-1.0, 0.64),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
