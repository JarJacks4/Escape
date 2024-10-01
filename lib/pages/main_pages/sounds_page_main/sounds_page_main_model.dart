import '/components/sounds_comp/sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/headers/header_main_sounds/header_main_sounds_widget.dart';
import 'sounds_page_main_widget.dart' show SoundsPageMainWidget;
import 'package:flutter/material.dart';

class SoundsPageMainModel extends FlutterFlowModel<SoundsPageMainWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderMainSounds component.
  late HeaderMainSoundsModel headerMainSoundsModel;
  // Model for SoundsComp component.
  late SoundsCompModel soundsCompModel;

  @override
  void initState(BuildContext context) {
    headerMainSoundsModel = createModel(context, () => HeaderMainSoundsModel());
    soundsCompModel = createModel(context, () => SoundsCompModel());
  }

  @override
  void dispose() {
    headerMainSoundsModel.dispose();
    soundsCompModel.dispose();
  }
}
