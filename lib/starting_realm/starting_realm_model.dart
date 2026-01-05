import '/components/starting_realm_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'starting_realm_widget.dart' show StartingRealmWidget;
import 'package:flutter/material.dart';

class StartingRealmModel extends FlutterFlowModel<StartingRealmWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StartingRealmCompVersion5 component.
  late StartingRealmCompVersion5Model startingRealmCompVersion5Model;

  @override
  void initState(BuildContext context) {
    startingRealmCompVersion5Model =
        createModel(context, () => StartingRealmCompVersion5Model());
  }

  @override
  void dispose() {
    startingRealmCompVersion5Model.dispose();
  }
}
