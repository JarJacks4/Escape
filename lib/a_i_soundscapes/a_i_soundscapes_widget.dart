import '/components/select_timed_scenario_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'a_i_soundscapes_model.dart';
export 'a_i_soundscapes_model.dart';

class AISoundscapesWidget extends StatefulWidget {
  const AISoundscapesWidget({
    super.key,
    String? meditationaudio,
  }) : this.meditationaudio = meditationaudio ??
            'https://www.youtube.com/watch?v=u3papaX85MA&list=PLyC3pcUWmqsTfH2-BQQ4PfuS7NjxcFa9v&index=4';

  final String meditationaudio;

  static String routeName = 'AISoundscapes';
  static String routePath = 'aISoundscapes';

  @override
  State<AISoundscapesWidget> createState() => _AISoundscapesWidgetState();
}

class _AISoundscapesWidgetState extends State<AISoundscapesWidget>
    with TickerProviderStateMixin {
  late AISoundscapesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AISoundscapesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AISoundscapes'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 3600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 3600.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Stack(
                children: [
                  ScrollConfiguration(
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 812.6,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Register_-_Login_(2).gif',
                                  ).image,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 7.0,
                                    sigmaY: 7.0,
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 117.07,
                                    decoration: BoxDecoration(
                                      color: Color(0x7DD0E3F7),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 25.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 50.0,
                                                  icon: Icon(
                                                    Icons.arrow_back,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 36.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'A_I_SOUNDSCAPES_arrow_back_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_navigate_back');
                                                    context.safePop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'A_I_SOUNDSCAPES_Image_gu53mehd_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      HomeVersion4Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 1),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Logo_ESCAPE_White.png',
                                                      width: 86.0,
                                                      height: 72.9,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '94yf5u3h' /* Lucille 
Soundscapes */
                                              ,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'The Seasons',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 36.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: Container(
                                              width: 188.5,
                                              height: 140.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: Image.asset(
                                                    'assets/images/ESCAPE_Logo_Clear.png',
                                                  ).image,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation']!),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 119.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: ScrollConfiguration(
                                                behavior:
                                                    ScrollConfiguration.of(
                                                            context)
                                                        .copyWith(
                                                  scrollbars: false,
                                                  dragDevices: {
                                                    PointerDeviceKind.mouse,
                                                    PointerDeviceKind.touch,
                                                    PointerDeviceKind.stylus,
                                                    PointerDeviceKind.unknown,
                                                  },
                                                ),
                                                child: Scrollbar(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              3.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                63.0,
                                                                            height:
                                                                                64.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              borderRadius: BorderRadius.circular(50.0),
                                                                            ),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.slidersH,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 36.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('A_I_SOUNDSCAPES_PAGE_slidersH_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: SelectTimedScenarioCompWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'xls8hriv' /* Select Scenario */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              3.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                63.0,
                                                                            height:
                                                                                64.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              borderRadius: BorderRadius.circular(50.0),
                                                                            ),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.solidClock,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 36.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('A_I_SOUNDSCAPES_solidClock_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: SelectTimedScenarioCompWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'wnu0b9br' /* Select Time */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              63.0,
                                                                          height:
                                                                              64.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.black,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.ksingleBed,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 36.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('A_I_SOUNDSCAPES_singleBed_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_custom_action');
                                                                              _model.songandtitle = await actions.getRandomSongAndTitle(
                                                                                'Escape Meditation Help',
                                                                              );
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().currentSongUrl = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.url''',
                                                                              ).toString();
                                                                              FFAppState().currentSongtitle = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.title''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'zcn3zuay' /* Meditation */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              63.0,
                                                                          height:
                                                                              64.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.kfocus,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 36.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('A_I_SOUNDSCAPES_PAGE_focus_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_custom_action');
                                                                              _model.songandtitle9 = await actions.getRandomSongAndTitle(
                                                                                'Escape Meditation Help',
                                                                              );
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().currentSongUrl = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.url''',
                                                                              ).toString();
                                                                              FFAppState().currentSongtitle = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.title''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vgt6s6r3' /* Focus */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              63.0,
                                                                          height:
                                                                              64.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.ksadCry,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 36.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('A_I_SOUNDSCAPES_PAGE_sadCry_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_custom_action');
                                                                              _model.songandtitle1 = await actions.getRandomSongAndTitle(
                                                                                'Escape Meditation Help',
                                                                              );
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().currentSongUrl = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.url''',
                                                                              ).toString();
                                                                              FFAppState().currentSongtitle = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.title''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            18.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '9olwvss8' /* Depression */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'The Seasons',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              63.0,
                                                                          height:
                                                                              64.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.ksleeping,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 36.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('A_I_SOUNDSCAPES_PAGE_sleeping_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_custom_action');
                                                                              _model.songandtitle5 = await actions.getRandomSongAndTitle(
                                                                                'Escape Meditation Help',
                                                                              );
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().currentSongUrl = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.url''',
                                                                              ).toString();
                                                                              FFAppState().currentSongtitle = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.title''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            18.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'o4sm25ap' /* Sleep */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'The Seasons',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              63.0,
                                                                          height:
                                                                              64.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.kwind,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 36.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('A_I_SOUNDSCAPES_PAGE_wind_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_custom_action');
                                                                              _model.songandtitle3 = await actions.getRandomSongAndTitle(
                                                                                'Escape Meditation Help',
                                                                              );
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().currentSongUrl = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.url''',
                                                                              ).toString();
                                                                              FFAppState().currentSongtitle = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.title''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '88xk0uov' /* Wind Down */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              63.0,
                                                                          height:
                                                                              64.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.kbookOpen,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 36.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('A_I_SOUNDSCAPES_PAGE_bookOpen_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_custom_action');
                                                                              _model.songandtitle4 = await actions.getRandomSongAndTitle(
                                                                                'Escape Meditation Help',
                                                                              );
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().currentSongUrl = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.url''',
                                                                              ).toString();
                                                                              FFAppState().currentSongtitle = getJsonField(
                                                                                _model.songandtitle,
                                                                                r'''$.title''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '2xsqyq0v' /* Study */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'The Seasons',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.02),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 15.0),
                                            child: FlutterFlowAudioPlayer(
                                              audio: Audio.network(
                                                FFAppState().currentSongUrl,
                                                metas: Metas(
                                                  title: FFAppState()
                                                      .currentSongtitle,
                                                ),
                                              ),
                                              titleTextStyle: FlutterFlowTheme
                                                      .of(context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'The Seasons',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              playbackDurationTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        letterSpacing: 0.0,
                                                      ),
                                              fillColor: Color(0xDCD0E3F7),
                                              playbackButtonColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              elevation: 3.0,
                                              playInBackground:
                                                  PlayInBackground.enabled,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
