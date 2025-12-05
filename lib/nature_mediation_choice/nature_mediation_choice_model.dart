import '/components/nature_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nature_mediation_choice_widget.dart' show NatureMediationChoiceWidget;
import 'package:flutter/material.dart';

class NatureMediationChoiceModel
    extends FlutterFlowModel<NatureMediationChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NatureChoiceComp component.
  late NatureChoiceCompModel natureChoiceCompModel;

  @override
  void initState(BuildContext context) {
    natureChoiceCompModel = createModel(context, () => NatureChoiceCompModel());
  }

  @override
  void dispose() {
    natureChoiceCompModel.dispose();
  }
}
