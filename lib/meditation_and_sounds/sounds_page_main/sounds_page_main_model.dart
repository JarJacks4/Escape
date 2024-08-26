import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/headers/header_main_sounds/header_main_sounds_widget.dart';
import 'dart:ui';
import 'sounds_page_main_widget.dart' show SoundsPageMainWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoundsPageMainModel extends FlutterFlowModel<SoundsPageMainWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderMainSounds component.
  late HeaderMainSoundsModel headerMainSoundsModel;

  @override
  void initState(BuildContext context) {
    headerMainSoundsModel = createModel(context, () => HeaderMainSoundsModel());
  }

  @override
  void dispose() {
    headerMainSoundsModel.dispose();
  }
}
