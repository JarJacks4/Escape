// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:youtube_player_flutter/youtube_player_flutter.dart'
    as yt_flutter; // Prefix to avoid conflict

class YouTubePlayerDemo extends StatefulWidget {
  const YouTubePlayerDemo({
    super.key,
    this.width,
    this.height,
    this.vidId,
  });

  final double? width;
  final double? height;
  final String? vidId;

  @override
  State<YouTubePlayerDemo> createState() => _YouTubePlayerDemoState();
}

class _YouTubePlayerDemoState extends State<YouTubePlayerDemo> {
  late yt_flutter.YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late yt_flutter.PlayerState _playerState;
  late yt_flutter.YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = yt_flutter.YoutubePlayerController(
      initialVideoId: widget.vidId ?? '',
      flags: const yt_flutter.YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(listener);

    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _playerState = yt_flutter.PlayerState.unknown;
    _videoMetaData = const yt_flutter.YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return yt_flutter.YoutubePlayerBuilder(
      player: yt_flutter.YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
          ),
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: player, // Adding the player inside the body of the Scaffold
      ),
    );
  }
}
