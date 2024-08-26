import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/headers/header_affirmations/header_affirmations_widget.dart';
import '/meditation_and_sounds/tabbar_home_affirmations/tabbar_home_affirmations_widget.dart';
import 'affirmations_main_page_widget.dart' show AffirmationsMainPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AffirmationsMainPageModel
    extends FlutterFlowModel<AffirmationsMainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderAffirmations component.
  late HeaderAffirmationsModel headerAffirmationsModel;
  // Model for tabbarHomeAffirmations component.
  late TabbarHomeAffirmationsModel tabbarHomeAffirmationsModel;

  @override
  void initState(BuildContext context) {
    headerAffirmationsModel =
        createModel(context, () => HeaderAffirmationsModel());
    tabbarHomeAffirmationsModel =
        createModel(context, () => TabbarHomeAffirmationsModel());
  }

  @override
  void dispose() {
    headerAffirmationsModel.dispose();
    tabbarHomeAffirmationsModel.dispose();
  }
}
