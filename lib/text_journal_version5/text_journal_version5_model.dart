import '/backend/api_requests/api_calls.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'text_journal_version5_widget.dart' show TextJournalVersion5Widget;
import 'package:flutter/material.dart';

class TextJournalVersion5Model
    extends FlutterFlowModel<TextJournalVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Column widget.
  ScrollController? columnScrollController2;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Column widget.
  ScrollController? columnScrollController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Column widget.
  ScrollController? columnScrollController4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController1 = ScrollController();
    columnScrollController2 = ScrollController();
    columnScrollController3 = ScrollController();
    columnScrollController4 = ScrollController();
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController1?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    columnScrollController2?.dispose();
    columnScrollController3?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    columnScrollController4?.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    buttonModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
