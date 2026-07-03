import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'new_sign_in_version5_widget.dart' show NewSignInVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class NewSignInVersion5Model extends FlutterFlowModel<NewSignInVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  AudioPlayer? soundPlayer1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for LoginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  String? _loginEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LoginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  String? _loginPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  AudioPlayer? soundPlayer2;
  // Stores action output result for [Custom Action - getIdToken] action in Button widget.
  String? userToken;
  // Stores action output result for [Backend Call - API (User Complete Profile)] action in Button widget.
  ApiCallResponse? passToken;
  AudioPlayer? soundPlayer3;
  // Stores action output result for [Custom Action - getIdToken] action in Button widget.
  String? userToken34;
  // Stores action output result for [Backend Call - API (User Complete Profile)] action in Button widget.
  ApiCallResponse? passToken3;
  AudioPlayer? soundPlayer4;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateLogin23;
  // Stores action output result for [Custom Action - getIdToken] action in Button widget.
  String? userToken2;
  AudioPlayer? soundPlayer5;
  // State field(s) for DisplayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  String? _displayNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zysh7arm' /* Name is required */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for CreateEmail widget.
  FocusNode? createEmailFocusNode;
  TextEditingController? createEmailTextController;
  String? Function(BuildContext, String?)? createEmailTextControllerValidator;
  String? _createEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bz20g5w7' /* Enter your email is required */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for CreatePassword widget.
  FocusNode? createPasswordFocusNode;
  TextEditingController? createPasswordTextController;
  late bool createPasswordVisibility;
  String? Function(BuildContext, String?)?
      createPasswordTextControllerValidator;
  String? _createPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p20013c1' /* Create a password is required */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }

    return null;
  }

  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zoe5nh6b' /* Confirm your password is requi... */,
      );
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }

    return null;
  }

  // State field(s) for LowerChakraMoods widget.
  FormFieldController<List<String>>? lowerChakraMoodsValueController;
  String? get lowerChakraMoodsValue =>
      lowerChakraMoodsValueController?.value?.firstOrNull;
  set lowerChakraMoodsValue(String? val) =>
      lowerChakraMoodsValueController?.value = val != null ? [val] : [];
  // State field(s) for MiddleChakraMoods widget.
  FormFieldController<List<String>>? middleChakraMoodsValueController;
  String? get middleChakraMoodsValue =>
      middleChakraMoodsValueController?.value?.firstOrNull;
  set middleChakraMoodsValue(String? val) =>
      middleChakraMoodsValueController?.value = val != null ? [val] : [];
  // State field(s) for HigherChakraMoods widget.
  FormFieldController<List<String>>? higherChakraMoodsValueController;
  String? get higherChakraMoodsValue =>
      higherChakraMoodsValueController?.value?.firstOrNull;
  set higherChakraMoodsValue(String? val) =>
      higherChakraMoodsValueController?.value = val != null ? [val] : [];
  // State field(s) for CrownChakraMoods widget.
  FormFieldController<List<String>>? crownChakraMoodsValueController;
  String? get crownChakraMoodsValue =>
      crownChakraMoodsValueController?.value?.firstOrNull;
  set crownChakraMoodsValue(String? val) =>
      crownChakraMoodsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Validate Form] action in Button widget.
  bool? createAccountValidation;
  AudioPlayer? soundPlayer6;
  // Stores action output result for [Custom Action - getIdToken] action in Button widget.
  String? userToken45;
  // Stores action output result for [Backend Call - API (Onboarding User)] action in Button widget.
  ApiCallResponse? passToken2;
  AudioPlayer? soundPlayer7;

  @override
  void initState(BuildContext context) {
    loginEmailTextControllerValidator = _loginEmailTextControllerValidator;
    loginPasswordVisibility = false;
    loginPasswordTextControllerValidator =
        _loginPasswordTextControllerValidator;
    displayNameTextControllerValidator = _displayNameTextControllerValidator;
    createEmailTextControllerValidator = _createEmailTextControllerValidator;
    createPasswordVisibility = false;
    createPasswordTextControllerValidator =
        _createPasswordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordTextController?.dispose();

    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    createEmailFocusNode?.dispose();
    createEmailTextController?.dispose();

    createPasswordFocusNode?.dispose();
    createPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
