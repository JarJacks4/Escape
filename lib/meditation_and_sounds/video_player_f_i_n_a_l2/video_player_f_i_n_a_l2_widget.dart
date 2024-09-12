import '/components/videoplayer_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_player_f_i_n_a_l2_model.dart';
export 'video_player_f_i_n_a_l2_model.dart';

class VideoPlayerFINAL2Widget extends StatefulWidget {
  const VideoPlayerFINAL2Widget({
    super.key,
    required this.videoId,
  });

  final String? videoId;

  @override
  State<VideoPlayerFINAL2Widget> createState() =>
      _VideoPlayerFINAL2WidgetState();
}

class _VideoPlayerFINAL2WidgetState extends State<VideoPlayerFINAL2Widget> {
  late VideoPlayerFINAL2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerFINAL2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideoPlayerFINAL2'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: wrapWithModel(
            model: _model.videoplayerCompModel,
            updateCallback: () => safeSetState(() {}),
            child: VideoplayerCompWidget(
              parameter1: widget!.videoId!,
            ),
          ),
        ),
      ),
    );
  }
}
