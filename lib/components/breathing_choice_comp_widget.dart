import '/components/before_bed_breathing_comp_widget.dart';
import '/components/calm_breathing_comp_widget.dart';
import '/components/deep_breathing_comp_widget.dart';
import '/components/long_breathe_meditation_f_i_n_a_l_widget.dart';
import '/components/short_breathe_meditation_f_i_n_a_l_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'breathing_choice_comp_model.dart';
export 'breathing_choice_comp_model.dart';

class BreathingChoiceCompWidget extends StatefulWidget {
  const BreathingChoiceCompWidget({super.key});

  @override
  State<BreathingChoiceCompWidget> createState() =>
      _BreathingChoiceCompWidgetState();
}

class _BreathingChoiceCompWidgetState extends State<BreathingChoiceCompWidget>
    with TickerProviderStateMixin {
  late BreathingChoiceCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreathingChoiceCompModel());

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
            ).animateOnPageLoad(animationsMap['carouselOnPageLoadAnimation']!),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('BREATHING_CHOICE_BACK_TO_HOME_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
              },
              text: FFLocalizations.of(context).getText(
                'rfrdzkly' /* Back to Home */,
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
    );
  }
}
