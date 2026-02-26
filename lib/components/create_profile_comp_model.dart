import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_profile_comp_widget.dart' show CreateProfileCompWidget;
import 'package:flutter/material.dart';

class CreateProfileCompModel extends FlutterFlowModel<CreateProfileCompWidget> {
  ///  Local state fields for this component.

  String? profilePicture;

  bool isProfilePicture = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
