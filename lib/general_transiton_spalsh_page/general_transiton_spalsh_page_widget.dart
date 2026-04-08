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
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'general_transiton_spalsh_page_model.dart';
export 'general_transiton_spalsh_page_model.dart';

class GeneralTransitonSpalshPageWidget extends StatefulWidget {
  const GeneralTransitonSpalshPageWidget({super.key});

  static String routeName = 'GeneralTransitonSpalshPage';
  static String routePath = 'generalTransitonSpalshPage';

  @override
  State<GeneralTransitonSpalshPageWidget> createState() =>
      _GeneralTransitonSpalshPageWidgetState();
}

class _GeneralTransitonSpalshPageWidgetState
    extends State<GeneralTransitonSpalshPageWidget> {
  late GeneralTransitonSpalshPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralTransitonSpalshPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'GeneralTransitonSpalshPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GENERAL_TRANSITON_SPALSH_GeneralTransito');
      logFirebaseEvent('GeneralTransitonSpalshPage_haptic_feedba');
      HapticFeedback.vibrate();
      logFirebaseEvent('GeneralTransitonSpalshPage_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(0.5);
      await _model.soundPlayer!
          .setAsset('assets/audios/krnbeatz-dawn-logo-430179.mp3')
          .then((_) => _model.soundPlayer!.play());

      logFirebaseEvent('GeneralTransitonSpalshPage_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      logFirebaseEvent('GeneralTransitonSpalshPage_navigate_to');

      context.pushNamed(
        LucilleSuggestionsWidget.routeName,
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
                fit: BoxFit.cover,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
