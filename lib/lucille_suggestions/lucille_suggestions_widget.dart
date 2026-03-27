import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lucille_suggestion_description_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_slideable_list_item_mrpo3s/components/swipe_left_comp_widget.dart'
    as that_slideable_list_item_mrpo3s;
import 'package:that_slideable_list_item_mrpo3s/custom_code/widgets/index.dart'
    as that_slideable_list_item_mrpo3s_custom_widgets;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'lucille_suggestions_model.dart';
export 'lucille_suggestions_model.dart';

class LucilleSuggestionsWidget extends StatefulWidget {
  const LucilleSuggestionsWidget({super.key});

  static String routeName = 'LucilleSuggestions';
  static String routePath = 'lucilleSuggestions';

  @override
  State<LucilleSuggestionsWidget> createState() =>
      _LucilleSuggestionsWidgetState();
}

class _LucilleSuggestionsWidgetState extends State<LucilleSuggestionsWidget>
    with TickerProviderStateMixin {
  late LucilleSuggestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleSuggestionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleSuggestions'});
    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 150.0.ms, duration: 120.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'blurOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 100.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 210.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 310.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 420.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 310.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 600.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 1370.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 1550.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 150.0.ms, duration: 120.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'blurOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 100.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 210.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 310.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 420.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 310.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 600.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 1370.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 1550.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 150.0.ms, duration: 120.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'blurOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 100.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 210.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 310.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'textOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 420.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 310.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 600.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 1370.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
      'containerOnPageLoadAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(curve: Curves.easeIn, delay: 0.0.ms, duration: 1550.0.ms, begin: 0.0, end: 1.0),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _startExercise({
    required String? title,
    required String? description,
    required double? duration,
    required AudioPlayer? Function() getPlayer,
    required void Function(AudioPlayer) setPlayer,
    required void Function(ApiCallResponse?) setRecommended,
    required void Function(ApiCallResponse?) setSoundscape,
    required ApiCallResponse? Function() getSoundscapeResult,
  }) async {

      print('DEBUG _startExercise title: $title');
      print('DEBUG _startExercise description: $description');
      print('DEBUG _startExercise duration: $duration');

    HapticFeedback.heavyImpact();
    AudioPlayer player = getPlayer() ?? AudioPlayer();
    setPlayer(player);
    if (player.playing) await player.stop();
    player.setVolume(1.0);
    await player.setAsset('assets/audios/universfield-interface-soft-click-131438.mp3').then((_) => player.play());

    final soundResp = await LucilleSoundscapesGroup.recommendedSoundscapesCall.call(
      emotion: valueOrDefault(currentUserDocument?.currentMood, ''),
      exerciseID: FFAppState().activeExerciseSessionID,
      userID: currentUserUid,
    );
    setRecommended(soundResp);

    if (soundResp.succeeded) {
      final scapeResp = await LucilleSoundscapesGroup.getSoundscapeCall.call();
      print('DEBUG scapeResp body: ${scapeResp.jsonBody}');
      print('DEBUG audioUrl from API: ${LucilleSoundscapesGroup.getSoundscapeCall.audioUrl(scapeResp.jsonBody)}');
      setSoundscape(scapeResp);
    } else {
      return;
    }

    context.pushNamed(
      LucilleSuggestionPageWidget.routeName,
      queryParameters: {
        'exerciseTitle': serializeParam(title, ParamType.String),
        'exerciseDescription': serializeParam(description, ParamType.String),
        'exerciseDuration': serializeParam(duration, ParamType.double),
        'exersiseSoundscape': serializeParam(
          LucilleSoundscapesGroup.getSoundscapeCall
              .audioUrl(getSoundscapeResult()?.jsonBody ?? '')
              ?.firstOrNull,
          ParamType.String,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        '__transition_info__': TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 2),
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

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
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: Stack(
                  children: [
                    PageView(
                      controller: _model.pageViewController ??= PageController(initialPage: 0),
                      onPageChanged: (_) => safeSetState(() {}),
                      scrollDirection: Axis.horizontal,
                      children: [
                        // ─────────────────────────────────────────────────
                        // PAGE 1
                        // ─────────────────────────────────────────────────
                        Container(
                          width: double.infinity,
                          height: 173.6,
                          decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
                          child: Stack(
                            children: [
                              Image.network(
                                'https://images.unsplash.com/photo-1713428856219-20e151269843?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxjYWxtJTIwYnJlYXRoaW5nfGVufDB8fHx8MTc3NDI5NTIzOXww&ixlib=rb-4.1.0&q=80&w=1080',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment(0.0, 0.0),
                              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation1']!),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(0.0)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                    child: Container(
                                      width: 109.6,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [FlutterFlowTheme.of(context).primary, Color(0x88D0E3F7), FlutterFlowTheme.of(context).alternate],
                                          stops: [0.0, 0.5, 1.0],
                                          begin: AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              width: 370.4,
                                              height: 129.5,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.sizeOf(context).height * 0.111,
                                                        decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(16.0), border: Border.all(color: Color(0x59EDF1F7))),
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.max,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(mainAxisSize: MainAxisSize.max, children: [
                                                                Text(FFLocalizations.of(context).getText('uht3aerj'), style: FlutterFlowTheme.of(context).labelMedium.override(fontFamily: 'The Seasons', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.normal)).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                              ].divide(SizedBox(width: 6.0))),
                                                              Text(FFLocalizations.of(context).getText('acfhvhmu'), style: FlutterFlowTheme.of(context).headlineSmall.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).alternate, fontSize: 20.0, letterSpacing: 0.0, fontWeight: FontWeight.w300)).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                                            ].divide(SizedBox(height: 4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent('LUCILLE_SUGGESTIONS_Page1_DownArrow_ON_TAP');
                                                          HapticFeedback.mediumImpact();
                                                          context.pushNamed(HomeVersion5Widget.routeName, extra: <String, dynamic>{'__transition_info__': TransitionInfo(hasTransition: true, transitionType: PageTransitionType.fade, duration: Duration(milliseconds: 3))});
                                                        },
                                                        child: Container(
                                                          width: 44.0, height: 44.0,
                                                          decoration: BoxDecoration(color: Color(0x33FFFFFF), boxShadow: [BoxShadow(blurRadius: 20.0, color: FlutterFlowTheme.of(context).accent1, offset: Offset(0.0, 0.0))], borderRadius: BorderRadius.circular(22.0)),
                                                          child: Align(alignment: AlignmentDirectional(0.0, 0.0), child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 24.0)),
                                                        ),
                                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: AnimatedContainer(
                                              duration: Duration(milliseconds: 200), curve: Curves.easeOut,
                                              decoration: BoxDecoration(color: Color(0x8039519F), boxShadow: [BoxShadow(blurRadius: 40.0, color: Color(0x60FCC462), offset: Offset(0.0, 0.0), spreadRadius: 5.0)], borderRadius: BorderRadius.circular(24.0), border: Border.all(color: Color(0x56EDF1F7))),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Flexible(flex: 1, child: Container(width: 32.0, height: 32.0, decoration: BoxDecoration(color: Colors.white, image: DecorationImage(fit: BoxFit.cover, image: Image.asset('assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png').image), boxShadow: [BoxShadow(blurRadius: 20.0, color: Color(0xFFD0E3F7), offset: Offset(0.0, 0.0), spreadRadius: 10.0)], borderRadius: BorderRadius.circular(16.0)))),
                                                    Text(FFLocalizations.of(context).getText('ajnk2arx'), style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).primary, letterSpacing: 0.0, fontWeight: FontWeight.w600)),
                                                  ].divide(SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Align(
                                              alignment: AlignmentDirectional(0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 220.0, 0.0, 0.0),
                                                child: FutureBuilder<ApiCallResponse>(
                                                  future: _model.suggestionCache(requestFn: () => LucilleTherapyExercisesGroup.recommendedExercisesCall.call(limit: 3, userID: currentUserUid)),
                                                  builder: (context, snapshot) {
                                                    if (!snapshot.hasData) return Center(child: SizedBox(width: 100.0, height: 100.0, child: SpinKitWave(color: FlutterFlowTheme.of(context).accent1, size: 100.0)));
                                                    final resp = snapshot.data!;
                                                    final title = LucilleTherapyExercisesGroup.recommendedExercisesCall.title(resp.jsonBody)?.firstOrNull;
                                                    final description = LucilleTherapyExercisesGroup.recommendedExercisesCall.description(resp.jsonBody)?.firstOrNull;
                                                    final modality = LucilleTherapyExercisesGroup.recommendedExercisesCall.modality(resp.jsonBody)?.firstOrNull;
                                                    final duration = LucilleTherapyExercisesGroup.recommendedExercisesCall.duration(resp.jsonBody)?.firstOrNull;
                                                    return Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.all(15.0),
                                                          child: GestureDetector(
                                                            onTap: () async {
                                                              logFirebaseEvent('LUCILLE_SUGGESTIONS_Page1_Card_ON_TAP');
                                                              await _startExercise(
                                                                title: title, description: description, duration: duration?.toDouble(),
                                                                getPlayer: () => _model.soundPlayer1, setPlayer: (p) => _model.soundPlayer1 = p,
                                                                setRecommended: (v) => _model.recommendedSoundscapes = v,
                                                                setSoundscape: (v) => _model.getSoundscape = v,
                                                                getSoundscapeResult: () => _model.getSoundscape,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: double.infinity,
                                                              height: MediaQuery.sizeOf(context).height * 0.27,
                                                              decoration: BoxDecoration(color: Color(0x7939519F), borderRadius: BorderRadius.circular(24.0), border: Border.all(color: Color(0x6DEDF1F7))),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(15.0),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(mainAxisSize: MainAxisSize.max, children: [
                                                                      Container(decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(12.0)), child: Padding(padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0), child: Text(valueOrDefault<String>(modality, 'Mind'), style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.w500)))),
                                                                    ].divide(SizedBox(width: 8.0))),
                                                                    Text(valueOrDefault<String>(title, 'Calm Breathing'), style: FlutterFlowTheme.of(context).displaySmall.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.bold)),
                                                                    Flexible(flex: 1, child: Text(valueOrDefault<String>(description, 'A gentle breathing exercise to help focus your mind and body.'), style: FlutterFlowTheme.of(context).bodyMedium.override(fontFamily: 'WorkSans', color: Color(0xFFEEEEFF), letterSpacing: 0.0, fontWeight: FontWeight.normal), overflow: TextOverflow.fade)),
                                                                    Container(
                                                                      decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Color(0x6ED0E3F7))),
                                                                      child: Padding(padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0), child: Row(mainAxisSize: MainAxisSize.max, children: [
                                                                        Icon(Icons.access_time_rounded, color: Colors.white, size: 16.0),
                                                                        Text(valueOrDefault<String>(duration?.toString(), 'None'), style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.normal)),
                                                                      ].divide(SizedBox(width: 6.0)))),
                                                                    ),
                                                                  ].divide(SizedBox(height: 12.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding: EdgeInsets.all(8.0),
                                                            child: Container(
                                                              width: double.infinity,
                                                              decoration: BoxDecoration(color: Color(0x33FFFFFF), boxShadow: [BoxShadow(blurRadius: 20.0, color: Color(0xFFD0E3F7), offset: Offset(0.0, 0.0))], borderRadius: BorderRadius.circular(16.0)),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(FFLocalizations.of(context).getText('uw5atc2i'), style: FlutterFlowTheme.of(context).bodyLarge.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).alternate, letterSpacing: 0.0, fontWeight: FontWeight.w500)),
                                                                    InkWell(
                                                                      splashColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,
                                                                      onTap: () async {
                                                                        await showModalBottomSheet(isScrollControlled: true, backgroundColor: Colors.transparent, context: context, builder: (context) {
                                                                          return GestureDetector(onTap: () { FocusScope.of(context).unfocus(); FocusManager.instance.primaryFocus?.unfocus(); }, child: Padding(padding: MediaQuery.viewInsetsOf(context), child: Container(height: MediaQuery.sizeOf(context).height * 0.4, child: LucilleSuggestionDescriptionCompWidget())));
                                                                        }).then((value) => safeSetState(() {}));
                                                                      },
                                                                      child: Icon(Icons.keyboard_arrow_up_rounded, color: FlutterFlowTheme.of(context).accent1, size: 24.0),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation5']!),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                            child: Container(
                                                              width: double.infinity, height: 102.0,
                                                              child: that_slideable_list_item_mrpo3s_custom_widgets.ThatSlideableWidget(
                                                                width: double.infinity, height: 102.0, startPaneDragDismissible: false, endPaneDragDismissible: false,
                                                                startPaneFirstActionIcon: Icon(Icons.skip_next, color: FlutterFlowTheme.of(context).primary, size: 36.0),
                                                                // FIX: changed from FaIcon to Icon
                                                                endPaneFirstActionIcon: Icon(Icons.flag, color: FlutterFlowTheme.of(context).primary, size: 36.0),
                                                                startPaneMotion: that_slideable_list_item_mrpo3s_enums.ActionPaneMotion.scroll,
                                                                endPaneMotion: that_slideable_list_item_mrpo3s_enums.ActionPaneMotion.behind,
                                                                startPaneFirstActionStruct: that_slideable_list_item_mrpo3s_data_schema.SlideActionDataTypeStruct(backgroundColor: FlutterFlowTheme.of(context).error, flex: 1, label: 'I Need More Options...', autoClose: false, spacing: 4.0, borderRadius: 12.0),
                                                                endPaneFirstActionStruct: that_slideable_list_item_mrpo3s_data_schema.SlideActionDataTypeStruct(backgroundColor: FlutterFlowTheme.of(context).accent1, flex: 1, label: 'I Need More Options...', autoClose: false, spacing: 4.0, borderRadius: 12.0),
                                                                onStartActionPaneDismissed: () async {
                                                                  context.pushNamed(HomeVersion5Widget.routeName, extra: <String, dynamic>{'__transition_info__': TransitionInfo(hasTransition: true, transitionType: PageTransitionType.fade, duration: Duration(milliseconds: 3))});
                                                                },
                                                                onEndActionPaneDismissed: () async {},
                                                                onStartPaneFirstActionPressed: () async {
                                                                  await _model.pageViewController?.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                                                                },
                                                                onStartPaneSecondActionPressed: () async {},
                                                                onStartPaneThirdActionPressed: () async {},
                                                                onStartPaneFourthActionPressed: () async {},
                                                                onStartPaneFifthActionPressed: () async {},
                                                                onEndPaneFirstActionPressed: () async {
                                                                  await _startExercise(
                                                                    title: title, description: description, duration: duration?.toDouble(),
                                                                    getPlayer: () => _model.soundPlayer1, setPlayer: (p) => _model.soundPlayer1 = p,
                                                                    setRecommended: (v) => _model.recommendedSoundscapes = v,
                                                                    setSoundscape: (v) => _model.getSoundscape = v,
                                                                    getSoundscapeResult: () => _model.getSoundscape,
                                                                  );
                                                                },
                                                                onEndPaneSecondActionPressed: () async {},
                                                                onEndPaneThirdActionPressed: () async {},
                                                                onEndPaneFourthActionPressed: () async {},
                                                                onEndPaneFifthActionPressed: () async {},
                                                                child: () => that_slideable_list_item_mrpo3s.SwipeLeftCompWidget(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                  ),
                                ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation1']!),
                              ),
                            ],
                          ),
                        ),
                        // ─────────────────────────────────────────────────
                        // PAGE 2
                        // ─────────────────────────────────────────────────
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity, height: MediaQuery.sizeOf(context).height,
                              decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/bf96634860de987cbec653483b4500e6.gif', width: double.infinity, height: double.infinity, fit: BoxFit.cover, alignment: Alignment(0.0, 0.0)).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                                  Container(
                                    width: double.infinity, height: double.infinity,
                                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(0.0)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                        child: Container(
                                          width: 109.6, height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [FlutterFlowTheme.of(context).primary, Color(0x88D0E3F7), FlutterFlowTheme.of(context).alternate], stops: [0.0, 0.5, 1.0], begin: AlignmentDirectional(1.0, -0.64), end: AlignmentDirectional(-1.0, 0.64)),
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                child: Container(
                                                  width: 370.4, height: 129.5,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.sizeOf(context).height * 0.111,
                                                            decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(16.0), border: Border.all(color: Color(0x59EDF1F7))),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(mainAxisSize: MainAxisSize.max, children: [
                                                                    Text(FFLocalizations.of(context).getText('4lrm84op'), style: FlutterFlowTheme.of(context).labelMedium.override(fontFamily: 'The Seasons', color: FlutterFlowTheme.of(context).tertiary, letterSpacing: 0.0, fontWeight: FontWeight.normal)).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
                                                                  ].divide(SizedBox(width: 6.0))),
                                                                  Text(FFLocalizations.of(context).getText('jkhnkmdh'), style: FlutterFlowTheme.of(context).headlineSmall.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).alternate, fontSize: 20.0, letterSpacing: 0.0, fontWeight: FontWeight.w300)).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
                                                                ].divide(SizedBox(height: 4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              HapticFeedback.mediumImpact();
                                                              _model.soundPlayer2 ??= AudioPlayer();
                                                              if (_model.soundPlayer2!.playing) await _model.soundPlayer2!.stop();
                                                              _model.soundPlayer2!.setVolume(1.0);
                                                              _model.soundPlayer2!.setAsset('assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3').then((_) => _model.soundPlayer2!.play());
                                                              context.pushNamed(HomeVersion5Widget.routeName, extra: <String, dynamic>{'__transition_info__': TransitionInfo(hasTransition: true, transitionType: PageTransitionType.fade, duration: Duration(milliseconds: 3))});
                                                            },
                                                            child: Container(
                                                              width: 44.0, height: 44.0,
                                                              decoration: BoxDecoration(color: Color(0x33FFFFFF), boxShadow: [BoxShadow(blurRadius: 20.0, color: FlutterFlowTheme.of(context).accent1, offset: Offset(0.0, 0.0))], borderRadius: BorderRadius.circular(22.0)),
                                                              child: Align(alignment: AlignmentDirectional(0.0, 0.0), child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 24.0)),
                                                            ),
                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation7']!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: AnimatedContainer(
                                                  duration: Duration(milliseconds: 200), curve: Curves.easeOut,
                                                  decoration: BoxDecoration(color: Color(0x8039519F), boxShadow: [BoxShadow(blurRadius: 40.0, color: Color(0x60FCC462), offset: Offset(0.0, 0.0), spreadRadius: 5.0)], borderRadius: BorderRadius.circular(24.0), border: Border.all(color: Color(0x56EDF1F7))),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Flexible(flex: 1, child: Container(width: 32.0, height: 32.0, decoration: BoxDecoration(color: Colors.white, image: DecorationImage(fit: BoxFit.cover, image: Image.asset('assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png').image), boxShadow: [BoxShadow(blurRadius: 20.0, color: Color(0xFFD0E3F7), offset: Offset(0.0, 0.0), spreadRadius: 10.0)], borderRadius: BorderRadius.circular(16.0)))),
                                                        Text(FFLocalizations.of(context).getText('sodcx31d'), style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).primary, letterSpacing: 0.0, fontWeight: FontWeight.w600)),
                                                      ].divide(SizedBox(width: 10.0)),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation8']!),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment: AlignmentDirectional(0.0, 1.0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 220.0, 0.0, 0.0),
                                                    child: FutureBuilder<ApiCallResponse>(
                                                      future: _model.suggestionCache(requestFn: () => LucilleTherapyExercisesGroup.recommendedExercisesCall.call(limit: 3, userID: currentUserUid)),
                                                      builder: (context, snapshot) {
                                                        if (!snapshot.hasData) return Center(child: SizedBox(width: 100.0, height: 100.0, child: SpinKitWave(color: FlutterFlowTheme.of(context).accent1, size: 100.0)));
                                                        final resp = snapshot.data!;
                                                        final titles = LucilleTherapyExercisesGroup.recommendedExercisesCall.title(resp.jsonBody);
                                                        final descriptions = LucilleTherapyExercisesGroup.recommendedExercisesCall.description(resp.jsonBody);
                                                        final modalities = LucilleTherapyExercisesGroup.recommendedExercisesCall.modality(resp.jsonBody);
                                                        final durations = LucilleTherapyExercisesGroup.recommendedExercisesCall.duration(resp.jsonBody);
                                                        final title = (titles != null && titles.length > 1) ? titles[1] : null;
                                                        final description = (descriptions != null && descriptions.length > 1) ? descriptions[1] : null;
                                                        final modality = (modalities != null && modalities.length > 1) ? modalities[1] : 'Mind';
                                                        final duration = (durations != null && durations.length > 1) ? durations[1] : null;
                                                        return Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.all(15.0),
                                                              child: GestureDetector(
                                                                onTap: () async {
                                                                  logFirebaseEvent('LUCILLE_SUGGESTIONS_Page2_Card_ON_TAP');
                                                                  await _startExercise(
                                                                    title: title, description: description, duration: duration?.toDouble(),
                                                                    getPlayer: () => _model.soundPlayer3, setPlayer: (p) => _model.soundPlayer3 = p,
                                                                    setRecommended: (v) => _model.recommendedSoundscapes8 = v,
                                                                    setSoundscape: (v) => _model.getSoundscape4 = v,
                                                                    getSoundscapeResult: () => _model.getSoundscape4,
                                                                  );
                                                                },
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  height: MediaQuery.sizeOf(context).height * 0.27,
                                                                  decoration: BoxDecoration(color: Color(0x59D0E3F7), borderRadius: BorderRadius.circular(24.0), border: Border.all(color: Color(0x6DEDF1F7))),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(15.0),
                                                                    child: Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Row(mainAxisSize: MainAxisSize.max, children: [
                                                                          Container(decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(12.0)), child: Padding(padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0), child: Text(modality, style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.w500)))),
                                                                        ].divide(SizedBox(width: 8.0))),
                                                                        Text(title ?? 'Calm Breathing', style: FlutterFlowTheme.of(context).displaySmall.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.bold)),
                                                                        Flexible(flex: 1, child: Text(description ?? 'A gentle breathing exercise to help focus your mind and body.', style: FlutterFlowTheme.of(context).bodyMedium.override(fontFamily: 'WorkSans', color: Color(0xFFEEEEFF), letterSpacing: 0.0, fontWeight: FontWeight.normal), overflow: TextOverflow.fade)),
                                                                        Container(
                                                                          decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Color(0x6ED0E3F7))),
                                                                          child: Padding(padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0), child: Row(mainAxisSize: MainAxisSize.max, children: [
                                                                            Icon(Icons.access_time_rounded, color: Colors.white, size: 16.0),
                                                                            Text(duration?.toString() ?? 'None', style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.normal)),
                                                                          ].divide(SizedBox(width: 6.0)))),
                                                                        ),
                                                                      ].divide(SizedBox(height: 12.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation9']!),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(color: Color(0x33FFFFFF), boxShadow: [BoxShadow(blurRadius: 20.0, color: Color(0xFFD0E3F7), offset: Offset(0.0, 0.0))], borderRadius: BorderRadius.circular(16.0)),
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(FFLocalizations.of(context).getText('kgn6w9ex'), style: FlutterFlowTheme.of(context).bodyLarge.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).alternate, letterSpacing: 0.0, fontWeight: FontWeight.w500)),
                                                                        InkWell(
                                                                          splashColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,
                                                                          onTap: () async {
                                                                            await showModalBottomSheet(isScrollControlled: true, backgroundColor: Colors.transparent, context: context, builder: (context) {
                                                                              return GestureDetector(onTap: () { FocusScope.of(context).unfocus(); FocusManager.instance.primaryFocus?.unfocus(); }, child: Padding(padding: MediaQuery.viewInsetsOf(context), child: Container(height: MediaQuery.sizeOf(context).height * 0.4, child: LucilleSuggestionDescriptionCompWidget())));
                                                                            }).then((value) => safeSetState(() {}));
                                                                          },
                                                                          child: Icon(Icons.keyboard_arrow_up_rounded, color: FlutterFlowTheme.of(context).accent1, size: 24.0),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation10']!),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                child: Container(
                                                                  width: double.infinity, height: 102.0,
                                                                  child: that_slideable_list_item_mrpo3s_custom_widgets.ThatSlideableWidget(
                                                                    width: double.infinity, height: 102.0, startPaneDragDismissible: false, endPaneDragDismissible: false,
                                                                    startPaneFirstActionIcon: Icon(Icons.skip_next, color: FlutterFlowTheme.of(context).primary, size: 36.0),
                                                                    // FIX: changed from FaIcon to Icon
                                                                    endPaneFirstActionIcon: Icon(Icons.flag, color: FlutterFlowTheme.of(context).primary, size: 36.0),
                                                                    startPaneMotion: that_slideable_list_item_mrpo3s_enums.ActionPaneMotion.scroll,
                                                                    endPaneMotion: that_slideable_list_item_mrpo3s_enums.ActionPaneMotion.behind,
                                                                    startPaneFirstActionStruct: that_slideable_list_item_mrpo3s_data_schema.SlideActionDataTypeStruct(backgroundColor: FlutterFlowTheme.of(context).error, flex: 1, label: 'I Need More Options....', autoClose: false, spacing: 4.0, borderRadius: 12.0),
                                                                    endPaneFirstActionStruct: that_slideable_list_item_mrpo3s_data_schema.SlideActionDataTypeStruct(backgroundColor: FlutterFlowTheme.of(context).accent1, flex: 1, label: 'I Need More Options....', autoClose: false, spacing: 4.0, borderRadius: 12.0),
                                                                    onStartActionPaneDismissed: () async { context.pushNamed(HomeVersion5Widget.routeName, extra: <String, dynamic>{'__transition_info__': TransitionInfo(hasTransition: true, transitionType: PageTransitionType.fade, duration: Duration(milliseconds: 3))}); },
                                                                    onEndActionPaneDismissed: () async {},
                                                                    onStartPaneFirstActionPressed: () async { await _model.pageViewController?.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease); },
                                                                    onStartPaneSecondActionPressed: () async {},
                                                                    onStartPaneThirdActionPressed: () async {},
                                                                    onStartPaneFourthActionPressed: () async {},
                                                                    onStartPaneFifthActionPressed: () async {},
                                                                    onEndPaneFirstActionPressed: () async {
                                                                      await _startExercise(
                                                                        title: title, description: description, duration: duration?.toDouble(),
                                                                        getPlayer: () => _model.soundPlayer3, setPlayer: (p) => _model.soundPlayer3 = p,
                                                                        setRecommended: (v) => _model.recommendedSoundscapes8 = v,
                                                                        setSoundscape: (v) => _model.getSoundscape4 = v,
                                                                        getSoundscapeResult: () => _model.getSoundscape4,
                                                                      );
                                                                    },
                                                                    onEndPaneSecondActionPressed: () async {}, onEndPaneThirdActionPressed: () async {}, onEndPaneFourthActionPressed: () async {}, onEndPaneFifthActionPressed: () async {},
                                                                    child: () => that_slideable_list_item_mrpo3s.SwipeLeftCompWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation6']!),
                                      ),
                                    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation2']!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // ─────────────────────────────────────────────────
                        // PAGE 3
                        // ─────────────────────────────────────────────────
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity, height: MediaQuery.sizeOf(context).height,
                              decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/dbc134076bdc297451e61e49a8caec19.gif', width: double.infinity, height: double.infinity, fit: BoxFit.cover, alignment: Alignment(0.0, 0.0)).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation3']!),
                                  Container(
                                    width: double.infinity, height: double.infinity,
                                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(0.0)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                        child: Container(
                                          width: 109.6, height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [FlutterFlowTheme.of(context).primary, Color(0x88D0E3F7), FlutterFlowTheme.of(context).alternate], stops: [0.0, 0.5, 1.0], begin: AlignmentDirectional(1.0, -0.64), end: AlignmentDirectional(-1.0, 0.64)),
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                child: Container(
                                                  width: 370.4, height: 129.5,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.sizeOf(context).height * 0.111,
                                                            decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(16.0), border: Border.all(color: Color(0x59EDF1F7))),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(mainAxisSize: MainAxisSize.max, children: [
                                                                    Text(FFLocalizations.of(context).getText('fwez2cfm'), style: FlutterFlowTheme.of(context).labelMedium.override(fontFamily: 'The Seasons', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.normal)).animateOnPageLoad(animationsMap['textOnPageLoadAnimation5']!),
                                                                  ].divide(SizedBox(width: 6.0))),
                                                                  Text(FFLocalizations.of(context).getText('xq4yqiuq'), style: FlutterFlowTheme.of(context).headlineSmall.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).alternate, fontSize: 20.0, letterSpacing: 0.0, fontWeight: FontWeight.w300)).animateOnPageLoad(animationsMap['textOnPageLoadAnimation6']!),
                                                                ].divide(SizedBox(height: 4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent('LUCILLE_SUGGESTIONS_Page3_DownArrow_ON_TAP');
                                                              HapticFeedback.mediumImpact();
                                                              context.pushNamed(HomeVersion5Widget.routeName, extra: <String, dynamic>{'__transition_info__': TransitionInfo(hasTransition: true, transitionType: PageTransitionType.fade, duration: Duration(milliseconds: 3))});
                                                            },
                                                            child: Container(
                                                              width: 44.0, height: 44.0,
                                                              decoration: BoxDecoration(color: Color(0x33FFFFFF), boxShadow: [BoxShadow(blurRadius: 20.0, color: FlutterFlowTheme.of(context).accent1, offset: Offset(0.0, 0.0))], borderRadius: BorderRadius.circular(22.0)),
                                                              child: Align(alignment: AlignmentDirectional(0.0, 0.0), child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 24.0)),
                                                            ),
                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation12']!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: AnimatedContainer(
                                                  duration: Duration(milliseconds: 200), curve: Curves.easeOut,
                                                  decoration: BoxDecoration(color: Color(0x8039519F), boxShadow: [BoxShadow(blurRadius: 40.0, color: Color(0x60FCC462), offset: Offset(0.0, 0.0), spreadRadius: 5.0)], borderRadius: BorderRadius.circular(24.0), border: Border.all(color: Color(0x56EDF1F7))),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Flexible(flex: 1, child: Container(width: 32.0, height: 32.0, decoration: BoxDecoration(color: Colors.white, image: DecorationImage(fit: BoxFit.cover, image: Image.asset('assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png').image), boxShadow: [BoxShadow(blurRadius: 20.0, color: Color(0xFFD0E3F7), offset: Offset(0.0, 0.0), spreadRadius: 10.0)], borderRadius: BorderRadius.circular(16.0)))),
                                                        Text(FFLocalizations.of(context).getText('7gn3b274'), style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).primary, letterSpacing: 0.0, fontWeight: FontWeight.w600)),
                                                      ].divide(SizedBox(width: 10.0)),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation13']!),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment: AlignmentDirectional(0.0, 1.0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 220.0, 0.0, 0.0),
                                                    child: FutureBuilder<ApiCallResponse>(
                                                      future: _model.suggestionCache(requestFn: () => LucilleTherapyExercisesGroup.recommendedExercisesCall.call(limit: 3, userID: currentUserUid)),
                                                      builder: (context, snapshot) {
                                                        if (!snapshot.hasData) return Center(child: SizedBox(width: 100.0, height: 100.0, child: SpinKitWave(color: FlutterFlowTheme.of(context).accent1, size: 100.0)));
                                                        final resp = snapshot.data!;
                                                        final titles = LucilleTherapyExercisesGroup.recommendedExercisesCall.title(resp.jsonBody);
                                                        final descriptions = LucilleTherapyExercisesGroup.recommendedExercisesCall.description(resp.jsonBody);
                                                        final modalities = LucilleTherapyExercisesGroup.recommendedExercisesCall.modality(resp.jsonBody);
                                                        final durations = LucilleTherapyExercisesGroup.recommendedExercisesCall.duration(resp.jsonBody);
                                                        final title = (titles != null && titles.length > 2) ? titles[2] : null;
                                                        final description = (descriptions != null && descriptions.length > 2) ? descriptions[2] : null;
                                                        final modality = (modalities != null && modalities.length > 2) ? modalities[2] : 'Mind';
                                                        final duration = (durations != null && durations.length > 2) ? durations[2] : null;
                                                        return Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.all(15.0),
                                                              child: GestureDetector(
                                                                onTap: () async {
                                                                  logFirebaseEvent('LUCILLE_SUGGESTIONS_Page3_Card_ON_TAP');
                                                                  await _startExercise(
                                                                    title: title, description: description, duration: duration?.toDouble(),
                                                                    getPlayer: () => _model.soundPlayer4, setPlayer: (p) => _model.soundPlayer4 = p,
                                                                    setRecommended: (v) => _model.recommendedSoundscapes3 = v,
                                                                    setSoundscape: (v) => _model.getSoundscape3 = v,
                                                                    getSoundscapeResult: () => _model.getSoundscape3,
                                                                  );
                                                                },
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  height: MediaQuery.sizeOf(context).height * 0.27,
                                                                  decoration: BoxDecoration(color: Color(0x7939519F), borderRadius: BorderRadius.circular(24.0), border: Border.all(color: Color(0x6DEDF1F7))),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(15.0),
                                                                    child: Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Row(mainAxisSize: MainAxisSize.max, children: [
                                                                          Container(decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(12.0)), child: Padding(padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0), child: Text(modality, style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.w500)))),
                                                                        ].divide(SizedBox(width: 8.0))),
                                                                        Text(title ?? 'Calm Breathing', style: FlutterFlowTheme.of(context).displaySmall.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.bold)),
                                                                        Flexible(flex: 1, child: Text(description ?? 'A gentle breathing exercise to help focus your mind and body.', style: FlutterFlowTheme.of(context).bodyMedium.override(fontFamily: 'WorkSans', color: Color(0xFFEEEEFF), letterSpacing: 0.0, fontWeight: FontWeight.normal), overflow: TextOverflow.fade)),
                                                                        Container(
                                                                          decoration: BoxDecoration(color: Color(0x33FFFFFF), borderRadius: BorderRadius.circular(20.0), border: Border.all(color: Color(0x6ED0E3F7))),
                                                                          child: Padding(padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0), child: Row(mainAxisSize: MainAxisSize.max, children: [
                                                                            Icon(Icons.access_time_rounded, color: Colors.white, size: 16.0),
                                                                            Text(duration?.toString() ?? 'None', style: FlutterFlowTheme.of(context).labelLarge.override(fontFamily: 'WorkSans', color: Colors.white, letterSpacing: 0.0, fontWeight: FontWeight.normal)),
                                                                          ].divide(SizedBox(width: 6.0)))),
                                                                        ),
                                                                      ].divide(SizedBox(height: 12.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation14']!),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(color: Color(0x33FFFFFF), boxShadow: [BoxShadow(blurRadius: 20.0, color: Color(0xFFD0E3F7), offset: Offset(0.0, 0.0))], borderRadius: BorderRadius.circular(16.0)),
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(FFLocalizations.of(context).getText('4etpq4ye'), style: FlutterFlowTheme.of(context).bodyLarge.override(fontFamily: 'WorkSans', color: FlutterFlowTheme.of(context).alternate, letterSpacing: 0.0, fontWeight: FontWeight.w500)),
                                                                        InkWell(
                                                                          splashColor: Colors.transparent, focusColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,
                                                                          onTap: () async {
                                                                            await showModalBottomSheet(isScrollControlled: true, backgroundColor: Colors.transparent, context: context, builder: (context) {
                                                                              return GestureDetector(onTap: () { FocusScope.of(context).unfocus(); FocusManager.instance.primaryFocus?.unfocus(); }, child: Padding(padding: MediaQuery.viewInsetsOf(context), child: Container(height: MediaQuery.sizeOf(context).height * 0.4, child: LucilleSuggestionDescriptionCompWidget())));
                                                                            }).then((value) => safeSetState(() {}));
                                                                          },
                                                                          child: Icon(Icons.keyboard_arrow_up_rounded, color: FlutterFlowTheme.of(context).accent1, size: 24.0),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation15']!),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                child: Container(
                                                                  width: double.infinity, height: 102.0,
                                                                  child: that_slideable_list_item_mrpo3s_custom_widgets.ThatSlideableWidget(
                                                                    width: double.infinity, height: 102.0, startPaneDragDismissible: false, endPaneDragDismissible: false,
                                                                    startPaneFirstActionIcon: Icon(Icons.skip_next, color: FlutterFlowTheme.of(context).primary, size: 36.0),
                                                                    // FIX: changed from FaIcon to Icon
                                                                    endPaneFirstActionIcon: Icon(Icons.flag, color: FlutterFlowTheme.of(context).primary, size: 36.0),
                                                                    startPaneMotion: that_slideable_list_item_mrpo3s_enums.ActionPaneMotion.scroll,
                                                                    endPaneMotion: that_slideable_list_item_mrpo3s_enums.ActionPaneMotion.behind,
                                                                    startPaneFirstActionStruct: that_slideable_list_item_mrpo3s_data_schema.SlideActionDataTypeStruct(backgroundColor: FlutterFlowTheme.of(context).error, flex: 1, label: 'I Need More Options...', autoClose: false, spacing: 4.0, borderRadius: 12.0),
                                                                    endPaneFirstActionStruct: that_slideable_list_item_mrpo3s_data_schema.SlideActionDataTypeStruct(backgroundColor: FlutterFlowTheme.of(context).accent1, flex: 1, label: 'I Need More Options...', autoClose: false, spacing: 4.0, borderRadius: 12.0),
                                                                    onStartActionPaneDismissed: () async { context.pushNamed(HomeVersion5Widget.routeName, extra: <String, dynamic>{'__transition_info__': TransitionInfo(hasTransition: true, transitionType: PageTransitionType.fade, duration: Duration(milliseconds: 3))}); },
                                                                    onEndActionPaneDismissed: () async {},
                                                                    onStartPaneFirstActionPressed: () async { await _model.pageViewController?.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease); },
                                                                    onStartPaneSecondActionPressed: () async {},
                                                                    onStartPaneThirdActionPressed: () async {},
                                                                    onStartPaneFourthActionPressed: () async {},
                                                                    onStartPaneFifthActionPressed: () async {},
                                                                    onEndPaneFirstActionPressed: () async {
                                                                      await _startExercise(
                                                                        title: title, description: description, duration: duration?.toDouble(),
                                                                        getPlayer: () => _model.soundPlayer4, setPlayer: (p) => _model.soundPlayer4 = p,
                                                                        setRecommended: (v) => _model.recommendedSoundscapes3 = v,
                                                                        setSoundscape: (v) => _model.getSoundscape3 = v,
                                                                        getSoundscapeResult: () => _model.getSoundscape3,
                                                                      );
                                                                    },
                                                                    onEndPaneSecondActionPressed: () async {}, onEndPaneThirdActionPressed: () async {}, onEndPaneFourthActionPressed: () async {}, onEndPaneFifthActionPressed: () async {},
                                                                    child: () => that_slideable_list_item_mrpo3s.SwipeLeftCompWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation11']!),
                                      ),
                                    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation3']!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 175.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??= PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(i, duration: Duration(milliseconds: 500), curve: Curves.ease);
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 8.0, radius: 8.0, dotWidth: 8.0, dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).secondary,
                            activeDotColor: FlutterFlowTheme.of(context).accent3,
                            paintStyle: PaintingStyle.stroke,
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
      ),
    );
  }
}
