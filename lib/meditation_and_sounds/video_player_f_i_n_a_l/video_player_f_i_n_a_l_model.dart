import '/components/video_player_f_i_n_a_l_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'video_player_f_i_n_a_l_widget.dart' show VideoPlayerFINALWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoPlayerFINALModel extends FlutterFlowModel<VideoPlayerFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VideoPlayerFINALComp component.
  late VideoPlayerFINALCompModel videoPlayerFINALCompModel;

  @override
  void initState(BuildContext context) {
    videoPlayerFINALCompModel =
        createModel(context, () => VideoPlayerFINALCompModel());
  }

  @override
  void dispose() {
    videoPlayerFINALCompModel.dispose();
  }
}
