import '/components/fire_nature_meditation_widget.dart';
import '/components/thunderstorms_nature_meditation_widget.dart';
import '/components/waterfalls_nature_meditation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nature_choice_comp_model.dart';
export 'nature_choice_comp_model.dart';

class NatureChoiceCompWidget extends StatefulWidget {
  const NatureChoiceCompWidget({super.key});

  @override
  State<NatureChoiceCompWidget> createState() => _NatureChoiceCompWidgetState();
}

class _NatureChoiceCompWidgetState extends State<NatureChoiceCompWidget>
    with TickerProviderStateMixin {
  late NatureChoiceCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NatureChoiceCompModel());

    animationsMap.addAll({
      'waterfallsNatureMeditationOnPageLoadAnimation': AnimationInfo(
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
      height: 839.07,
      decoration: BoxDecoration(
        color: Color(0x5BD0E3F7),
      ),
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
                          model: _model.fireNatureMeditationModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FireNatureMeditationWidget(),
                        ),
                        wrapWithModel(
                          model: _model.waterfallsNatureMeditationModel,
                          updateCallback: () => safeSetState(() {}),
                          child: WaterfallsNatureMeditationWidget(),
                        ).animateOnPageLoad(animationsMap[
                            'waterfallsNatureMeditationOnPageLoadAnimation']!),
                        wrapWithModel(
                          model: _model.thunderstormsNatureMeditationModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ThunderstormsNatureMeditationWidget(),
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
                      logFirebaseEvent('NATURE_CHOICE_BACK_TO_HOME_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'v3z8j5u2' /* Back to Home */,
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
    );
  }
}
