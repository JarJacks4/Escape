import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'videoplayer_comp_copy_model.dart';
export 'videoplayer_comp_copy_model.dart';

class VideoplayerCompCopyWidget extends StatefulWidget {
  const VideoplayerCompCopyWidget({
    super.key,
    required this.parameter1,
  });

  final String? parameter1;

  @override
  State<VideoplayerCompCopyWidget> createState() =>
      _VideoplayerCompCopyWidgetState();
}

class _VideoplayerCompCopyWidgetState extends State<VideoplayerCompCopyWidget> {
  late VideoplayerCompCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoplayerCompCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 970.0,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7.0,
                  sigmaY: 7.0,
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 691.0,
                            decoration: BoxDecoration(
                              color: Color(0x00000220),
                            ),
                            child: Visibility(
                              visible: responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ),
                              child: FlutterFlowYoutubePlayer(
                                url:
                                    'https://www.youtube.com/watch?v=${widget!.parameter1}',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: double.infinity,
                                autoPlay: false,
                                looping: true,
                                mute: false,
                                showControls: true,
                                showFullScreen: true,
                                strictRelatedVideos: false,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: FaIcon(
                                FontAwesomeIcons.angleDown,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VIDEOPLAYER_COPY_angleDown_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
