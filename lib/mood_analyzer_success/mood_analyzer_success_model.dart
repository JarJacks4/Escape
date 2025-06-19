import '/components/mood_analyzer_success_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'mood_analyzer_success_widget.dart' show MoodAnalyzerSuccessWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoodAnalyzerSuccessModel
    extends FlutterFlowModel<MoodAnalyzerSuccessWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoodAnalyzerSuccessComp component.
  late MoodAnalyzerSuccessCompModel moodAnalyzerSuccessCompModel;

  @override
  void initState(BuildContext context) {
    moodAnalyzerSuccessCompModel =
        createModel(context, () => MoodAnalyzerSuccessCompModel());
  }

  @override
  void dispose() {
    moodAnalyzerSuccessCompModel.dispose();
  }
}
