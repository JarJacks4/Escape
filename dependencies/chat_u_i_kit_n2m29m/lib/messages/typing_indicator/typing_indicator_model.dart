import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'typing_indicator_widget.dart' show TypingIndicatorWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TypingIndicatorModel extends FlutterFlowModel<TypingIndicatorWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel;

  @override
  void initState(BuildContext context) {
    customAvatarModel = createModel(context, () => CustomAvatarModel());
  }

  @override
  void dispose() {
    customAvatarModel.dispose();
  }
}
