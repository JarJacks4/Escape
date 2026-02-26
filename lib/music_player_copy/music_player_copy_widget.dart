import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'music_player_copy_model.dart';
export 'music_player_copy_model.dart';

class MusicPlayerCopyWidget extends StatefulWidget {
  const MusicPlayerCopyWidget({
    super.key,
    this.initialSong,
    required this.tracks,
    this.trackAlbumArt,
    this.trackTime,
    this.songTitle,
    this.songGenre,
    required this.songMood,
  });

  final String? initialSong;
  final List<SoundscapesStruct>? tracks;
  final String? trackAlbumArt;
  final int? trackTime;
  final String? songTitle;
  final String? songGenre;
  final String? songMood;

  static String routeName = 'MusicPlayerCopy';
  static String routePath = 'musicPlayerCopy';

  @override
  State<MusicPlayerCopyWidget> createState() => _MusicPlayerCopyWidgetState();
}

class _MusicPlayerCopyWidgetState extends State<MusicPlayerCopyWidget> {
  late MusicPlayerCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicPlayerCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MusicPlayerCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MUSIC_PLAYER_COPY_MusicPlayerCopy_ON_INI');
      logFirebaseEvent('MusicPlayerCopy_update_page_state');
      _model.tracks = _model.tracks.take(20).toList().toList().cast<String>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        valueOrDefault<String>(
                          widget.trackAlbumArt,
                          'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Gifs%2F89779ebdad6cda0831f05a306eebf7cd.gif?alt=media&token=fd2b83e9-a9a0-48a0-80e1-ddb769e137ee',
                        ),
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x43D0E3F7),
                              FlutterFlowTheme.of(context).primaryBackground
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: custom_widgets.ThatAudioPlayer(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
