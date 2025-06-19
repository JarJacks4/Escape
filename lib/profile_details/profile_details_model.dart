import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_details_widget.dart' show ProfileDetailsWidget;
import 'package:flutter/material.dart';

class ProfileDetailsModel extends FlutterFlowModel<ProfileDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
