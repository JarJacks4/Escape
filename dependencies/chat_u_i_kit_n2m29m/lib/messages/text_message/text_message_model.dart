import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'text_message_widget.dart' show TextMessageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextMessageModel extends FlutterFlowModel<TextMessageWidget> {
  ///  Local state fields for this component.

  bool showTimestampAndStatus = false;

  ///  State fields for stateful widgets in this component.

  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel1;
  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel2;

  @override
  void initState(BuildContext context) {
    customAvatarModel1 = createModel(context, () => CustomAvatarModel());
    customAvatarModel2 = createModel(context, () => CustomAvatarModel());
  }

  @override
  void dispose() {
    customAvatarModel1.dispose();
    customAvatarModel2.dispose();
  }
}
