import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_i_soundscapes_copy_copy_copy_widget.dart'
    show AISoundscapesCopyCopyCopyWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AISoundscapesCopyCopyCopyModel
    extends FlutterFlowModel<AISoundscapesCopyCopyCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  AudioPlayer? soundPlayer4;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  AudioPlayer? soundPlayer13;
  AudioPlayer? soundPlayer14;
  // State field(s) for Column widget.
  ScrollController? columnController7;
  AudioPlayer? soundPlayer15;
  AudioPlayer? soundPlayer16;
  AudioPlayer? soundPlayer17;
  AudioPlayer? soundPlayer18;
  // State field(s) for Column widget.
  ScrollController? columnController8;
  AudioPlayer? soundPlayer19;
  AudioPlayer? soundPlayer20;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    columnController7 = ScrollController();
    columnController8 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    tabBarController?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    columnController7?.dispose();
    columnController8?.dispose();
  }
}
