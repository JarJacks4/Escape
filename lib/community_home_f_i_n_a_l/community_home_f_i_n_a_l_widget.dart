import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'community_home_f_i_n_a_l_model.dart';
export 'community_home_f_i_n_a_l_model.dart';

/// CommunityHomeFINAL
class CommunityHomeFINALWidget extends StatefulWidget {
  const CommunityHomeFINALWidget({
    super.key,
    int? forYouIndex,
    int? breathingIndex,
    int? bodyIndex,
    int? initialTabIndex,
    this.oldIndex,
    int? newIndex,
  })  : this.forYouIndex = forYouIndex ?? 2,
        this.breathingIndex = breathingIndex ?? 3,
        this.bodyIndex = bodyIndex ?? 2,
        this.initialTabIndex = initialTabIndex ?? 0,
        this.newIndex = newIndex ?? 3;

  final int forYouIndex;
  final int breathingIndex;
  final int bodyIndex;
  final int initialTabIndex;
  final int? oldIndex;
  final int newIndex;

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
      logFirebaseEvent('CommunityHomeFINAL_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Soundscapes Token Loaded!',
            style: TextStyle(
              fontFamily: 'WorkSans',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 190.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 190.0.ms,
            duration: 1220.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1680.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1710.0.ms,
            color: FlutterFlowTheme.of(context).secondary,
            angle: 0.524,
          ),
        ],
      ),
      'tabBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 850.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1830.0.ms,
            color: Color(0xEAFCC462),
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
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20.0,
                        color: FlutterFlowTheme.of(context).primary,
                        offset: Offset(
                          5.0,
                          8.0,
                        ),
                        spreadRadius: 10.0,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0x3DD0E3F7),
                        FlutterFlowTheme.of(context).primary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 874.6,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 876.4,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child:
                                                  tiktokfeed_wz8en7_custom_widgets
                                                      .ChewieWidget(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                userID: currentUserUid,
                                                data:
                                                    tiktokfeed_wz8en7_app_state
                                                            .FFAppState()
                                                        .ListTikTokPages,
                                                likerebuidpage: () async {},
                                                bookedrebuidpage: () async {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child:
                                                  tiktokfeed_wz8en7_custom_widgets
                                                      .ChewieWidget(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                userID: currentUserUid,
                                                data:
                                                    tiktokfeed_wz8en7_app_state
                                                            .FFAppState()
                                                        .meditationTikToks,
                                                likerebuidpage: () async {},
                                                bookedrebuidpage: () async {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  ScrollConfiguration(
                                                    behavior:
                                                        ScrollConfiguration.of(
                                                                context)
                                                            .copyWith(
                                                      scrollbars: false,
                                                      dragDevices: {
                                                        PointerDeviceKind.mouse,
                                                        PointerDeviceKind.touch,
                                                        PointerDeviceKind
                                                            .stylus,
                                                        PointerDeviceKind
                                                            .unknown,
                                                      },
                                                    ),
                                                    child: Scrollbar(
                                                      controller: _model
                                                          .columnController1,
                                                      child:
                                                          SingleChildScrollView(
                                                        controller: _model
                                                            .columnController1,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Opacity(
                                                                  opacity: 0.5,
                                                                  child: Hero(
                                                                    tag:
                                                                        'background',
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                                                                        width:
                                                                            409.6,
                                                                        height:
                                                                            876.8,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'imageOnPageLoadAnimation']!),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              872.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0x43D0E3F7),
                                                                                FlutterFlowTheme.of(context).primaryBackground
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 16.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '6d4t92no' /* Good Morning */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                    fontFamily: 'The Seasons',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          AuthUserStreamWidget(
                                                                                            builder: (context) => Text(
                                                                                              currentUserDisplayName,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'WorkSans',
                                                                                                    color: Colors.black,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Container(
                                                                                        width: 48.0,
                                                                                        height: 48.0,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                              FlutterFlowTheme.of(context).tertiary
                                                                                            ],
                                                                                            stops: [0.0, 1.0],
                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                          ),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.asset(
                                                                                            'assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png',
                                                                                            width: 200.0,
                                                                                            height: 200.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ssi8ixm9' /* Quick Access */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'The Seasons',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 12.0)),
                                                                                  ),
                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment(-1.0, 0),
                                                                                          child: FlutterFlowButtonTabBar(
                                                                                            useToggleButtonStyle: false,
                                                                                            isScrollable: true,
                                                                                            labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'The Seasons',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                            unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'WorkSans',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                            labelColor: FlutterFlowTheme.of(context).primary,
                                                                                            unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            unselectedBackgroundColor: Color(0xB3FFFFFF),
                                                                                            borderWidth: 2.0,
                                                                                            borderRadius: 30.0,
                                                                                            elevation: 0.0,
                                                                                            labelPadding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                            buttonMargin: EdgeInsets.all(10.0),
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 35.0, 0.0),
                                                                                            tabs: [
                                                                                              Tab(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'rvpmgyno' /* All */,
                                                                                                ),
                                                                                              ),
                                                                                              Tab(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'azrit1qn' /* Music Mediations */,
                                                                                                ),
                                                                                              ),
                                                                                              Tab(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'zick3bi7' /* Nature */,
                                                                                                ),
                                                                                              ),
                                                                                              Tab(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'duhi51jt' /* Focus */,
                                                                                                ),
                                                                                              ),
                                                                                              Tab(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'j78fg574' /* Sleep */,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                            controller: _model.tabBarController,
                                                                                            onTap: (i) async {
                                                                                              [
                                                                                                () async {},
                                                                                                () async {},
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
                                                                                            children: [
                                                                                              KeepAliveWidgetWrapper(
                                                                                                builder: (context) => Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      flex: 1,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '1fzy6wjt' /* Featured for You */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                            fontFamily: 'The Seasons',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'rerwucyb' /* Discover your perfect soundsca... */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '7dx08063' /* See all */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Flexible(
                                                                                                                      flex: 1,
                                                                                                                      child: Container(
                                                                                                                        width: 150.37,
                                                                                                                        height: 163.1,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                                        ),
                                                                                                                        child: Stack(
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: 163.3,
                                                                                                                              height: 180.7,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                image: DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: Image.network(
                                                                                                                                    'https://images.unsplash.com/photo-1470115636492-6d2b56f9146d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8Zm9yZXN0fGVufDB8fHx8MTc2ODI0MDQ0NXww&ixlib=rb-4.1.0&q=80&w=1080',
                                                                                                                                  ).image,
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                                child: Container(
                                                                                                                                  height: 37.5,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: Color(0xCC1C2444),
                                                                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(12.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Icon(
                                                                                                                                          Icons.play_arrow,
                                                                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                          size: 16.0,
                                                                                                                                        ),
                                                                                                                                        Text(
                                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                                            '004q5sfi' /* 20 minutes */,
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                fontFamily: 'WorkSans',
                                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'nt0yq6td' /* Forest Dawn */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'gb2ny7ob' /* 20 minutes */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
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
                                                                                                                controller: _model.columnController2,
                                                                                                                child: SingleChildScrollView(
                                                                                                                  primary: false,
                                                                                                                  controller: _model.columnController2,
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                '1puugffg' /* Find Your Mood */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                                    fontFamily: 'The Seasons',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'dv83j10h' /* See all */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 355.3,
                                                                                                                            height: 153.6,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.asset(
                                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                    width: 351.4,
                                                                                                                                    height: 200.0,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Flexible(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                                'qho5lh6k' /* Relax */,
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                    fontSize: 24.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                                    'ci9aldsr' /* Melt away stress with calming ... */,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Container(
                                                                                                                                        width: 48.3,
                                                                                                                                        height: 48.3,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                            colors: [
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                            ],
                                                                                                                                            stops: [0.0, 1.0],
                                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                                          ),
                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                        ),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.chevron_right,
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            width: 355.3,
                                                                                                                            height: 153.6,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.asset(
                                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/Container_(9).png',
                                                                                                                                    width: 350.19,
                                                                                                                                    height: 200.0,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Flexible(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                                'm1y8v42i' /* Focus */,
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                    fontSize: 24.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                                    '0gl99ym0' /* Enhance concentration with 
am... */
                                                                                                                                                    ,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Container(
                                                                                                                                        width: 48.3,
                                                                                                                                        height: 48.3,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                            colors: [
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                            ],
                                                                                                                                            stops: [0.0, 1.0],
                                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                                          ),
                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                        ),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.chevron_right,
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            width: 355.3,
                                                                                                                            height: 153.6,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.asset(
                                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/Container_(10).png',
                                                                                                                                    width: 348.98,
                                                                                                                                    height: 200.0,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Flexible(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                                'n4a3trrc' /* Energize */,
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                    fontSize: 24.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                                    '70kv5o0y' /* Uplift your spirit with vibran... */,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Container(
                                                                                                                                        width: 48.33,
                                                                                                                                        height: 48.33,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                            colors: [
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                            ],
                                                                                                                                            stops: [0.0, 1.0],
                                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                                          ),
                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                        ),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.chevron_right,
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            width: 355.3,
                                                                                                                            height: 153.6,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.asset(
                                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/Container_(11).png',
                                                                                                                                    width: 351.39,
                                                                                                                                    height: 200.0,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Flexible(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                                '4jpm9y22' /* Sleep */,
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                    fontSize: 24.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                                    'd9bcs4nx' /* Drift into peaceful slumber wi... */,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Container(
                                                                                                                                        width: 48.3,
                                                                                                                                        height: 48.3,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                            colors: [
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                            ],
                                                                                                                                            stops: [0.0, 1.0],
                                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                                          ),
                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                        ),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.chevron_right,
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              KeepAliveWidgetWrapper(
                                                                                                builder: (context) => Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      flex: 1,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '0ty03h2g' /* Music For You */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                            fontFamily: 'The Seasons',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'z5q0rcn5' /* Discover your perfect soundsca... */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'x1tse0rs' /* See all */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 150.4,
                                                                                                                      height: 163.1,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                      ),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 163.3,
                                                                                                                            height: 180.7,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.network(
                                                                                                                                  'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxtdXNpY3xlbnwwfHx8fDE3NjgxOTcxNjh8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                              child: Container(
                                                                                                                                height: 37.5,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: Color(0xCC1C2444),
                                                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Icon(
                                                                                                                                        Icons.play_arrow,
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        size: 16.0,
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          'd9fyoors' /* 20 minutes */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'WorkSans',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '4pm7vwtn' /* Forest Dawn */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'fw45exp8' /* 20 minutes */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
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
                                                                                                                controller: _model.columnController3,
                                                                                                                child: SingleChildScrollView(
                                                                                                                  primary: false,
                                                                                                                  controller: _model.columnController3,
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                '4n5ykgft' /* Find Your Mood */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                                    fontFamily: 'The Seasons',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'zob8rr9o' /* See all */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Expanded(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: 355.3,
                                                                                                                              height: 153.6,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                image: DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                  ).image,
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                              ),
                                                                                                                              child: Stack(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    child: Image.asset(
                                                                                                                                      'assets/images/Container_(4).png',
                                                                                                                                      width: 350.6,
                                                                                                                                      height: 200.0,
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsets.all(25.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Flexible(
                                                                                                                                          flex: 1,
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  '9tapzquj' /* Relax */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Flexible(
                                                                                                                                                flex: 1,
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                                      '0fis6f1c' /* Melt away stress with calming ... */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          fontFamily: 'WorkSans',
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                          fontSize: 14.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 48.3,
                                                                                                                                          height: 48.3,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            gradient: LinearGradient(
                                                                                                                                              colors: [
                                                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                                                                FlutterFlowTheme.of(context).secondary
                                                                                                                                              ],
                                                                                                                                              stops: [0.0, 1.0],
                                                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                                                            ),
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.chevron_right,
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Container(
                                                                                                                              width: 355.3,
                                                                                                                              height: 153.6,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                image: DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                  ).image,
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                              ),
                                                                                                                              child: Stack(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    child: Image.asset(
                                                                                                                                      'assets/images/Container_(10).png',
                                                                                                                                      width: 352.7,
                                                                                                                                      height: 200.0,
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsets.all(25.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Flexible(
                                                                                                                                          flex: 1,
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  'k5oz09t7' /* Energize */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Flexible(
                                                                                                                                                flex: 1,
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                                      'fw3cxm6s' /* Uplift your spirit with vibran... */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          fontFamily: 'WorkSans',
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                          fontSize: 14.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 48.33,
                                                                                                                                          height: 48.33,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            gradient: LinearGradient(
                                                                                                                                              colors: [
                                                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                                                                FlutterFlowTheme.of(context).secondary
                                                                                                                                              ],
                                                                                                                                              stops: [0.0, 1.0],
                                                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                                                            ),
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.chevron_right,
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(height: 12.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              KeepAliveWidgetWrapper(
                                                                                                builder: (context) => Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      flex: 1,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '4i2lwa02' /* Nature Sounds */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                            fontFamily: 'The Seasons',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'ic1lkpe0' /* Discover your perfect soundsca... */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'bsfpgy1d' /* See all */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 150.37,
                                                                                                                      height: 163.1,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                      ),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 163.3,
                                                                                                                            height: 180.7,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.network(
                                                                                                                                  'https://images.unsplash.com/photo-1421789665209-c9b2a435e3dc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxuYXR1cmV8ZW58MHx8fHwxNzY4MjM0NTY1fDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                              child: Container(
                                                                                                                                height: 37.53,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: Color(0xCC1C2444),
                                                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Icon(
                                                                                                                                        Icons.play_arrow,
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        size: 16.0,
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          'rnuagz8z' /* 20 minutes */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'WorkSans',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        's1nccqqt' /* Forest Dawn */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        's9jl2x0w' /* 20 minutes */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
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
                                                                                                                controller: _model.columnController4,
                                                                                                                child: SingleChildScrollView(
                                                                                                                  primary: false,
                                                                                                                  controller: _model.columnController4,
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'pjec176m' /* Find Your Mood */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                                    fontFamily: 'The Seasons',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'llpdb2a6' /* See all */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Flexible(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: 355.3,
                                                                                                                              height: 153.6,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                image: DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                  ).image,
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                              ),
                                                                                                                              child: Stack(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    child: Image.asset(
                                                                                                                                      'assets/images/Container_(10).png',
                                                                                                                                      width: 352.7,
                                                                                                                                      height: 200.0,
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsets.all(25.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Flexible(
                                                                                                                                          flex: 1,
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  '63b0v2wr' /* Energize */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Flexible(
                                                                                                                                                flex: 1,
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                                      'c1q7p73z' /* Uplift your spirit with vibran... */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          fontFamily: 'WorkSans',
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                          fontSize: 14.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 48.33,
                                                                                                                                          height: 48.33,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            gradient: LinearGradient(
                                                                                                                                              colors: [
                                                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                                                                FlutterFlowTheme.of(context).secondary
                                                                                                                                              ],
                                                                                                                                              stops: [0.0, 1.0],
                                                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                                                            ),
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.chevron_right,
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(height: 12.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              KeepAliveWidgetWrapper(
                                                                                                builder: (context) => Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      flex: 1,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'ew2yx6fv' /* Concentration Flow */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                            fontFamily: 'The Seasons',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'cm3tj9a4' /* Discover your perfect soundsca... */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'qi9rv37p' /* See all */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 155.2,
                                                                                                                      height: 135.51,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                      ),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 163.3,
                                                                                                                            height: 199.99,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.network(
                                                                                                                                  'https://images.unsplash.com/photo-1531870972494-627796a756dc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8Zm9jdXN8ZW58MHx8fHwxNzY4MjQwNjAxfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 20.0),
                                                                                                                              child: Container(
                                                                                                                                height: 37.5,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: Color(0xCC1C2444),
                                                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Icon(
                                                                                                                                        Icons.play_arrow,
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        size: 16.0,
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          '9a7q2uz5' /* 20 minutes */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'WorkSans',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'ykx7syw0' /* Forest Dawn */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'shrbluwl' /* 20 minutes */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
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
                                                                                                                controller: _model.columnController5,
                                                                                                                child: SingleChildScrollView(
                                                                                                                  primary: false,
                                                                                                                  controller: _model.columnController5,
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        flex: 1,
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'fdb650bv' /* Find Your Mood */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                                      fontFamily: 'The Seasons',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'of184fwd' /* See all */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'WorkSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 355.3,
                                                                                                                            height: 153.6,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.asset(
                                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                    width: 350.63,
                                                                                                                                    height: 200.0,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Flexible(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  'r4kmy9de' /* Relax */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                                    'ead84gyp' /* Melt away stress with calming ... */,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Container(
                                                                                                                                        width: 48.3,
                                                                                                                                        height: 48.3,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                            colors: [
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                            ],
                                                                                                                                            stops: [0.0, 1.0],
                                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                                          ),
                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                        ),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.chevron_right,
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            width: 355.3,
                                                                                                                            height: 153.6,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.cover,
                                                                                                                                image: Image.asset(
                                                                                                                                  'assets/images/Container_(4).png',
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/Container_(10).png',
                                                                                                                                    width: 352.7,
                                                                                                                                    height: 200.0,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsets.all(25.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Flexible(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  'hyfrzw3l' /* Energize */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Flexible(
                                                                                                                                              flex: 1,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                                    'gov7vn5t' /* Uplift your spirit with vibran... */,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Container(
                                                                                                                                        width: 48.33,
                                                                                                                                        height: 48.33,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                            colors: [
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                            ],
                                                                                                                                            stops: [0.0, 1.0],
                                                                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                                                                          ),
                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                        ),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.chevron_right,
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              KeepAliveWidgetWrapper(
                                                                                                builder: (context) => Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      flex: 1,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'a67eyh9s' /* Sleep Soundscapes */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                            fontFamily: 'The Seasons',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '9lflea4h' /* Discover your perfect soundsca... */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'khbcwvkr' /* See all */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 150.4,
                                                                                                                      height: 157.08,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        image: DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: Image.network(
                                                                                                                            'https://images.unsplash.com/photo-1585128719715-46776b56a0d1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxzbGVlcHxlbnwwfHx8fDE3NjgyNDA4MDR8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                                                                                          ).image,
                                                                                                                        ),
                                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                                      ),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                              child: Container(
                                                                                                                                height: 37.5,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: Color(0xCC1C2444),
                                                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Icon(
                                                                                                                                        Icons.play_arrow,
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                        size: 16.0,
                                                                                                                                      ),
                                                                                                                                      Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          '8a4p971k' /* 20 minutes */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              fontFamily: 'WorkSans',
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'vc3k9nlz' /* Forest Dawn */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'uwltvvui' /* 20 minutes */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            flex: 1,
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
                                                                                                                controller: _model.columnController6,
                                                                                                                child: SingleChildScrollView(
                                                                                                                  primary: false,
                                                                                                                  controller: _model.columnController6,
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'f6cnc2ro' /* Find Your Mood */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                                    fontFamily: 'The Seasons',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'dlf3ycl7' /* See all */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'WorkSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Expanded(
                                                                                                                        flex: 1,
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: 355.3,
                                                                                                                              height: 153.6,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                image: DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                  ).image,
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                              ),
                                                                                                                              child: Stack(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    child: Image.asset(
                                                                                                                                      'assets/images/Container_(4).png',
                                                                                                                                      width: 350.6,
                                                                                                                                      height: 200.0,
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsets.all(25.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Flexible(
                                                                                                                                          flex: 1,
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  'hutwaug4' /* Relax */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Flexible(
                                                                                                                                                flex: 1,
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                                      'l6fxqyqn' /* Melt away stress with calming ... */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          fontFamily: 'WorkSans',
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                          fontSize: 14.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 48.3,
                                                                                                                                          height: 48.3,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            gradient: LinearGradient(
                                                                                                                                              colors: [
                                                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                                                                FlutterFlowTheme.of(context).secondary
                                                                                                                                              ],
                                                                                                                                              stops: [0.0, 1.0],
                                                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                                                            ),
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.chevron_right,
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Container(
                                                                                                                              width: 355.3,
                                                                                                                              height: 153.6,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                image: DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: Image.asset(
                                                                                                                                    'assets/images/Container_(4).png',
                                                                                                                                  ).image,
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                              ),
                                                                                                                              child: Stack(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    child: Image.asset(
                                                                                                                                      'assets/images/Container_(10).png',
                                                                                                                                      width: 352.7,
                                                                                                                                      height: 200.0,
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsets.all(25.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Flexible(
                                                                                                                                          flex: 1,
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                                  '7a55aefo' /* Energize */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'WorkSans',
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                      fontSize: 24.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Flexible(
                                                                                                                                                flex: 1,
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                                      '8qrjo9z6' /* Uplift your spirit with vibran... */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          fontFamily: 'WorkSans',
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                          fontSize: 14.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 48.33,
                                                                                                                                          height: 48.33,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            gradient: LinearGradient(
                                                                                                                                              colors: [
                                                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                                                                FlutterFlowTheme.of(context).secondary
                                                                                                                                              ],
                                                                                                                                              stops: [0.0, 1.0],
                                                                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                                                                            ),
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.chevron_right,
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(height: 12.0)),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ).animateOnPageLoad(animationsMap['tabBarOnPageLoadAnimation']!),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
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
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Color(0x21000000)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: ScrollConfiguration(
                                              behavior: ScrollConfiguration.of(
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
                                                controller:
                                                    _model.columnController7,
                                                child: SingleChildScrollView(
                                                  controller:
                                                      _model.columnController7,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    40.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/Container_(12).png',
                                                              ).image,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Icon(
                                                                  FFIcons
                                                                      .kmarketplace,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 24.0,
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'iconOnPageLoadAnimation']!),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25.0,
                                                                            0.0,
                                                                            25.0,
                                                                            0.0),
                                                                    child:
                                                                        ScrollConfiguration(
                                                                      behavior:
                                                                          ScrollConfiguration.of(context)
                                                                              .copyWith(
                                                                        scrollbars:
                                                                            false,
                                                                        dragDevices: {
                                                                          PointerDeviceKind
                                                                              .mouse,
                                                                          PointerDeviceKind
                                                                              .touch,
                                                                          PointerDeviceKind
                                                                              .stylus,
                                                                          PointerDeviceKind
                                                                              .unknown,
                                                                        },
                                                                      ),
                                                                      child:
                                                                          Scrollbar(
                                                                        controller:
                                                                            _model.rowController,
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          controller:
                                                                              _model.rowController,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () {
                                                                                      print('Button pressed ...');
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '19xazzwl' /* For You */,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: Color(0xBFD0E3F7),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'WorkSans',
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      hoverColor: Color(0xFFD0E3F7),
                                                                                      hoverElevation: 5.0,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('COMMUNITY_HOME_F_I_N_A_L_MEDITATION_BTN_');
                                                                                      logFirebaseEvent('Button_page_view');
                                                                                      await _model.pageViewController?.animateToPage(
                                                                                        1,
                                                                                        duration: Duration(milliseconds: 500),
                                                                                        curve: Curves.ease,
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'em4h0o7b' /* Meditation */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      FFIcons.kbrain,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).alternate,
                                                                                      color: Color(0x00EDF1F7),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'WorkSans',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('COMMUNITY_HOME_F_I_N_A_L_Column_15e6mamu');
                                                                                  logFirebaseEvent('Column_page_view');
                                                                                  await _model.pageViewController?.animateToPage(
                                                                                    2,
                                                                                    duration: Duration(milliseconds: 500),
                                                                                    curve: Curves.ease,
                                                                                  );
                                                                                },
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '7vqucg1k' /* Body */,
                                                                                      ),
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.peace,
                                                                                        size: 15.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: FlutterFlowTheme.of(context).accent3,
                                                                                        color: Color(0x00EDF1F7),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'WorkSans',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('COMMUNITY_HOME_F_I_N_A_L_SOUNDSCAPES_BTN');
                                                                                      logFirebaseEvent('Button_page_view');
                                                                                      await _model.pageViewController?.animateToPage(
                                                                                        3,
                                                                                        duration: Duration(milliseconds: 500),
                                                                                        curve: Curves.ease,
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'ujqof96c' /* Soundscapes */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.music_note,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).tertiary,
                                                                                      color: Color(0x00EDF1F7),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'WorkSans',
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                            ].divide(SizedBox(width: 24.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .person_2_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 24.0,
                                                                ),
                                                              ],
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
