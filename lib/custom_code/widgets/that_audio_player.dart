// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
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

/// =============================================================
/// AUDIO PLAYER ENGINE (GLOBAL / SINGLE INSTANCE)
/// =============================================================
class ThatAudioPlayerState {
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<SoundscapesStruct> _playlist = [];
  int _currentIndex = 0;

  /// -------------------------------
  /// Singleton setup
  /// -------------------------------
  ThatAudioPlayerState._internal();
  static final ThatAudioPlayerState _instance =
      ThatAudioPlayerState._internal();
  factory ThatAudioPlayerState() => _instance;

  /// =============================================================
  /// INITIALIZE AUDIO (PLAYLIST)
  /// =============================================================
  Future<void> initializeAudio({
    required List<SoundscapesStruct> playlist,
    int initialIndex = 0,
  }) async {
    if (playlist.isEmpty) {
      debugPrint('ThatAudioPlayer: playlist is empty');
      return;
    }

    _playlist = playlist;
    _currentIndex = initialIndex;

    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: playlist.map((soundscape) {
          return AudioSource.uri(
            Uri.parse(soundscape.songUrl),
            tag: MediaItem(
              id: soundscape.hashCode.toString(),
              title: soundscape.songTitle,
              artist: soundscape.artist ?? '',
              artUri: soundscape.albumArt.isNotEmpty
                  ? Uri.parse(soundscape.albumArt)
                  : null,
            ),
          );
        }).toList(),
      ),
      initialIndex: initialIndex,
    );

    await _audioPlayer.play();
  }

  /// =============================================================
  /// CORE CONTROLS
  /// =============================================================
  Future<void> play() => _audioPlayer.play();
  Future<void> pause() => _audioPlayer.pause();

  Future<void> nextTrack() async {
    if (_audioPlayer.hasNext) {
      await _audioPlayer.seekToNext();
    }
  }

  Future<void> previousTrack() async {
    if (_audioPlayer.hasPrevious) {
      await _audioPlayer.seekToPrevious();
    }
  }

  Future<void> seek({required double value, int? index}) async {
    await _audioPlayer.seek(
      Duration(seconds: value.toInt()),
      index: index,
    );
  }

  Future<void> seekForward(int seconds) async {
    await _audioPlayer.seek(
      _audioPlayer.position + Duration(seconds: seconds),
    );
  }

  Future<void> seekBackward(int seconds) async {
    await _audioPlayer.seek(
      _audioPlayer.position - Duration(seconds: seconds),
    );
  }

  /// =============================================================
  /// PLAYBACK OPTIONS
  /// =============================================================
  Future<void> setSpeed(double speed) async {
    await _audioPlayer.setSpeed(speed);
  }

  double getPlaybackSpeed() {
    return _audioPlayer.speed;
  }

  Future<void> setLoopMode(LoopMode mode) async {
    await _audioPlayer.setLoopMode(mode);
  }

  Future<void> toggleShuffle() async {
    final enabled = _audioPlayer.shuffleModeEnabled;
    await _audioPlayer.setShuffleModeEnabled(!enabled);
  }

  bool isShuffling() {
    return _audioPlayer.shuffleModeEnabled;
  }

  /// =============================================================
  /// VOLUME
  /// =============================================================
  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  double getCurrentVolume() {
    return _audioPlayer.volume;
  }

  /// =============================================================
  /// STATE GETTERS (FOR UI & ACTIONS)
  /// =============================================================
  bool isPlaying() {
    return _audioPlayer.playing;
  }

  int getCurrentPositionOfAudio() {
    return _audioPlayer.position.inSeconds;
  }

  int getTotalDurationOfAudio() {
    return _audioPlayer.duration?.inSeconds ?? 0;
  }

  int get currentIndex => _currentIndex;

  /// =============================================================
  /// CLEANUP
  /// =============================================================
  void dispose() {
    _audioPlayer.dispose();
  }
}

/// ============================================================= INVISIBLE
/// WIDGET (SAFE FOR STACK + OVERLAY)
/// =============================================================
class ThatAudioPlayer extends StatefulWidget {
  const ThatAudioPlayer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ThatAudioPlayer> createState() => _ThatAudioPlayerState();
}

class _ThatAudioPlayerState extends State<ThatAudioPlayer> {
  final ThatAudioPlayerState _player = ThatAudioPlayerState();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Invisible + non-blocking
    return const IgnorePointer(
      ignoring: true,
      child: SizedBox.shrink(),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
