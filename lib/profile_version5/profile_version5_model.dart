import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_version5_widget.dart' show ProfileVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ProfileVersion5Model extends FlutterFlowModel<ProfileVersion5Widget> {
  ///  Local state fields for this page.

  String? newProfilePic;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer1;
  bool isDataUploading_uploadDataTyq8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTyq8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTyq8 = '';

  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
