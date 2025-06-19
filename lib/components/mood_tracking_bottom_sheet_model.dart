import '/flutter_flow/flutter_flow_util.dart';
import 'mood_tracking_bottom_sheet_widget.dart'
    show MoodTrackingBottomSheetWidget;
import 'package:flutter/material.dart';

class MoodTrackingBottomSheetModel
    extends FlutterFlowModel<MoodTrackingBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? moodDeepFeelingsTextResponseBarCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
