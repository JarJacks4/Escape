import '/components/freud_score_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'freud_score_page_widget.dart' show FreudScorePageWidget;
import 'package:flutter/material.dart';

class FreudScorePageModel extends FlutterFlowModel<FreudScorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FreudScore component.
  late FreudScoreModel freudScoreModel;

  @override
  void initState(BuildContext context) {
    freudScoreModel = createModel(context, () => FreudScoreModel());
  }

  @override
  void dispose() {
    freudScoreModel.dispose();
  }
}
