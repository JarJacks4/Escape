import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/components/calendar_day_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_history_widget.dart' show JournalHistoryWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class JournalHistoryModel extends FlutterFlowModel<JournalHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // State field(s) for Row widget.
  ScrollController? rowScrollController;
  // Model for CalendarDay.
  late CalendarDayModel calendarDayModel1;
  // Model for CalendarDay.
  late CalendarDayModel calendarDayModel2;
  // Model for CalendarDay.
  late CalendarDayModel calendarDayModel3;
  // Model for CalendarDay.
  late CalendarDayModel calendarDayModel4;
  // Model for CalendarDay.
  late CalendarDayModel calendarDayModel5;
  // Model for CalendarDay.
  late CalendarDayModel calendarDayModel6;
  // Model for Button.
  late ButtonModel buttonModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, JournalRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    rowScrollController = ScrollController();
    calendarDayModel1 = createModel(context, () => CalendarDayModel());
    calendarDayModel2 = createModel(context, () => CalendarDayModel());
    calendarDayModel3 = createModel(context, () => CalendarDayModel());
    calendarDayModel4 = createModel(context, () => CalendarDayModel());
    calendarDayModel5 = createModel(context, () => CalendarDayModel());
    calendarDayModel6 = createModel(context, () => CalendarDayModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    rowScrollController?.dispose();
    calendarDayModel1.dispose();
    calendarDayModel2.dispose();
    calendarDayModel3.dispose();
    calendarDayModel4.dispose();
    calendarDayModel5.dispose();
    calendarDayModel6.dispose();
    buttonModel.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, JournalRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, JournalRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, JournalRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryJournalRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
