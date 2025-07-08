import '/flutter_flow/flutter_flow_util.dart';
import 'events_page_widget.dart' show EventsPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EventsPageModel extends FlutterFlowModel<EventsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
