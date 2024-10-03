import '/flutter_flow/flutter_flow_util.dart';
import '/headers/header_yoga/header_yoga_widget.dart';
import '/meditation_and_sounds/tabbar_home_yoga/tabbar_home_yoga_widget.dart';
import 'body_home_widget.dart' show BodyHomeWidget;
import 'package:flutter/material.dart';

class BodyHomeModel extends FlutterFlowModel<BodyHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderYoga component.
  late HeaderYogaModel headerYogaModel;
  // Model for tabbarHomeYoga component.
  late TabbarHomeYogaModel tabbarHomeYogaModel;

  @override
  void initState(BuildContext context) {
    headerYogaModel = createModel(context, () => HeaderYogaModel());
    tabbarHomeYogaModel = createModel(context, () => TabbarHomeYogaModel());
  }

  @override
  void dispose() {
    headerYogaModel.dispose();
    tabbarHomeYogaModel.dispose();
  }
}
