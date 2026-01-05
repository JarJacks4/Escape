import '/backend/api_requests/api_calls.dart';
import '/components/new_home_version5_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_version5_widget.dart' show HomeVersion5Widget;
import 'package:flutter/material.dart';

class HomeVersion5Model extends FlutterFlowModel<HomeVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Create New Session)] action in HomeVersion5 widget.
  ApiCallResponse? createSession;
  // Model for NewHomeVersion5 component.
  late NewHomeVersion5Model newHomeVersion5Model;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    newHomeVersion5Model = createModel(context, () => NewHomeVersion5Model());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    newHomeVersion5Model.dispose();
    sideNavModel.dispose();
  }
}
