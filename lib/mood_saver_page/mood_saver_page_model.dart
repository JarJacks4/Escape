import '/components/mood_saver_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'mood_saver_page_widget.dart' show MoodSaverPageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoodSaverPageModel extends FlutterFlowModel<MoodSaverPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for moodSaverComponent component.
  late MoodSaverComponentModel moodSaverComponentModel;

  @override
  void initState(BuildContext context) {
    moodSaverComponentModel =
        createModel(context, () => MoodSaverComponentModel());
  }

  @override
  void dispose() {
    moodSaverComponentModel.dispose();
  }
}
