import '/components/mood_slider_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_scan_version5_widget.dart' show MoodScanVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MoodScanVersion5Model extends FlutterFlowModel<MoodScanVersion5Widget> {
  ///  Local state fields for this page.

  String? profilePicture;

  bool interests = false;

  String? mood;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer1;
  bool isDataUploading_mdPhoto = false;
  FFUploadedFile uploadedLocalFile_mdPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_mdPhoto = '';

  // Stores action output result for [AI Agent - Send Message to LucilleMoodAnalyzerAgent] action in Button widget.
  String? aIMoodAnalyzeAction;
  // Model for MoodSliderComponent component.
  late MoodSliderComponentModel moodSliderComponentModel;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {
    moodSliderComponentModel =
        createModel(context, () => MoodSliderComponentModel());
  }

  @override
  void dispose() {
    moodSliderComponentModel.dispose();
  }
}
