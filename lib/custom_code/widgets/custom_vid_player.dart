// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:visibility_detector/visibility_detector.dart';

// Define a custom widget named CustomVidPlayer
class CustomVidPlayer extends StatefulWidget {
  CustomVidPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoPath,
    this.playPauseVideoAction = false,
    this.looping = false,
    this.showControls = false,
    this.allowFullScreen = false,
    this.allowPlayBackSpeedChanging = false,
    this.controlAudio = false,
    this.loadingCircleColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoPath;
  bool playPauseVideoAction;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlayBackSpeedChanging;
  bool controlAudio;
  final Color? loadingCircleColor;

  @override
  _CustomVidPlayerState createState() => _CustomVidPlayerState();
}

// Define the state for the CustomVidPlayer widget
class _CustomVidPlayerState extends State<CustomVidPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController with the provided videoPath
    _videoPlayerController = VideoPlayerController.network(widget.videoPath);
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((_) {
      setState(() {});
      // Initialize the ChewieController
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        looping: widget.looping,
        showControls: widget.showControls,
        allowFullScreen: widget.allowFullScreen,
        allowPlaybackSpeedChanging: widget.allowPlayBackSpeedChanging,
        // Set the loading indicator's color
        materialProgressColors: ChewieProgressColors(
          playedColor: widget.loadingCircleColor ??
              Colors.blue, // You can set a default color here
          handleColor: widget.loadingCircleColor ??
              Colors.blue, // You can set a default color here
        ),
      );
      _updateAudioVolume(); // Initialize audio volume
    });
  }

  @override
  void didUpdateWidget(CustomVidPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update video playback based on the playPauseVideoAction property
    if (widget.playPauseVideoAction != oldWidget.playPauseVideoAction) {
      if (widget.playPauseVideoAction) {
        _videoPlayerController.play();
      } else {
        _videoPlayerController.pause();
      }
    }

    // Update audio volume based on the controlAudio property
    if (widget.controlAudio != oldWidget.controlAudio) {
      _updateAudioVolume();
    }
  }

  void _updateAudioVolume() {
    double volume = widget.controlAudio ? 1.0 : 0.0;
    _videoPlayerController.setVolume(volume);
  }

  @override
  void dispose() {
    // Dispose of the video and Chewie controllers
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _toggleVideoPlayback() {
    // Toggle video playback and update the state
    if (widget.playPauseVideoAction || _isVideoPlaying) {
      _videoPlayerController.play();
    } else {
      _videoPlayerController.pause();
    }
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
      widget.playPauseVideoAction = _isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoPath),
      onVisibilityChanged: (visibilityInfo) {
        // Play or pause the video based on visibility
        if (visibilityInfo.visibleFraction >= 1) {
          _videoPlayerController.play();
        } else {
          _videoPlayerController.pause();
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: _videoPlayerController.value.isInitialized
            ? Stack(
                children: [
                  // Display the video using Chewie
                  Chewie(
                    controller: _chewieController,
                  ),
                  GestureDetector(
                    onTap: _toggleVideoPlayback,
                    behavior: HitTestBehavior.opaque,
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
