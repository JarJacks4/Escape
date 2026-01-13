import '/auth/firebase_auth/auth_util.dart';
import '/components/nav_bar_version5_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'a_i_soundscapes_copy_copy_model.dart';
export 'a_i_soundscapes_copy_copy_model.dart';

class AISoundscapesCopyCopyWidget extends StatefulWidget {
  const AISoundscapesCopyCopyWidget({
    super.key,
    String? meditationaudio,
  }) : this.meditationaudio = meditationaudio ??
            'https://www.youtube.com/watch?v=u3papaX85MA&list=PLyC3pcUWmqsTfH2-BQQ4PfuS7NjxcFa9v&index=4';

  final String meditationaudio;

  static String routeName = 'AISoundscapesCopyCopy';
  static String routePath = 'aISoundscapesCopyCopy';

  @override
  State<AISoundscapesCopyCopyWidget> createState() =>
      _AISoundscapesCopyCopyWidgetState();
}

class _AISoundscapesCopyCopyWidgetState
    extends State<AISoundscapesCopyCopyWidget> with TickerProviderStateMixin {
  late AISoundscapesCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AISoundscapesCopyCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AISoundscapesCopyCopy'});
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
                controller: _model.columnController1,
                child: SingleChildScrollView(
                  controller: _model.columnController1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: Hero(
                              tag: 'background',
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                                  width: 409.6,
                                  height: 876.8,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ),
                          Stack(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 872.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x43D0E3F7),
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsets.all(25.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e524z1dy' /* Good Morning */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'The Seasons',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Text(
                                                        currentUserDisplayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png',
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3gmitzgj' /* Quick Access */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'The Seasons',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment(-1.0, 0),
                                                    child:
                                                        FlutterFlowButtonTabBar(
                                                      useToggleButtonStyle:
                                                          false,
                                                      isScrollable: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'The Seasons',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      unselectedLabelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      labelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      unselectedLabelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      unselectedBackgroundColor:
                                                          Color(0xB3FFFFFF),
                                                      borderWidth: 2.0,
                                                      borderRadius: 30.0,
                                                      elevation: 0.0,
                                                      labelPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      buttonMargin:
                                                          EdgeInsets.all(10.0),
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  35.0,
                                                                  0.0),
                                                      tabs: [
                                                        Tab(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'a48kot20' /* All */,
                                                          ),
                                                        ),
                                                        Tab(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'roz5tg5t' /* Music Mediations */,
                                                          ),
                                                        ),
                                                        Tab(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '4pfrpoi9' /* Nature */,
                                                          ),
                                                        ),
                                                        Tab(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ijltxle4' /* Focus */,
                                                          ),
                                                        ),
                                                        Tab(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'outv5elj' /* Sleep */,
                                                          ),
                                                        ),
                                                      ],
                                                      controller: _model
                                                          .tabBarController,
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
                                                      controller: _model
                                                          .tabBarController,
                                                      children: [
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'laco00jk' /* Featured for You */,
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
                                                                                  'bb6eykv8' /* Discover your perfect soundsca... */,
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
                                                                              'ydesjd2y' /* See all */,
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
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                      'x058jif2' /* 20 minutes */,
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
                                                                                  '4v3gke6z' /* Forest Dawn */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ugvutklc' /* 20 minutes */,
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
                                                                      child:
                                                                          ScrollConfiguration(
                                                                        behavior:
                                                                            ScrollConfiguration.of(context).copyWith(
                                                                          scrollbars:
                                                                              false,
                                                                          dragDevices: {
                                                                            PointerDeviceKind.mouse,
                                                                            PointerDeviceKind.touch,
                                                                            PointerDeviceKind.stylus,
                                                                            PointerDeviceKind.unknown,
                                                                          },
                                                                        ),
                                                                        child:
                                                                            Scrollbar(
                                                                          controller:
                                                                              _model.columnController2,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            controller:
                                                                                _model.columnController2,
                                                                            child:
                                                                                Column(
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
                                                                                          'zlob3syi' /* Find Your Mood */,
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
                                                                                        'xgpq54q7' /* See all */,
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
                                                                                                          'v95be34r' /* Relax */,
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
                                                                                                              'rkb0bw8z' /* Melt away stress with calming ... */,
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
                                                                                                          'xcxkezgh' /* Focus */,
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
                                                                                                              '4g4vdkt2' /* Enhance concentration with 
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
                                                                                                          'v73uj5bg' /* Energize */,
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
                                                                                                              'ufl09re2' /* Uplift your spirit with vibran... */,
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
                                                                                                          'flniighr' /* Sleep */,
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
                                                                                                              '1bxw9v4u' /* Drift into peaceful slumber wi... */,
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
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'toowh382' /* Music For You */,
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
                                                                                  'hnl9962y' /* Discover your perfect soundsca... */,
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
                                                                              '5u9cy9rz' /* See all */,
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
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                    'yppkc4io' /* 20 minutes */,
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
                                                                                  'sezcnqzm' /* Forest Dawn */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '87mh1gax' /* 20 minutes */,
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
                                                                      child:
                                                                          ScrollConfiguration(
                                                                        behavior:
                                                                            ScrollConfiguration.of(context).copyWith(
                                                                          scrollbars:
                                                                              false,
                                                                          dragDevices: {
                                                                            PointerDeviceKind.mouse,
                                                                            PointerDeviceKind.touch,
                                                                            PointerDeviceKind.stylus,
                                                                            PointerDeviceKind.unknown,
                                                                          },
                                                                        ),
                                                                        child:
                                                                            Scrollbar(
                                                                          controller:
                                                                              _model.columnController3,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            controller:
                                                                                _model.columnController3,
                                                                            child:
                                                                                Column(
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
                                                                                          'hl0oeyhv' /* Find Your Mood */,
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
                                                                                        '7vbv2d52' /* See all */,
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
                                                                                                            '74k75a1x' /* Relax */,
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
                                                                                                                '87gj283k' /* Melt away stress with calming ... */,
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
                                                                                                            'e9qp74q4' /* Energize */,
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
                                                                                                                'y3m54cms' /* Uplift your spirit with vibran... */,
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
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '2scz676n' /* Nature Sounds */,
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
                                                                                  'z1m3sd5c' /* Discover your perfect soundsca... */,
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
                                                                              'ubd9ljos' /* See all */,
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
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                    'f0yi513s' /* 20 minutes */,
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
                                                                                  'tb1of93p' /* Forest Dawn */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'qhjuq6y0' /* 20 minutes */,
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
                                                                      child:
                                                                          ScrollConfiguration(
                                                                        behavior:
                                                                            ScrollConfiguration.of(context).copyWith(
                                                                          scrollbars:
                                                                              false,
                                                                          dragDevices: {
                                                                            PointerDeviceKind.mouse,
                                                                            PointerDeviceKind.touch,
                                                                            PointerDeviceKind.stylus,
                                                                            PointerDeviceKind.unknown,
                                                                          },
                                                                        ),
                                                                        child:
                                                                            Scrollbar(
                                                                          controller:
                                                                              _model.columnController4,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            controller:
                                                                                _model.columnController4,
                                                                            child:
                                                                                Column(
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
                                                                                          'mc93jczh' /* Find Your Mood */,
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
                                                                                        'edujl39z' /* See all */,
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
                                                                                                            'a5wwyrrp' /* Energize */,
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
                                                                                                                'dg4nqecz' /* Uplift your spirit with vibran... */,
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
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'y30bgwiu' /* Concentration Flow */,
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
                                                                                  'ktuxkza8' /* Discover your perfect soundsca... */,
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
                                                                              'vbtehk1b' /* See all */,
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
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                    '22j8m3s3' /* 20 minutes */,
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
                                                                                  '0lcn6pci' /* Forest Dawn */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'kyzav8td' /* 20 minutes */,
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
                                                                      child:
                                                                          ScrollConfiguration(
                                                                        behavior:
                                                                            ScrollConfiguration.of(context).copyWith(
                                                                          scrollbars:
                                                                              false,
                                                                          dragDevices: {
                                                                            PointerDeviceKind.mouse,
                                                                            PointerDeviceKind.touch,
                                                                            PointerDeviceKind.stylus,
                                                                            PointerDeviceKind.unknown,
                                                                          },
                                                                        ),
                                                                        child:
                                                                            Scrollbar(
                                                                          controller:
                                                                              _model.columnController5,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            controller:
                                                                                _model.columnController5,
                                                                            child:
                                                                                Column(
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
                                                                                            '33ciss33' /* Find Your Mood */,
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
                                                                                          '147wlcyf' /* See all */,
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
                                                                                                            'y4z758h7' /* Relax */,
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
                                                                                                              '5mssys0a' /* Melt away stress with calming ... */,
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
                                                                                                            'cpw1lh29' /* Energize */,
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
                                                                                                              'p3ew93u7' /* Uplift your spirit with vibran... */,
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
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        KeepAliveWidgetWrapper(
                                                          builder: (context) =>
                                                              Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '0pd4mmdz' /* Sleep Soundscapes */,
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
                                                                                  'f5kncud6' /* Discover your perfect soundsca... */,
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
                                                                              'ia0j34ig' /* See all */,
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
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                    'adskknqc' /* 20 minutes */,
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
                                                                                  'rp43bvzb' /* Forest Dawn */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  's9oklwgz' /* 20 minutes */,
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
                                                                      child:
                                                                          ScrollConfiguration(
                                                                        behavior:
                                                                            ScrollConfiguration.of(context).copyWith(
                                                                          scrollbars:
                                                                              false,
                                                                          dragDevices: {
                                                                            PointerDeviceKind.mouse,
                                                                            PointerDeviceKind.touch,
                                                                            PointerDeviceKind.stylus,
                                                                            PointerDeviceKind.unknown,
                                                                          },
                                                                        ),
                                                                        child:
                                                                            Scrollbar(
                                                                          controller:
                                                                              _model.columnController6,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            controller:
                                                                                _model.columnController6,
                                                                            child:
                                                                                Column(
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
                                                                                          'hbeu4qyz' /* Find Your Mood */,
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
                                                                                        'abo8nnaj' /* See all */,
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
                                                                                                            'f23s86la' /* Relax */,
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
                                                                                                                'brxted5n' /* Melt away stress with calming ... */,
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
                                                                                                            'nfrr9ill' /* Energize */,
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
                                                                                                                'quy4w2f8' /* Uplift your spirit with vibran... */,
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
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ).animateOnPageLoad(animationsMap[
                                                  'tabBarOnPageLoadAnimation']!),
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 400.8,
                    height: 89.25,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.navBarVersion5Model,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarVersion5Widget(),
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
