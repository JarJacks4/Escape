import '/auth/firebase_auth/auth_util.dart';
import '/components/enter_innerverse_card_version5_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'mood_weather_version5_comp_widget.dart'
    show MoodWeatherVersion5CompWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoodWeatherVersion5CompModel
    extends FlutterFlowModel<MoodWeatherVersion5CompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EnterInnerverseCardVersion5 component.
  late EnterInnerverseCardVersion5Model enterInnerverseCardVersion5Model;

  @override
  void initState(BuildContext context) {
    enterInnerverseCardVersion5Model =
        createModel(context, () => EnterInnerverseCardVersion5Model());
  }

  @override
  void dispose() {
    enterInnerverseCardVersion5Model.dispose();
  }
}
