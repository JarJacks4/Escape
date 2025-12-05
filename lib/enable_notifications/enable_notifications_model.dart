import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enable_notifications_widget.dart' show EnableNotificationsWidget;
import 'package:flutter/material.dart';

class EnableNotificationsModel
    extends FlutterFlowModel<EnableNotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
