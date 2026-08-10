import '/flutter_flow/flutter_flow_util.dart';
import 'soundscapes_playlists_widget.dart' show SoundscapesPlaylistsWidget;
import 'package:flutter/material.dart';

class SoundscapesPlaylistsModel
    extends FlutterFlowModel<SoundscapesPlaylistsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for Column widget.
  ScrollController? columnController2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    rowController = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    rowController?.dispose();
    columnController2?.dispose();
  }
}
