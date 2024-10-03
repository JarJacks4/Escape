import '/flutter_flow/flutter_flow_util.dart';
import '/meditation_and_sounds/header_home/header_home_widget.dart';
import '/meditation_and_sounds/home_comp/home_comp_widget.dart';
import 'new_home_widget.dart' show NewHomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class NewHomeModel extends FlutterFlowModel<NewHomeWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? introWalkthroughController;
  // Model for HeaderHome component.
  late HeaderHomeModel headerHomeModel;
  // Model for HomeComp component.
  late HomeCompModel homeCompModel;

  @override
  void initState(BuildContext context) {
    headerHomeModel = createModel(context, () => HeaderHomeModel());
    homeCompModel = createModel(context, () => HomeCompModel());
  }

  @override
  void dispose() {
    introWalkthroughController?.finish();
    headerHomeModel.dispose();
    homeCompModel.dispose();
  }
}
