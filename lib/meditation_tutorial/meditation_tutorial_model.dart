import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'meditation_tutorial_widget.dart' show MeditationTutorialWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeditationTutorialModel
    extends FlutterFlowModel<MeditationTutorialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MeditationHelpComp component.
  late MeditationHelpCompModel meditationHelpCompModel;

  @override
  void initState(BuildContext context) {
    meditationHelpCompModel =
        createModel(context, () => MeditationHelpCompModel());
  }

  @override
  void dispose() {
    meditationHelpCompModel.dispose();
  }
}
