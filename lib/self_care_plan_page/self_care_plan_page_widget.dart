import '/auth/firebase_auth/auth_util.dart';
import '/components/chat_with_lucille_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'self_care_plan_page_model.dart';
export 'self_care_plan_page_model.dart';

class SelfCarePlanPageWidget extends StatefulWidget {
  const SelfCarePlanPageWidget({super.key});

  static String routeName = 'SelfCarePlanPage';
  static String routePath = 'selfCarePlanPage';

  @override
  State<SelfCarePlanPageWidget> createState() => _SelfCarePlanPageWidgetState();
}

class _SelfCarePlanPageWidgetState extends State<SelfCarePlanPageWidget>
    with TickerProviderStateMixin {
  late SelfCarePlanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelfCarePlanPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SelfCarePlanPage'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 2400.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
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
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
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
      'textOnPageLoadAnimation3': AnimationInfo(
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
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
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
      'textOnPageLoadAnimation4': AnimationInfo(
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
      'progressBarOnPageLoadAnimation': AnimationInfo(
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
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEDF1F7),
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(170.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '2erc8jaf' /* Self Care Plan */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'The Seasons',
                                              color: Colors.black,
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation3']!),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SELF_CARE_PLAN_Image_zc6j856m_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_navigate_to');

                                            context.pushNamed(
                                                HomeVersion4Widget.routeName);
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Rectangle_1.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'imageOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            height: 68.67,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent4,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Hero(
                                            tag: FFAppState().ProfilePicture,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              child: Image.network(
                                                FFAppState().ProfilePicture,
                                                width: 46.4,
                                                height: 46.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  width: 46.4,
                                                  height: 46.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              AnimatedDefaultTextStyle(
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'The Seasons',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            duration:
                                                Duration(milliseconds: 600),
                                            curve: Curves.easeIn,
                                            child: Text(
                                              valueOrDefault<String>(
                                                currentUserDisplayName,
                                                'Jane Doe',
                                              ).maybeHandleOverflow(
                                                maxChars: 10,
                                                replacement: '…',
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation4']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 100.0,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                    indent: 8.0,
                                    endIndent: 8.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: 185.9,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 20.0, 0.0),
                                              child: LinearPercentIndicator(
                                                percent: FFAppState()
                                                    .pointsEarned
                                                    .toDouble(),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                lineHeight: 25.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                center: Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .pointsEarned
                                                        .toString(),
                                                    '0 Points',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 50,
                                                    replacement: '…',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                                barRadius:
                                                    Radius.circular(80.0),
                                                padding: EdgeInsets.zero,
                                              ).animateOnPageLoad(animationsMap[
                                                  'progressBarOnPageLoadAnimation']!),
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
                      ],
                    ),
                    background: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                    titlePadding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 10.0),
                child: ScrollConfiguration(
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
                    controller: _model.columnController,
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeOut,
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.28,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        5.0,
                                      ),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          19.0, 40.0, 7.0, 20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child:
                                                          AnimatedDefaultTextStyle(
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      28.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        duration: Duration(
                                                            milliseconds: 600),
                                                        curve: Curves.easeIn,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm2orc3gk' /* Welcome back, */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.easeIn,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                AnimatedDefaultTextStyle(
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'The Seasons',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      600),
                                                              curve:
                                                                  Curves.easeIn,
                                                              child: Text(
                                                                currentUserDisplayName,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 25.0)),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                100.0,
                                                                8.0,
                                                                0.0),
                                                    child: Container(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        FFAppState()
                                                            .ProfilePicture,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'rowOnPageLoadAnimation']!),
                                        ].divide(SizedBox(height: 15.0)),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.95, -0.82),
                                      child: Hero(
                                        tag: 'hero',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/ESCAPE_Logo_Clear.png',
                                            width: 45.1,
                                            height: 52.28,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation1']!),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['stackOnPageLoadAnimation']!),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 19.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'yws4gl3j' /* Enter the Innerverse */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'The Seasons',
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 175.69,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ListView(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 22.0),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          wrapWithModel(
                                            model:
                                                _model.chatWithLucilleCardModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ChatWithLucilleCardWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .generateSoundscapesCardModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                GenerateSoundscapesCardWidget(),
                                          ),
                                        ].divide(SizedBox(width: 22.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'af5dwc79' /* Recommendations */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'The Seasons',
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation2']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 33.0, 0.0, 0.0),
                            child: MasonryGridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return [
                                  () => Container(
                                        height: 147.43,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1C2F44),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SELF_CARE_PLAN_Column_iofnqxok_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_navigate_to');

                                            context.pushNamed(
                                                MeditationChoicePageWidget
                                                    .routeName);
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/Meditation.png',
                                                        height: 101.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'uwi7xjwm' /* Meditation */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'The Seasons',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                  () => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SELF_CARE_PLAN_Container_qmxcxfhi_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            CommunityHomeFINALWidget.routeName,
                                            queryParameters: {
                                              'bodyIndex': serializeParam(
                                                3,
                                                ParamType.int,
                                              ),
                                              'initialTabIndex': serializeParam(
                                                3,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          height: 178.5,
                                          decoration: BoxDecoration(
                                            color: Color(0xC3F0831A),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        flex: 1,
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ocz0wsml' /* Body */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          minFontSize: 14.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'The Seasons',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'woec7ek6' /* Pilates */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          minFontSize: 10.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xdatlwfc' /* Tai Chi */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          minFontSize: 10.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'batcuo8o' /* Yoga */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          minFontSize: 10.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 15.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Ellipse_2.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  () => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SELF_CARE_PLAN_Container_l8pyfou6_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            JournalPageFINALWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 2),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 219.17,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD0E3F7),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Vector.png',
                                                                  width: 46.33,
                                                                  height: 36.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'yqvofdtb' /* Journaling */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'The Seasons',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'vvejr6vn' /* Gratitude
Journal
Improvement */
                                                              ,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 3,
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  () => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SELF_CARE_PLAN_Container_damzyfar_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            CommunityHomeFINALWidget.routeName,
                                            queryParameters: {
                                              'bodyIndex': serializeParam(
                                                3,
                                                ParamType.int,
                                              ),
                                              'initialTabIndex': serializeParam(
                                                3,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 2),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 235.03,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1C2F44),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Group_Task.png',
                                                                  height: 42.4,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '7bls7upz' /* Community */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                            minFontSize: 12.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'd15be9at' /* See Community Content and Esca... */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 3,
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                ][index]();
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.todaysSelfCareActivitiesCompModel,
                                updateCallback: () => safeSetState(() {}),
                                child: Hero(
                                  tag: 'ClassComp',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TodaysSelfCareActivitiesCompWidget(),
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
        ),
      ),
    );
  }
}
