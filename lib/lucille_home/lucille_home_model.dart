import '/components/lucille_home_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_home_widget.dart' show LucilleHomeWidget;
import 'package:flutter/material.dart';

class LucilleHomeModel extends FlutterFlowModel<LucilleHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LucilleHomeVersion5 component.
  late LucilleHomeVersion5Model lucilleHomeVersion5Model;

  @override
  void initState(BuildContext context) {
    lucilleHomeVersion5Model =
        createModel(context, () => LucilleHomeVersion5Model());
  }

  @override
  void dispose() {
    lucilleHomeVersion5Model.dispose();
  }
}
