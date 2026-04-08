import '/components/quest_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'quests_page_widget.dart' show QuestsPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestsPageModel extends FlutterFlowModel<QuestsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for QuestCompVersion5 component.
  late QuestCompVersion5Model questCompVersion5Model;

  @override
  void initState(BuildContext context) {
    questCompVersion5Model =
        createModel(context, () => QuestCompVersion5Model());
  }

  @override
  void dispose() {
    questCompVersion5Model.dispose();
  }
}
