import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'add_tab_bar_widget.dart' show AddTabBarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTabBarModel extends FlutterFlowModel<AddTabBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VideosCollectionRecord? submitVideoUpload;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VideosCollectionRecord? submitContentUpload;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode1;
  TextEditingController? myBioTextController1;
  String? Function(BuildContext, String?)? myBioTextController1Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode2;
  TextEditingController? myBioTextController2;
  String? Function(BuildContext, String?)? myBioTextController2Validator;
  DateTime? datePicked1;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode3;
  TextEditingController? myBioTextController3;
  String? Function(BuildContext, String?)? myBioTextController3Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode4;
  TextEditingController? myBioTextController4;
  String? Function(BuildContext, String?)? myBioTextController4Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SelfCareClassesRecord? saveAddClass;
  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];
  List<String> uploadedFileUrls3 = [];

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode5;
  TextEditingController? myBioTextController5;
  String? Function(BuildContext, String?)? myBioTextController5Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode6;
  TextEditingController? myBioTextController6;
  String? Function(BuildContext, String?)? myBioTextController6Validator;
  DateTime? datePicked2;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode7;
  TextEditingController? myBioTextController7;
  String? Function(BuildContext, String?)? myBioTextController7Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode8;
  TextEditingController? myBioTextController8;
  String? Function(BuildContext, String?)? myBioTextController8Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventsCollectionRecord? saveAddEvent;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    myBioFocusNode1?.dispose();
    myBioTextController1?.dispose();

    myBioFocusNode2?.dispose();
    myBioTextController2?.dispose();

    myBioFocusNode3?.dispose();
    myBioTextController3?.dispose();

    myBioFocusNode4?.dispose();
    myBioTextController4?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    myBioFocusNode5?.dispose();
    myBioTextController5?.dispose();

    myBioFocusNode6?.dispose();
    myBioTextController6?.dispose();

    myBioFocusNode7?.dispose();
    myBioTextController7?.dispose();

    myBioFocusNode8?.dispose();
    myBioTextController8?.dispose();
  }
}
