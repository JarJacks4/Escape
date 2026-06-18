import '/components/deep_sleep_meditation_widget.dart';
import '/components/insomnia_meditation_comp_widget.dart';
import '/components/nap_meditation_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sleep_choice_comp_model.dart';
export 'sleep_choice_comp_model.dart';

class SleepChoiceCompWidget extends StatefulWidget {
  const SleepChoiceCompWidget({super.key});

  @override
  State<SleepChoiceCompWidget> createState() => _SleepChoiceCompWidgetState();
}

class _SleepChoiceCompWidgetState extends State<SleepChoiceCompWidget> {
  late SleepChoiceCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepChoiceCompModel());
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
      height: 789.17,
      decoration: BoxDecoration(
        color: Color(0x44EDF1F7),
      ),
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
                    model: _model.deepSleepMeditationModel,
                    updateCallback: () => safeSetState(() {}),
                    child: DeepSleepMeditationWidget(),
                  ),
                  wrapWithModel(
                    model: _model.napMeditationCompModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NapMeditationCompWidget(),
                  ),
                  wrapWithModel(
                    model: _model.insomniaMeditationCompModel,
                    updateCallback: () => safeSetState(() {}),
                    child: InsomniaMeditationCompWidget(),
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
                logFirebaseEvent('SLEEP_CHOICE_BACK_TO_HOME_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
              },
              text: FFLocalizations.of(context).getText(
                'dph0xluv' /* Back to Home */,
              ),
              icon: Icon(
                Icons.arrow_back,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ].addToStart(SizedBox(height: 24.0)).addToEnd(SizedBox(height: 24.0)),
      ),
    );
  }
}
