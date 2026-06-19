import '/components/health_journal_calender_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'health_journal_calendar_widget.dart' show HealthJournalCalendarWidget;
import 'package:flutter/material.dart';

class HealthJournalCalendarModel
    extends FlutterFlowModel<HealthJournalCalendarWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for HealthJournalCalender component.
  late HealthJournalCalenderModel healthJournalCalenderModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    healthJournalCalenderModel =
        createModel(context, () => HealthJournalCalenderModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    healthJournalCalenderModel.dispose();
  }
}
