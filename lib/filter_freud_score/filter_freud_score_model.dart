import '/components/filter_freud_score_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_freud_score_widget.dart' show FilterFreudScoreWidget;
import 'package:flutter/material.dart';

class FilterFreudScoreModel extends FlutterFlowModel<FilterFreudScoreWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FilterFreudScoreComponent component.
  late FilterFreudScoreComponentModel filterFreudScoreComponentModel;

  @override
  void initState(BuildContext context) {
    filterFreudScoreComponentModel =
        createModel(context, () => FilterFreudScoreComponentModel());
  }

  @override
  void dispose() {
    filterFreudScoreComponentModel.dispose();
  }
}
