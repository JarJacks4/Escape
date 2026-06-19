import '/components/dashboard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_page_widget.dart' show DashboardPageWidget;
import 'package:flutter/material.dart';

class DashboardPageModel extends FlutterFlowModel<DashboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Dashboard component.
  late DashboardModel dashboardModel;

  @override
  void initState(BuildContext context) {
    dashboardModel = createModel(context, () => DashboardModel());
  }

  @override
  void dispose() {
    dashboardModel.dispose();
  }
}
