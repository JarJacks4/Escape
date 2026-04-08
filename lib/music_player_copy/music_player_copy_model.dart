import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'music_player_copy_widget.dart' show MusicPlayerCopyWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
