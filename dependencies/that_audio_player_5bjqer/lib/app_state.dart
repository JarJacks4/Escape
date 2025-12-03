import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isMiniPlayerVisible =
          prefs.getBool('ff_isMiniPlayerVisible') ?? _isMiniPlayerVisible;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentMedia')) {
        try {
          final serializedData = prefs.getString('ff_currentMedia') ?? '{}';
          _currentMedia =
              MediaStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dummyMedia = prefs
              .getStringList('ff_dummyMedia')
              ?.map((x) {
                try {
                  return MediaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dummyMedia;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isThatAudioPlayerPlaying = false;
  bool get isThatAudioPlayerPlaying => _isThatAudioPlayerPlaying;
  set isThatAudioPlayerPlaying(bool value) {
    _isThatAudioPlayerPlaying = value;
  }

  bool _isThatAudioPlayerShuffling = false;
  bool get isThatAudioPlayerShuffling => _isThatAudioPlayerShuffling;
  set isThatAudioPlayerShuffling(bool value) {
    _isThatAudioPlayerShuffling = value;
  }

  double _totalDurationOfAudioInSeconds = 0.1;
  double get totalDurationOfAudioInSeconds => _totalDurationOfAudioInSeconds;
  set totalDurationOfAudioInSeconds(double value) {
    _totalDurationOfAudioInSeconds = value;
  }

  double _currentPositionOfAudioInSeconds = 0.0;
  double get currentPositionOfAudioInSeconds =>
      _currentPositionOfAudioInSeconds;
  set currentPositionOfAudioInSeconds(double value) {
    _currentPositionOfAudioInSeconds = value;
  }

  double _currentAudioVolume = 1.0;
  double get currentAudioVolume => _currentAudioVolume;
  set currentAudioVolume(double value) {
    _currentAudioVolume = value;
  }

  double _audioBufferedPosition = 0.0;
  double get audioBufferedPosition => _audioBufferedPosition;
  set audioBufferedPosition(double value) {
    _audioBufferedPosition = value;
  }

  bool _isMiniPlayerVisible = false;
  bool get isMiniPlayerVisible => _isMiniPlayerVisible;
  set isMiniPlayerVisible(bool value) {
    _isMiniPlayerVisible = value;
    prefs.setBool('ff_isMiniPlayerVisible', value);
  }

  MediaStruct _currentMedia = MediaStruct();
  MediaStruct get currentMedia => _currentMedia;
  set currentMedia(MediaStruct value) {
    _currentMedia = value;
    prefs.setString('ff_currentMedia', value.serialize());
  }

  void updateCurrentMediaStruct(Function(MediaStruct) updateFn) {
    updateFn(_currentMedia);
    prefs.setString('ff_currentMedia', _currentMedia.serialize());
  }

  List<MediaStruct> _dummyMedia = [
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3\",\"mediaArtist\":\"Kangaroo\",\"mediaTitle\":\"Kangaroo World\",\"mediaBanner\":\"https://picsum.photos/seed/432/600\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3\",\"mediaArtist\":\"Sevish\",\"mediaTitle\":\"Sevish does bad things\",\"mediaBanner\":\"https://picsum.photos/seed/717/600\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3\",\"mediaArtist\":\"Galaxy invaders\",\"mediaTitle\":\"Main theme\",\"mediaBanner\":\"https://picsum.photos/seed/855/600\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://commondatastorage.googleapis.com/codeskulptor-demos/riceracer_assets/music/race2.ogg\",\"mediaArtist\":\"Rice racer\",\"mediaTitle\":\"Race 2\",\"mediaBanner\":\"https://picsum.photos/seed/448/600\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3\",\"mediaArtist\":\"Music\",\"mediaTitle\":\"Background Music\",\"mediaBanner\":\"https://picsum.photos/seed/788/600\"}'))
  ];
  List<MediaStruct> get dummyMedia => _dummyMedia;
  set dummyMedia(List<MediaStruct> value) {
    _dummyMedia = value;
    prefs.setStringList(
        'ff_dummyMedia', value.map((x) => x.serialize()).toList());
  }

  void addToDummyMedia(MediaStruct value) {
    dummyMedia.add(value);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void removeFromDummyMedia(MediaStruct value) {
    dummyMedia.remove(value);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDummyMedia(int index) {
    dummyMedia.removeAt(index);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void updateDummyMediaAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    dummyMedia[index] = updateFn(_dummyMedia[index]);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDummyMedia(int index, MediaStruct value) {
    dummyMedia.insert(index, value);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  int _currentMediaIndex = 0;
  int get currentMediaIndex => _currentMediaIndex;
  set currentMediaIndex(int value) {
    _currentMediaIndex = value;
  }

  String _loopMode = '';
  String get loopMode => _loopMode;
  set loopMode(String value) {
    _loopMode = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
