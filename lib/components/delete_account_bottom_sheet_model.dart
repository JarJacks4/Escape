import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delete_account_bottom_sheet_widget.dart'
    show DeleteAccountBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DeleteAccountBottomSheetModel
    extends FlutterFlowModel<DeleteAccountBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  // Stores action output result for [Backend Call - API (Delete User Profile)] action in Button widget.
  ApiCallResponse? deleteUser;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
