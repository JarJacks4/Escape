import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_version5_widget.dart' show EditProfileVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EditProfileVersion5Model
    extends FlutterFlowModel<EditProfileVersion5Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  bool isDataUploading_uploadPhoto3 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto3 = '';

  AudioPlayer? soundPlayer3;
  bool isDataUploading_uploadPhoto2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uu8y5ifl' /* Display Name is required */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 33) {
      return 'Maximum 33 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  AudioPlayer? soundPlayer4;
  // State field(s) for EditEmail widget.
  FocusNode? editEmailFocusNode;
  TextEditingController? editEmailTextController;
  String? Function(BuildContext, String?)? editEmailTextControllerValidator;
  String? _editEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bdmg7pdi' /* Email is required */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 22) {
      return 'Maximum 22 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  AudioPlayer? soundPlayer5;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't95fgmtz' /* Password is required */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 22) {
      return 'Maximum 22 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  AudioPlayer? soundPlayer6;
  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  AudioPlayer? soundPlayer7;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  AudioPlayer? soundPlayer8;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  AudioPlayer? soundPlayer9;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  AudioPlayer? soundPlayer10;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateEditProfile2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    textController1Validator = _textController1Validator;
    editEmailTextControllerValidator = _editEmailTextControllerValidator;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    editEmailFocusNode?.dispose();
    editEmailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
