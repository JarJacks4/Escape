// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CustomPreloadVideoWidget extends StatefulWidget {
  const CustomPreloadVideoWidget({
    Key? key,
    this.width,
    this.height,
    required this.pages, // Non-nullable List<TiktokPageStruct>
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<TiktokPageStruct> pages;

  @override
  State<CustomPreloadVideoWidget> createState() =>
      _CustomPreloadVideoWidgetState();
}

class _CustomPreloadVideoWidgetState extends State<CustomPreloadVideoWidget> {
  late final List<String> urls;
  final ScrollController _scrollController = ScrollController();
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, ChewieController> _chewieControllers = {};
  int _currentPlayingIndex = 0;

  @override
  void initState() {
    super.initState();

    // Extract video URLs safely
    urls = widget.pages
        .map((page) => page.urlvideo ?? '')
        .where((url) => url.isNotEmpty)
        .toList();

    if (urls.isNotEmpty) {
      _initializeVideoController(_currentPlayingIndex);
    }
    _scrollController.addListener(_onScroll);
  }

  void _initializeVideoController(int index) async {
    if (index >= urls.length || _videoControllers.containsKey(index)) return;

    final controller = VideoPlayerController.network(urls[index]);
    await controller.initialize();
    controller.setLooping(true);
    controller.play();

    final chewie = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
      showControls: false,
    );

    if (mounted) {
      setState(() {
        _videoControllers[index] = controller;
        _chewieControllers[index] = chewie;
      });
    }
  }

  void _disposeController(int index) {
    _videoControllers[index]?.dispose();
    _chewieControllers[index]?.dispose();
    _videoControllers.remove(index);
    _chewieControllers.remove(index);
  }

  void _onScroll() {
    final itemHeight = MediaQuery.of(context).size.height;
    final currentIndex = (_scrollController.offset / itemHeight).round();

    if (currentIndex != _currentPlayingIndex &&
        currentIndex >= 0 &&
        currentIndex < urls.length) {
      _disposeController(_currentPlayingIndex);
      _currentPlayingIndex = currentIndex;
      _initializeVideoController(_currentPlayingIndex);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (final controller in _videoControllers.values) {
      controller.dispose();
    }
    for (final controller in _chewieControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (urls.isEmpty) {
      return const Center(child: Text('No videos to display.'));
    }

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          final chewie = _chewieControllers[index];
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: chewie != null
                ? Chewie(controller: chewie)
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
