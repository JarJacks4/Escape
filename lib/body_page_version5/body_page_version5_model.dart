import '/components/body_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'body_page_version5_widget.dart' show BodyPageVersion5Widget;
import 'package:flutter/material.dart';

class BodyPageVersion5Model extends FlutterFlowModel<BodyPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for BodyPage component.
  late BodyPageModel bodyPageModel;

  @override
  void initState(BuildContext context) {
    bodyPageModel = createModel(context, () => BodyPageModel());
  }

  @override
  void dispose() {
    bodyPageModel.dispose();
  }
}
