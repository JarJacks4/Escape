import '/components/that_mini_audio_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'navbar_widget.dart' show NavbarWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavbarModel extends FlutterFlowModel<NavbarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ThatMiniAudioPlayer component.
  late ThatMiniAudioPlayerModel thatMiniAudioPlayerModel;

  @override
  void initState(BuildContext context) {
    thatMiniAudioPlayerModel =
        createModel(context, () => ThatMiniAudioPlayerModel());
  }

  @override
  void dispose() {
    thatMiniAudioPlayerModel.dispose();
  }
}
