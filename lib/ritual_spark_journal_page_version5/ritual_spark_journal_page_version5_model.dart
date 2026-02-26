import '/components/journal_page1_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ritual_spark_journal_page_version5_widget.dart'
    show RitualSparkJournalPageVersion5Widget;
import 'package:flutter/material.dart';

class RitualSparkJournalPageVersion5Model
    extends FlutterFlowModel<RitualSparkJournalPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for journalPage1Version5 component.
  late JournalPage1Version5Model journalPage1Version5Model;

  @override
  void initState(BuildContext context) {
    journalPage1Version5Model =
        createModel(context, () => JournalPage1Version5Model());
  }

  @override
  void dispose() {
    journalPage1Version5Model.dispose();
  }
}
