import '/components/new_music_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'next_songs_soundscape_comp_widget.dart'
    show NextSongsSoundscapeCompWidget;
import 'package:flutter/material.dart';

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
