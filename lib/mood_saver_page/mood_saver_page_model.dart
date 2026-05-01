import '/components/mood_saver_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_saver_page_widget.dart' show MoodSaverPageWidget;
import 'package:flutter/material.dart';

class MoodSaverPageModel extends FlutterFlowModel<MoodSaverPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for moodSaverComponent component.
  late MoodSaverComponentModel moodSaverComponentModel;

  @override
  void initState(BuildContext context) {
    moodSaverComponentModel =
        createModel(context, () => MoodSaverComponentModel());
  }

  @override
  void dispose() {
    moodSaverComponentModel.dispose();
  }
}
