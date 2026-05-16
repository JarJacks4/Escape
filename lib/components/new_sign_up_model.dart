import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import '/new_sign_in_version5/new_sign_in_version5_widget.dart' show NewSignInVersion5Widget;import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/backend/api_requests/api_calls.dart'
    as that_audio_player_oo85ab_api_calls_util;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_palette/material_palette.dart';
import 'package:provider/provider.dart';

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
  AudioPlayer? soundPlayer3;
  // Stores action output result for [Backend Call - API (CreateID)] action in Button widget.
  ApiCallResponse? createIDForLogin;
  // Stores action output result for [Backend Call - API (Validate Session)] action in Button widget.
  ApiCallResponse? validateSession;
  AudioPlayer? soundPlayer4;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateLogin23;
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
