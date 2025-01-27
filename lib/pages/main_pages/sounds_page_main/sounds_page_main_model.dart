import '/components/sounds_comp/sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sounds_page_main_widget.dart' show SoundsPageMainWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoundsPageMainModel extends FlutterFlowModel<SoundsPageMainWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SoundsComp component.
  late SoundsCompModel soundsCompModel;

  @override
  void initState(BuildContext context) {
    soundsCompModel = createModel(context, () => SoundsCompModel());
  }

  @override
  void dispose() {
    soundsCompModel.dispose();
  }
}
