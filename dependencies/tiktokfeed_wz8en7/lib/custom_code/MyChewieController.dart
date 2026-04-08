import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:preload_videos/interface/controller_interface.dart';
import 'package:video_player/video_player.dart';

abstract class CustomVideoController {
  Future<void> initialize();
  Future<void> play();
  Future<void> pause();
  Future<void> dispose();
  bool get isPlaying;
  bool get isInitialized;
  String get dataSource;
}

class MyChewieController extends CustomVideoController {
  final String _url;
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  // Expose ChewieController for the UI
  ChewieController? get chewieController => _chewieController;

  MyChewieController(this._url) {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(_url));
  }

  @override
  Future<void> initialize() async {
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true, // You can configure this
      looping: false,
    );
  }

  @override
  Future<void> play() async {
    _chewieController?.play();
  }

  @override
  Future<void> pause() async {
    _chewieController?.pause();
  }

  @override
  Future<void> dispose() async {
    _chewieController?.dispose();
    await _videoPlayerController.dispose();
  }

  @override
  bool get isPlaying => _videoPlayerController.value.isPlaying;

  @override
  bool get isInitialized => _videoPlayerController.value.isInitialized;

  @override
  String get dataSource => _url;
}
