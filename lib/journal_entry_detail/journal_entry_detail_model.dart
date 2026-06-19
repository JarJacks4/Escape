import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_entry_detail_widget.dart' show JournalEntryDetailWidget;
import 'package:flutter/material.dart';

class JournalEntryDetailModel
    extends FlutterFlowModel<JournalEntryDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    buttonModel.dispose();
  }
}
