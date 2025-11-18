import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'destinations_unreal_engine_widget.dart'
    show DestinationsUnrealEngineWidget;
import 'package:flutter/material.dart';

class DestinationsUnrealEngineModel
    extends FlutterFlowModel<DestinationsUnrealEngineWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}
