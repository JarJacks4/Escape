import '/components/side_nav_widget.dart';
import '/components/sounds_comp/sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_main_sounds_widget.dart' show HeaderMainSoundsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HeaderMainSoundsModel extends FlutterFlowModel<HeaderMainSoundsWidget> {
  ///  State fields for stateful widgets in this component.

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
