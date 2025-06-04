import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_home_f_i_n_a_l_model.dart';
export 'community_home_f_i_n_a_l_model.dart';

/// ProviderCommunityHome
class CommunityHomeFINALWidget extends StatefulWidget {
  const CommunityHomeFINALWidget({
    super.key,
    this.forYouIndex,
    this.breathingIndex,
    this.bodyIndex,
  });

  final int? forYouIndex;
  final int? breathingIndex;
  final int? bodyIndex;

  static String routeName = 'CommunityHomeFINAL';
  static String routePath = 'communityHomeFINAL';

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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COMMUNITY_HOME_F_I_N_A_L_CommunityHomeFI');
      logFirebaseEvent('CommunityHomeFINAL_custom_action');
      _model.meditationReOrder = await actions.reorderItems(
        tiktokfeed_wz8en7_app_state.FFAppState()
            .meditationTikToks
            .map((e) => e.urlvideo)
            .toList()
            .toList(),
        widget!.forYouIndex!,
        widget!.breathingIndex!,
      );
      logFirebaseEvent('CommunityHomeFINAL_custom_action');
      _model.bodyReOrder = await actions.reorderItems(
        tiktokfeed_wz8en7_app_state.FFAppState()
            .BodyTikToks
            .map((e) => e.urlvideo)
            .toList()
            .toList(),
        widget!.forYouIndex!,
        widget!.bodyIndex!,
      );
      logFirebaseEvent('CommunityHomeFINAL_custom_action');
      _model.forYouReOrder = await actions.reorderItems(
        tiktokfeed_wz8en7_app_state.FFAppState()
            .ListTikTokPages
            .map((e) => e.urlvideo)
            .toList()
            .toList(),
        widget!.forYouIndex!,
        widget!.forYouIndex!,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            widget!.forYouIndex,
            0,
          ),
          2),
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        logFirebaseEvent('COMMUNITY_HOME_F_I_N_A_L_TabBar_c1dem0rv');
        logFirebaseEvent('TabBar_custom_action');
        _model.meditationReOrder1 = await actions.reorderItems(
          tiktokfeed_wz8en7_app_state.FFAppState()
              .meditationTikToks
              .map((e) => e.urlvideo)
              .toList()
              .toList(),
          widget!.forYouIndex!,
          widget!.breathingIndex!,
        );
        logFirebaseEvent('TabBar_custom_action');
        _model.bodyReOrder2 = await actions.reorderItems(
          tiktokfeed_wz8en7_app_state.FFAppState()
              .BodyTikToks
              .map((e) => e.urlvideo)
              .toList()
              .toList(),
          widget!.forYouIndex!,
          widget!.bodyIndex!,
        );
        logFirebaseEvent('TabBar_custom_action');
        _model.forYouReOrder3 = await actions.reorderItems(
          tiktokfeed_wz8en7_app_state.FFAppState()
              .ListTikTokPages
              .map((e) => e.urlvideo)
              .toList()
              .toList(),
          widget!.forYouIndex!,
          widget!.forYouIndex!,
        );

        safeSetState(() {});
      });

    animationsMap.addAll({
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
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 50.0, 8.0, 0.0),
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
                                          ),
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
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).accent1,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                                    FlutterFlowTheme.of(context).primary,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'jqshrznh' /* For You */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '07okvhbs' /* Breathing */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '8vmea7gc' /* Body */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 636.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final forYouVideos =
                                                      tiktokfeed_wz8en7_app_state
                                                              .FFAppState()
                                                          .ListTikTokPages
                                                          .take(100)
                                                          .toList();

                                                  return ReorderableListView
                                                      .builder(
                                                    padding: EdgeInsets.zero,
                                                    proxyDecorator: (Widget
                                                                child,
                                                            int index,
                                                            Animation<double>
                                                                animation) =>
                                                        Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: child),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        forYouVideos.length,
                                                    itemBuilder: (context,
                                                        forYouVideosIndex) {
                                                      final forYouVideosItem =
                                                          forYouVideos[
                                                              forYouVideosIndex];
                                                      return Container(
                                                        key: ValueKey(
                                                            "ListView_xnl6plvo" +
                                                                '_' +
                                                                forYouVideosIndex
                                                                    .toString()),
                                                        child: Align(
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
                                                                      .ListTikTokPages,
                                                                  likerebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_gcbdh');
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
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_gcbdh');
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
                                                      );
                                                    },
                                                    onReorder: (int
                                                            reorderableOldIndex,
                                                        int reorderableNewIndex) async {
                                                      logFirebaseEvent(
                                                          'COMMUNITY_HOME_F_I_N_A_L_ListView_xnl6pl');
                                                      logFirebaseEvent(
                                                          'ListView_custom_action');
                                                      _model.updateForYou =
                                                          await actions
                                                              .reorderItems(
                                                        tiktokfeed_wz8en7_app_state
                                                                .FFAppState()
                                                            .ListTikTokPages
                                                            .map((e) =>
                                                                e.urlvideo)
                                                            .toList(),
                                                        reorderableOldIndex,
                                                        reorderableNewIndex,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  );
                                                },
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
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 636.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final forYouVideos =
                                                      tiktokfeed_wz8en7_app_state
                                                              .FFAppState()
                                                          .ListTikTokPages
                                                          .take(100)
                                                          .toList();

                                                  return ReorderableListView
                                                      .builder(
                                                    padding: EdgeInsets.zero,
                                                    proxyDecorator: (Widget
                                                                child,
                                                            int index,
                                                            Animation<double>
                                                                animation) =>
                                                        Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: child),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        forYouVideos.length,
                                                    itemBuilder: (context,
                                                        forYouVideosIndex) {
                                                      final forYouVideosItem =
                                                          forYouVideos[
                                                              forYouVideosIndex];
                                                      return Container(
                                                        key: ValueKey(
                                                            "ListView_t3xnkjn0" +
                                                                '_' +
                                                                forYouVideosIndex
                                                                    .toString()),
                                                        child: Align(
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
                                                                      .ListTikTokPages,
                                                                  likerebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_85nck');
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
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_85nck');
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
                                                      );
                                                    },
                                                    onReorder: (int
                                                            reorderableOldIndex,
                                                        int reorderableNewIndex) async {
                                                      logFirebaseEvent(
                                                          'COMMUNITY_HOME_F_I_N_A_L_ListView_t3xnkj');
                                                      logFirebaseEvent(
                                                          'ListView_custom_action');
                                                      _model.updateBreathing =
                                                          await actions
                                                              .reorderItems(
                                                        tiktokfeed_wz8en7_app_state
                                                                .FFAppState()
                                                            .BreathingTikTok
                                                            .map((e) =>
                                                                e.urlvideo)
                                                            .toList(),
                                                        reorderableOldIndex,
                                                        reorderableNewIndex,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  );
                                                },
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
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 636.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final forYouVideos =
                                                      tiktokfeed_wz8en7_app_state
                                                              .FFAppState()
                                                          .ListTikTokPages
                                                          .take(100)
                                                          .toList();

                                                  return ReorderableListView
                                                      .builder(
                                                    padding: EdgeInsets.zero,
                                                    proxyDecorator: (Widget
                                                                child,
                                                            int index,
                                                            Animation<double>
                                                                animation) =>
                                                        Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: child),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        forYouVideos.length,
                                                    itemBuilder: (context,
                                                        forYouVideosIndex) {
                                                      final forYouVideosItem =
                                                          forYouVideos[
                                                              forYouVideosIndex];
                                                      return Container(
                                                        key: ValueKey(
                                                            "ListView_qdott1ry" +
                                                                '_' +
                                                                forYouVideosIndex
                                                                    .toString()),
                                                        child: Align(
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
                                                                      .ListTikTokPages,
                                                                  likerebuidpage:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_duhiz');
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
                                                                        'COMMUNITY_HOME_F_I_N_A_L_Container_duhiz');
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
                                                      );
                                                    },
                                                    onReorder: (int
                                                            reorderableOldIndex,
                                                        int reorderableNewIndex) async {
                                                      logFirebaseEvent(
                                                          'COMMUNITY_HOME_F_I_N_A_L_ListView_qdott1');
                                                      logFirebaseEvent(
                                                          'ListView_custom_action');
                                                      _model.updateBody =
                                                          await actions
                                                              .reorderItems(
                                                        tiktokfeed_wz8en7_app_state
                                                                .FFAppState()
                                                            .BodyTikToks
                                                            .map((e) =>
                                                                e.urlvideo)
                                                            .toList(),
                                                        reorderableOldIndex,
                                                        reorderableNewIndex,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  );
                                                },
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
      ),
    );
  }
}
