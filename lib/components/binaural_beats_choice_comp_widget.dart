import '/components/a_d_h_d_binaural_beats_widget.dart';
import '/components/binaural_beats_anxiety_relief_widget.dart';
import '/components/nature_sounds_page_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'binaural_beats_choice_comp_model.dart';
export 'binaural_beats_choice_comp_model.dart';

class BinauralBeatsChoiceCompWidget extends StatefulWidget {
  const BinauralBeatsChoiceCompWidget({super.key});

  @override
  State<BinauralBeatsChoiceCompWidget> createState() =>
      _BinauralBeatsChoiceCompWidgetState();
}

class _BinauralBeatsChoiceCompWidgetState
    extends State<BinauralBeatsChoiceCompWidget> with TickerProviderStateMixin {
  late BinauralBeatsChoiceCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BinauralBeatsChoiceCompModel());

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
      height: 770.9,
      decoration: BoxDecoration(
        color: Color(0x60D0E3F7),
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
                          model: _model.natureSoundsPageCompModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NatureSoundsPageCompWidget(),
                        ),
                        wrapWithModel(
                          model: _model.binauralBeatsAnxietyReliefModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BinauralBeatsAnxietyReliefWidget(),
                        ),
                        wrapWithModel(
                          model: _model.aDHDBinauralBeatsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ADHDBinauralBeatsWidget(),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'BINAURAL_BEATS_CHOICE_BACK_TO_HOME_BTN_O');
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'qlch4iv7' /* Back to Home */,
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
