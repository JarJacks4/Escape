import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'display_name_f_i_n_a_l_widget.dart' show DisplayNameFINALWidget;
import 'package:flutter/material.dart';

class DisplayNameFINALModel extends FlutterFlowModel<DisplayNameFINALWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ek3z10p9' /* Display Name is required */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateDisplayName;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
