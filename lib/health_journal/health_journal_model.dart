import '/backend/api_requests/api_calls.dart';
import '/components/health_journal_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'health_journal_widget.dart' show HealthJournalWidget;
import 'package:flutter/material.dart';

class HealthJournalModel extends FlutterFlowModel<HealthJournalWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Active Exercise)] action in HealthJournal widget.
  ApiCallResponse? getActiveExercise;
  // Stores action output result for [Backend Call - API (User Complete Profile)] action in HealthJournal widget.
  ApiCallResponse? listRecentSessions;
  // Model for HealthJournalComponent component.
  late HealthJournalComponentModel healthJournalComponentModel;

  @override
  void initState(BuildContext context) {
    healthJournalComponentModel =
        createModel(context, () => HealthJournalComponentModel());
  }

  @override
  void dispose() {
    healthJournalComponentModel.dispose();
  }
}
