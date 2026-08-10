import '/flutter_flow/flutter_flow_util.dart';
import 'soundscapes_details_widget.dart' show SoundscapesDetailsWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundscapesDetailsModel
    extends FlutterFlowModel<SoundscapesDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  AudioPlayer? soundPlayer1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  AudioPlayer? soundPlayer2;
  // State field(s) for Row widget.
  ScrollController? rowController3;
  // State field(s) for Row widget.
  ScrollController? rowController4;
  AudioPlayer? soundPlayer3;
  // State field(s) for Row widget.
  ScrollController? rowController5;
  AudioPlayer? soundPlayer4;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    rowController3 = ScrollController();
    rowController4 = ScrollController();
    rowController5 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    rowController1?.dispose();
    rowController2?.dispose();
    rowController3?.dispose();
    rowController4?.dispose();
    rowController5?.dispose();
  }
}
