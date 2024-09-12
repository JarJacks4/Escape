import '/components/staggered_view_affirmations/staggered_view_affirmations_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tabbar_home_affirmations_model.dart';
export 'tabbar_home_affirmations_model.dart';

class TabbarHomeAffirmationsWidget extends StatefulWidget {
  const TabbarHomeAffirmationsWidget({super.key});

  @override
  State<TabbarHomeAffirmationsWidget> createState() =>
      _TabbarHomeAffirmationsWidgetState();
}

class _TabbarHomeAffirmationsWidgetState
    extends State<TabbarHomeAffirmationsWidget> with TickerProviderStateMixin {
  late TabbarHomeAffirmationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabbarHomeAffirmationsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 12,
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
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment(-1.0, 0),
              child: FlutterFlowButtonTabBar(
                useToggleButtonStyle: false,
                isScrollable: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                unselectedLabelStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                labelColor: Colors.white,
                unselectedLabelColor: FlutterFlowTheme.of(context).primary,
                backgroundColor: Color(0xFF2082A2),
                unselectedBackgroundColor: Color(0xFFA0A3B1),
                borderColor: Color(0x00FFFFFF),
                unselectedBorderColor: Color(0x00FFFFFF),
                borderWidth: 0.0,
                borderRadius: 10.0,
                elevation: 5.0,
                labelPadding:
                    EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                buttonMargin:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                tabs: [
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'z65mpf7i' /* All */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.alignLeft,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '8q9bwptp' /* Anxiety */,
                    ),
                    icon: Icon(
                      Icons.electric_bolt_sharp,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '5b3s2s7r' /* Kids */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.babyCarriage,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'xc6td5ep' /* Sleep */,
                    ),
                    icon: Icon(
                      Icons.bed,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'g29ync2r' /* Embrace Love */,
                    ),
                    icon: Icon(
                      Icons.favorite,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'ocx5xyv6' /* Grounding */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.medrt,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'lzayyzx4' /* Faith */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.prayingHands,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'cwqevyt9' /* Perception */,
                    ),
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'y4i0x5du' /* Growth */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.arrowUp,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'd9k06uwa' /* Mindset */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.brain,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '53r2wlkj' /* Spirituality */,
                    ),
                    icon: Icon(
                      Icons.rowing,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '3bfinern' /* Uplift */,
                    ),
                    icon: Icon(
                      Icons.hail,
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
                    () async {},
                    () async {},
                    () async {},
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: 157.0,
                                child: Stack(
                                  children: [
                                    PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                            'assets/images/bannerx.png',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Image.network(
                                          'https://picsum.photos/seed/828/600',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                        Image.network(
                                          'https://picsum.photos/seed/976/600',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(initialPage: 0),
                                          count: 3,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            safeSetState(() {});
                                          },
                                          effect:
                                              smooth_page_indicator.SlideEffect(
                                            spacing: 8.0,
                                            radius: 16.0,
                                            dotWidth: 8.0,
                                            dotHeight: 8.0,
                                            dotColor: Color(0xFF9E9E9E),
                                            activeDotColor: Color(0xFF3F51B5),
                                            paintStyle: PaintingStyle.fill,
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 22.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.staggeredViewAffirmationsModel,
                            updateCallback: () => safeSetState(() {}),
                            child: StaggeredViewAffirmationsWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
