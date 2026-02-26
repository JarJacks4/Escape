import '/flutter_flow/flutter_flow_util.dart';
import 'youre_all_set_comp_widget.dart' show YoureAllSetCompWidget;
import 'package:flutter/material.dart';

class YoureAllSetCompModel extends FlutterFlowModel<YoureAllSetCompWidget> {
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
