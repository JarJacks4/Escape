import '/components/coming_soon_body_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coming_soon_body_widget.dart' show ComingSoonBodyWidget;
import 'package:flutter/material.dart';

class ComingSoonBodyModel extends FlutterFlowModel<ComingSoonBodyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ComingSoonBodyComp component.
  late ComingSoonBodyCompModel comingSoonBodyCompModel;

  @override
  void initState(BuildContext context) {
    comingSoonBodyCompModel =
        createModel(context, () => ComingSoonBodyCompModel());
  }

  @override
  void dispose() {
    comingSoonBodyCompModel.dispose();
  }
}
