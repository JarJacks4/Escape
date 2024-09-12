import '/components/videoplayer_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'video_player_f_i_n_a_l2_widget.dart' show VideoPlayerFINAL2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoPlayerFINAL2Model extends FlutterFlowModel<VideoPlayerFINAL2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for VideoplayerComp component.
  late VideoplayerCompModel videoplayerCompModel;

  @override
  void initState(BuildContext context) {
    videoplayerCompModel = createModel(context, () => VideoplayerCompModel());
  }

  @override
  void dispose() {
    videoplayerCompModel.dispose();
  }
}
