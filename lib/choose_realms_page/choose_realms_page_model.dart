import '/components/choose_realms_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_realms_page_widget.dart' show ChooseRealmsPageWidget;
import 'package:flutter/material.dart';

class ChooseRealmsPageModel extends FlutterFlowModel<ChooseRealmsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChooseRealms component.
  late ChooseRealmsModel chooseRealmsModel;

  @override
  void initState(BuildContext context) {
    chooseRealmsModel = createModel(context, () => ChooseRealmsModel());
  }

  @override
  void dispose() {
    chooseRealmsModel.dispose();
  }
}
