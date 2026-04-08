import '/components/intro_walkthrough1_widget.dart';
import '/components/intro_walkthrough2_widget.dart';
import '/components/intro_walkthrough3_widget.dart';
import '/components/intro_walkthrough4_widget.dart';
import '/components/intro_walkthrough5_widget.dart';
import '/components/intro_walkthrough6_widget.dart';
import '/components/intro_walkthrough7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_intro_dialogue_comp_copy_widget.dart'
    show LoginIntroDialogueCompCopyWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginIntroDialogueCompCopyModel
    extends FlutterFlowModel<LoginIntroDialogueCompCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for IntroWalkthrough1 component.
  late IntroWalkthrough1Model introWalkthrough1Model;
  // Model for IntroWalkthrough2 component.
  late IntroWalkthrough2Model introWalkthrough2Model;
  // Model for IntroWalkthrough3 component.
  late IntroWalkthrough3Model introWalkthrough3Model;
  // Model for IntroWalkthrough4 component.
  late IntroWalkthrough4Model introWalkthrough4Model;
  // Model for IntroWalkthrough5 component.
  late IntroWalkthrough5Model introWalkthrough5Model;
  // Model for IntroWalkthrough6 component.
  late IntroWalkthrough6Model introWalkthrough6Model;
  // Model for IntroWalkthrough7 component.
  late IntroWalkthrough7Model introWalkthrough7Model;

  @override
  void initState(BuildContext context) {
    introWalkthrough1Model =
        createModel(context, () => IntroWalkthrough1Model());
    introWalkthrough2Model =
        createModel(context, () => IntroWalkthrough2Model());
    introWalkthrough3Model =
        createModel(context, () => IntroWalkthrough3Model());
    introWalkthrough4Model =
        createModel(context, () => IntroWalkthrough4Model());
    introWalkthrough5Model =
        createModel(context, () => IntroWalkthrough5Model());
    introWalkthrough6Model =
        createModel(context, () => IntroWalkthrough6Model());
    introWalkthrough7Model =
        createModel(context, () => IntroWalkthrough7Model());
  }

  @override
  void dispose() {
    introWalkthrough1Model.dispose();
    introWalkthrough2Model.dispose();
    introWalkthrough3Model.dispose();
    introWalkthrough4Model.dispose();
    introWalkthrough5Model.dispose();
    introWalkthrough6Model.dispose();
    introWalkthrough7Model.dispose();
  }
}
