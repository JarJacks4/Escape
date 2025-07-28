import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:chat_u_i_kit_n2m29m/app_state.dart'
    as chat_u_i_kit_n2m29m_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'community_home_f_i_n_a_l_model.dart';
export 'community_home_f_i_n_a_l_model.dart';

/// CommunityHomeFINAL
class CommunityHomeFINALWidget extends StatefulWidget {
  const CommunityHomeFINALWidget({
    super.key,
    this.forYouIndex,
    this.breathingIndex,
    this.bodyIndex,
    int? initialTabIndex,
    this.oldIndex,
    int? newIndex,
  })  : this.initialTabIndex = initialTabIndex ?? 0,
        this.newIndex = newIndex ?? 2;

  final int? forYouIndex;
  final int? breathingIndex;
  final int? bodyIndex;
  final int initialTabIndex;
  final int? oldIndex;
  final int newIndex;

  static String routeName = 'CommunityHomeFINAL';
  static String routePath = '/communityHomeFINAL';

  @override
  State<CommunityHomeFINALWidget> createState() =>
      _CommunityHomeFINALWidgetState();
}

class _CommunityHomeFINALWidgetState extends State<CommunityHomeFINALWidget>
    with TickerProviderStateMixin {
  late CommunityHomeFINALModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityHomeFINALModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CommunityHomeFINAL'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            widget.initialTabIndex,
            0,
          ),
          2),
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
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
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-48.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
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
    context.watch<FFAppState>();
    context.watch<chat_u_i_kit_n2m29m_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Color(0x80000000)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 60.0, 8.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Logo_ESCAPE_White.png',
                                              width: 137.32,
                                              height: 31.4,
                                              fit: BoxFit.contain,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'imageOnPageLoadAnimation']!),
                                        ].divide(SizedBox(width: 24.0)),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'COMMUNITY_HOME_F_I_N_A_L_Icon_dci0nmpb_O');
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                          ProfileFINALWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 1),
                                            ),
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.person_2_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 24.0,
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation']!,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      flex: 1,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            height: 683.71,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      tabAlignment: TabAlignment.center,
                                      labelColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              25.0, 0.0, 25.0, 0.0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'The Seasons',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      unselectedLabelStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                letterSpacing: 0.0,
                                              ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'mjfpegxu' /* For You */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'uym5o2s3' /* Breathing */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'db42ing9' /* Body */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          6.5,
                                                  constraints: BoxConstraints(
                                                    minWidth: double.infinity,
                                                    minHeight: 600.0,
                                                    maxWidth: double.infinity,
                                                    maxHeight:
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            100.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: ListView(
                                                      padding: EdgeInsets.zero,
                                                      reverse: true,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        1.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.8,
                                                              child: tiktokfeed_wz8en7_custom_widgets
                                                                  .ChewieWidget(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.8,
                                                                userID:
                                                                    currentUserUid,
                                                                data: tiktokfeed_wz8en7_app_state
                                                                        .FFAppState()
                                                                    .ListTikTokPages,
                                                                likerebuidpage:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'COMMUNITY_HOME_F_I_N_A_L_Container_vqjof');
                                                                  logFirebaseEvent(
                                                                      'ChewieWidget_update_app_state');
                                                                  FFAppState()
                                                                      .updateListTikTokPagesAtIndex(
                                                                    FFAppState()
                                                                        .videoId,
                                                                    (e) => e
                                                                      ..likes = FFAppState()
                                                                          .newListLike
                                                                          .toList(),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                bookedrebuidpage:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'COMMUNITY_HOME_F_I_N_A_L_Container_vqjof');
                                                                  logFirebaseEvent(
                                                                      'ChewieWidget_update_app_state');
                                                                  FFAppState()
                                                                      .updateListTikTokPagesAtIndex(
                                                                    tiktokfeed_wz8en7_app_state
                                                                            .FFAppState()
                                                                        .videoID,
                                                                    (e) => e
                                                                      ..bookmark = FFAppState()
                                                                          .newListBookmarks
                                                                          .toList(),
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'listViewOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 700.0,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: ListView(
                                                      padding: EdgeInsets.zero,
                                                      reverse: true,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        1.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.75,
                                                                child: tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.75,
                                                                  userID:
                                                                      currentUserDisplayName,
                                                                  data: tiktokfeed_wz8en7_app_state
                                                                          .FFAppState()
                                                                      .BreathingTikTok,
                                                                  likerebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_gcvai');
                                                                    logFirebaseEvent(
                                                                        'ChewieWidget_update_app_state');
                                                                    FFAppState()
                                                                        .updateListTikTokPagesAtIndex(
                                                                      FFAppState()
                                                                          .videoId,
                                                                      (e) => e
                                                                        ..likes = FFAppState()
                                                                            .newListLike
                                                                            .toList(),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  bookedrebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_gcvai');
                                                                    logFirebaseEvent(
                                                                        'ChewieWidget_update_app_state');
                                                                    FFAppState()
                                                                        .updateListTikTokPagesAtIndex(
                                                                      FFAppState()
                                                                          .videoId,
                                                                      (e) => e
                                                                        ..bookmark = FFAppState()
                                                                            .newListBookmarks
                                                                            .toList(),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
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
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 700.0,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: ListView(
                                                      padding: EdgeInsets.zero,
                                                      reverse: true,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        1.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.75,
                                                                child: tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.75,
                                                                  userID:
                                                                      currentUserDisplayName,
                                                                  data: tiktokfeed_wz8en7_app_state
                                                                          .FFAppState()
                                                                      .BodyTikToks,
                                                                  likerebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_sx2nh');
                                                                    logFirebaseEvent(
                                                                        'ChewieWidget_update_app_state');
                                                                    FFAppState()
                                                                        .updateListTikTokPagesAtIndex(
                                                                      FFAppState()
                                                                          .videoId,
                                                                      (e) => e
                                                                        ..likes = FFAppState()
                                                                            .newListLike
                                                                            .toList(),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  bookedrebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_sx2nh');
                                                                    logFirebaseEvent(
                                                                        'ChewieWidget_update_app_state');
                                                                    FFAppState()
                                                                        .updateListTikTokPagesAtIndex(
                                                                      FFAppState()
                                                                          .videoId,
                                                                      (e) => e
                                                                        ..bookmark = FFAppState()
                                                                            .newListBookmarks
                                                                            .toList(),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
