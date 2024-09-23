// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.width,
    this.height,
    this.videoId,
  });

  final double? width;
  final double? height;
  final String? videoId;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Manual Play with playlist

// If the requirement is just to play a single video.
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the videoId from the widget
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId!, // Access videoId from the widget
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close(); // Dispose of the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: YoutubePlayer(
                controller: _controller, // Play the video using the controller
              ),
            ),
          ],
        ),
      ),
    );
  }
}
