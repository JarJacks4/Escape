import '/components/header_main_meditation/header_main_meditation_widget.dart';
import '/components/tabbar_home_meditation/tabbar_home_meditation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_page_main_widget.dart' show MeditationPageMainWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class MeditationPageMainModel
    extends FlutterFlowModel<MeditationPageMainWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? meditationWalkthroughController;
  // Model for HeaderMainMeditation component.
  late HeaderMainMeditationModel headerMainMeditationModel;
  // Model for tabbarHomeMeditation component.
  late TabbarHomeMeditationModel tabbarHomeMeditationModel;

  @override
  void initState(BuildContext context) {
    headerMainMeditationModel =
        createModel(context, () => HeaderMainMeditationModel());
    tabbarHomeMeditationModel =
        createModel(context, () => TabbarHomeMeditationModel());
  }

  @override
  void dispose() {
    meditationWalkthroughController?.finish();
    headerMainMeditationModel.dispose();
    tabbarHomeMeditationModel.dispose();
  }
}
