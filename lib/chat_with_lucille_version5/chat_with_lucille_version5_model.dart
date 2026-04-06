import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
import 'chat_with_lucille_version5_widget.dart'
    show ChatWithLucilleVersion5Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class ChatWithLucilleVersion5Model
    extends FlutterFlowModel<ChatWithLucilleVersion5Widget> {
  ///  Local state fields for this page.

  bool aiIsResponsing = true;

  String userInput = 'userResponse';

  String? streamedResponse;

  List<String> chatMessages = [];
  void addToChatMessages(String item) => chatMessages.add(item);
  void removeFromChatMessages(String item) => chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, String item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(int index, Function(String) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  bool? newMessage = false;

  String? sessionID;

  List<TheoryOfMindLucilleStreamChatStruct> streamMessages = [];
  void addToStreamMessages(TheoryOfMindLucilleStreamChatStruct item) =>
      streamMessages.add(item);
  void removeFromStreamMessages(TheoryOfMindLucilleStreamChatStruct item) =>
      streamMessages.remove(item);
  void removeAtIndexFromStreamMessages(int index) =>
      streamMessages.removeAt(index);
  void insertAtIndexInStreamMessages(
          int index, TheoryOfMindLucilleStreamChatStruct item) =>
      streamMessages.insert(index, item);
  void updateStreamMessagesAtIndex(
          int index, Function(TheoryOfMindLucilleStreamChatStruct) updateFn) =>
      streamMessages[index] = updateFn(streamMessages[index]);

  String? accumulatedResponse;

  int? aiMessageIndex = 0;

  bool? isRecording = true;

  String? recordedAudioBase64;

  String? voiceTextUser;

  String? lucilleBase64ConvertedFile;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  AudioPlayer? soundPlayer1;
  AudioRecorder? audioRecorder;
  AudioPlayer? soundPlayer2;
  String? stopUserVoice;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  bool isDataUploading_uploadAudioFile = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadAudioFile = [];

  // Stores action output result for [Custom Action - audioPathFromUploadedFile] action in LottieAnimation widget.
  String? recordedFileToBase642;
  // Stores action output result for [Backend Call - API (Speech To Text)] action in LottieAnimation widget.
  ApiCallResponse? speechToText;
  // Stores action output result for [Backend Call - API (Lucille Chat Main)] action in LottieAnimation widget.
  ApiCallResponse? speechToTextChatResponse;
  // Stores action output result for [Backend Call - API (Text to Speech)] action in LottieAnimation widget.
  ApiCallResponse? ttsResponse;
  // Stores action output result for [Custom Action - base64ToAudioFile] action in LottieAnimation widget.
  String? base64AudioConversion;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Get Chat History)] action in IconButton widget.
  ApiCallResponse? getChatHistory;
  // Stores action output result for [Backend Call - API (ChatStream)] action in IconButton widget.
  ApiCallResponse? lucilleStreamChat;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listViewController?.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    writingIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
