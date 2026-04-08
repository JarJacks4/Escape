import '/components/new_music_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'next_songs_soundscape_comp_widget.dart'
    show NextSongsSoundscapeCompWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NextSongsSoundscapeCompModel
    extends FlutterFlowModel<NextSongsSoundscapeCompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NewMusicPlayer component.
  late NewMusicPlayerModel newMusicPlayerModel;

  @override
  void initState(BuildContext context) {
    newMusicPlayerModel = createModel(context, () => NewMusicPlayerModel());
  }

  @override
  void dispose() {
    newMusicPlayerModel.dispose();
  }
}
