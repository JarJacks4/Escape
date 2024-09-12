import '/components/video_player_f_i_n_a_l_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_player_f_i_n_a_l_model.dart';
export 'video_player_f_i_n_a_l_model.dart';

class VideoPlayerFINALWidget extends StatefulWidget {
  const VideoPlayerFINALWidget({
    super.key,
    required this.videoId,
  });

  final String? videoId;

  @override
  State<VideoPlayerFINALWidget> createState() => _VideoPlayerFINALWidgetState();
}

class _VideoPlayerFINALWidgetState extends State<VideoPlayerFINALWidget> {
  late VideoPlayerFINALModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerFINALModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideoPlayerFINAL'});
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.videoPlayerFINALCompModel,
                  updateCallback: () => safeSetState(() {}),
                  child: VideoPlayerFINALCompWidget(
                    parameter1: widget!.videoId!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
