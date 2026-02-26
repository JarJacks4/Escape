import '/components/explore_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'explore_page_widget.dart' show ExplorePageWidget;
import 'package:flutter/material.dart';

class ExplorePageModel extends FlutterFlowModel<ExplorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ExploreScreen component.
  late ExploreScreenModel exploreScreenModel;

  @override
  void initState(BuildContext context) {
    exploreScreenModel = createModel(context, () => ExploreScreenModel());
  }

  @override
  void dispose() {
    exploreScreenModel.dispose();
  }
}
