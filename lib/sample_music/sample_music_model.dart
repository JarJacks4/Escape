import '/components/minimized_music_player/minimized_music_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sample_music_widget.dart' show SampleMusicWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SampleMusicModel extends FlutterFlowModel<SampleMusicWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MinimizedMusicPlayer component.
  late MinimizedMusicPlayerModel minimizedMusicPlayerModel;

  @override
  void initState(BuildContext context) {
    minimizedMusicPlayerModel =
        createModel(context, () => MinimizedMusicPlayerModel());
  }

  @override
  void dispose() {
    minimizedMusicPlayerModel.dispose();
  }
}
