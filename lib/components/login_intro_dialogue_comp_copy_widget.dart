import '/components/intro_walkthrough1_widget.dart';
import '/components/intro_walkthrough2_widget.dart';
import '/components/intro_walkthrough3_widget.dart';
import '/components/intro_walkthrough4_widget.dart';
import '/components/intro_walkthrough5_widget.dart';
import '/components/intro_walkthrough6_widget.dart';
import '/components/intro_walkthrough7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_intro_dialogue_comp_copy_model.dart';
export 'login_intro_dialogue_comp_copy_model.dart';

/// New Component Gen
class LoginIntroDialogueCompCopyWidget extends StatefulWidget {
  const LoginIntroDialogueCompCopyWidget({super.key});

  @override
  State<LoginIntroDialogueCompCopyWidget> createState() =>
      _LoginIntroDialogueCompCopyWidgetState();
}

class _LoginIntroDialogueCompCopyWidgetState
    extends State<LoginIntroDialogueCompCopyWidget> {
  late LoginIntroDialogueCompCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginIntroDialogueCompCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 80.0,
                color: Color(0xB2EDF1F7),
                offset: Offset(
                  2.0,
                  2.0,
                ),
                spreadRadius: 3.0,
              )
            ],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            width: double.infinity,
            height: 412.09,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 548.94,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          wrapWithModel(
                            model: _model.introWalkthrough1Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough1Widget(),
                          ),
                          wrapWithModel(
                            model: _model.introWalkthrough2Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough2Widget(
                              parameter1:
                                  _model.pageViewCurrentIndex.toString(),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.introWalkthrough3Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough3Widget(
                              parameter1:
                                  _model.pageViewCurrentIndex.toString(),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.introWalkthrough4Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough4Widget(
                              parameter1:
                                  _model.pageViewCurrentIndex.toString(),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.introWalkthrough5Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough5Widget(
                              parameter1:
                                  _model.pageViewCurrentIndex.toString(),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.introWalkthrough6Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough6Widget(
                              parameter1:
                                  _model.pageViewCurrentIndex.toString(),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.introWalkthrough7Model,
                            updateCallback: () => safeSetState(() {}),
                            child: IntroWalkthrough7Widget(
                              parameter1:
                                  _model.pageViewCurrentIndex.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 7,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 8.0,
                            radius: 8.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            dotColor: Color(0x4C1C2444),
                            activeDotColor:
                                FlutterFlowTheme.of(context).accent1,
                            paintStyle: PaintingStyle.stroke,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
