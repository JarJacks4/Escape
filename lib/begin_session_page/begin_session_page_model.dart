import '/components/begin_session_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'begin_session_page_widget.dart' show BeginSessionPageWidget;
import 'package:flutter/material.dart';

class BeginSessionPageModel extends FlutterFlowModel<BeginSessionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for beginSession component.
  late BeginSessionModel beginSessionModel;

  @override
  void initState(BuildContext context) {
    beginSessionModel = createModel(context, () => BeginSessionModel());
  }

  @override
  void dispose() {
    beginSessionModel.dispose();
  }
}
