import '/components/beginners_yoga_comp/beginners_yoga_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'beginners_yoga_widget.dart' show BeginnersYogaWidget;
import 'package:flutter/material.dart';

class BeginnersYogaModel extends FlutterFlowModel<BeginnersYogaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BeginnersYogaComp component.
  late BeginnersYogaCompModel beginnersYogaCompModel;

  @override
  void initState(BuildContext context) {
    beginnersYogaCompModel =
        createModel(context, () => BeginnersYogaCompModel());
  }

  @override
  void dispose() {
    beginnersYogaCompModel.dispose();
  }
}
