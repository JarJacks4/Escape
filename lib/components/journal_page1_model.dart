import '/flutter_flow/flutter_flow_util.dart';
import 'journal_page1_widget.dart' show JournalPage1Widget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class JournalPage1Model extends FlutterFlowModel<JournalPage1Widget> {
  ///  State fields for stateful widgets in this component.

  AudioRecorder? audioRecorder;
  String? personalThoughts;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
