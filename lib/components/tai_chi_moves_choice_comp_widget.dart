import '/components/before_bed_breathing_comp_widget.dart';
import '/components/short_breathe_meditation_f_i_n_a_l_widget.dart';
import '/components/tai_chi_fair_lady_works_at_shuttle_comp_widget.dart';
import '/components/tai_chi_wild_horses_mane_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tai_chi_moves_choice_comp_model.dart';
export 'tai_chi_moves_choice_comp_model.dart';

class TaiChiMovesChoiceCompWidget extends StatefulWidget {
  const TaiChiMovesChoiceCompWidget({super.key});

  @override
  State<TaiChiMovesChoiceCompWidget> createState() =>
      _TaiChiMovesChoiceCompWidgetState();
}

class _TaiChiMovesChoiceCompWidgetState
    extends State<TaiChiMovesChoiceCompWidget> with TickerProviderStateMixin {
  late TaiChiMovesChoiceCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaiChiMovesChoiceCompModel());

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
      height: 805.1,
      decoration: BoxDecoration(
        color: Color(0x4FD0E3F7),
      ),
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
                    model: _model.taiChiWildHorsesManeCompModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TaiChiWildHorsesManeCompWidget(),
                  ),
                  wrapWithModel(
                    model: _model.taiChiFairLadyWorksAtShuttleCompModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TaiChiFairLadyWorksAtShuttleCompWidget(),
                  ),
                  Container(),
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
            ).animateOnPageLoad(animationsMap['carouselOnPageLoadAnimation']!),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('TAI_CHI_MOVES_CHOICE_BACK_TO_HOME_BTN_ON');
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
              },
              text: FFLocalizations.of(context).getText(
                'z94554fg' /* Back to Home */,
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
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).accent3,
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
        ],
      ),
    );
  }
}
