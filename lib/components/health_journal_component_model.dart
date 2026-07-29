import '/components/journal_stat_pill_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'health_journal_component_widget.dart' show HealthJournalComponentWidget;
import 'package:flutter/material.dart';

class HealthJournalComponentModel
    extends FlutterFlowModel<HealthJournalComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for JournalStatPill.
  late JournalStatPillModel journalStatPillModel1;
  // Model for JournalStatPill.
  late JournalStatPillModel journalStatPillModel2;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    journalStatPillModel1 = createModel(context, () => JournalStatPillModel());
    journalStatPillModel2 = createModel(context, () => JournalStatPillModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    journalStatPillModel1.dispose();
    journalStatPillModel2.dispose();
  }
}
