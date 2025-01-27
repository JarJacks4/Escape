import '/auth/firebase_auth/auth_util.dart';
import '/components/mood_track_result_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'mood_track_home_widget.dart' show MoodTrackHomeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoodTrackHomeModel extends FlutterFlowModel<MoodTrackHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodTrackResultComponent component.
  late MoodTrackResultComponentModel moodTrackResultComponentModel;

  @override
  void initState(BuildContext context) {
    moodTrackResultComponentModel =
        createModel(context, () => MoodTrackResultComponentModel());
  }

  @override
  void dispose() {
    moodTrackResultComponentModel.dispose();
  }
}
