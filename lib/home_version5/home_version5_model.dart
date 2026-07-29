import '/backend/api_requests/api_calls.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_version5_widget.dart' show HomeVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeVersion5Model extends FlutterFlowModel<HomeVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  // Stores action output result for [Backend Call - API (User Complete Profile)] action in HomeVersion5 widget.
  ApiCallResponse? usersCompleteProfile4;
  // Stores action output result for [Backend Call - API (CreateID)] action in HomeVersion5 widget.
  ApiCallResponse? createSession;
  // Stores action output result for [Backend Call - API (Update User Profile)] action in HomeVersion5 widget.
  ApiCallResponse? usersCompleteProfile;
  // Stores action output result for [Backend Call - API (Recommended Exercises)] action in HomeVersion5 widget.
  ApiCallResponse? recommendedExercises;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  // State field(s) for Row widget.
  ScrollController? rowController;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  AudioPlayer? soundPlayer10;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  AudioPlayer? soundPlayer13;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    listViewController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    rowController?.dispose();
  }
}
