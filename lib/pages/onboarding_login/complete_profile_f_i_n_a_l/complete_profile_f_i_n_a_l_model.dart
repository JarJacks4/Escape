import '/components/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'complete_profile_f_i_n_a_l_widget.dart' show CompleteProfileFINALWidget;
import 'package:flutter/material.dart';

class CompleteProfileFINALModel
    extends FlutterFlowModel<CompleteProfileFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for primaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for RoleDrowdown widget.
  String? roleDrowdownValue;
  FormFieldController<String>? roleDrowdownValueController;
  // State field(s) for PlanDropdown widget.
  String? planDropdownValue;
  FormFieldController<String>? planDropdownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Model for primaryButton component.
  late PrimaryButtonModel primaryButtonModel2;

  @override
  void initState(BuildContext context) {
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    primaryButtonModel1.dispose();
    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    primaryButtonModel2.dispose();
  }
}
