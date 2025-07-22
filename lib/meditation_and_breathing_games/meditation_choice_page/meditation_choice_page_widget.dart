import '/components/basic_breathing_page_comp_widget.dart';
import '/components/box_breathing_meditation_card_f_i_n_a_l_widget.dart';
import '/components/microcosmic_orbit_meditation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'meditation_choice_page_model.dart';
export 'meditation_choice_page_model.dart';

class MeditationChoicePageWidget extends StatefulWidget {
  const MeditationChoicePageWidget({super.key});

  static String routeName = 'MeditationChoicePage';
  static String routePath = '/meditationChoicePage';

  @override
  State<MeditationChoicePageWidget> createState() =>
      _MeditationChoicePageWidgetState();
}

class _MeditationChoicePageWidgetState
    extends State<MeditationChoicePageWidget> {
  late MeditationChoicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationChoicePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationChoicePage'});
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
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: 100.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'iduya9gb' /* Meditate */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'The Seasons',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                120.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MEDITATION_CHOICE_Image_301rti3m_ON_TAP');
                                logFirebaseEvent('Image_navigate_to');

                                context.pushNamed(HomeVersion4Widget.routeName);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Logo_ESCAPE_DarkBlue.png',
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.352,
                                  height: 156.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 671.7,
                        child: CarouselSlider(
                          items: [
                            wrapWithModel(
                              model:
                                  _model.boxBreathingMeditationCardFINALModel,
                              updateCallback: () => safeSetState(() {}),
                              child: Hero(
                                tag: 'meditationCard',
                                transitionOnUserGestures: true,
                                child: Material(
                                  color: Colors.transparent,
                                  child:
                                      BoxBreathingMeditationCardFINALWidget(),
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.basicBreathingPageCompModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BasicBreathingPageCompWidget(),
                            ),
                            wrapWithModel(
                              model: _model.microcosmicOrbitMeditationModel,
                              updateCallback: () => safeSetState(() {}),
                              child: MicrocosmicOrbitMeditationWidget(),
                            ),
                          ],
                          carouselController: _model.carouselController ??=
                              CarouselSliderController(),
                          options: CarouselOptions(
                            initialPage: 1,
                            viewportFraction: 0.8,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.25,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: false,
                            onPageChanged: (index, _) =>
                                _model.carouselCurrentIndex = index,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MEDITATION_CHOICE_BACK_TO_HOME_BTN_ON_TA');
                          logFirebaseEvent('Button_navigate_back');
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'dmluj1rq' /* Back to Home */,
                        ),
                        icon: Icon(
                          Icons.arrow_back,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 24.0))
                      .addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
