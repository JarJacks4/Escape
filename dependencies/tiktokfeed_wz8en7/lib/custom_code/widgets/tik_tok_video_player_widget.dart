// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

class TiktokVideoData {
  final String? videoUrl; // Corresponds to 'urlvideo'
  final String? userPictureUrl; // Corresponds to 'userPicture'
  final String? profileName; // Corresponds to 'profilename'
  final List<String>? likes; // Corresponds to 'likes'
  final List<String>? bookmarks; // Corresponds to 'bookmark'
  final int? id; // Corresponds to 'id'

  TiktokVideoData({
    this.videoUrl,
    this.userPictureUrl,
    this.profileName,
    this.likes,
    this.bookmarks,
    this.id,
  });

  // Factory constructor to create a TiktokVideoData from a map,
  // useful if you're passing dynamic data from FlutterFlow queries.
  factory TiktokVideoData.fromMap(Map<String, dynamic> map) {
    return TiktokVideoData(
      videoUrl: map['urlvideo'] as String?,
      userPictureUrl: map['userPicture'] as String?,
      profileName: map['profilename'] as String?,
      likes: (map['likes'] as List?)?.map((e) => e.toString()).toList(),
      bookmarks: (map['bookmark'] as List?)?.map((e) => e.toString()).toList(),
      id: map['id'] as int?,
    );
  }
}

class TikTokVideoPlayerWidget extends StatefulWidget {
  const TikTokVideoPlayerWidget({
    super.key,
    this.width,
    this.height,
    required this.tiktokVideosData,
  });

  final double? width;
  final double? height;
  final List<TiktokPageStruct> tiktokVideosData;

  @override
  State<TikTokVideoPlayerWidget> createState() =>
      _TikTokVideoPlayerWidgetState();
}

class _TikTokVideoPlayerWidgetState extends State<TikTokVideoPlayerWidget> {
  List<VideoPlayerController> _controllers = [];
  // List to hold futures for controller initialization
  List<Future<void>> _initializeVideoPlayerFutures = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers.clear();
    _initializeVideoPlayerFutures.clear();

    for (var videoStruct in widget.tiktokVideosData) {
      // Directly use the properties from TiktokPageStruct
      final videoUrl =
          videoStruct.urlvideo; // Access 'urlvideo' property from the struct
      if (videoUrl != null && videoUrl.isNotEmpty) {
        final controller =
            VideoPlayerController.networkUrl(Uri.parse(videoUrl));
        _controllers.add(controller);
        _initializeVideoPlayerFutures.add(
          controller.initialize().then((_) {
            // Loop the video
            controller.setLooping(true);
            // For a TikTok-like feed, you might only play the visible one.
            // For simplicity, we'll just initialize them.
            // You might want to add logic to play only when visible.
          }).catchError((error) {
            print('Error initializing video: $videoUrl - $error');
          }),
        );
      }
    }
    // Rebuild the UI once all controllers are initialized
    // This is important for VideoPlayer to show content
    Future.wait(_initializeVideoPlayerFutures).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant TikTokVideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the data changes, re-initialize controllers
    if (widget.tiktokVideosData != oldWidget.tiktokVideosData) {
      _disposeControllers(); // Dispose old controllers
      _initializeControllers(); // Initialize new ones
    }
  }

  void _disposeControllers() {
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tiktokVideosData.isEmpty) {
      return Center(
        child: Text(
          'No TikTok videos to display.',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.tiktokVideosData.length,
      itemBuilder: (context, index) {
        final videoStruct =
            widget.tiktokVideosData[index]; // Get the TiktokPageStruct directly
        final controller =
            _controllers.length > index ? _controllers[index] : null;
        final initializeFuture = _initializeVideoPlayerFutures.length > index
            ? _initializeVideoPlayerFutures[index]
            : null;

        return FutureBuilder(
          future: initializeFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                controller != null &&
                controller.value.isInitialized) {
              return Card(
                margin: const EdgeInsets.all(8.0),
                color: Colors.black87,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video Player
                    AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          VideoPlayer(controller),
                          VideoProgressIndicator(controller,
                              allowScrubbing: true),
                          // Play/Pause button overlay
                          Center(
                            child: IconButton(
                              icon: Icon(
                                controller.value.isPlaying
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                color: Colors.white.withOpacity(0.7),
                                size: 60.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  controller.value.isPlaying
                                      ? controller.pause()
                                      : controller.play();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // User Picture
                          if (videoStruct.userPicture != null &&
                              videoStruct.userPicture!.isNotEmpty)
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(videoStruct.userPicture!),
                              onBackgroundImageError: (exception, stackTrace) {
                                print(
                                    'Error loading user picture: ${videoStruct.userPicture} - $exception');
                              },
                            )
                          else
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          const SizedBox(width: 8),
                          // Profile Name
                          if (videoStruct.profilename != null)
                            Expanded(
                              child: Text(
                                videoStruct.profilename!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          const SizedBox(width: 16),
                          // Likes and Bookmark (simplified icons)
                          Row(
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                videoStruct.likes?.length.toString() ?? '0',
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(width: 12),
                              Icon(Icons.bookmark,
                                  color: Colors.blue, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error loading video for ${videoStruct.profilename ?? 'unknown'}: ${snapshot.error}',
                  style: TextStyle(color: Colors.redAccent),
                ),
              );
            } else {
              return Card(
                margin: const EdgeInsets.all(8.0),
                color: Colors.black87,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                elevation: 4,
                child: AspectRatio(
                  aspectRatio:
                      9 / 16, // Common aspect ratio for vertical videos
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.blueAccent),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
