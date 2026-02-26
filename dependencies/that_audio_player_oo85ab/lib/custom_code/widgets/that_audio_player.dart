// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class ThatAudioPlayerState {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  bool _isPlaying = false;
  bool _isShuffling = false;
  LoopMode _loopMode = LoopMode.off;
  double _playbackSpeed = 1.0;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  List<MediaStruct> _playlist = List.empty();

  /// **Private Constructor for Singleton**
  ThatAudioPlayerState._privateConstructor();

  static final ThatAudioPlayerState _instance =
      ThatAudioPlayerState._privateConstructor();

  factory ThatAudioPlayerState() {
    return _instance;
  }

  /// **Initialize Audio Source**
  Future<void> initializeAudio(
      {List<MediaStruct>? playlist,
      MediaStruct? singleAudio,
      int? initialIndex}) async {
    if (playlist != null && playlist.isNotEmpty) {
      _playlist = playlist;
      FFAppState().update(() => FFAppState().isMiniPlayerVisible = true);
      await _audioPlayer.setAudioSource(
          ConcatenatingAudioSource(
            children: playlist
                .map((media) => AudioSource.uri(Uri.parse(media.mediaUrl),
                    tag: MediaItem(
                        id: media.hashCode.toString(),
                        title: media.mediaTitle,
                        artist: media.mediaArtist,
                        artUri: Uri.parse(media.mediaBanner))))
                .toList(),
          ),
          initialIndex: initialIndex);
    } else if (singleAudio != null) {
      FFAppState().update(() {
        FFAppState().currentMedia = singleAudio;
        FFAppState().isMiniPlayerVisible = true;
      });
      await _audioPlayer.setAudioSource(AudioSource.uri(
          Uri.parse(singleAudio.mediaUrl),
          tag: MediaItem(
              id: singleAudio.hashCode.toString(),
              title: singleAudio.mediaTitle,
              artist: singleAudio.mediaArtist,
              artUri: Uri.parse(singleAudio.mediaBanner))));
    }

    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        _currentIndex = index;
        FFAppState().update(() {
          FFAppState().currentMediaIndex = index;
          if (_playlist.isNotEmpty)
            FFAppState().currentMedia = _playlist[index];
        });
      }
    });

    _audioPlayer.positionStream.listen((position) {
      FFAppState().update(() => FFAppState().currentPositionOfAudioInSeconds =
          position.inSeconds.toDouble());
      _currentPosition = position;
    });

    _audioPlayer.durationStream.listen((duration) {
      FFAppState().update(() => FFAppState().totalDurationOfAudioInSeconds =
          duration?.inSeconds.toDouble() ?? Duration.zero.inSeconds.toDouble());
      _totalDuration = duration ?? Duration.zero;
    });

    _audioPlayer.playerStateStream.listen((state) {
      FFAppState()
          .update(() => FFAppState().isThatAudioPlayerPlaying = state.playing);
      _isPlaying = state.playing;
    });

    _audioPlayer.volumeStream.listen((volume) {
      FFAppState().update(() => FFAppState().currentAudioVolume = volume);
    });

    _audioPlayer.bufferedPositionStream.listen((bufferredPosition) {
      FFAppState().update(() => FFAppState().audioBufferedPosition =
          bufferredPosition.inSeconds.toDouble());
    });

    _audioPlayer.loopModeStream.listen((loopMode) {
      FFAppState().update(() => FFAppState().loopMode = loopMode.name);
    });

    _audioPlayer.shuffleModeEnabledStream.listen((shuffleMode) {
      FFAppState()
          .update(() => FFAppState().isThatAudioPlayerShuffling = shuffleMode);
      _isShuffling = shuffleMode;
    });
  }

  /// **Audio Player Controls**
  void play() async => await _audioPlayer.play();
  void pause() async => await _audioPlayer.pause();
  void seekForward(int durationInSeconds) async => await _audioPlayer
      .seek(_currentPosition + Duration(seconds: durationInSeconds));
  void seekBackward(int durationInSeconds) async => await _audioPlayer
      .seek(_currentPosition - Duration(seconds: durationInSeconds));
  void toggleShuffle() async =>
      await _audioPlayer.setShuffleModeEnabled(!_isShuffling);
  void nextTrack() async => await _audioPlayer.seekToNext();
  void previousTrack() async => await _audioPlayer.seekToPrevious();
  void setSpeed(double speed) async => await _audioPlayer.setSpeed(speed);
  void setLoopMode(LoopMode mode) async => await _audioPlayer.setLoopMode(mode);
  int getTotalDurationOfAudio() => _totalDuration.inSeconds;
  int getCurrentPositionOfAudio() => _currentPosition.inSeconds;
  bool isPLaying() => _isPlaying;
  bool isShuffling() => _isShuffling;
  double getPlaybackSpeed() => _playbackSpeed;
  String getLoopMode() => _loopMode.name;
  void seek({double value = 0.0, int? index}) async =>
      await _audioPlayer.seek(Duration(seconds: value.toInt()), index: index);
  bool hasNext() => _audioPlayer.hasNext;
  double getCurrentVolume() => _audioPlayer.volume;
  void setVolume(double volume) => _audioPlayer.setVolume(volume);
  void dispose() => _audioPlayer.dispose();
}

class ThatAudioPlayer extends StatefulWidget {
  ThatAudioPlayer({super.key, this.width, this.height});

  final double? width;
  final double? height;
  @override
  _ThatAudioPlayerState createState() => _ThatAudioPlayerState();
}

class _ThatAudioPlayerState extends State<ThatAudioPlayer> {
  final ThatAudioPlayerState _thatAudioPlayerState = ThatAudioPlayerState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _thatAudioPlayerState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty UI, just initializes the singleton
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
