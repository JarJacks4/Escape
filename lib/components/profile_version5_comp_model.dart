import '/flutter_flow/flutter_flow_util.dart';
import 'profile_version5_comp_widget.dart' show ProfileVersion5CompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ProfileVersion5CompModel
    extends FlutterFlowModel<ProfileVersion5CompWidget> {
  ///  Local state fields for this component.

  String? newProfilePicture;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  bool isDataUploading_uploadDataTyq = false;
  FFUploadedFile uploadedLocalFile_uploadDataTyq =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTyq = '';

  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
