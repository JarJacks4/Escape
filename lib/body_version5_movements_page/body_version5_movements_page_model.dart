import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'body_version5_movements_page_widget.dart'
    show BodyVersion5MovementsPageWidget;
import 'package:flutter/material.dart';

class BodyVersion5MovementsPageModel
    extends FlutterFlowModel<BodyVersion5MovementsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for Button.
  late Button7Model buttonModel;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    buttonModel = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    buttonModel.dispose();
  }
}
