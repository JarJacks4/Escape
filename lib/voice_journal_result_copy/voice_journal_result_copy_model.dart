import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'voice_journal_result_copy_widget.dart'
    show VoiceJournalResultCopyWidget;
import 'package:flutter/material.dart';

class VoiceJournalResultCopyModel
    extends FlutterFlowModel<VoiceJournalResultCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController1;
  // State field(s) for Column widget.
  ScrollController? columnScrollController2;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController1 = ScrollController();
    columnScrollController2 = ScrollController();
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController1?.dispose();
    columnScrollController2?.dispose();
    buttonModel.dispose();
  }
}
