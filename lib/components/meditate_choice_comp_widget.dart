import '/components/basic_breathing_page_comp_widget.dart';
import '/components/box_breathing_meditation_card_f_i_n_a_l_widget.dart';
import '/components/microcosmic_orbit_meditation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'meditate_choice_comp_model.dart';
export 'meditate_choice_comp_model.dart';

class MeditateChoiceCompWidget extends StatefulWidget {
  const MeditateChoiceCompWidget({super.key});

  @override
  State<MeditateChoiceCompWidget> createState() =>
      _MeditateChoiceCompWidgetState();
}

class _MeditateChoiceCompWidgetState extends State<MeditateChoiceCompWidget> {
  late MeditateChoiceCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditateChoiceCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 810.4,
      decoration: BoxDecoration(),
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
                          model: _model.boxBreathingMeditationCardFINALModel,
                          updateCallback: () => safeSetState(() {}),
                          child: Hero(
                            tag: 'meditationCard',
                            transitionOnUserGestures: true,
                            child: Material(
                              color: Colors.transparent,
                              child: BoxBreathingMeditationCardFINALWidget(),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.basicBreathingPageCompModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: Hero(
                            tag: 'choice',
                            transitionOnUserGestures: true,
                            child: Material(
                              color: Colors.transparent,
                              child: BasicBreathingPageCompWidget(),
                            ),
                          ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'MEDITATE_CHOICE_BACK_TO_HOME_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      '53t55odi' /* Back to Home */,
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
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
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
    );
  }
}
