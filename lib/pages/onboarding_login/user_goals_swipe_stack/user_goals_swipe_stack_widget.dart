import '/components/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'user_goals_swipe_stack_model.dart';
export 'user_goals_swipe_stack_model.dart';

class UserGoalsSwipeStackWidget extends StatefulWidget {
  const UserGoalsSwipeStackWidget({super.key});

  @override
  State<UserGoalsSwipeStackWidget> createState() =>
      _UserGoalsSwipeStackWidgetState();
}

class _UserGoalsSwipeStackWidgetState extends State<UserGoalsSwipeStackWidget> {
  late UserGoalsSwipeStackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserGoalsSwipeStackModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UserGoalsSwipeStack'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'r4pfdw58' /* What's your goal? */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                              lineHeight: 1.5,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 15.0, 24.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rvgb019l' /* It will help us categorize con... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyLargeFamily),
                                lineHeight: 1.5,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowSwipeableStack(
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) {},
                          onRightSwipe: (index) async {
                            logFirebaseEvent(
                                'USER_GOALS_SWIPE_STACK_SwipeableStack_3j');
                            logFirebaseEvent('SwipeableStack_navigate_to');

                            context.goNamed(
                              'registrationSuccess',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 400),
                                ),
                              },
                            );
                          },
                          onUpSwipe: (index) {},
                          onDownSwipe: (index) {},
                          itemBuilder: (context, index) {
                            return [
                              () => Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        child: Container(
                                          width: 350.0,
                                          height: 500.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                                const Color(0xFFFFFF00)
                                              ],
                                              stops: const [0.2, 1.0],
                                              begin: const AlignmentDirectional(
                                                  -1.0, 0.85),
                                              end: const AlignmentDirectional(
                                                  1.0, -0.85),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Lottie.asset(
                                                      'assets/jsons/Animation_-_1708911023036.json',
                                                      width: 315.0,
                                                      height: 206.0,
                                                      fit: BoxFit.contain,
                                                      animate: true,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'b9q0tihn' /* Improve Mindset */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    SizedBox(
                                                      width: 50.0,
                                                      child: Divider(
                                                        height: 1.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ouhesfjy' /* I want to build my mindset */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                      ),
                                    ),
                                  ),
                              () => Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      child: Container(
                                        width: 350.0,
                                        height: 500.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              const Color(0xFFDF4ADF),
                                              FlutterFlowTheme.of(context)
                                                  .secondary
                                            ],
                                            stops: const [0.0, 1.0],
                                            begin: const AlignmentDirectional(
                                                -1.0, 0.85),
                                            end: const AlignmentDirectional(
                                                1.0, -0.85),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SizedBox(
                                                    width: 50.0,
                                                    child: Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Lottie
                                                                    .asset(
                                                                  'assets/jsons/Animation_-_1708910547293.json',
                                                                  width: 396.0,
                                                                  height: 217.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  animate: true,
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
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cy3ikwvx' /* Get Therapy */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'z7ht8qhj' /* I want to add learn muscle in ... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              () => Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      child: Container(
                                        width: 350.0,
                                        height: 500.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.red,
                                              Color(0xFFFFFF00)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                -1.0, 0.85),
                                            end: AlignmentDirectional(
                                                1.0, -0.85),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/jsons/Animation_-_1708909449328_(1).json',
                                                  width: 246.0,
                                                  height: 212.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'l0ta50sl' /* Community */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: Colors.white,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.0,
                                                    child: Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'lipvzfm4' /* I am here to meet my soul trib... */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                    ),
                                  ),
                              () => Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      child: Container(
                                        width: 350.0,
                                        height: 560.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondary
                                            ],
                                            stops: const [0.0, 1.0],
                                            begin: const AlignmentDirectional(
                                                -1.0, 0.85),
                                            end: const AlignmentDirectional(
                                                1.0, -0.85),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/jsons/Animation_-_1708910114414.json',
                                                  width: 246.0,
                                                  height: 248.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'weqtjr7f' /* Meditation and Rest */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.0,
                                                    child: Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '681telz4' /* I am here to meditate and find... */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                    ),
                                  ),
                              () => Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      child: Container(
                                        width: 350.0,
                                        height: 500.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              const Color(0xFF444F8C),
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                              const Color(0xFF405990)
                                            ],
                                            stops: const [0.0, 0.4, 1.0],
                                            begin: const AlignmentDirectional(
                                                -1.0, 0.85),
                                            end: const AlignmentDirectional(
                                                1.0, -0.85),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/jsons/Animation_-_1708909671341.json',
                                                  width: 246.0,
                                                  height: 212.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kt0o1q8y' /* Life Change */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.0,
                                                    child: Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3vb892tk' /* I am here to transform my life */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                    ),
                                  ),
                            ][index]();
                          },
                          itemCount: 5,
                          controller: _model.swipeableStackController,
                          loop: false,
                          cardDisplayCount: 5,
                          scale: 0.9,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'USER_GOALS_SWIPE_STACK_Container_jm3pnic');
                            logFirebaseEvent('primaryButton_navigate_to');

                            context.goNamed(
                              'registrationSuccess',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 400),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.primaryButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const PrimaryButtonWidget(
                              buttonText: 'Confirm',
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
      ),
    );
  }
}
