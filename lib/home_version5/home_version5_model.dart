import '/components/new_home_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_version5_widget.dart' show HomeVersion5Widget;
import 'package:flutter/material.dart';

class HomeVersion5Model extends FlutterFlowModel<HomeVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for NewHomeVersion5 component.
  late NewHomeVersion5Model newHomeVersion5Model;

  @override
  void initState(BuildContext context) {
    newHomeVersion5Model = createModel(context, () => NewHomeVersion5Model());
  }

  @override
  void dispose() {
    newHomeVersion5Model.dispose();
  }
}
