import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'onboarding_page_view_model.dart';
export 'onboarding_page_view_model.dart';

class OnboardingPageViewWidget extends StatefulWidget {
  const OnboardingPageViewWidget({super.key});

  static String routeName = 'OnboardingPageView';
  static String routePath = '/onboardingPageView';

  @override
  State<OnboardingPageViewWidget> createState() =>
      _OnboardingPageViewWidgetState();
}

class _OnboardingPageViewWidgetState extends State<OnboardingPageViewWidget> {
  late OnboardingPageViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingPageViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OnboardingPageView'});
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
            Container(
              width: double.infinity,
              height: 982.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 80.0,
                    color: FlutterFlowTheme.of(context).primary,
                    offset: Offset(
                      0.0,
                      80.0,
                    ),
                    spreadRadius: 80.0,
                  )
                ],
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Color(0x6AEDF1F7),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 503.2,
                child: Stack(
                  children: [
                    PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 973.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 80.0,
                                    color: FlutterFlowTheme.of(context).primary,
                                    offset: Offset(
                                      0.0,
                                      80.0,
                                    ),
                                    spreadRadius: 80.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                  color: Color(0x6AEDF1F7),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 497.6,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        image: Image.asset(
                                          'assets/images/Welcome_to_Escape.gif',
                                        ).image,
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                          FlutterFlowTheme.of(context).primary
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                'Welcome, ${currentUserDisplayName}',
                                                'Welcome, Jane Doe!',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'The Seasons',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '4m1aovgz' /* Your AI-powered self-care univ... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'WorkSans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 150.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Container(
                                            width: 317.5,
                                            height: 64.8,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 30.0,
                                                  color: Color(0xFDFCC462),
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                  spreadRadius: 5.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ONBOARDING_VIEW_CONTINUE_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_haptic_feedback');
                                                  HapticFeedback.lightImpact();
                                                  logFirebaseEvent(
                                                      'Button_play_sound');
                                                  _model.soundPlayer1 ??=
                                                      AudioPlayer();
                                                  if (_model
                                                      .soundPlayer1!.playing) {
                                                    await _model.soundPlayer1!
                                                        .stop();
                                                  }
                                                  _model.soundPlayer1!
                                                      .setVolume(1.0);
                                                  _model.soundPlayer1!
                                                      .setAsset(
                                                          'assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav')
                                                      .then((_) => _model
                                                          .soundPlayer1!
                                                          .play());

                                                  logFirebaseEvent(
                                                      'Button_page_view');
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4cem9x6v' /* Continue */,
                                                ),
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0x71EDF1F7),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 32.0)),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/544539643a2b1ae28b6cabe578ae19ce.gif',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 80.0,
                                    color: FlutterFlowTheme.of(context).primary,
                                    offset: Offset(
                                      0.0,
                                      80.0,
                                    ),
                                    spreadRadius: 80.0,
                                  )
                                ],
                                border: Border.all(
                                  color: Color(0x6AEDF1F7),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 0.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x78EDF1F7),
                                          Color(0x5ED0E3F7),
                                          Color(0x80673AB7)
                                        ],
                                        stops: [0.0, 0.5, 1.0],
                                        begin: AlignmentDirectional(1.0, -0.64),
                                        end: AlignmentDirectional(-1.0, 0.64),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 500.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 333.6,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 80.0,
                                                    color: Color(0xFFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                    spreadRadius: 80.0,
                                                  )
                                                ],
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rfuep4zh' /* Personalized Self Care, Powere... */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'g944d890' /* Your AI-powered self-care univ... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    35.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ONBOARDING_VIEW_BACK_BTN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Button_page_view');
                                                                await _model
                                                                    .pageViewController
                                                                    ?.previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'oic0o15v' /* Back */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 120.0,
                                                                height: 50.0,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 1.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.0),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 156.8,
                                                                height: 55.7,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          30.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        0.0,
                                                                      ),
                                                                      spreadRadius:
                                                                          8.0,
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'ONBOARDING_VIEW_CONTINUE_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_haptic_feedback');
                                                                      HapticFeedback
                                                                          .lightImpact();
                                                                      logFirebaseEvent(
                                                                          'Button_play_sound');
                                                                      _model.soundPlayer2 ??=
                                                                          AudioPlayer();
                                                                      if (_model
                                                                          .soundPlayer2!
                                                                          .playing) {
                                                                        await _model
                                                                            .soundPlayer2!
                                                                            .stop();
                                                                      }
                                                                      _model
                                                                          .soundPlayer2!
                                                                          .setVolume(
                                                                              1.0);
                                                                      _model
                                                                          .soundPlayer2!
                                                                          .setAsset(
                                                                              'assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav')
                                                                          .then((_) => _model
                                                                              .soundPlayer2!
                                                                              .play());

                                                                      logFirebaseEvent(
                                                                          'Button_page_view');
                                                                      await _model
                                                                          .pageViewController
                                                                          ?.nextPage(
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'yd3egcyn' /* Continue */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.342,
                                                                      height:
                                                                          50.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x5AEDF1F7),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/90ac6093fb40e1d7398371b1d61a4e4a.gif',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 80.0,
                                    color: FlutterFlowTheme.of(context).primary,
                                    offset: Offset(
                                      0.0,
                                      80.0,
                                    ),
                                    spreadRadius: 80.0,
                                  )
                                ],
                                border: Border.all(
                                  color: Color(0x6AEDF1F7),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 0.0,
                                    sigmaY: 0.0,
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x78EDF1F7),
                                          Color(0x5ED0E3F7),
                                          Color(0x80673AB7)
                                        ],
                                        stops: [0.0, 0.5, 1.0],
                                        begin: AlignmentDirectional(1.0, -0.64),
                                        end: AlignmentDirectional(-1.0, 0.64),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 500.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 333.6,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 80.0,
                                                    color: Color(0xFFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                    spreadRadius: 80.0,
                                                  )
                                                ],
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'eif1m7kg' /* Soundscapes by Lucille */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5olefya1' /* Lucille poowers your self-care... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    35.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ONBOARDING_VIEW_BACK_BTN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Button_page_view');
                                                                await _model
                                                                    .pageViewController
                                                                    ?.previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'rscrrgf1' /* Back */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 120.0,
                                                                height: 50.0,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 1.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.0),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 156.8,
                                                                height: 55.7,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          30.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        0.0,
                                                                      ),
                                                                      spreadRadius:
                                                                          8.0,
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'ONBOARDING_VIEW_CONTINUE_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_haptic_feedback');
                                                                      HapticFeedback
                                                                          .lightImpact();
                                                                      logFirebaseEvent(
                                                                          'Button_play_sound');
                                                                      _model.soundPlayer3 ??=
                                                                          AudioPlayer();
                                                                      if (_model
                                                                          .soundPlayer3!
                                                                          .playing) {
                                                                        await _model
                                                                            .soundPlayer3!
                                                                            .stop();
                                                                      }
                                                                      _model
                                                                          .soundPlayer3!
                                                                          .setVolume(
                                                                              1.0);
                                                                      _model
                                                                          .soundPlayer3!
                                                                          .setAsset(
                                                                              'assets/audios/ES_Notification,_Attention,_Text,_Reveal,_Positive_01_-_Epidemic_Sound_-_2170-2760.wav')
                                                                          .then((_) => _model
                                                                              .soundPlayer3!
                                                                              .play());

                                                                      logFirebaseEvent(
                                                                          'Button_page_view');
                                                                      await _model
                                                                          .pageViewController
                                                                          ?.nextPage(
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '87l89d9l' /* Continue */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.342,
                                                                      height:
                                                                          50.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x5AEDF1F7),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 32.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Dark_Future_-_Stefan_Kang.gif',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 80.0,
                                    color: FlutterFlowTheme.of(context).primary,
                                    offset: Offset(
                                      0.0,
                                      80.0,
                                    ),
                                    spreadRadius: 80.0,
                                  )
                                ],
                                border: Border.all(
                                  color: Color(0x6AEDF1F7),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 0.0,
                                    sigmaY: 0.0,
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x78EDF1F7),
                                          Color(0x5ED0E3F7),
                                          Color(0x80673AB7)
                                        ],
                                        stops: [0.0, 0.5, 1.0],
                                        begin: AlignmentDirectional(1.0, -0.64),
                                        end: AlignmentDirectional(-1.0, 0.64),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 500.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 333.6,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 80.0,
                                                    color: Color(0xFFEDF1F7),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                    spreadRadius: 80.0,
                                                  )
                                                ],
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'y1nbf80n' /* Private. Secure. Just for You. */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'qtmmv0p1' /* All your information is secure... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    35.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ONBOARDING_VIEW_BACK_BTN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Button_page_view');
                                                                await _model
                                                                    .pageViewController
                                                                    ?.previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'o3u84p81' /* Back */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 120.0,
                                                                height: 50.0,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 1.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.0),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 156.8,
                                                                height: 55.7,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          30.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        0.0,
                                                                      ),
                                                                      spreadRadius:
                                                                          8.0,
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'ONBOARDING_VIEW_FINISH_ONBOARDING_BTN_ON');
                                                                      logFirebaseEvent(
                                                                          'Button_haptic_feedback');
                                                                      HapticFeedback
                                                                          .lightImpact();
                                                                      logFirebaseEvent(
                                                                          'Button_play_sound');
                                                                      _model.soundPlayer4 ??=
                                                                          AudioPlayer();
                                                                      if (_model
                                                                          .soundPlayer4!
                                                                          .playing) {
                                                                        await _model
                                                                            .soundPlayer4!
                                                                            .stop();
                                                                      }
                                                                      _model
                                                                          .soundPlayer4!
                                                                          .setVolume(
                                                                              1.0);
                                                                      _model
                                                                          .soundPlayer4!
                                                                          .setAsset(
                                                                              'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                                          .then((_) => _model
                                                                              .soundPlayer4!
                                                                              .play());

                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        YoureAllSetPageVersion5Widget
                                                                            .routeName,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          '__transition_info__':
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.rightToLeft,
                                                                            duration:
                                                                                Duration(milliseconds: 1),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kjltem25' /* Finish Onboarding */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.399,
                                                                      height:
                                                                          50.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x5AEDF1F7),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
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
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 4,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 8.0,
                            radius: 8.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).tertiary,
                            activeDotColor:
                                FlutterFlowTheme.of(context).accent1,
                            paintStyle: PaintingStyle.fill,
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
      ),
    );
  }
}
