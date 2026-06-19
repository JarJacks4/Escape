import '/components/journal_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'journal_history2_widget.dart' show JournalHistory2Widget;
import 'package:flutter/material.dart';

class JournalHistory2Model extends FlutterFlowModel<JournalHistory2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // Model for JournalCard.
  late JournalCardModel journalCardModel1;
  // Model for JournalCard.
  late JournalCardModel journalCardModel2;
  // Model for JournalCard.
  late JournalCardModel journalCardModel3;
  // Model for JournalCard.
  late JournalCardModel journalCardModel4;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    journalCardModel1 = createModel(context, () => JournalCardModel());
    journalCardModel2 = createModel(context, () => JournalCardModel());
    journalCardModel3 = createModel(context, () => JournalCardModel());
    journalCardModel4 = createModel(context, () => JournalCardModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    journalCardModel1.dispose();
    journalCardModel2.dispose();
    journalCardModel3.dispose();
    journalCardModel4.dispose();
  }
}
