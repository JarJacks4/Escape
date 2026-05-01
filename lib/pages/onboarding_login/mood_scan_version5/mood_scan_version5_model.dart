import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_scan_version5_widget.dart' show MoodScanVersion5Widget;
import 'package:flutter/material.dart';

class MoodScanVersion5Model extends FlutterFlowModel<MoodScanVersion5Widget> {
  ///  Local state fields for this page.

  String? profilePicture;

  bool interests = false;

  String? mood;

  bool? isScanLoading = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_mdPhoto = false;
  FFUploadedFile uploadedLocalFile_mdPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_mdPhoto = '';

  // Stores action output result for [Backend Call - API (Lucille Chat Main)] action in Button widget.
  ApiCallResponse? moodScan;
  // Stores action output result for [Backend Call - API (Lucille Chat Main)] action in Button widget.
  ApiCallResponse? stressLevel;
  // Stores action output result for [Backend Call - API (Lucille Chat Main)] action in Button widget.
  ApiCallResponse? energyScan;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
