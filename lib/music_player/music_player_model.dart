import '/flutter_flow/flutter_flow_util.dart';
import 'music_player_widget.dart' show MusicPlayerWidget;
import 'package:flutter/material.dart';

class MusicPlayerModel extends FlutterFlowModel<MusicPlayerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
  }
}
