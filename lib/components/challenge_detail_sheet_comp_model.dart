import '/flutter_flow/flutter_flow_util.dart';
import 'challenge_detail_sheet_comp_widget.dart'
    show ChallengeDetailSheetCompWidget;
import 'package:flutter/material.dart';

class ChallengeDetailSheetCompModel
    extends FlutterFlowModel<ChallengeDetailSheetCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
