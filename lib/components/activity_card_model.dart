import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activity_card_widget.dart' show ActivityCardWidget;
import 'package:flutter/material.dart';

class ActivityCardModel extends FlutterFlowModel<ActivityCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
