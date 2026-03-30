import '/components/mood_result_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_result_page_widget.dart' show MoodResultPageWidget;
import 'package:flutter/material.dart';

class MoodResultPageModel extends FlutterFlowModel<MoodResultPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodResultComponent component.
  late MoodResultComponentModel moodResultComponentModel;

  @override
  void initState(BuildContext context) {
    moodResultComponentModel =
        createModel(context, () => MoodResultComponentModel());
  }

  @override
  void dispose() {
    moodResultComponentModel.dispose();
  }
}
