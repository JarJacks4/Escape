import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_account_onboarding_flow_widget.dart'
    show CreateAccountOnboardingFlowWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CreateAccountOnboardingFlowModel
    extends FlutterFlowModel<CreateAccountOnboardingFlowWidget> {
  ///  Local state fields for this page.

  String? profilePicture;

  bool interests = false;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer2;
  bool isDataUploading_profilePictureUpload1 = false;
  FFUploadedFile uploadedLocalFile_profilePictureUpload1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilePictureUpload1 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  AudioPlayer? soundPlayer3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  AudioPlayer? soundPlayer4;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer5;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  // Stores action output result for [Backend Call - API (Onboarding User)] action in Button widget.
  ApiCallResponse? onboardingLucille1;
  // Stores action output result for [Backend Call - API (Create Memory)] action in Button widget.
  ApiCallResponse? onboardingLucilleMemory4;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
  }
}
