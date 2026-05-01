import '/components/respiration_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'respiration_page_widget.dart' show RespirationPageWidget;
import 'package:flutter/material.dart';

class RespirationPageModel extends FlutterFlowModel<RespirationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RespirationComponent component.
  late RespirationComponentModel respirationComponentModel;

  @override
  void initState(BuildContext context) {
    respirationComponentModel =
        createModel(context, () => RespirationComponentModel());
  }

  @override
  void dispose() {
    respirationComponentModel.dispose();
  }
}
