import '/components/basic_breathing_page_comp_widget.dart';
import '/components/before_bed_breathing_comp_widget.dart';
import '/components/calm_breathing_comp_widget.dart';
import '/components/deep_breathing_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breathing_choice_page_model.dart';
export 'breathing_choice_page_model.dart';

class BreathingChoicePageWidget extends StatefulWidget {
  const BreathingChoicePageWidget({super.key});

  @override
  State<BreathingChoicePageWidget> createState() =>
      _BreathingChoicePageWidgetState();
}

class _BreathingChoicePageWidgetState extends State<BreathingChoicePageWidget> {
  late BreathingChoicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreathingChoicePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BreathingChoicePage'});
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
                                'zn52k72p' /* Breathing */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'The Seasons',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
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

                                context.pushNamed('HomeVersion2');
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
                        model: _model.basicBreathingPageCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BasicBreathingPageCompWidget(),
                      ),
                      wrapWithModel(
                        model: _model.beforeBedBreathingCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BeforeBedBreathingCompWidget(),
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
            ],
          ),
        ),
      ),
    );
  }
}
