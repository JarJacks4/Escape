import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_player_f_i_n_a_l_comp_model.dart';
export 'video_player_f_i_n_a_l_comp_model.dart';

class VideoPlayerFINALCompWidget extends StatefulWidget {
  const VideoPlayerFINALCompWidget({
    super.key,
    required this.parameter1,
  });

  final String? parameter1;

  @override
  State<VideoPlayerFINALCompWidget> createState() =>
      _VideoPlayerFINALCompWidgetState();
}

class _VideoPlayerFINALCompWidgetState
    extends State<VideoPlayerFINALCompWidget> {
  late VideoPlayerFINALCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerFINALCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowYoutubePlayer(
      url: 'https://www.youtube.com/watch?v=${widget!.parameter1}',
      height: double.infinity,
      autoPlay: false,
      looping: true,
      mute: false,
      showControls: true,
      showFullScreen: true,
      strictRelatedVideos: false,
    );
  }
}
