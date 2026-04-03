import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/coming_soon_body_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/index.dart'
    as $that_audio_player_oo85ab;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lucille_soundscape_suggestion_model.dart';
export 'lucille_soundscape_suggestion_model.dart';

/// New Component Gen
class LucilleSoundscapeSuggestionWidget extends StatefulWidget {
  const LucilleSoundscapeSuggestionWidget({super.key});

  @override
  State<LucilleSoundscapeSuggestionWidget> createState() =>
      _LucilleSoundscapeSuggestionWidgetState();
}

class _LucilleSoundscapeSuggestionWidgetState
    extends State<LucilleSoundscapeSuggestionWidget>
    with TickerProviderStateMixin {
  late LucilleSoundscapeSuggestionModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleSoundscapeSuggestionModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: 879.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Escape_Soundscapes_(2).png',
          ).image,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 16.0),
          child: SingleChildScrollView(
            controller: _model.columnController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  thickness: 2.0,
                  indent: 75.0,
                  endIndent: 75.0,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF3D3A6E),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    offset: Offset(
                                      0.0,
                                      0.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'yfiohfz1' /* Lucille */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'The Seasons',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ri2nymau' /* Your AI companion */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Color(0xFFF4A261),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 2.0)),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                        child: Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF3D3A6E),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20.0,
                                color: FlutterFlowTheme.of(context).accent3,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                spreadRadius: 5.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'LUCILLE_SOUNDSCAPE_SUGGESTION_Icon_y9k8a');
                                logFirebaseEvent('Icon_haptic_feedback');
                                HapticFeedback.heavyImpact();
                                logFirebaseEvent('Icon_play_sound');
                                _model.soundPlayer1 ??= AudioPlayer();
                                if (_model.soundPlayer1!.playing) {
                                  await _model.soundPlayer1!.stop();
                                }
                                _model.soundPlayer1!.setVolume(1.0);
                                _model.soundPlayer1!
                                    .setAsset(
                                        'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                    .then((_) => _model.soundPlayer1!.play());

                                logFirebaseEvent('Icon_bottom_sheet');
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 329.5,
                  height: 162.5,
                  decoration: BoxDecoration(
                    color: Color(0x1BFFFFFF),
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: Color(0x37EDF1F7),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 36.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Lottie.asset(
                                'assets/jsons/ai_animation_Flow_1.json',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'b7ilirfg' /* Hi there. I've been learning a... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kyjrp9tz' /* How are you feeling right now?... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Container(
                    width: 329.5,
                    height: 221.1,
                    decoration: BoxDecoration(
                      color: Color(0x34FFFFFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: Color(0x5CD0E3F7),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 5.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(26.0),
                      border: Border.all(
                        color: Color(0x4CEDF1F7),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'talye8xo' /* I'm feeling... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Color(0x9C1C2444),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'ypi5amxd' /* Calm */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'n9ymcfry' /* Focused */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'rjx3a1xp' /* Sleepy */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'xq0uwz1h' /* Energized */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          '0xsxktjp' /* Healing */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          '5ffoa83e' /* Awakening */,
                                        ))
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.choiceChipsValue =
                                              val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0xA8FCC462),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'The Seasons',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor:
                                            FlutterFlowTheme.of(context).info,
                                        iconSize: 16.0,
                                        elevation: 3.0,
                                        borderColor: Color(0x72EDF1F7),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0x891C2444),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 16.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      chipSpacing: 20.0,
                                      rowSpacing: 15.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.center,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'dlkjsifu' /* Lucille Recommends */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'WorkSans',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF3D3A6E),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: Color(0xFF5B5BD6),
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'gwy73oje' /* Personalized */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FutureBuilder<ApiCallResponse>(
                    future: _model.soundscapesCache(
                      requestFn: () =>
                          LucilleSoundscapesGroup.getSoundscapeCall.call(),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: SpinKitWave(
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 100.0,
                            ),
                          ),
                        );
                      }
                      final columnGetSoundscapeResponse = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              final recommendations =
                                  (columnGetSoundscapeResponse.jsonBody
                                                  .toList()
                                                  .map<Soundscapes1Struct?>(
                                                      Soundscapes1Struct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<Soundscapes1Struct?>)
                                          .withoutNulls
                                          .toList() ??
                                      [];

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 25.0),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: recommendations.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 25.0),
                                itemBuilder: (context, recommendationsIndex) {
                                  final recommendationsItem =
                                      recommendations[recommendationsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LUCILLE_SOUNDSCAPE_SUGGESTION_Container_');
                                        logFirebaseEvent(
                                            'Container_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent(
                                            'Container_play_sound');
                                        _model.soundPlayer2 ??= AudioPlayer();
                                        if (_model.soundPlayer2!.playing) {
                                          await _model.soundPlayer2!.stop();
                                        }
                                        _model.soundPlayer2!.setVolume(1.0);
                                        _model.soundPlayer2!
                                            .setAsset(
                                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                            .then((_) =>
                                                _model.soundPlayer2!.play());

                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          $that_audio_player_oo85ab
                                              .PlayerPageLucilleWidget
                                              .routeName,
                                          queryParameters: {
                                            'lucilleAudioUrl': serializeParam(
                                              recommendationsItem.audioUrl,
                                              ParamType.String,
                                            ),
                                            'soundscapeTitle': serializeParam(
                                              recommendationsItem.title,
                                              ParamType.String,
                                            ),
                                            'soundscapeID': serializeParam(
                                              recommendationsItem.soundscapeId,
                                              ParamType.String,
                                            ),
                                            'soundscapeCategory':
                                                serializeParam(
                                              recommendationsItem.category,
                                              ParamType.String,
                                            ),
                                            'sessionID': serializeParam(
                                              FFAppState().chatSessionId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            '__transition_info__that_audio_player_oo85ab':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 2),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 302.4,
                                        height: 117.5,
                                        decoration: BoxDecoration(
                                          color: Color(0x32D0E3F7),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x63EDF1F7),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                              spreadRadius: 3.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(26.0),
                                          border: Border.all(
                                            color: Color(0x3BD0E3F7),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 56.0,
                                                height: 56.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 20.0,
                                                      color: Color(0x6CFCC462),
                                                      offset: Offset(
                                                        0.0,
                                                        0.0,
                                                      ),
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0x42EDF1F7),
                                                      Color(0x6ED0E3F7)
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Lottie.asset(
                                                  'assets/jsons/ai_animation_Flow_1.json',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AnimatedDefaultTextStyle(
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'WorkSans',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      duration: Duration(
                                                          milliseconds: 270),
                                                      curve: Curves.easeIn,
                                                      child: Text(
                                                        recommendationsItem
                                                            .title,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    AnimatedDefaultTextStyle(
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'WorkSans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      duration: Duration(
                                                          milliseconds: 375),
                                                      curve: Curves.easeIn,
                                                      child: Text(
                                                        recommendationsItem
                                                            .category,
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child:
                                                          AnimatedDefaultTextStyle(
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        duration: Duration(
                                                            milliseconds: 285),
                                                        curve: Curves.easeIn,
                                                        child: Text(
                                                          recommendationsItem
                                                              .description,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 6.0)),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Container(
                    width: 329.5,
                    height: 58.5,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40.0,
                          color: Color(0xA8F0831A),
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          spreadRadius: 5.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0x00FFA07A), Color(0xFF39519F)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LUCILLE_SOUNDSCAPE_SUGGESTION_ASK_LUCILL');
                        logFirebaseEvent('Button_haptic_feedback');
                        HapticFeedback.heavyImpact();
                        logFirebaseEvent('Button_play_sound');
                        _model.soundPlayer3 ??= AudioPlayer();
                        if (_model.soundPlayer3!.playing) {
                          await _model.soundPlayer3!.stop();
                        }
                        _model.soundPlayer3!.setVolume(1.0);
                        _model.soundPlayer3!
                            .setAsset(
                                'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                            .then((_) => _model.soundPlayer3!.play());

                        logFirebaseEvent('Button_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ComingSoonBodyCompWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      text: FFLocalizations.of(context).getText(
                        'a1uv4v4b' /* Ask Lucille to create somethin... */,
                      ),
                      icon: Icon(
                        Icons.spa,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00EDF1F7),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
