import '/components/lucille_body1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_body1_page_widget.dart' show LucilleBody1PageWidget;
import 'package:flutter/material.dart';

class LucilleBody1PageModel extends FlutterFlowModel<LucilleBody1PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LucilleBody1 component.
  late LucilleBody1Model lucilleBody1Model;

  @override
  void initState(BuildContext context) {
    lucilleBody1Model = createModel(context, () => LucilleBody1Model());
  }

  @override
  void dispose() {
    lucilleBody1Model.dispose();
  }
}
