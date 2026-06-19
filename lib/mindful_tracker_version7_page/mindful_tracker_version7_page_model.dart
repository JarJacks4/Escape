import '/components/mindful_tracker_version7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mindful_tracker_version7_page_widget.dart'
    show MindfulTrackerVersion7PageWidget;
import 'package:flutter/material.dart';

class MindfulTrackerVersion7PageModel
    extends FlutterFlowModel<MindfulTrackerVersion7PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MindfulTrackerVersion7 component.
  late MindfulTrackerVersion7Model mindfulTrackerVersion7Model;

  @override
  void initState(BuildContext context) {
    mindfulTrackerVersion7Model =
        createModel(context, () => MindfulTrackerVersion7Model());
  }

  @override
  void dispose() {
    mindfulTrackerVersion7Model.dispose();
  }
}
