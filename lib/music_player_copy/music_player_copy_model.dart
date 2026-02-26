import '/flutter_flow/flutter_flow_util.dart';
import 'music_player_copy_widget.dart' show MusicPlayerCopyWidget;
import 'package:flutter/material.dart';

class MusicPlayerCopyModel extends FlutterFlowModel<MusicPlayerCopyWidget> {
  ///  Local state fields for this page.

  List<String> tracks = [];
  void addToTracks(String item) => tracks.add(item);
  void removeFromTracks(String item) => tracks.remove(item);
  void removeAtIndexFromTracks(int index) => tracks.removeAt(index);
  void insertAtIndexInTracks(int index, String item) =>
      tracks.insert(index, item);
  void updateTracksAtIndex(int index, Function(String) updateFn) =>
      tracks[index] = updateFn(tracks[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
