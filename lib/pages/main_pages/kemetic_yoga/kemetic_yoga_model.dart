import '/components/kemetic_yoga_sounds_comp_f_i_n_a_l/kemetic_yoga_sounds_comp_f_i_n_a_l_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'kemetic_yoga_widget.dart' show KemeticYogaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KemeticYogaModel extends FlutterFlowModel<KemeticYogaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for KemeticYogaSoundsCompFINAL component.
  late KemeticYogaSoundsCompFINALModel kemeticYogaSoundsCompFINALModel;

  @override
  void initState(BuildContext context) {
    kemeticYogaSoundsCompFINALModel =
        createModel(context, () => KemeticYogaSoundsCompFINALModel());
  }

  @override
  void dispose() {
    kemeticYogaSoundsCompFINALModel.dispose();
  }
}
