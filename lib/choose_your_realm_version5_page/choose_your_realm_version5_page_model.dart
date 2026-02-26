import '/components/choose_your_realm_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_your_realm_version5_page_widget.dart'
    show ChooseYourRealmVersion5PageWidget;
import 'package:flutter/material.dart';

class ChooseYourRealmVersion5PageModel
    extends FlutterFlowModel<ChooseYourRealmVersion5PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChooseYourRealmVersion5 component.
  late ChooseYourRealmVersion5Model chooseYourRealmVersion5Model;

  @override
  void initState(BuildContext context) {
    chooseYourRealmVersion5Model =
        createModel(context, () => ChooseYourRealmVersion5Model());
  }

  @override
  void dispose() {
    chooseYourRealmVersion5Model.dispose();
  }
}
