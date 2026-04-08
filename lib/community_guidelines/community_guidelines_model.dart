import '/components/community_guidelines_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'community_guidelines_widget.dart' show CommunityGuidelinesWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityGuidelinesModel
    extends FlutterFlowModel<CommunityGuidelinesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CommunityGuidelinesComp component.
  late CommunityGuidelinesCompModel communityGuidelinesCompModel;

  @override
  void initState(BuildContext context) {
    communityGuidelinesCompModel =
        createModel(context, () => CommunityGuidelinesCompModel());
  }

  @override
  void dispose() {
    communityGuidelinesCompModel.dispose();
  }
}
