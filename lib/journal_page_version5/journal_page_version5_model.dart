import '/components/journal_page1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_page_version5_widget.dart' show JournalPageVersion5Widget;
import 'package:flutter/material.dart';

class JournalPageVersion5Model
    extends FlutterFlowModel<JournalPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for JournalPage1 component.
  late JournalPage1Model journalPage1Model;

  @override
  void initState(BuildContext context) {
    journalPage1Model = createModel(context, () => JournalPage1Model());
  }

  @override
  void dispose() {
    journalPage1Model.dispose();
  }
}
