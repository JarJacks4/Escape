import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_suggestion_description_comp_widget.dart'
    show LucilleSuggestionDescriptionCompWidget;
import 'package:flutter/material.dart';

class LucilleSuggestionDescriptionCompModel
    extends FlutterFlowModel<LucilleSuggestionDescriptionCompWidget> {
  ///  Local state fields for this component.

  String? exerciseID;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    rowController = ScrollController();
  }

  @override
  void dispose() {
    rowController?.dispose();
  }
}
