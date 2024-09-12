import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'youtubetest_copy_model.dart';
export 'youtubetest_copy_model.dart';

class YoutubetestCopyWidget extends StatefulWidget {
  const YoutubetestCopyWidget({
    super.key,
    required this.videoId,
  });

  final String? videoId;

  @override
  State<YoutubetestCopyWidget> createState() => _YoutubetestCopyWidgetState();
}

class _YoutubetestCopyWidgetState extends State<YoutubetestCopyWidget> {
  late YoutubetestCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YoutubetestCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'youtubetestCopy'});
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
          body: Visibility(
            visible: responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 427.0,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      decoration: BoxDecoration(
                        color: Color(0x00000220),
                      ),
                      child: FlutterFlowYoutubePlayer(
                        url:
                            'https://www.youtube.com/watch?v=${widget!.videoId}',
                        autoPlay: false,
                        looping: true,
                        mute: false,
                        showControls: true,
                        showFullScreen: true,
                        strictRelatedVideos: true,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
