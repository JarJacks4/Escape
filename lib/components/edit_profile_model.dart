import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadPhoto1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto1 = '';

  // State field(s) for NewDisplayName widget.
  FocusNode? newDisplayNameFocusNode;
  TextEditingController? newDisplayNameTextController;
  String? Function(BuildContext, String?)?
      newDisplayNameTextControllerValidator;
  String? _newDisplayNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wuecrh0d' /* Your New Display Name is requi... */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 60) {
      return 'Maximum 60 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for NewEmail widget.
  FocusNode? newEmailFocusNode;
  TextEditingController? newEmailTextController;
  String? Function(BuildContext, String?)? newEmailTextControllerValidator;
  String? _newEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r0swkki9' /* Your Email is required */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 60) {
      return 'Maximum 60 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'csb99zv7' /* Your New Password is required */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
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
        'tn0eyg3v' /* Confirm Your New Password Here... */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateEditProfile;

  @override
  void initState(BuildContext context) {
    newDisplayNameTextControllerValidator =
        _newDisplayNameTextControllerValidator;
    newEmailTextControllerValidator = _newEmailTextControllerValidator;
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    newDisplayNameFocusNode?.dispose();
    newDisplayNameTextController?.dispose();

    newEmailFocusNode?.dispose();
    newEmailTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
