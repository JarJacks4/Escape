import '/components/meditation_sounds_list/meditation_sounds_list_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tabbar_home_model.dart';
export 'tabbar_home_model.dart';

class TabbarHomeWidget extends StatefulWidget {
  const TabbarHomeWidget({super.key});

  @override
  State<TabbarHomeWidget> createState() => _TabbarHomeWidgetState();
}

class _TabbarHomeWidgetState extends State<TabbarHomeWidget>
    with TickerProviderStateMixin {
  late TabbarHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabbarHomeModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 15,
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
                      fontFamily: 'WorkSans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
                unselectedLabelStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'WorkSans',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
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
                      'iumvt9n4' /* All */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.alignLeft,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '3ufmn5om' /* Anxiety */,
                    ),
                    icon: Icon(
                      Icons.electric_bolt_sharp,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'czlfvmzx' /* Kids */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.babyCarriage,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'hdfy77sq' /* Sleep */,
                    ),
                    icon: Icon(
                      Icons.bed,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'pk32goul' /* Metaphysical */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.atom,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'znokofks' /* Embrace Love */,
                    ),
                    icon: Icon(
                      Icons.favorite,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'b85t02ok' /* Vocalization */,
                    ),
                    icon: Icon(
                      Icons.record_voice_over_outlined,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'dmjho5zy' /* Grounding */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.medrt,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      's4jxxxu4' /* Faith */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.prayingHands,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '2mzigygs' /* Perception */,
                    ),
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'bcl976bn' /* Growth */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.arrowUp,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'rmwopa2y' /* Mindset */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.brain,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      's3qhfy7v' /* Spirituality */,
                    ),
                    icon: Icon(
                      Icons.rowing,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'iur5kuh7' /* Numerology */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.sortNumericUp,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'q61nd4wd' /* Uplift */,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                    child: MasonryGridView.builder(
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      crossAxisSpacing: 9.0,
                      mainAxisSpacing: 8.0,
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return [
                          () => Material(
                                color: Colors.transparent,
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: 88.0,
                                  height: 239.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        'https://images.unsplash.com/photo-1593811167562-9cef47bfc4d7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxtZWRpdGF0aW9uJTIwdGVhY2hlcnxlbnwwfHx8fDE3MDkxNDczMzZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 194.0,
                                          height: 69.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xC9040404),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1fz6i9au' /* How to Meditate */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
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
                                  borderRadius: BorderRadius.circular(11.0),
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
                                        'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxqb3VybmV5fGVufDB8fHx8MTcwOTEzNTYxMHww&ixlib=rb-4.0.3&q=80&w=1080',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 200.0,
                                          height: 69.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xC9040404),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lqdf0u7x' /* 7 Days of Calm */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
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
                                  borderRadius: BorderRadius.circular(15.0),
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
                                        'https://images.unsplash.com/photo-1627827961200-cb3197e1e0b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8dmlicmF0aW9ufGVufDB8fHx8MTcwOTE0NzQ5MHww&ixlib=rb-4.0.3&q=80&w=1080',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 196.0,
                                          height: 69.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xC9040404),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'q6f2kv1g' /* How to Use Vibration */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: 88.0,
                                  height: 204.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        'https://images.unsplash.com/photo-1573412930091-cc65eb8f537d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxyZWR1Y2luZyUyMGFueGlldHl8ZW58MHx8fHwxNzA5MTQ3MzkxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 196.0,
                                          height: 69.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xC9040404),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  's4qrhptq' /* Reduce Anxiety */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
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
                  wrapWithModel(
                    model: _model.meditationSoundsListModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MeditationSoundsListWidget(),
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
