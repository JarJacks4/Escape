import '/components/using_vibrationsounds_comp/using_vibrationsounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'using_vibration_widget.dart' show UsingVibrationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UsingVibrationModel extends FlutterFlowModel<UsingVibrationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UsingVibrationsoundsComp component.
  late UsingVibrationsoundsCompModel usingVibrationsoundsCompModel;

  @override
  void initState(BuildContext context) {
    usingVibrationsoundsCompModel =
        createModel(context, () => UsingVibrationsoundsCompModel());
  }

  @override
  void dispose() {
    usingVibrationsoundsCompModel.dispose();
  }
}
