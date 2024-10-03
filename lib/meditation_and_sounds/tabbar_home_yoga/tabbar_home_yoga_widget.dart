import '/components/beginners_yoga_comp/beginners_yoga_comp_widget.dart';
import '/components/grounding_videos/grounding_videos_widget.dart';
import '/components/pilates_videos_comp/pilates_videos_comp_widget.dart';
import '/components/tai_chi_videos_comp/tai_chi_videos_comp_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tabbar_home_yoga_model.dart';
export 'tabbar_home_yoga_model.dart';

class TabbarHomeYogaWidget extends StatefulWidget {
  const TabbarHomeYogaWidget({super.key});

  @override
  State<TabbarHomeYogaWidget> createState() => _TabbarHomeYogaWidgetState();
}

class _TabbarHomeYogaWidgetState extends State<TabbarHomeYogaWidget>
    with TickerProviderStateMixin {
  late TabbarHomeYogaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabbarHomeYogaModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        desktop: false,
      ),
      child: Align(
        alignment: const AlignmentDirectional(-1.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          child: Column(
            children: [
              Align(
                alignment: const Alignment(-1.0, 0),
                child: FlutterFlowButtonTabBar(
                  useToggleButtonStyle: false,
                  isScrollable: true,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                  unselectedLabelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                  labelColor: Colors.white,
                  unselectedLabelColor: FlutterFlowTheme.of(context).primary,
                  backgroundColor: const Color(0xFF2082A2),
                  unselectedBackgroundColor: const Color(0xFFA0A3B1),
                  borderColor: const Color(0x00FFFFFF),
                  unselectedBorderColor: const Color(0x00FFFFFF),
                  borderWidth: 0.0,
                  borderRadius: 10.0,
                  elevation: 5.0,
                  labelPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  buttonMargin:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'vwdrovo6' /* All */,
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.alignLeft,
                        size: 40.0,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '2em0l24e' /* Yoga */,
                      ),
                      icon: const Icon(
                        Icons.spa,
                        size: 40.0,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        's6bssogi' /* Pilates */,
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.solidSmileBeam,
                        size: 40.0,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '34x8o9b5' /* Tai Chi */,
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.yinYang,
                        size: 40.0,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '5pzabn9d' /* Grounding */,
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.medrt,
                        size: 40.0,
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 10.0, 0.0),
                            child: MasonryGridView.builder(
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 11.0,
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return [
                                  () => Material(
                                        color: Colors.transparent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: 88.0,
                                          height: 271.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://images.unsplash.com/photo-1549576490-b0b4831ef60a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHx5b2dhJTIwY2xhc3N8ZW58MHx8fHwxNzA5Nzg1NTIzfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                              ).image,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                                spreadRadius: 2.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
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
                                                          'TABBAR_HOME_YOGA_Container_8y2pd8b1_ON_T');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'BeginnersYoga',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 195.0,
                                                      height: 69.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xBE84468E),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  11.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '2ppotz15' /* Beginner's
Guide */
                                                              ,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                        ),
                                      ),
                                  () => Material(
                                        color: Colors.transparent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: 88.0,
                                          height: 183.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://images.unsplash.com/photo-1512291313931-d4291048e7b6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHx5b2dhJTIwY2hhbGxlbmdlfGVufDB8fHx8MTcwOTc4NTU1MHww&ixlib=rb-4.0.3&q=80&w=1080',
                                              ).image,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                                spreadRadius: 2.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
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
                                                          'TABBAR_HOME_YOGA_Container_w48ns2bp_ON_T');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'HelpAnxiety',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 166.0,
                                                      height: 69.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xBE84468E),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fd9w4b1o' /* Help
Anxiety */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                  () => Material(
                                        color: Colors.transparent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Container(
                                          width: 88.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://images.unsplash.com/photo-1562679299-d21b8e13ac09?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8ZWd5cHQlMjB8ZW58MHx8fHwxNzI1NTU0MDAwfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                              ).image,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                                spreadRadius: 2.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(11.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
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
                                                            'TABBAR_HOME_YOGA_Container_9qhg0yc3_ON_T');
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

                                                        context.pushNamed(
                                                          'KemeticYoga',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xBE84468E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      11.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'bhcxsiry' /* Kemetic Yoga */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                        ),
                                      ),
                                  () => Material(
                                        color: Colors.transparent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: 88.0,
                                          height: 243.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHx5b2dhfGVufDB8fHx8MTcwOTEzMjIyNHww&ixlib=rb-4.0.3&q=80&w=1080',
                                              ).image,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                                spreadRadius: 2.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
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
                                                          'TABBAR_HOME_YOGA_Container_p0lf548e_ON_T');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'YogaPoseVideos',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 166.0,
                                                      height: 69.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xBE84468E),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6bjyvt1j' /* Yoga Poses */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                ][index]();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.beginnersYogaCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const BeginnersYogaCompWidget(),
                    ),
                    wrapWithModel(
                      model: _model.pilatesVideosCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const PilatesVideosCompWidget(),
                    ),
                    wrapWithModel(
                      model: _model.taiChiVideosCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const TaiChiVideosCompWidget(),
                    ),
                    wrapWithModel(
                      model: _model.groundingVideosModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const GroundingVideosWidget(),
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
