import '/components/button5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'rec_card_widget.dart' show RecCardWidget;
import 'package:flutter/material.dart';

class RecCardModel extends FlutterFlowModel<RecCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Button.
  late Button5Model buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => Button5Model());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
