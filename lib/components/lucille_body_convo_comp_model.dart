import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_body_convo_comp_widget.dart' show LucilleBodyConvoCompWidget;
import 'package:flutter/material.dart';

class LucilleBodyConvoCompModel
    extends FlutterFlowModel<LucilleBodyConvoCompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Button.
  late Button7Model buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
