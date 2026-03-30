import '/components/coaching_session_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coaching_session_page_widget.dart' show CoachingSessionPageWidget;
import 'package:flutter/material.dart';

class CoachingSessionPageModel
    extends FlutterFlowModel<CoachingSessionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for coachingSession component.
  late CoachingSessionModel coachingSessionModel;

  @override
  void initState(BuildContext context) {
    coachingSessionModel = createModel(context, () => CoachingSessionModel());
  }

  @override
  void dispose() {
    coachingSessionModel.dispose();
  }
}
