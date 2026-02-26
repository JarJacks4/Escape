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

  List<MediaStruct> _currentMediaMusicMeditations = [
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Binaural%20Alpha%20-%20Syntropy.mp3?alt=media&token=7360273c-e63b-4a8d-94f3-c179e8c92a43\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Binaural Alpha\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-wolfart-10082927.jpg?alt=media&token=a9db7de6-ea99-4c42-be53-bf8fe27d8a87\",\"Genre\":\"Music Meditations\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Binaural%20Cloud%20(Alpha%207%20Hz)%20-%20Syntropy.mp3?alt=media&token=77c3037b-396c-490f-ab32-e1630b556db7\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Binaural Cloud (Alpha 7 Hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-tracehudson-7241400.jpg?alt=media&token=0fac6b37-42d3-4a87-a8da-30efe12bb44a\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Birdsong%20by%20the%20River%20-%20Center%20of%20Attention.mp3?alt=media&token=9ee2f718-f2a1-4edc-8f15-68cfd6427f8f\",\"mediaArtist\":\"Center of Attention\",\"mediaTitle\":\"Birdsong by the River\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-tobiasbjorkli-2239485.jpg?alt=media&token=97255f3d-131c-4366-9b5c-3e4207739f36\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"hhttps://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Carried%20by%20Current%20-%20Valante.mp3?alt=media&token=bffada8b-b30b-490b-bcfb-2f762db104dc\",\"mediaArtist\":\"Valante\",\"mediaTitle\":\"Carried by Current\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-ourpicstoyou-org-733507-1577610.jpg?alt=media&token=862b3d17-94e8-4172-a00f-d519dbc99312\",\"Genre\":\"Music Meditations\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Convexations%20-%20Syntropy.mp3?alt=media&token=6e351e5c-95c4-431c-83d4-25934594e2a9\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Convexations\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-olesia-libra-417944690-15378631.jpg?alt=media&token=6a821e18-7a1d-4388-bbca-659c8086f481\",\"Genre\":\"Music Meditations\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Crowned%20With%20Spirit%20-%20Valante.mp3?alt=media&token=a9d0696e-e083-4a8c-b1e9-a41111614f9a\",\"mediaArtist\":\"Valante\",\"mediaTitle\":\"Corwned With Spirit\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-mikhail-nilov-8108400.jpg?alt=media&token=78c0f4e6-4b36-4ab2-be94-b8b07046dc67\",\"Genre\":\"Music Meditations\",\"Mood\":\"Expressive\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Crystalis%20-%20Joseph%20Beg.mp3?alt=media&token=41d57733-bd27-4875-a30b-06ed5d1a8ae4\",\"mediaArtist\":\"Joseph Beg\",\"mediaTitle\":\"Crystalis\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-marlon-martinez-505085-1450082.jpg?alt=media&token=067c5fc2-a76e-420e-9ac7-b441496a7a74\",\"Genre\":\"Music Meditations\",\"Mood\":\"Dreamy\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Filtered%20Smiles%20-%20baegel.mp3?alt=media&token=41ca94ce-24a7-47de-b378-fc1f5d7a4c26\",\"mediaArtist\":\"baegal\",\"mediaTitle\":\"Filtered Smiles\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-lina-pfeiffer-188403171-33417410.jpg?alt=media&token=fdd13622-1ddb-4a01-a907-34ab4156ec63\",\"Genre\":\"Music Meditations\",\"Mood\":\"Inspiring\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Floating%20through%20Clouds%20-%20Calm%20Shores.mp3?alt=media&token=53e840e3-4d15-4eeb-9aa9-dcd8b265ba1c\",\"mediaArtist\":\"Calm Shores\",\"mediaTitle\":\"FLoating Through Clouds\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-lidia-li-2152784403-32482695.jpg?alt=media&token=2742dba3-1c7b-4691-920e-f1a96dae19f6\",\"Genre\":\"Music Meditations\",\"Mood\":\"Calm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Floating%2C%20Floating%20-%20August%20Wilhelmsson.mp3?alt=media&token=aa515ef2-40f6-4c5b-9dc1-1f608c6fc565\",\"mediaArtist\":\"August Wilhemsson\",\"mediaTitle\":\"Floating, Floating\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-kellie-churchman-371878-1001682.jpg?alt=media&token=e6963461-869a-43d7-af5f-02ad76069aab\",\"Genre\":\"Music Meditations\",\"Mood\":\"Hopeful\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Havsdrommar%20-%20Center%20of%20Attention.mp3?alt=media&token=6e8e13f0-bc01-4a93-894b-51cd8e95f131\",\"mediaArtist\":\"Center of Attention\",\"mediaTitle\":\"Havsdrommar\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-kata-tsumuri-395883531-20031115.jpg?alt=media&token=5f4c25fc-1e64-4545-8ed6-e1f5adc10533\",\"Genre\":\"Music Meditations\",\"Mood\":\"Dreamy\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Incognito%20-%20ProdByCamz.mp3?alt=media&token=bb940309-5dd9-4db9-afa9-810cc676199f\",\"mediaArtist\":\"ProdByCamz\",\"mediaTitle\":\"Incognito\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-joerg-hartmann-626385254-19854780.jpg?alt=media&token=864ab32f-5111-4eef-a884-5ca586d57d68\",\"Genre\":\"Music Meditation\",\"Mood\":\"Afro-House\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Inner%20Motion%20-%20Amber%20Glow.mp3?alt=media&token=9b940fa2-476b-477c-a5ca-9d6418a3f89d\",\"mediaArtist\":\"Amber Glow\",\"mediaTitle\":\"inner Motion\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-fabianreck-17888996.jpg?alt=media&token=ba6e25ba-9479-4b6b-b54b-6e2ad761dfb5\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Just%20Surrender%20-%20Lars%20Meyer.mp3?alt=media&token=d714c8bb-08c9-41c8-930f-60abcae5e2a4\",\"mediaArtist\":\"Lars Meyer\",\"mediaTitle\":\"Just Surrender\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-job-26346659-9547631.jpg?alt=media&token=6cc13145-7992-409c-874b-df07de274021\",\"Genre\":\"Music Meditations\",\"Mood\":\"Creative\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Long%20Term%20and%20Ashes%20-%20Daniella%20Ljungsberg.mp3?alt=media&token=7737f806-f0e1-4605-a733-dac7d8da0f89\",\"mediaArtist\":\"Daniella Ljungsberg\",\"mediaTitle\":\"Long Term and Ashes\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-fabianreck-17888996.jpg?alt=media&token=ba6e25ba-9479-4b6b-b54b-6e2ad761dfb5\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ominous\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_M%20-%20Lofive.mp3?alt=media&token=2b273c8f-43c4-4310-b43a-6388f7f9ee89\",\"mediaArtist\":\"LoFive\",\"mediaTitle\":\"M\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-asadphoto-3426870.jpg?alt=media&token=ce77d7e0-b798-4931-86b8-52cc714d3cd9\",\"Genre\":\"Music Meditations\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Maniamaster%20-%20Lupus%20Nocte.mp3?alt=media&token=65c66140-af7a-4ad5-bc99-b16c2f2a66f7\",\"mediaArtist\":\"Lupus Nocte\",\"mediaTitle\":\"Maniamaster\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-afatihdagli-29574021.jpg?alt=media&token=7a417c20-70a5-4d1c-83bd-57adde60d0fe\",\"Genre\":\"Music Meditations\",\"Mood\":\"Nostalgia\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Midnight%20Call%20-%20Ben%20Elson.mp3?alt=media&token=5f837ef7-69b4-451b-b3bc-5f46bb3b077f\",\"mediaArtist\":\"Ben Olson\",\"mediaTitle\":\"Midnight Call\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FAlbum%20Art%2Fpexels-martin-de-arriba-25131490-6739524.jpg?alt=media&token=c9fbc754-a3a2-4caf-8b8e-7f641ea8c174\",\"Genre\":\"Music Meditations\",\"Mood\":\"Nostalgia\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Overboard%20-%20Mizlo.mp3?alt=media&token=7d4e9882-79ff-40b0-8c37-0f1b718e6649\",\"mediaArtist\":\"Mizlo\",\"mediaTitle\":\"Overboard\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FAlbum%20Art%2Fpexels-pramodtiwari-13594336.jpg?alt=media&token=36fb8d0b-2781-4b65-98ca-43f8889d531d\"}'))
  ];
  List<MediaStruct> get currentMediaMusicMeditations =>
      _currentMediaMusicMeditations;
  set currentMediaMusicMeditations(List<MediaStruct> value) {
    _currentMediaMusicMeditations = value;
  }

  void addToCurrentMediaMusicMeditations(MediaStruct value) {
    currentMediaMusicMeditations.add(value);
  }

  void removeFromCurrentMediaMusicMeditations(MediaStruct value) {
    currentMediaMusicMeditations.remove(value);
  }

  void removeAtIndexFromCurrentMediaMusicMeditations(int index) {
    currentMediaMusicMeditations.removeAt(index);
  }

  void updateCurrentMediaMusicMeditationsAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    currentMediaMusicMeditations[index] =
        updateFn(_currentMediaMusicMeditations[index]);
  }

  void insertAtIndexInCurrentMediaMusicMeditations(
      int index, MediaStruct value) {
    currentMediaMusicMeditations.insert(index, value);
  }

  List<MediaStruct> _currentMediaFocus = [
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_3rd%20Solar%20Plexus%20Chakra%20Kundalini%20Breathing%20-%20369.mp3?alt=media&token=5de197f0-cc17-4f40-aac3-30516002228b\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_3rd Solar Plexus Chakra Kundalini Breathing\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-afroromanzo-5483044.jpg?alt=media&token=1b740591-be79-4dbc-9f08-b972bb851a66\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"Hello World\",\"mediaArtist\":\"Hello World\",\"mediaTitle\":\"Hello World\",\"mediaBanner\":\"https://picsum.photos/seed/259/600\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Already%20Know%20(Instrumental%20Version)%20-%20DAJANA.mp3?alt=media&token=1b86de22-1051-4dd7-b859-d340410ca2e6\",\"mediaArtist\":\"DAJANA\",\"mediaTitle\":\"Already Know (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rethaferguson-3059892.jpg?alt=media&token=1afc68f7-6e73-4c49-bd38-5ae6c281cb9f\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Binaural%20Alpha%20-%20Syntropy.mp3?alt=media&token=b4ddf9de-857b-4f08-9c81-a0db8508941f\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Binaural (Alpha)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-ravikant-5337636.jpg?alt=media&token=b1fab4c5-b62b-4e04-bdb9-df80ef51a82f\",\"Genre\":\"Focus\",\"Mood\":\"Cerebral\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Binaural Cloud (Alpha 7 Hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-ravikant-5337636.jpg?alt=media&token=b1fab4c5-b62b-4e04-bdb9-df80ef51a82f\",\"Genre\":\"Focus\",\"Mood\":\"Stress-Reducing\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"mediaArtist\":\"Magonia\",\"mediaTitle\":\"Binaural Schumann Alpha\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rafaalem-14847096.jpg?alt=media&token=6bedac41-aeb3-4911-9105-803475a45043\",\"Genre\":\"Focus\",\"Mood\":\"Cerebral\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Clairvoyance%20(Alpha%20Waves%208%20hz)%20-%20Syntropy.mp3?alt=media&token=6c03a6ed-0143-4087-8cbb-187ca173f66a\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Clairvoyance (Alpha Waves 8 hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rafaalem-14845614.jpg?alt=media&token=42db3023-ad81-4351-8a77-dbf5a8385a9c\",\"Genre\":\"Focus\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Clairvoyance%20(Alpha%20Waves%208%20hz)%20-%20Syntropy.mp3?alt=media&token=6c03a6ed-0143-4087-8cbb-187ca173f66a\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Clairvoyance (Alpha Waves 8 hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rafaalem-14845614.jpg?alt=media&token=42db3023-ad81-4351-8a77-dbf5a8385a9c\",\"Genre\":\"Focus\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Crystalimbic%20(Beta%20Waves)%20-%20Syntropy.mp3?alt=media&token=d1e8a2f9-f043-48bd-a982-39baee344c42\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Crystalimbic (Beta Waves)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pnw-prod-8980953.jpg?alt=media&token=4e0e92e5-eb17-4474-96e2-9b27e80150fe\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_D.W.B%20(Instrumental%20Version)%20-%20Norman%20Sann.mp3?alt=media&token=61796edc-58e0-4195-9837-9d6936136ab8\",\"mediaArtist\":\"Norman Sann\",\"mediaTitle\":\"ES_D.W.B (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pnw-prod-8980943.jpg?alt=media&token=ec542353-6ed3-43af-a327-c4b2972c9005\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Dance%20in%20the%20Light%20(Instrumental%20Version)%20-%20Hector%20Gabriel.mp3?alt=media&token=11f058f8-98c1-417d-a2d1-5b081dc1b9c3\",\"mediaArtist\":\"Hector Gabriel\",\"mediaTitle\":\"Dance in the Light (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pixabay-159193.jpg?alt=media&token=6adb486b-cb8e-4a4d-a7d7-4ff83ca326bb\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Focus%20On%20the%20Moment%20-%20Trevor%20Kowalski.mp3?alt=media&token=b5a9c165-452f-4fa0-9cd6-5d546e28d1bf\",\"mediaArtist\":\"Trevor Kawalski\",\"mediaTitle\":\"Focus on The Moment\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pattjjee-18156531.jpg?alt=media&token=41dbc742-bbfe-491c-a2d2-741bcbb8c0e3\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Focused%20-%20Damma%20Beatz.mp3?alt=media&token=fce16c23-fcb0-4259-a282-9007cc5e6cf5\",\"mediaArtist\":\"Dama Beatz\",\"mediaTitle\":\"Focused\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-nicollazzi-xiong-208366-668353.jpg?alt=media&token=d4929129-60d7-4861-b41b-f36e50bc9f44\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Forest%20Summer%20High%20Pitched%20Birds%20-%20Epidemic%20Sound.mp3?alt=media&token=6ff92b49-2dd7-4683-8e08-37430ce102d1\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"Forest Summer High Pitched Birds\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-marleneleppanen-16981566.jpg?alt=media&token=cbbfad0b-f246-4a54-8b76-2449050f7e05\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_I\'m%20Summer%20(Instrumental%20Version)%20-%20Zorro.mp3?alt=media&token=44b91186-d6ce-4397-b05b-11e9f913cefa\",\"mediaArtist\":\"Zorro\",\"mediaTitle\":\"I\'m Summer (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-koolshooters-8534781.jpg?alt=media&token=39475db4-beff-4202-9761-5955c2f2ea9f\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Koan%20II%20(Alpha%2010%20Hz)%20-%20Syntropy.mp3?alt=media&token=7cc8c805-3ef2-4d8f-a3e8-9f9618321095\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Koan II (Alpha 10 Hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-klub-boks-1437055-10868847.jpg?alt=media&token=4f37f5af-56c3-45e8-84b5-46f91a789a7d\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Meant%20to%20Be%20(Instrumental%20Version)%20-%20Mimmi%20Bangoura.mp3?alt=media&token=776950c9-8695-4902-857a-06cda02a3c9c\",\"mediaArtist\":\"Mimi Bangoura\",\"mediaTitle\":\"Meant to Be (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-hebertsantos-8461246.jpg?alt=media&token=fb7f5f49-ade9-4c6a-a6b8-b7c46c618542\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Might%20As%20Well%20Be%20on%20the%20Moon%20(Instrumental%20Version)%20-%20Mimmi%20Bangoura.mp3?alt=media&token=6ad8b314-fb58-4be8-baeb-aa99f4ca780f\",\"mediaArtist\":\"Mimi Bangoura\",\"mediaTitle\":\"Might As Well Be on the Moon (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-gustavodenuncio-31923252.jpg?alt=media&token=d08baf5e-a3a7-4e37-8f61-17a342c31c11\",\"Genre\":\"Focus\",\"Mood\":\"Cultured\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_My%20Deja%20Vu%20(Instrumental%20Version)%20-%20Ira%20Moon.mp3?alt=media&token=40473f6c-9135-4b60-b815-b8ad563eddad\",\"mediaArtist\":\"Ira Moon\",\"mediaTitle\":\"My Deja Vu (Instrumental Version)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-fotios-photos-13230724.jpg?alt=media&token=1e22bd64-a354-4bb3-bcf0-697f2fc85190\",\"Genre\":\"Focus\",\"Mood\":\"Chill\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Nordic%20Sunrise%20(Alpha%20Drone%208Hz)%20-%20Bruce%20Brus.mp3?alt=media&token=dd363342-9f64-4459-a89e-4e48d35d194c\",\"mediaArtist\":\"Bruce Brus\",\"mediaTitle\":\"Nordic Sunrise (Alpha Drone 8Hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-faruktokluoglu-10063057.jpg?alt=media&token=6b505e90-1c3f-48db-88e7-100e06efc633\",\"Genre\":\"Focus\",\"Mood\":\"Transformative\"}'))
  ];
  List<MediaStruct> get currentMediaFocus => _currentMediaFocus;
  set currentMediaFocus(List<MediaStruct> value) {
    _currentMediaFocus = value;
  }

  void addToCurrentMediaFocus(MediaStruct value) {
    currentMediaFocus.add(value);
  }

  void removeFromCurrentMediaFocus(MediaStruct value) {
    currentMediaFocus.remove(value);
  }

  void removeAtIndexFromCurrentMediaFocus(int index) {
    currentMediaFocus.removeAt(index);
  }

  void updateCurrentMediaFocusAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    currentMediaFocus[index] = updateFn(_currentMediaFocus[index]);
  }

  void insertAtIndexInCurrentMediaFocus(int index, MediaStruct value) {
    currentMediaFocus.insert(index, value);
  }

  List<MediaStruct> _currentMediaAllTab = [
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Pictures%20of%20a%20Floating%20World%20-%20Chaxti.mp3?alt=media&token=1e895060-abaa-4438-8afb-8eac642ae1e8\",\"mediaArtist\":\"Chaxti\",\"mediaTitle\":\"Pictures of a Floating World\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-99gallery-19821544.jpg?alt=media&token=7efce314-3453-4918-94d3-b0b490f40b5a\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Pisces%20-%20Sayuri%20Hayashi%20Egnell.mp3?alt=media&token=99018083-7b9f-4d16-9029-0490f5d38320\",\"mediaArtist\":\"Sayuri Hayashi Egnell\",\"mediaTitle\":\"Pisces\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-petkevich-evgeniy-16986035.jpg?alt=media&token=f1d4ffc6-0fb9-4072-b70a-d56f2e213e50\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Samadhi%20(Alpha%2010%20hz)%20-%20Syntropy.mp3?alt=media&token=9b670f55-371f-4036-b611-554914d87416\",\"mediaArtist\":\"Syntropy\",\"mediaTitle\":\"Samadhi (Alpha 10 hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-a-darmel-6940245.jpg?alt=media&token=a118320c-a7f2-45c5-b22f-5af603dbddac\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Sight%20of%20Summer%2089%20-%20Colors%20of%20Illusion.mp3?alt=media&token=b76ebfc3-99b7-4e67-aa73-3e0f11fabe3c\",\"mediaArtist\":\"Colors of Illusion\",\"mediaTitle\":\"Sight of Summer 89\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-a-darmel-6940514.jpg?alt=media&token=8e66303d-0259-4095-bd40-a647acb62cca\",\"Genre\":\"All\",\"Mood\":\"Nostalgia\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Soothing%20Sitars%20-%20Palace%20on%20Wheels.mp3?alt=media&token=d337cd57-133a-4f99-8ba1-5ab03864fb9a\",\"mediaArtist\":\"Palace on Wheels\",\"mediaTitle\":\"Soothing Sitars\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alena-shekhovtcova-6074959.jpg?alt=media&token=ace1b265-d412-4fc4-acfa-cb54fa46c7ca\",\"Genre\":\"All\",\"Mood\":\"Nostalgia\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Stillpoint%20-%20Center%20of%20Attention.mp3?alt=media&token=c8540da6-5938-42af-9360-dbe1875b1aed\",\"mediaArtist\":\"Center of Attention\",\"mediaTitle\":\"Stillpoint\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alexeydemidov-10482161.jpg?alt=media&token=7cd19610-d2aa-4959-bd91-37e93f663451\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Summer%20Breeze%20-%20Ben%20Elson.mp3?alt=media&token=8ffc766f-3974-4828-a2d3-2251d1a22065\",\"mediaArtist\":\"Ben Olson\",\"mediaTitle\":\"Summer Breeze\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alexeydemidov-10596388.jpg?alt=media&token=ccba8a64-2143-443c-a6c8-bd13c4fd49d6\",\"Genre\":\"All\",\"Mood\":\"Nostalgia\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Tenuous%20Waves%20-%20Elin%20Piel.mp3?alt=media&token=b38f9cb3-0e42-48d0-a129-fd3ee7d9916c\",\"mediaArtist\":\"Elin Piel\",\"mediaTitle\":\"Tenuous Waves\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alexeydemidov-10614526.jpg?alt=media&token=e413986f-0444-4875-b0dd-4dabdeaa8dd2\",\"Genre\":\"All\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Vata%20-%20Year%20of%20the%20Deer.mp3?alt=media&token=166e1b40-dbca-41e5-8d54-9507cce85d01\",\"mediaArtist\":\"Year of the Deer\",\"mediaTitle\":\"Vata\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-marek-piwnicki-3907296-17651134.jpg?alt=media&token=67b55468-cca8-4022-9595-8a5269c2d5e1\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Wallpaper%20Game%20-%20Hara%20Noda.mp3?alt=media&token=bc2e4b2c-ac63-4d1f-b4d8-a77e93b97db3\",\"mediaArtist\":\"Hara Noda\",\"mediaTitle\":\"Wallpaper Game\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-marek-piwnicki-3907296-27852890.jpg?alt=media&token=08a3d976-981a-4030-a607-884b06594041\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_I%20Will%20Be%20Right%20Here%20With%20You%20-%20Wendy%20Marcini.mp3?alt=media&token=d848d311-3c19-450f-a5ce-1ce13972ff23\",\"mediaArtist\":\"Wendy Marcini\",\"mediaTitle\":\"I Will Be Right Here With You\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-matteo-angeloni-106557007-14213760.jpg?alt=media&token=b2266afd-684d-4041-92c1-f7b9a4477972\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Intermission%20Clouds%20-%20Jonah%20Aardekker.mp3?alt=media&token=5568e10a-f15d-4c7c-a0de-bb94cf0e6442\",\"mediaArtist\":\"Jonah Aardekker\",\"mediaTitle\":\"Intermission Clouds\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-mauricio-krupka-buendia-1141363850-30509382.jpg?alt=media&token=94517a4c-0d7e-4d1c-956d-94ab54c1d2d3\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Lake%20Como%20Nights%20-%20Wendy%20Marcini.mp3?alt=media&token=65f84828-dc2c-4ca6-8380-86c372eba344\",\"mediaArtist\":\"Wendy Marcini\",\"mediaTitle\":\"Lake Como Nights\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-mitbg000-29204174.jpg?alt=media&token=6e8b1fc5-6386-486a-a96f-dd0c11d42171\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Late%20Night%20Friends%20-%20Sugoi.mp3?alt=media&token=981992a0-7e46-495e-981c-549ae1da16fa\",\"mediaArtist\":\"Sugoi\",\"mediaTitle\":\"Late Night Friends\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-mitbg000-29204174.jpg?alt=media&token=6e8b1fc5-6386-486a-a96f-dd0c11d42171\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Moonflower%20-%20Wendy%20Marcini.mp3?alt=media&token=a42cd96c-19d4-49dc-a7ce-faab256a2414\",\"mediaArtist\":\"Wendy Marcini\",\"mediaTitle\":\"Moonflower\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-necatiomerk-28977069.jpg?alt=media&token=d602c672-c469-4636-a9f5-37d7ceecf828\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Oak%20and%20Marble%20-%20Martin%20Landstrom.mp3?alt=media&token=cb37bb58-0d62-4e48-b751-7ad4bd1ed8db\",\"mediaArtist\":\"Martin Landstrom\",\"mediaTitle\":\"Oak and Marble\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-nextvoyage-1470405.jpg?alt=media&token=3bff1a90-73e1-4359-bb82-9e110fdc3bc9\",\"Genre\":\"All\",\"Mood\":\"Jazz\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Turn%20Again%20-%20By%20Lotus.mp3?alt=media&token=f67510a6-e1ec-48d7-b203-99ebdb3b99db\",\"mediaArtist\":\"By Lotus\",\"mediaTitle\":\"Turn Again\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-paolo-sanchez-2149881372-34986211.jpg?alt=media&token=05411cd5-1d47-42b5-9444-cb82c60ff223\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Titane%20-%20ELFL.mp3?alt=media&token=0a3469fe-e3c8-4025-a6d4-7e85f6cad6e9\",\"mediaArtist\":\"ELFL\",\"mediaTitle\":\"Titane\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-perqued-13722886.jpg?alt=media&token=fd09af68-a911-421a-88fc-f994320be6a0\",\"Genre\":\"All\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Akira%20-%20AGST.mp3?alt=media&token=8e287dbb-a15f-47fb-8a8a-54558056a432\",\"mediaArtist\":\"AGST\",\"mediaTitle\":\"Akira\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guvo59-28553959.jpg?alt=media&token=189bdb4a-9690-498a-b7a7-aac6941e3aa6\",\"Genre\":\"All\",\"Mood\":\"Uplifting\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Fractal%20Echoes%20-%20Luba%20Hilman.mp3?alt=media&token=093004f6-fbc5-41c7-9cb8-11fae45571f4\",\"mediaArtist\":\"Luba Hilman\",\"mediaTitle\":\"Fractal Echoes\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guy-lebreton-2621719-4197781.jpg?alt=media&token=51a0ccdd-57e8-4c80-b5b1-2860fb330fa3\",\"Genre\":\"All\",\"Mood\":\"Ominous\"}'))
  ];
  List<MediaStruct> get currentMediaAllTab => _currentMediaAllTab;
  set currentMediaAllTab(List<MediaStruct> value) {
    _currentMediaAllTab = value;
  }

  void addToCurrentMediaAllTab(MediaStruct value) {
    currentMediaAllTab.add(value);
  }

  void removeFromCurrentMediaAllTab(MediaStruct value) {
    currentMediaAllTab.remove(value);
  }

  void removeAtIndexFromCurrentMediaAllTab(int index) {
    currentMediaAllTab.removeAt(index);
  }

  void updateCurrentMediaAllTabAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    currentMediaAllTab[index] = updateFn(_currentMediaAllTab[index]);
  }

  void insertAtIndexInCurrentMediaAllTab(int index, MediaStruct value) {
    currentMediaAllTab.insert(index, value);
  }

  List<MediaStruct> _currentMediaNatureTab = [
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Birds%20Chirping%2C%20Light%20Rain%2C%20Light%20Wind%20-%20Epidemic%20Sound.mp3?alt=media&token=08dba522-5c06-4941-b91e-a5e2d1263fcf\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Birds Chirping, Light Rain, Light Wind\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guy-lebreton-2621719-4197781.jpg?alt=media&token=51a0ccdd-57e8-4c80-b5b1-2860fb330fa3\",\"Genre\":\"Nature\",\"Mood\":\"Calm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Birds%2C%20Distant%20Walla%2C%20Light%20Traffic%2C%20Children%2001%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=df623d91-afa1-4b9d-9f2e-422cdcb8028a\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Birds, Distant Walla, Light Traffic, Children 01\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guvo59-28553959.jpg?alt=media&token=189bdb4a-9690-498a-b7a7-aac6941e3aa6\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Countryside%2C%20Birds%20Chirping%2C%206PM%2C%20Wind%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=30ca7cf6-f366-466c-8cca-9defaf6654b0\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Countryside, Birds Chirping, 6PM, Wind\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-aisling-kerr-2999317-17808903.jpg?alt=media&token=1c56200a-0a06-4355-bc1c-00b88e65c0d2\",\"Genre\":\"Nature\",\"Mood\":\"Calm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Countryside%2C%20Birds%2C%20Wind%2C%20Distant%20Traffic%2C%20Engine%20Starts%2C%20Idle%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=7d3c6ea7-214f-496b-9e80-de763abcd7d0\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Countryside, Birds, Wind, Distant Traffic, Engine Starts, Idle\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-adrien-olichon-1257089-13244510.jpg?alt=media&token=4aaddb47-b52b-4879-8795-b9593755eae6\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Countryside%2C%20Birds%2C%20Wind%2C%20Distant%20Traffic%2C%20Engine%20Starts%2C%20Idle%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=7d3c6ea7-214f-496b-9e80-de763abcd7d0\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Countryside, Birds, Wind, Distant Traffic, Engine Starts, Idle\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-adrien-olichon-1257089-13244510.jpg?alt=media&token=4aaddb47-b52b-4879-8795-b9593755eae6\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Creek%2C%20Medium%20Stream%2C%202m%20-%20Epidemic%20Sound.mp3?alt=media&token=48427ab0-93d2-47fb-9a14-19ddeb0b8d2b\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Creek, Medium Stream, 2m\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-anna-gosciniak-3666306-5678734.jpg?alt=media&token=989df73f-4ca0-4486-b2bb-caf40a754dfa\",\"Genre\":\"Nature\",\"Mood\":\"Serene\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Day%2C%20Birds%2C%20Insects%2C%20Yellowstone%20National%20Park%2C%20Wyoming%2002%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=63c16097-06e8-4760-bba0-3fb41b42a17d\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Day, Birds, Insects, Yellowstone National Park, Wyoming 02\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-anna-hinckel-3008225-4598880.jpg?alt=media&token=251aa1d2-f9e3-4213-9903-73118fe70de2\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Dunes%20-%20Valante.mp3?alt=media&token=20781d7e-a24a-42ad-a7e7-0e7701446641\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Dunes - Valante\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-benjamin-walsham-159059246-11213644.jpg?alt=media&token=d0dd06e9-7b3d-4a9d-9678-2800795ba46d\",\"Genre\":\"Nature\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Field%20With%20Crickets%2C%20Distant%20Traffic%2C%20Night%2001%20-%20Epidemic%20Sound.mp3?alt=media&token=42ccf790-53b1-4c46-b9a4-93561ceac2b7\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Field With Crickets, Distant Traffic, Night 01\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-blooddrainer-6805628.jpg?alt=media&token=bb09fb44-f59d-4f60-8e7a-9dfd55b59628\",\"Genre\":\"Nature\",\"Mood\":\"Calm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Fire%20Whooshes%2C%20Fast%20-%20Epidemic%20Sound.mp3?alt=media&token=cd45b1f0-c08a-4618-a37d-e254213ff390\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Fire Whooshes, Fast\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-sidde-62197501-9532342.jpg?alt=media&token=1e44078d-accb-47ad-819e-e3a428a26a9e\",\"Genre\":\"Nature\",\"Mood\":\"Warm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Fire%2C%20Designed%20-%20Epidemic%20Sound.mp3?alt=media&token=b55df8d8-a040-4f93-8d2c-71508c7d98e6\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Fire, Designed\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-rgfd-4497960.jpg?alt=media&token=a258a111-242f-4d12-86da-3ed542bca901\",\"Genre\":\"Nature\",\"Mood\":\"Warm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Floor%20Stove%2C%20Cabin%2C%20Heating%20Clicks%2C%20Room%20-%20Epidemic%20Sound.mp3?alt=media&token=71fde7d3-0637-4a6f-bb3c-2ba46f14c6ed\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Floor Stove, Cabin, Heating Clicks, Room\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-mikhail-nilov-6623917.jpg?alt=media&token=756dc881-6835-4146-b173-0302187820ba\",\"Genre\":\"Nature\",\"Mood\":\"Warm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Forest%20Ambience%20Birds%2C%20Squirel%20Calls%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=b39e2ff5-fae3-46f7-bb98-53069f5ecda4\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Forest Ambience Birds, Squirel Calls\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-julia-volk-5652990.jpg?alt=media&token=0ee8a0a1-641d-4acd-8827-a390a6eea361\",\"Genre\":\"Nature\",\"Mood\":\"Inspired\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Forest%20Lullaby%20-%20Center%20of%20Attention.mp3?alt=media&token=b2c886bd-91e6-43e7-bf0f-dea368fa0076\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Forest Lullaby - Center of Attention\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-doma-16274147.jpg?alt=media&token=cef64c86-b9cf-4d39-91eb-18cf6f59e362\",\"Genre\":\"Nature\",\"Mood\":\"Calm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Forest%20Summer%20High%20Pitched%20Birds%20-%20Epidemic%20Sound.mp3?alt=media&token=f1a6a7a1-1961-470f-9bad-67d491379737\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Forest Summer High Pitched Birds\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-jayde-8463686.jpg?alt=media&token=4efe4f63-2c25-4e7a-9ab9-8858da4900d0\",\"Genre\":\"Nature\",\"Mood\":\"Serene\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Meadow%2C%20Summer%2C%20Birds%20Sing%2C%20Wind%2C%20Light%20Rustle%20In%20Trees%20-%20Epidemic%20Sound.mp3?alt=media&token=36214f17-7366-424c-a553-568b81d3e20a\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Meadow, Summer, Birds Sing, Wind, Light Rustle In Trees\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-jeronimo-spasoff-294202650-14060282.jpg?alt=media&token=14e3dc71-d720-4c81-ad23-280cfaaf64e8\",\"Genre\":\"Nature\",\"Mood\":\"Serene\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Murmurations%20-%20Hanna%20Lindgren.mp3?alt=media&token=3ce7a245-c702-4054-8a90-197a379ff3d8\",\"mediaArtist\":\"Hanna Lindgren\",\"mediaTitle\":\"ES_Murmurations\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-joni-tuohimaa-1936935-12736977.jpg?alt=media&token=63b18f35-3170-4ddf-be34-ad5dd347d951\",\"Genre\":\"Nature\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Ocean%2C%20Crashing%20In%20On%20Beach%2C%20Foam%20Details%20-%20Epidemic%20Sound.mp3?alt=media&token=cbb8b65a-2ae4-465c-9917-a340705d772a\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES_Ocean, Crashing In On Beach, Foam Details\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-jothamsutharson-12587288.jpg?alt=media&token=a092f712-0f6b-4b10-99e2-25a914725fd0\",\"Genre\":\"Nature\",\"Mood\":\"Calm\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Osiris%20-%20Ben%20Elson.mp3?alt=media&token=a4a4b8f0-0a76-43d4-b7e7-c1d94bed49f2\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"ES Osiris\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-katie-mukhina-975382726-33463120.jpg?alt=media&token=03c0cda8-a810-469d-bb66-7533afb0c510\",\"Genre\":\"Nature\",\"Mood\":\"Ambient\"}'))
  ];
  List<MediaStruct> get currentMediaNatureTab => _currentMediaNatureTab;
  set currentMediaNatureTab(List<MediaStruct> value) {
    _currentMediaNatureTab = value;
  }

  void addToCurrentMediaNatureTab(MediaStruct value) {
    currentMediaNatureTab.add(value);
  }

  void removeFromCurrentMediaNatureTab(MediaStruct value) {
    currentMediaNatureTab.remove(value);
  }

  void removeAtIndexFromCurrentMediaNatureTab(int index) {
    currentMediaNatureTab.removeAt(index);
  }

  void updateCurrentMediaNatureTabAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    currentMediaNatureTab[index] = updateFn(_currentMediaNatureTab[index]);
  }

  void insertAtIndexInCurrentMediaNatureTab(int index, MediaStruct value) {
    currentMediaNatureTab.insert(index, value);
  }

  List<MediaStruct> _currentMediaSleepTab = [
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Affirmations%20-%20Rocket%20Noise.mp3?alt=media&token=f7d2d7e9-cded-42ff-a293-34349e101f5f\",\"mediaArtist\":\"Rocket Noise\",\"mediaTitle\":\"Affirmations\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-carlos-montelara-3450804-5861727.jpg?alt=media&token=8e5ae3bf-a5c3-4e73-b232-bf8e6c0af287\",\"Genre\":\"Sleep\",\"Mood\":\"Binaural\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Alonia%20-%20Valante.mp3?alt=media&token=832fd567-12f5-4875-ac30-fdafca43064c\",\"mediaArtist\":\"Valante\",\"mediaTitle\":\"Alonia\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-clubhouseconvos-13620067.jpg?alt=media&token=d27dd553-56b2-4047-b49d-22857191eb45\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Ambient%20Area%2C%20Dark%20Hum%20-%20Epidemic%20Sound.mp3?alt=media&token=1a0a0ce8-bf04-408c-bd79-0f3b713ddc8b\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"Ambient Area, Dark Hum\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-clubhouseconvos-13620069.jpg?alt=media&token=14f4d998-0425-4aab-a37d-925833686838\",\"Genre\":\"Sleep\",\"Mood\":\"Real World\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Anantya%20Vihara%20-%20Valante.mp3?alt=media&token=36bfdadc-3e00-41aa-996b-9562819a2596\",\"mediaArtist\":\"Valante\",\"mediaTitle\":\"Anantya Vihara\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-0ldpikes-31636696.jpg?alt=media&token=0e8c1493-bb13-4128-be61-0e2bee66c4b6\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Brooding%20Ambience%20Space%20-%20Epidemic%20Sound.mp3?alt=media&token=822a74aa-f500-4e9e-9269-e5a87e4aebe4\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"Brooding Ambience Space\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-0ldpikes-31636696.jpg?alt=media&token=0e8c1493-bb13-4128-be61-0e2bee66c4b6\",\"Genre\":\"Sleep\",\"Mood\":\"White Noise\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Crickets%20Ambience%2C%20Night%2C%20Meadow%2003%20-%20Epidemic%20Sound.mp3?alt=media&token=5b718f1d-619a-4d15-9a1f-a47e1d062202\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"Crickets Ambience, Night, Meadow 03\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-67120628-8376091.jpg?alt=media&token=59bcde0e-44ea-49b6-a0cb-994201d5fd0f\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Designed%20Water%2C%20Aquarium%2C%20Bubbles%2003%20-%20Epidemic%20Sound.mp3?alt=media&token=edca8bd5-7422-4583-8fce-18e24e01fdbb\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"Designed Water, Aquarium, Bubbles 03\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-alina-rossoshanska-338724645-29319453.jpg?alt=media&token=3e65463f-0090-44f8-ac38-1b095790506a\",\"Genre\":\"Sleep\",\"Mood\":\"Calm Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Dream%20Focus%20Beta%20Waves%20(146-160%20Hz)%20-%20Mandala%20Dreams.mp3?alt=media&token=c85cdaeb-faad-4974-9683-f7c90fe2e925\",\"mediaArtist\":\"Mandala Dreams\",\"mediaTitle\":\"Dream Focus Beta Waves (146-160 Hz)\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-artbovich-6283973.jpg?alt=media&token=267a54f3-8ce8-4392-9399-4bfabf769b3a\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_End%20of%20a%20Dream%20-%20Hanna%20Lindgren.mp3?alt=media&token=b667a8c6-4e08-4d4f-b74e-24260c6584bf\",\"mediaArtist\":\"Hanna Lindgren\",\"mediaTitle\":\"End of a Dream\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-artbovich-6585625.jpg?alt=media&token=23e0cb7c-0605-40f7-95af-c4d6674f9387\",\"Genre\":\"Sleep\",\"Mood\":\"Ominous\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Enlightened%20Drift%20-%20Amber%20Glow.mp3?alt=media&token=5fca2b29-30b8-4ae6-bc94-b69dcbfb02ce\",\"mediaArtist\":\"Amber Glow\",\"mediaTitle\":\"Enlightened Drift\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-clubhouseconvos-13620071.jpg?alt=media&token=aa72c4a7-caac-4046-bb27-779b73e18478\",\"Genre\":\"Sleep\",\"Mood\":\"Calm Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Helt%20stilla%20-%20Blue%20Saga.mp3?alt=media&token=5f0aaf40-0847-47e0-a031-72768ab03771\",\"mediaArtist\":\"Blue Saga\",\"mediaTitle\":\"Helt stilla\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-durmussarica-10108905.jpg?alt=media&token=38aecb9c-9ee7-4d64-a68b-39b72fa3cffd\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Intermission%20-%20Hanna%20Lindgren.mp3?alt=media&token=02e5cbe9-08e2-4e99-a50b-9a676ced2f6d\",\"mediaArtist\":\"Hanna Lindgren\",\"mediaTitle\":\"Intermission\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-duygugungor-24038436.jpg?alt=media&token=0c36019f-ecc5-47db-925e-785a5f36c101\",\"Genre\":\"Sleep\",\"Mood\":\"Ominous\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Kindled%20-%20Valante.mp3?alt=media&token=981176ca-bebb-4e0c-a595-6503551c18c9\",\"mediaArtist\":\"Valante\",\"mediaTitle\":\"Kindled\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-efce-705477.jpg?alt=media&token=d55713a9-d314-40fa-8173-5fc610e2fdce\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Kokoro%20-%20Valante.mp3?alt=media&token=bd516146-1302-4f13-928f-3ccbc2394afe\",\"mediaArtist\":\"Valante\",\"mediaTitle\":\"Kokoro\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-ekaterina-bolovtsova-7445324.jpg?alt=media&token=51e47202-41b3-4354-8b03-d474b47dad56\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Living%20Room%2C%20Distant%20Traffic%2001%20-%20Epidemic%20Sound.mp3?alt=media&token=106d8c4c-552a-4f87-ac8a-a2749bc91510\",\"mediaArtist\":\"ES\",\"mediaTitle\":\"Living Room, Distant Traffic 01\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-ekaterina-bolovtsova-7445347.jpg?alt=media&token=b1e21f3c-ce46-4d92-989d-07e021d854eb\",\"Genre\":\"Sleep\",\"Mood\":\"White Noise\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Midnattssol%20-%20Strom.mp3?alt=media&token=18cfc2fe-6c81-4d08-ae24-063e68831a7f\",\"mediaArtist\":\"Strom\",\"mediaTitle\":\"Midnattssol\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-flavia-dias-127252601-34952201.jpg?alt=media&token=8c69868c-5b14-44cd-916d-ae481182770c\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Mirai%20-%20By%20Lotus.mp3?alt=media&token=73716ad6-16f4-41f5-b18d-e2c4e0b5a225\",\"mediaArtist\":\"By Lotus\",\"mediaTitle\":\"Mirai\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-flavia-dias-127252601-34952201.jpg?alt=media&token=8c69868c-5b14-44cd-916d-ae481182770c\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Murmurations%20-%20Hanna%20Lindgren.mp3?alt=media&token=4549b46f-ce49-4ce4-8c56-ec431a6962fb\",\"mediaArtist\":\"Hanna Lindgren\",\"mediaTitle\":\"Murmurations\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-guiirossi-1705073.jpg?alt=media&token=6e9e0bc2-c037-4a82-a5b2-e7e2fb9e8311\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Oppland%20-%20DEX%201200.mp3?alt=media&token=29cfd0b2-4089-4118-9aea-19c402a29cd1\",\"mediaArtist\":\"DEX 1200\",\"mediaTitle\":\"Oppland\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-houwng-nguyen-3756130-33521561.jpg?alt=media&token=0aa5de25-b0e4-4253-b8a6-cf392467b6fd\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}')),
    MediaStruct.fromSerializableMap(jsonDecode(
        '{\"mediaUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Sense%20of%20Relief%20-%20Hanna%20Lindgren.mp3?alt=media&token=d8a33e13-75d0-4388-ae7d-709251a9e952\",\"mediaArtist\":\"Hanna Lindgren\",\"mediaTitle\":\"Sense of Relief\",\"mediaBanner\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-introspectivedsgn-17716285.jpg?alt=media&token=583ff292-5aaf-4d09-bf9f-c3318cefe591\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\"}'))
  ];
  List<MediaStruct> get currentMediaSleepTab => _currentMediaSleepTab;
  set currentMediaSleepTab(List<MediaStruct> value) {
    _currentMediaSleepTab = value;
  }

  void addToCurrentMediaSleepTab(MediaStruct value) {
    currentMediaSleepTab.add(value);
  }

  void removeFromCurrentMediaSleepTab(MediaStruct value) {
    currentMediaSleepTab.remove(value);
  }

  void removeAtIndexFromCurrentMediaSleepTab(int index) {
    currentMediaSleepTab.removeAt(index);
  }

  void updateCurrentMediaSleepTabAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    currentMediaSleepTab[index] = updateFn(_currentMediaSleepTab[index]);
  }

  void insertAtIndexInCurrentMediaSleepTab(int index, MediaStruct value) {
    currentMediaSleepTab.insert(index, value);
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
