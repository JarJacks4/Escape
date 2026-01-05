import '/backend/backend.dart';
import '/components/lucille_home_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lucille_home_widget.dart' show LucilleHomeWidget;
import 'package:flutter/material.dart';

class LucilleHomeModel extends FlutterFlowModel<LucilleHomeWidget> {
  ///  Local state fields for this page.

  UsersRecord? profilePicture;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for LucilleHomeCompVersion5 component.
  late LucilleHomeCompVersion5Model lucilleHomeCompVersion5Model;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    lucilleHomeCompVersion5Model =
        createModel(context, () => LucilleHomeCompVersion5Model());
  }

  @override
  void dispose() {
    columnController?.dispose();
    lucilleHomeCompVersion5Model.dispose();
  }
}
