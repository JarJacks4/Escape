import '/components/using_vibrationsounds_comp/using_vibrationsounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'increase_focus_f_i_n_a_l_widget.dart' show IncreaseFocusFINALWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IncreaseFocusFINALModel
    extends FlutterFlowModel<IncreaseFocusFINALWidget> {
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
