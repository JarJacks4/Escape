import '/components/header_main_meditation/header_main_meditation_widget.dart';
import '/components/tabbar_home_meditation/tabbar_home_meditation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_page_main_widget.dart' show MeditationPageMainWidget;
import 'package:flutter/material.dart';

class MeditationPageMainModel
    extends FlutterFlowModel<MeditationPageMainWidget> {
  ///  State fields for stateful widgets in this page.

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
    headerMainMeditationModel.dispose();
    tabbarHomeMeditationModel.dispose();
  }
}
