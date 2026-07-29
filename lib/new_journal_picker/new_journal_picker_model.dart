import '/components/journal_type_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_journal_picker_widget.dart' show NewJournalPickerWidget;
import 'package:flutter/material.dart';

class NewJournalPickerModel extends FlutterFlowModel<NewJournalPickerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for JournalTypeCard.
  late JournalTypeCardModel journalTypeCardModel1;
  // Model for JournalTypeCard.
  late JournalTypeCardModel journalTypeCardModel2;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    journalTypeCardModel1 = createModel(context, () => JournalTypeCardModel());
    journalTypeCardModel2 = createModel(context, () => JournalTypeCardModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    journalTypeCardModel1.dispose();
    journalTypeCardModel2.dispose();
  }
}
