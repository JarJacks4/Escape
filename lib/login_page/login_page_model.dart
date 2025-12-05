import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for emailAddress widget.
  final emailAddressKey = GlobalKey();
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? emailAddressSelectedOption;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iv0rdxd0' /* Email Address is required */,
      );
    }
    if (val != emailAddressSelectedOption) {
      return FFLocalizations.of(context).getText(
        '57nh9imm' /* Please enter the correct email... */,
      );
    }
    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'wqhq82ir' /* 8 */,
      );
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't2u6f37c' /* Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'a1k99req' /* 8 */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'rti5iv7z' /* 20 */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button-Login widget.
  bool? validateLogin;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    columnController1?.dispose();
    tabBarController?.dispose();
    columnController2?.dispose();
    emailAddressFocusNode?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
