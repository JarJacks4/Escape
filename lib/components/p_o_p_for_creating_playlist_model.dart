import '/flutter_flow/flutter_flow_util.dart';
import 'p_o_p_for_creating_playlist_widget.dart'
    show POPForCreatingPlaylistWidget;
import 'package:flutter/material.dart';

class POPForCreatingPlaylistModel
    extends FlutterFlowModel<POPForCreatingPlaylistWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
