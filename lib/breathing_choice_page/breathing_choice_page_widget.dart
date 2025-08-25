import '/components/before_bed_breathing_comp_widget.dart';
import '/components/calm_breathing_comp_widget.dart';
import '/components/deep_breathing_comp_widget.dart';
import '/components/long_breathe_meditation_f_i_n_a_l_widget.dart';
import '/components/short_breathe_meditation_f_i_n_a_l_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'breathing_choice_page_model.dart';
export 'breathing_choice_page_model.dart';

class BreathingChoicePageWidget extends StatefulWidget {
  const BreathingChoicePageWidget({super.key});

  static String routeName = 'BreathingChoicePage';
  static String routePath = 'breathingChoicePage';

  @override
  State<BreathingChoicePageWidget> createState() =>
      _BreathingChoicePageWidgetState();
}

class _BreathingChoicePageWidgetState extends State<BreathingChoicePageWidget>
    with TickerProviderStateMixin {
  late BreathingChoicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreathingChoicePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BreathingChoicePage'});
    animationsMap.addAll({
      'carouselOnPageLoadAnimation': AnimationInfo(
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
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zn52k72p' /* Breathing */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'The Seasons',
                                        fontSize: 22.0,
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
                                        'BREATHING_CHOICE_Image_iw49a95u_ON_TAP');
                                    logFirebaseEvent('Image_navigate_to');

                                    context.pushNamed(
                                        HomeVersion4Widget.routeName);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Logo_ESCAPE_DarkBlue.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.352,
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
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                ),
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 700.0,
                  child: CarouselSlider(
                    items: [
                      wrapWithModel(
                        model: _model.deepBreathingCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DeepBreathingCompWidget(),
                      ),
                      wrapWithModel(
                        model: _model.calmBreathingCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CalmBreathingCompWidget(),
                      ),
                      wrapWithModel(
                        model: _model.longBreatheMeditationFINALModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LongBreatheMeditationFINALWidget(),
                      ),
                      wrapWithModel(
                        model: _model.beforeBedBreathingCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BeforeBedBreathingCompWidget(),
                      ),
                      wrapWithModel(
                        model: _model.shortBreatheMeditationFINALModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ShortBreatheMeditationFINALWidget(),
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
                ).animateOnPageLoad(
                    animationsMap['carouselOnPageLoadAnimation']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 8.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'BREATHING_CHOICE_BACK_TO_HOME_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_back');
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    '36ip72fp' /* Back to Home */,
                  ),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).alternate,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(30.0),
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
