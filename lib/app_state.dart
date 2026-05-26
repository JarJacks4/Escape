import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _pointsEarned =
          await secureStorage.getInt('ff_pointsEarned') ?? _pointsEarned;
    });
    await _safeInitAsync(() async {
      _chatSessionId =
          await secureStorage.getString('ff_chatSessionId') ?? _chatSessionId;
      _chatSessionId = '';
    });
    await _safeInitAsync(() async {
      _ProfilePicture =
          await secureStorage.getString('ff_ProfilePicture') ?? _ProfilePicture;
    });
    await _safeInitAsync(() async {
      _AmbientMusic = (await secureStorage.getStringList('ff_AmbientMusic')) ??
          _AmbientMusic;
    });
    await _safeInitAsync(() async {
      _hasCompletedGoal = await secureStorage.getBool('ff_hasCompletedGoal') ??
          _hasCompletedGoal;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_currentMediaAllTab') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_currentMediaAllTab') ?? '{}';
          _currentMediaAllTab =
              SoundscapesStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _isMiniPlayerVisible =
          await secureStorage.getBool('ff_isMiniPlayerVisible') ??
              _isMiniPlayerVisible;
    });
    await _safeInitAsync(() async {
      _isFirstTimeUser =
          await secureStorage.getBool('ff_isFirstTimeUser') ?? _isFirstTimeUser;
    });
    await _safeInitAsync(() async {
      _hasCleansedRoot =
          await secureStorage.getBool('ff_hasCleansedRoot') ?? _hasCleansedRoot;
    });
    await _safeInitAsync(() async {
      _voiceNote = await secureStorage.getString('ff_voiceNote') ?? _voiceNote;
    });
    await _safeInitAsync(() async {
      _isAudioRecording = await secureStorage.getBool('ff_isAudioRecording') ??
          _isAudioRecording;
    });
    await _safeInitAsync(() async {
      _isFinishedIntroWalkthrough =
          await secureStorage.getBool('ff_isFinishedIntroWalkthrough') ??
              _isFinishedIntroWalkthrough;
    });
    await _safeInitAsync(() async {
      _pointsEarnedPercentage =
          await secureStorage.getDouble('ff_pointsEarnedPercentage') ??
              _pointsEarnedPercentage;
    });
    await _safeInitAsync(() async {
      _chakraRewardShown =
          await secureStorage.getBool('ff_chakraRewardShown') ??
              _chakraRewardShown;
    });
    await _safeInitAsync(() async {
      _isFirstTimeUsingEnergyScan =
          await secureStorage.getBool('ff_isFirstTimeUsingEnergyScan') ??
              _isFirstTimeUsingEnergyScan;
    });
    await _safeInitAsync(() async {
      _gorqKey = await secureStorage.getString('ff_gorqKey') ?? _gorqKey;
      _gorqKey = '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';
    });
    await _safeInitAsync(() async {
      _NewReorderedIndex = await secureStorage.getInt('ff_NewReorderedIndex') ??
          _NewReorderedIndex;
    });
    await _safeInitAsync(() async {
      _ReorderedVideosIndex =
          await secureStorage.getInt('ff_ReorderedVideosIndex') ??
              _ReorderedVideosIndex;
    });
    await _safeInitAsync(() async {
      _activeExerciseSessionID =
          await secureStorage.getString('ff_activeExerciseSessionID') ??
              _activeExerciseSessionID;
    });
    await _safeInitAsync(() async {
      _currentSoundscapeID =
          await secureStorage.getString('ff_currentSoundscapeID') ??
              _currentSoundscapeID;
    });
    await _safeInitAsync(() async {
      _exerciseID =
          await secureStorage.getString('ff_exerciseID') ?? _exerciseID;
    });
    await _safeInitAsync(() async {
      _messagesTheoryOfMind =
          (await secureStorage.getStringList('ff_messagesTheoryOfMind'))
                  ?.map((x) {
                    try {
                      return TheoryOfMindLucilleStreamChatStruct
                          .fromSerializableMap(jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _messagesTheoryOfMind;
    });
    await _safeInitAsync(() async {
      _hasSeenOnboarding =
          await secureStorage.getBool('ff_hasSeenOnboarding') ??
              _hasSeenOnboarding;
    });
    await _safeInitAsync(() async {
      _isEnergyScore =
          await secureStorage.getBool('ff_isEnergyScore') ?? _isEnergyScore;
    });
    await _safeInitAsync(() async {
      _energyScore =
          await secureStorage.getInt('ff_energyScore') ?? _energyScore;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<LatLng> _TherapistLocation = [];
  List<LatLng> get TherapistLocation => _TherapistLocation;
  set TherapistLocation(List<LatLng> value) {
    _TherapistLocation = value;
  }

  void addToTherapistLocation(LatLng value) {
    TherapistLocation.add(value);
  }

  void removeFromTherapistLocation(LatLng value) {
    TherapistLocation.remove(value);
  }

  void removeAtIndexFromTherapistLocation(int index) {
    TherapistLocation.removeAt(index);
  }

  void updateTherapistLocationAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    TherapistLocation[index] = updateFn(_TherapistLocation[index]);
  }

  void insertAtIndexInTherapistLocation(int index, LatLng value) {
    TherapistLocation.insert(index, value);
  }

  List<String> _newListLike = [];
  List<String> get newListLike => _newListLike;
  set newListLike(List<String> value) {
    _newListLike = value;
  }

  void addToNewListLike(String value) {
    newListLike.add(value);
  }

  void removeFromNewListLike(String value) {
    newListLike.remove(value);
  }

  void removeAtIndexFromNewListLike(int index) {
    newListLike.removeAt(index);
  }

  void updateNewListLikeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    newListLike[index] = updateFn(_newListLike[index]);
  }

  void insertAtIndexInNewListLike(int index, String value) {
    newListLike.insert(index, value);
  }

  int _videoId = 0;
  int get videoId => _videoId;
  set videoId(int value) {
    _videoId = value;
  }

  bool _isLiked = false;
  bool get isLiked => _isLiked;
  set isLiked(bool value) {
    _isLiked = value;
  }

  String _moods = '';
  String get moods => _moods;
  set moods(String value) {
    _moods = value;
  }

  List<String> _interests = [];
  List<String> get interests => _interests;
  set interests(List<String> value) {
    _interests = value;
  }

  void addToInterests(String value) {
    interests.add(value);
  }

  void removeFromInterests(String value) {
    interests.remove(value);
  }

  void removeAtIndexFromInterests(int index) {
    interests.removeAt(index);
  }

  void updateInterestsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    interests[index] = updateFn(_interests[index]);
  }

  void insertAtIndexInInterests(int index, String value) {
    interests.insert(index, value);
  }

  String _systemMessage =
      'You are a self-care expert and helpful assistant. Your name is Lucille and you answer people\'s queries regarding self care and well being. But you are NOT a medical doctor so always add a disclaimer with where required andrefrain from giving medical advise. If someone is suicidal please refer them tto suicide helplines.';
  String get systemMessage => _systemMessage;
  set systemMessage(String value) {
    _systemMessage = value;
  }

  bool _expandMenu = true;
  bool get expandMenu => _expandMenu;
  set expandMenu(bool value) {
    _expandMenu = value;
  }

  String _newName = '';
  String get newName => _newName;
  set newName(String value) {
    _newName = value;
  }

  String _moodPhoto = '';
  String get moodPhoto => _moodPhoto;
  set moodPhoto(String value) {
    _moodPhoto = value;
  }

  bool _isCompletedSelfCareTask = false;
  bool get isCompletedSelfCareTask => _isCompletedSelfCareTask;
  set isCompletedSelfCareTask(bool value) {
    _isCompletedSelfCareTask = value;
  }

  String _ImprovingThoughts = '';
  String get ImprovingThoughts => _ImprovingThoughts;
  set ImprovingThoughts(String value) {
    _ImprovingThoughts = value;
  }

  int _pointsEarned = 0;
  int get pointsEarned => _pointsEarned;
  set pointsEarned(int value) {
    _pointsEarned = value;
    secureStorage.setInt('ff_pointsEarned', value);
  }

  void deletePointsEarned() {
    secureStorage.delete(key: 'ff_pointsEarned');
  }

  String _deepFeelings = '';
  String get deepFeelings => _deepFeelings;
  set deepFeelings(String value) {
    _deepFeelings = value;
  }

  List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct> _ListTikTokPages = [
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"1\",\"urlvideo\":\"https://www.tiktok.com/@espdaniella/video/7134513581307170094?is_from_webapp=1&sender_device=pc&web_id=7417139841606190622\",\"userPicture\":\"https://p16-sign.tiktokcdn-us.com/tos-useast5-avt-0068-tx/4821848bee3ad650735de6e0a340e6df~tplv-tiktokx-cropcenter:100:100.jpeg?dr=9640&nonce=43282&refresh_token=f3c70edfeb36f0c406255ca6c14762fa&x-expires=1741240800&x-signature=ceDXgz4cMsclhnVSXINKhAaGfC4%3D&idc=useast8&ps=13740610&shcp=81f88b70&shp=a5d48078&t=4d5b0474\",\"profilename\":\"\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"10 Minute Singing Bowl Meditation\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"1\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994648/Download_7_ktaowq.mp4\",\"userPicture\":\"https://p16-common-sign-va.tiktokcdn-us.com/tos-maliva-avt-0068/a82b751c857ae97f7ec02cbe1e8e868f~tplv-tiktokx-cropcenter:100:100.jpeg?dr=9640&nonce=62492&refresh_token=a85c2120b0079f919aae0e6e3aaf2eee&x-expires=1741240800&x-signature=Q82qqMrdhlCwujjthOwBOgTvhyk%3D&idc=useast5&ps=13740610&shcp=b59d6b55&shp=a5d48078&t=4d5b0474\",\"profilename\":\"\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Deep Sleep Guided Meditation 528 Hz\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994628/Download_8_ffhfxw.mp4\",\"userPicture\":\"https://p16-sign-useast2a.tiktokcdn.com/tos-useast2a-avt-0068-euttp/8a0f0b75ad900c6f3a9186b88c482f04~tplv-tiktokx-cropcenter:100:100.jpeg?dr=9640&nonce=68841&refresh_token=a82e65e5cf7d81a82648825d7b908e90&x-expires=1741240800&x-signature=hNjpj6iDJ%2F6lfkukXymAWsbdbtE%3D&idc=useast5&ps=13740610&shcp=81f88b70&shp=a5d48078&t=4d5b0474\",\"profilename\":\"nightatlasmusic\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Guided Nighttime Meditation\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994629/Download_3_sfz1n8.mp4\",\"userPicture\":\"\",\"profilename\":\"meddailyzen\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"417 Hz Sound\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994628/Download_5_dv7dxz.mp4\",\"userPicture\":\"https://p16-common-sign-va.tiktokcdn-us.com/tos-maliva-avt-0068/9965f9b849f6ee44af049b5c663184f2~tplv-tiktokx-cropcenter:100:100.jpeg?dr=9640&nonce=93805&refresh_token=b0eed7130ce5f54a986154e878f7b6f7&x-expires=1741240800&x-signature=zAUPrvQgAXVOSzUpCruq7gFH29w%3D&idc=useast5&ps=13740610&shcp=b59d6b55&shp=a5d48078&t=4d5b0474\",\"profilename\":\"vmrose_music\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994627/Download_6_tvuh5s.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744993440/Download_1_yra0ld.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744993439/Download_2_qw2mdv.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744992912/Download_qccjju.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}'))
  ];
  List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct> get ListTikTokPages =>
      _ListTikTokPages;
  set ListTikTokPages(
      List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct> value) {
    _ListTikTokPages = value;
  }

  void addToListTikTokPages(
      tiktokfeed_wz8en7_data_schema.TiktokPageStruct value) {
    ListTikTokPages.add(value);
  }

  void removeFromListTikTokPages(
      tiktokfeed_wz8en7_data_schema.TiktokPageStruct value) {
    ListTikTokPages.remove(value);
  }

  void removeAtIndexFromListTikTokPages(int index) {
    ListTikTokPages.removeAt(index);
  }

  void updateListTikTokPagesAtIndex(
    int index,
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct Function(
            tiktokfeed_wz8en7_data_schema.TiktokPageStruct)
        updateFn,
  ) {
    ListTikTokPages[index] = updateFn(_ListTikTokPages[index]);
  }

  void insertAtIndexInListTikTokPages(
      int index, tiktokfeed_wz8en7_data_schema.TiktokPageStruct value) {
    ListTikTokPages.insert(index, value);
  }

  bool _isBookmarked = false;
  bool get isBookmarked => _isBookmarked;
  set isBookmarked(bool value) {
    _isBookmarked = value;
  }

  List<String> _newListBookmarks = [];
  List<String> get newListBookmarks => _newListBookmarks;
  set newListBookmarks(List<String> value) {
    _newListBookmarks = value;
  }

  void addToNewListBookmarks(String value) {
    newListBookmarks.add(value);
  }

  void removeFromNewListBookmarks(String value) {
    newListBookmarks.remove(value);
  }

  void removeAtIndexFromNewListBookmarks(int index) {
    newListBookmarks.removeAt(index);
  }

  void updateNewListBookmarksAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    newListBookmarks[index] = updateFn(_newListBookmarks[index]);
  }

  void insertAtIndexInNewListBookmarks(int index, String value) {
    newListBookmarks.insert(index, value);
  }

  String _chatSessionId = '';
  String get chatSessionId => _chatSessionId;
  set chatSessionId(String value) {
    _chatSessionId = value;
    secureStorage.setString('ff_chatSessionId', value);
  }

  void deleteChatSessionId() {
    secureStorage.delete(key: 'ff_chatSessionId');
  }

  List<String> _MusicPlayerBackgrounds = [];
  List<String> get MusicPlayerBackgrounds => _MusicPlayerBackgrounds;
  set MusicPlayerBackgrounds(List<String> value) {
    _MusicPlayerBackgrounds = value;
  }

  void addToMusicPlayerBackgrounds(String value) {
    MusicPlayerBackgrounds.add(value);
  }

  void removeFromMusicPlayerBackgrounds(String value) {
    MusicPlayerBackgrounds.remove(value);
  }

  void removeAtIndexFromMusicPlayerBackgrounds(int index) {
    MusicPlayerBackgrounds.removeAt(index);
  }

  void updateMusicPlayerBackgroundsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MusicPlayerBackgrounds[index] = updateFn(_MusicPlayerBackgrounds[index]);
  }

  void insertAtIndexInMusicPlayerBackgrounds(int index, String value) {
    MusicPlayerBackgrounds.insert(index, value);
  }

  String _SoundscapeDuration = '';
  String get SoundscapeDuration => _SoundscapeDuration;
  set SoundscapeDuration(String value) {
    _SoundscapeDuration = value;
  }

  /// user messages and lucille responses
  List<dynamic> _chatHistory = [];
  List<dynamic> get chatHistory => _chatHistory;
  set chatHistory(List<dynamic> value) {
    _chatHistory = value;
  }

  void addToChatHistory(dynamic value) {
    chatHistory.add(value);
  }

  void removeFromChatHistory(dynamic value) {
    chatHistory.remove(value);
  }

  void removeAtIndexFromChatHistory(int index) {
    chatHistory.removeAt(index);
  }

  void updateChatHistoryAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    chatHistory[index] = updateFn(_chatHistory[index]);
  }

  void insertAtIndexInChatHistory(int index, dynamic value) {
    chatHistory.insert(index, value);
  }

  /// user
  String _senderUser = 'user';
  String get senderUser => _senderUser;
  set senderUser(String value) {
    _senderUser = value;
  }

  String _senderLucille = 'lucille';
  String get senderLucille => _senderLucille;
  set senderLucille(String value) {
    _senderLucille = value;
  }

  String _lucilleResponseTemp = '';
  String get lucilleResponseTemp => _lucilleResponseTemp;
  set lucilleResponseTemp(String value) {
    _lucilleResponseTemp = value;
  }

  DocumentReference? _isHome;
  DocumentReference? get isHome => _isHome;
  set isHome(DocumentReference? value) {
    _isHome = value;
  }

  DocumentReference? _isAISoundscape;
  DocumentReference? get isAISoundscape => _isAISoundscape;
  set isAISoundscape(DocumentReference? value) {
    _isAISoundscape = value;
  }

  DocumentReference? _isLucilleHome;
  DocumentReference? get isLucilleHome => _isLucilleHome;
  set isLucilleHome(DocumentReference? value) {
    _isLucilleHome = value;
  }

  DocumentReference? _isProvidersCommunity;
  DocumentReference? get isProvidersCommunity => _isProvidersCommunity;
  set isProvidersCommunity(DocumentReference? value) {
    _isProvidersCommunity = value;
  }

  DocumentReference? _isProfile;
  DocumentReference? get isProfile => _isProfile;
  set isProfile(DocumentReference? value) {
    _isProfile = value;
  }

  List<String> _AIsoundscapesfolder = [];
  List<String> get AIsoundscapesfolder => _AIsoundscapesfolder;
  set AIsoundscapesfolder(List<String> value) {
    _AIsoundscapesfolder = value;
  }

  void addToAIsoundscapesfolder(String value) {
    AIsoundscapesfolder.add(value);
  }

  void removeFromAIsoundscapesfolder(String value) {
    AIsoundscapesfolder.remove(value);
  }

  void removeAtIndexFromAIsoundscapesfolder(int index) {
    AIsoundscapesfolder.removeAt(index);
  }

  void updateAIsoundscapesfolderAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AIsoundscapesfolder[index] = updateFn(_AIsoundscapesfolder[index]);
  }

  void insertAtIndexInAIsoundscapesfolder(int index, String value) {
    AIsoundscapesfolder.insert(index, value);
  }

  String _currentSongUrl = '';
  String get currentSongUrl => _currentSongUrl;
  set currentSongUrl(String value) {
    _currentSongUrl = value;
  }

  String _currentSongtitle = '';
  String get currentSongtitle => _currentSongtitle;
  set currentSongtitle(String value) {
    _currentSongtitle = value;
  }

  DocumentReference? _numberOfGoalsCompleted;
  DocumentReference? get numberOfGoalsCompleted => _numberOfGoalsCompleted;
  set numberOfGoalsCompleted(DocumentReference? value) {
    _numberOfGoalsCompleted = value;
  }

  UserProfileStruct _UserProfile = UserProfileStruct.fromSerializableMap(jsonDecode(
      '{\"username\":\"/Users/display_name\",\"ProfilePicture\":\"/Users/photo_url\"}'));
  UserProfileStruct get UserProfile => _UserProfile;
  set UserProfile(UserProfileStruct value) {
    _UserProfile = value;
  }

  void updateUserProfileStruct(Function(UserProfileStruct) updateFn) {
    updateFn(_UserProfile);
  }

  String _ProfilePicture =
      'https://res.cloudinary.com/dbyduwpud/image/upload/v1751860346/AICircleLucilleChat_uo87av.gif';
  String get ProfilePicture => _ProfilePicture;
  set ProfilePicture(String value) {
    _ProfilePicture = value;
    secureStorage.setString('ff_ProfilePicture', value);
  }

  void deleteProfilePicture() {
    secureStorage.delete(key: 'ff_ProfilePicture');
  }

  String _lucillePushNotifRaw = '';
  String get lucillePushNotifRaw => _lucillePushNotifRaw;
  set lucillePushNotifRaw(String value) {
    _lucillePushNotifRaw = value;
  }

  String _lucillePushTitle = '';
  String get lucillePushTitle => _lucillePushTitle;
  set lucillePushTitle(String value) {
    _lucillePushTitle = value;
  }

  String _lucillePushBody = '';
  String get lucillePushBody => _lucillePushBody;
  set lucillePushBody(String value) {
    _lucillePushBody = value;
  }

  DocumentReference? _moodHistory;
  DocumentReference? get moodHistory => _moodHistory;
  set moodHistory(DocumentReference? value) {
    _moodHistory = value;
  }

  List<String> _LucilleReorderRaw = [];
  List<String> get LucilleReorderRaw => _LucilleReorderRaw;
  set LucilleReorderRaw(List<String> value) {
    _LucilleReorderRaw = value;
  }

  void addToLucilleReorderRaw(String value) {
    LucilleReorderRaw.add(value);
  }

  void removeFromLucilleReorderRaw(String value) {
    LucilleReorderRaw.remove(value);
  }

  void removeAtIndexFromLucilleReorderRaw(int index) {
    LucilleReorderRaw.removeAt(index);
  }

  void updateLucilleReorderRawAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    LucilleReorderRaw[index] = updateFn(_LucilleReorderRaw[index]);
  }

  void insertAtIndexInLucilleReorderRaw(int index, String value) {
    LucilleReorderRaw.insert(index, value);
  }

  List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct> _LucilleReorderLists =
      [];
  List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct>
      get LucilleReorderLists => _LucilleReorderLists;
  set LucilleReorderLists(
      List<tiktokfeed_wz8en7_data_schema.TiktokPageStruct> value) {
    _LucilleReorderLists = value;
  }

  void addToLucilleReorderLists(
      tiktokfeed_wz8en7_data_schema.TiktokPageStruct value) {
    LucilleReorderLists.add(value);
  }

  void removeFromLucilleReorderLists(
      tiktokfeed_wz8en7_data_schema.TiktokPageStruct value) {
    LucilleReorderLists.remove(value);
  }

  void removeAtIndexFromLucilleReorderLists(int index) {
    LucilleReorderLists.removeAt(index);
  }

  void updateLucilleReorderListsAtIndex(
    int index,
    tiktokfeed_wz8en7_data_schema.TiktokPageStruct Function(
            tiktokfeed_wz8en7_data_schema.TiktokPageStruct)
        updateFn,
  ) {
    LucilleReorderLists[index] = updateFn(_LucilleReorderLists[index]);
  }

  void insertAtIndexInLucilleReorderLists(
      int index, tiktokfeed_wz8en7_data_schema.TiktokPageStruct value) {
    LucilleReorderLists.insert(index, value);
  }

  String _JournalPrompt = '';
  String get JournalPrompt => _JournalPrompt;
  set JournalPrompt(String value) {
    _JournalPrompt = value;
  }

  DateTime? _lastActivity;
  DateTime? get lastActivity => _lastActivity;
  set lastActivity(DateTime? value) {
    _lastActivity = value;
  }

  bool _showTimeoutWarning = false;
  bool get showTimeoutWarning => _showTimeoutWarning;
  set showTimeoutWarning(bool value) {
    _showTimeoutWarning = value;
  }

  List<String> _AmbientMusic = [
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_A%20Prayer%20for%20Light%20-%20Sayuri%20Hayashi%20Egnell.mp3?alt=media&token=01416c12-7b48-425a-8001-2d315409650f',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Ashkira%20-%20Place%20of%20Light%20(432%20Hz)%20-%20369.mp3?alt=media&token=54deda0a-e53c-42f0-8edc-8c436fedc940',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Bhimpalasi%20-%20Pawan%20Krishna%20(1).mp3?alt=media&token=9ec67458-dd89-4da7-bfba-88b195ff4434',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Bhimpalasi%20-%20Pawan%20Krishna%20(1).mp3?alt=media&token=9ec67458-dd89-4da7-bfba-88b195ff4434',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Binaural%20Cloud%20(Alpha%207%20Hz)%20-%20Syntropy.mp3?alt=media&token=68c213c6-1d70-40b1-9998-25aa64093d13',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Binaural%20Schumann%20Alpha%20-%20Magonia%20-%20369.mp3?alt=media&token=a1cb0f6e-101a-4517-b15b-65900c7964d2',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Binaural%20Schumann%20Alpha%20-%20Mermaids\'%20Dance%20-%20369.mp3?alt=media&token=07a98f46-9422-4cb2-8b61-9cb38698062c',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Dimension%20of%20Dreams%20-%20Mandala%20Dreams.mp3?alt=media&token=99e0d610-51f5-44f7-b55f-0559f9d46f5b',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Frankel%20-%20Syntropy%20(1).mp3?alt=media&token=a04b73b2-8438-4c03-9f8b-557d8e458a84',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/ES_Gaia%20Awakening%20-%20Syntropy.mp3?alt=media&token=0b62b171-f229-4c0a-851e-1637ce7c26ce',
    'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/New%20Composition%20%233.mp3?alt=media&token=39444123-3b36-40e8-b82b-802f4de2c8ad'
  ];
  List<String> get AmbientMusic => _AmbientMusic;
  set AmbientMusic(List<String> value) {
    _AmbientMusic = value;
    secureStorage.setStringList('ff_AmbientMusic', value);
  }

  void deleteAmbientMusic() {
    secureStorage.delete(key: 'ff_AmbientMusic');
  }

  void addToAmbientMusic(String value) {
    AmbientMusic.add(value);
    secureStorage.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void removeFromAmbientMusic(String value) {
    AmbientMusic.remove(value);
    secureStorage.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void removeAtIndexFromAmbientMusic(int index) {
    AmbientMusic.removeAt(index);
    secureStorage.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void updateAmbientMusicAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AmbientMusic[index] = updateFn(_AmbientMusic[index]);
    secureStorage.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void insertAtIndexInAmbientMusic(int index, String value) {
    AmbientMusic.insert(index, value);
    secureStorage.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  int _GoalsCompleted = 0;
  int get GoalsCompleted => _GoalsCompleted;
  set GoalsCompleted(int value) {
    _GoalsCompleted = value;
  }

  bool _hasCompletedGoal = false;
  bool get hasCompletedGoal => _hasCompletedGoal;
  set hasCompletedGoal(bool value) {
    _hasCompletedGoal = value;
    secureStorage.setBool('ff_hasCompletedGoal', value);
  }

  void deleteHasCompletedGoal() {
    secureStorage.delete(key: 'ff_hasCompletedGoal');
  }

  String _EpidemicToken = '';
  String get EpidemicToken => _EpidemicToken;
  set EpidemicToken(String value) {
    _EpidemicToken = value;
  }

  String _userVoiceMessage = '';
  String get userVoiceMessage => _userVoiceMessage;
  set userVoiceMessage(String value) {
    _userVoiceMessage = value;
  }

  bool _isListening = false;
  bool get isListening => _isListening;
  set isListening(bool value) {
    _isListening = value;
  }

  List<String> _AdvancedMoodChoiceChips = [];
  List<String> get AdvancedMoodChoiceChips => _AdvancedMoodChoiceChips;
  set AdvancedMoodChoiceChips(List<String> value) {
    _AdvancedMoodChoiceChips = value;
  }

  void addToAdvancedMoodChoiceChips(String value) {
    AdvancedMoodChoiceChips.add(value);
  }

  void removeFromAdvancedMoodChoiceChips(String value) {
    AdvancedMoodChoiceChips.remove(value);
  }

  void removeAtIndexFromAdvancedMoodChoiceChips(int index) {
    AdvancedMoodChoiceChips.removeAt(index);
  }

  void updateAdvancedMoodChoiceChipsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AdvancedMoodChoiceChips[index] = updateFn(_AdvancedMoodChoiceChips[index]);
  }

  void insertAtIndexInAdvancedMoodChoiceChips(int index, String value) {
    AdvancedMoodChoiceChips.insert(index, value);
  }

  List<String> _NeutralMoodsHistory = [];
  List<String> get NeutralMoodsHistory => _NeutralMoodsHistory;
  set NeutralMoodsHistory(List<String> value) {
    _NeutralMoodsHistory = value;
  }

  void addToNeutralMoodsHistory(String value) {
    NeutralMoodsHistory.add(value);
  }

  void removeFromNeutralMoodsHistory(String value) {
    NeutralMoodsHistory.remove(value);
  }

  void removeAtIndexFromNeutralMoodsHistory(int index) {
    NeutralMoodsHistory.removeAt(index);
  }

  void updateNeutralMoodsHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    NeutralMoodsHistory[index] = updateFn(_NeutralMoodsHistory[index]);
  }

  void insertAtIndexInNeutralMoodsHistory(int index, String value) {
    NeutralMoodsHistory.insert(index, value);
  }

  List<String> _StressedMoodsHistory = [];
  List<String> get StressedMoodsHistory => _StressedMoodsHistory;
  set StressedMoodsHistory(List<String> value) {
    _StressedMoodsHistory = value;
  }

  void addToStressedMoodsHistory(String value) {
    StressedMoodsHistory.add(value);
  }

  void removeFromStressedMoodsHistory(String value) {
    StressedMoodsHistory.remove(value);
  }

  void removeAtIndexFromStressedMoodsHistory(int index) {
    StressedMoodsHistory.removeAt(index);
  }

  void updateStressedMoodsHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    StressedMoodsHistory[index] = updateFn(_StressedMoodsHistory[index]);
  }

  void insertAtIndexInStressedMoodsHistory(int index, String value) {
    StressedMoodsHistory.insert(index, value);
  }

  List<String> _HeavyMoodsHistory = [];
  List<String> get HeavyMoodsHistory => _HeavyMoodsHistory;
  set HeavyMoodsHistory(List<String> value) {
    _HeavyMoodsHistory = value;
  }

  void addToHeavyMoodsHistory(String value) {
    HeavyMoodsHistory.add(value);
  }

  void removeFromHeavyMoodsHistory(String value) {
    HeavyMoodsHistory.remove(value);
  }

  void removeAtIndexFromHeavyMoodsHistory(int index) {
    HeavyMoodsHistory.removeAt(index);
  }

  void updateHeavyMoodsHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    HeavyMoodsHistory[index] = updateFn(_HeavyMoodsHistory[index]);
  }

  void insertAtIndexInHeavyMoodsHistory(int index, String value) {
    HeavyMoodsHistory.insert(index, value);
  }

  List<String> _communityTabs = [
    'For You',
    'Meditation',
    'Breathing',
    'Body',
    'Soundscapes'
  ];
  List<String> get communityTabs => _communityTabs;
  set communityTabs(List<String> value) {
    _communityTabs = value;
  }

  void addToCommunityTabs(String value) {
    communityTabs.add(value);
  }

  void removeFromCommunityTabs(String value) {
    communityTabs.remove(value);
  }

  void removeAtIndexFromCommunityTabs(int index) {
    communityTabs.removeAt(index);
  }

  void updateCommunityTabsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    communityTabs[index] = updateFn(_communityTabs[index]);
  }

  void insertAtIndexInCommunityTabs(int index, String value) {
    communityTabs.insert(index, value);
  }

  String _sampleRecording = '';
  String get sampleRecording => _sampleRecording;
  set sampleRecording(String value) {
    _sampleRecording = value;
  }

  List<LucilleChatStruct> _newMessages = [];
  List<LucilleChatStruct> get newMessages => _newMessages;
  set newMessages(List<LucilleChatStruct> value) {
    _newMessages = value;
  }

  void addToNewMessages(LucilleChatStruct value) {
    newMessages.add(value);
  }

  void removeFromNewMessages(LucilleChatStruct value) {
    newMessages.remove(value);
  }

  void removeAtIndexFromNewMessages(int index) {
    newMessages.removeAt(index);
  }

  void updateNewMessagesAtIndex(
    int index,
    LucilleChatStruct Function(LucilleChatStruct) updateFn,
  ) {
    newMessages[index] = updateFn(_newMessages[index]);
  }

  void insertAtIndexInNewMessages(int index, LucilleChatStruct value) {
    newMessages.insert(index, value);
  }

  List<LucilleMessageStruct> _listOfMessages = [];
  List<LucilleMessageStruct> get listOfMessages => _listOfMessages;
  set listOfMessages(List<LucilleMessageStruct> value) {
    _listOfMessages = value;
  }

  void addToListOfMessages(LucilleMessageStruct value) {
    listOfMessages.add(value);
  }

  void removeFromListOfMessages(LucilleMessageStruct value) {
    listOfMessages.remove(value);
  }

  void removeAtIndexFromListOfMessages(int index) {
    listOfMessages.removeAt(index);
  }

  void updateListOfMessagesAtIndex(
    int index,
    LucilleMessageStruct Function(LucilleMessageStruct) updateFn,
  ) {
    listOfMessages[index] = updateFn(_listOfMessages[index]);
  }

  void insertAtIndexInListOfMessages(int index, LucilleMessageStruct value) {
    listOfMessages.insert(index, value);
  }

  List<BuildShipStreamStruct> _messagesBuildShip = [];
  List<BuildShipStreamStruct> get messagesBuildShip => _messagesBuildShip;
  set messagesBuildShip(List<BuildShipStreamStruct> value) {
    _messagesBuildShip = value;
  }

  void addToMessagesBuildShip(BuildShipStreamStruct value) {
    messagesBuildShip.add(value);
  }

  void removeFromMessagesBuildShip(BuildShipStreamStruct value) {
    messagesBuildShip.remove(value);
  }

  void removeAtIndexFromMessagesBuildShip(int index) {
    messagesBuildShip.removeAt(index);
  }

  void updateMessagesBuildShipAtIndex(
    int index,
    BuildShipStreamStruct Function(BuildShipStreamStruct) updateFn,
  ) {
    messagesBuildShip[index] = updateFn(_messagesBuildShip[index]);
  }

  void insertAtIndexInMessagesBuildShip(
      int index, BuildShipStreamStruct value) {
    messagesBuildShip.insert(index, value);
  }

  List<LucilleStreamFINALStruct> _streamMessages = [];
  List<LucilleStreamFINALStruct> get streamMessages => _streamMessages;
  set streamMessages(List<LucilleStreamFINALStruct> value) {
    _streamMessages = value;
  }

  void addToStreamMessages(LucilleStreamFINALStruct value) {
    streamMessages.add(value);
  }

  void removeFromStreamMessages(LucilleStreamFINALStruct value) {
    streamMessages.remove(value);
  }

  void removeAtIndexFromStreamMessages(int index) {
    streamMessages.removeAt(index);
  }

  void updateStreamMessagesAtIndex(
    int index,
    LucilleStreamFINALStruct Function(LucilleStreamFINALStruct) updateFn,
  ) {
    streamMessages[index] = updateFn(_streamMessages[index]);
  }

  void insertAtIndexInStreamMessages(
      int index, LucilleStreamFINALStruct value) {
    streamMessages.insert(index, value);
  }

  List<SoundscapesStruct> _SoundscapesAllTab = [
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Chaxti\",\"SongTitle\":\"Pictures of a Floating World\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-99gallery-19821544.jpg?alt=media&token=7efce314-3453-4918-94d3-b0b490f40b5a\",\"Duration\":\"331.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Pictures%20of%20a%20Floating%20World%20-%20Chaxti.mp3?alt=media&token=1e895060-abaa-4438-8afb-8eac642ae1e8\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Sayuri Hayashi Egnell\",\"SongTitle\":\"Pisces\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-petkevich-evgeniy-16986035.jpg?alt=media&token=f1d4ffc6-0fb9-4072-b70a-d56f2e213e50\",\"Duration\":\"336.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Pisces%20-%20Sayuri%20Hayashi%20Egnell.mp3?alt=media&token=99018083-7b9f-4d16-9029-0490f5d38320\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Samadhi (Alpha 10 hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-a-darmel-6940245.jpg?alt=media&token=a118320c-a7f2-45c5-b22f-5af603dbddac\",\"Duration\":\"255.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Samadhi%20(Alpha%2010%20hz)%20-%20Syntropy.mp3?alt=media&token=9b670f55-371f-4036-b611-554914d87416\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Colors of Illusion\",\"SongTitle\":\"Sight of Summer 89\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-a-darmel-6940514.jpg?alt=media&token=8e66303d-0259-4095-bd40-a647acb62cca\",\"Duration\":\"405.0\",\"Genre\":\"All\",\"Mood\":\"Nostalgia\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Sight%20of%20Summer%2089%20-%20Colors%20of%20Illusion.mp3?alt=media&token=b76ebfc3-99b7-4e67-aa73-3e0f11fabe3c\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Palace on Wheels\",\"SongTitle\":\"Soothing Sitars\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alena-shekhovtcova-6074959.jpg?alt=media&token=ace1b265-d412-4fc4-acfa-cb54fa46c7ca\",\"Duration\":\"610.0\",\"Genre\":\"All\",\"Mood\":\"Nostalgia\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Soothing%20Sitars%20-%20Palace%20on%20Wheels.mp3?alt=media&token=d337cd57-133a-4f99-8ba1-5ab03864fb9a\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Center of Attention\",\"SongTitle\":\"Stillpoint\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alexeydemidov-10482161.jpg?alt=media&token=7cd19610-d2aa-4959-bd91-37e93f663451\",\"Duration\":\"212.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Stillpoint%20-%20Center%20of%20Attention.mp3?alt=media&token=c8540da6-5938-42af-9360-dbe1875b1aed\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Ben Elson\",\"SongTitle\":\"Summer Breeze\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alexeydemidov-10596388.jpg?alt=media&token=ccba8a64-2143-443c-a6c8-bd13c4fd49d6\",\"Duration\":\"334.0\",\"Genre\":\"All\",\"Mood\":\"Nostalgia\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Summer%20Breeze%20-%20Ben%20Elson.mp3?alt=media&token=8ffc766f-3974-4828-a2d3-2251d1a22065\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Elin Piel\",\"SongTitle\":\"Tenuous Waves - Elin Piel\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-alexeydemidov-10614526.jpg?alt=media&token=e413986f-0444-4875-b0dd-4dabdeaa8dd2\",\"Duration\":\"239.0\",\"Genre\":\"All\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Tenuous%20Waves%20-%20Elin%20Piel.mp3?alt=media&token=b38f9cb3-0e42-48d0-a129-fd3ee7d9916c\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Year of the Deer\",\"SongTitle\":\"Vata\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-marek-piwnicki-3907296-17651134.jpg?alt=media&token=67b55468-cca8-4022-9595-8a5269c2d5e1\",\"Duration\":\"214.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Vata%20-%20Year%20of%20the%20Deer.mp3?alt=media&token=166e1b40-dbca-41e5-8d54-9507cce85d01\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Hara Noda\",\"SongTitle\":\"Wallpaper Game\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-marek-piwnicki-3907296-27852890.jpg?alt=media&token=08a3d976-981a-4030-a607-884b06594041\",\"Duration\":\"4480.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Wallpaper%20Game%20-%20Hara%20Noda.mp3?alt=media&token=bc2e4b2c-ac63-4d1f-b4d8-a77e93b97db3\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Wendy Marcini\",\"SongTitle\":\"I Will Be Right Here With You\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-matteo-angeloni-106557007-14213760.jpg?alt=media&token=b2266afd-684d-4041-92c1-f7b9a4477972\",\"Duration\":\"2440.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_I%20Will%20Be%20Right%20Here%20With%20You%20-%20Wendy%20Marcini.mp3?alt=media&token=d848d311-3c19-450f-a5ce-1ce13972ff23\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Jonah Aardekker\",\"SongTitle\":\"Intermission Clouds\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-mauricio-krupka-buendia-1141363850-30509382.jpg?alt=media&token=94517a4c-0d7e-4d1c-956d-94ab54c1d2d3\",\"Duration\":\"245.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Intermission%20Clouds%20-%20Jonah%20Aardekker.mp3?alt=media&token=5568e10a-f15d-4c7c-a0de-bb94cf0e6442\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Wendy Marcini\",\"SongTitle\":\"Lake Como Nights\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-mitbg000-29204174.jpg?alt=media&token=6e8b1fc5-6386-486a-a96f-dd0c11d42171\",\"Duration\":\"3400.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Lake%20Como%20Nights%20-%20Wendy%20Marcini.mp3?alt=media&token=65f84828-dc2c-4ca6-8380-86c372eba344\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Sugoi\",\"SongTitle\":\"Late Night Friends\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-mitbg000-29204174.jpg?alt=media&token=6e8b1fc5-6386-486a-a96f-dd0c11d42171\",\"Duration\":\"234.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Late%20Night%20Friends%20-%20Sugoi.mp3?alt=media&token=981992a0-7e46-495e-981c-549ae1da16fa\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Wendy Marcini\",\"SongTitle\":\"Moonflower\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-necatiomerk-28977069.jpg?alt=media&token=d602c672-c469-4636-a9f5-37d7ceecf828\",\"Duration\":\"2590.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Moonflower%20-%20Wendy%20Marcini.mp3?alt=media&token=a42cd96c-19d4-49dc-a7ce-faab256a2414\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Martin Landstrom\",\"SongTitle\":\"Oak and Marble\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-nextvoyage-1470405.jpg?alt=media&token=3bff1a90-73e1-4359-bb82-9e110fdc3bc9\",\"Duration\":\"5000.0\",\"Genre\":\"All\",\"Mood\":\"Jazz\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Jazz%2FSongs%2FES_Oak%20and%20Marble%20-%20Martin%20Landstrom.mp3?alt=media&token=cb37bb58-0d62-4e48-b751-7ad4bd1ed8db\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"By Lotus\",\"SongTitle\":\"Turn Again\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-paolo-sanchez-2149881372-34986211.jpg?alt=media&token=05411cd5-1d47-42b5-9444-cb82c60ff223\",\"Duration\":\"538.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Turn%20Again%20-%20By%20Lotus.mp3?alt=media&token=f67510a6-e1ec-48d7-b203-99ebdb3b99db\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ELFL\",\"SongTitle\":\"Titane\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-perqued-13722886.jpg?alt=media&token=fd09af68-a911-421a-88fc-f994320be6a0\",\"Duration\":\"3100.0\",\"Genre\":\"All\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Titane%20-%20ELFL.mp3?alt=media&token=0a3469fe-e3c8-4025-a6d4-7e85f6cad6e9\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"AGST\",\"SongTitle\":\"Akira\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guvo59-28553959.jpg?alt=media&token=189bdb4a-9690-498a-b7a7-aac6941e3aa6\",\"Duration\":\"3060.0\",\"Genre\":\"All\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Akira%20-%20AGST.mp3?alt=media&token=8e287dbb-a15f-47fb-8a8a-54558056a432\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Luba Hilman\",\"SongTitle\":\"Fractal Echoes\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guy-lebreton-2621719-4197781.jpg?alt=media&token=51a0ccdd-57e8-4c80-b5b1-2860fb330fa3\",\"Duration\":\"2230.0\",\"Genre\":\"All\",\"Mood\":\"Ominous\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FSongs%2FES_Fractal%20Echoes%20-%20Luba%20Hilman.mp3?alt=media&token=093004f6-fbc5-41c7-9cb8-11fae45571f4\"}'))
  ];
  List<SoundscapesStruct> get SoundscapesAllTab => _SoundscapesAllTab;
  set SoundscapesAllTab(List<SoundscapesStruct> value) {
    _SoundscapesAllTab = value;
  }

  void addToSoundscapesAllTab(SoundscapesStruct value) {
    SoundscapesAllTab.add(value);
  }

  void removeFromSoundscapesAllTab(SoundscapesStruct value) {
    SoundscapesAllTab.remove(value);
  }

  void removeAtIndexFromSoundscapesAllTab(int index) {
    SoundscapesAllTab.removeAt(index);
  }

  void updateSoundscapesAllTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesAllTab[index] = updateFn(_SoundscapesAllTab[index]);
  }

  void insertAtIndexInSoundscapesAllTab(int index, SoundscapesStruct value) {
    SoundscapesAllTab.insert(index, value);
  }

  List<SoundscapesStruct> _SoundscapesNatureTab = [
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Birds Chirping, Light Rain, Light Wind\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guy-lebreton-2621719-4197781.jpg?alt=media&token=51a0ccdd-57e8-4c80-b5b1-2860fb330fa3\",\"Duration\":\"248.0\",\"Genre\":\"Nature\",\"Mood\":\"Calm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Birds%20Chirping%2C%20Light%20Rain%2C%20Light%20Wind%20-%20Epidemic%20Sound.mp3?alt=media&token=08dba522-5c06-4941-b91e-a5e2d1263fcf\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Birds, Distant Walla, Light Traffic, Children 01\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SounscapesAllTab%2FAlbum%20Art%2Fpexels-guvo59-28553959.jpg?alt=media&token=189bdb4a-9690-498a-b7a7-aac6941e3aa6\",\"Duration\":\"280.0\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Birds%2C%20Distant%20Walla%2C%20Light%20Traffic%2C%20Children%2001%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=df623d91-afa1-4b9d-9f2e-422cdcb8028a\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Campfire, Small Fire, Crackling, Calm, Night\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-33205297-7042926.jpg?alt=media&token=c253aa38-6e50-46fb-8733-392a36670bad\",\"Duration\":\"706.0\",\"Genre\":\"Nature\",\"Mood\":\"Warm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Campfire%2C%20Small%20Fire%2C%20Crackling%2C%20Calm%2C%20Night%20-%20Epidemic%20Sound.mp3?alt=media&token=b6030320-6a95-4f09-9f63-556eff5be718\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Countryside, Birds Chirping, 6PM, Wind\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-aisling-kerr-2999317-17808903.jpg?alt=media&token=1c56200a-0a06-4355-bc1c-00b88e65c0d2\",\"Duration\":\"150.0\",\"Genre\":\"Nature\",\"Mood\":\"Calm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Countryside%2C%20Birds%20Chirping%2C%206PM%2C%20Wind%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=30ca7cf6-f366-466c-8cca-9defaf6654b0\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Countryside, Birds, Wind, Distant Traffic, Engine Starts, Idle\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-adrien-olichon-1257089-13244510.jpg?alt=media&token=4aaddb47-b52b-4879-8795-b9593755eae6\",\"Duration\":\"210.0\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Countryside%2C%20Birds%2C%20Wind%2C%20Distant%20Traffic%2C%20Engine%20Starts%2C%20Idle%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=7d3c6ea7-214f-496b-9e80-de763abcd7d0\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Creek, Medium Stream, 2m\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-anna-gosciniak-3666306-5678734.jpg?alt=media&token=989df73f-4ca0-4486-b2bb-caf40a754dfa\",\"Duration\":\"300.0\",\"Genre\":\"Nature\",\"Mood\":\"Serene\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Creek%2C%20Medium%20Stream%2C%202m%20-%20Epidemic%20Sound.mp3?alt=media&token=48427ab0-93d2-47fb-9a14-19ddeb0b8d2b\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Day, Birds, Insects, Yellowstone National Park, Wyoming 02\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-anna-hinckel-3008225-4598880.jpg?alt=media&token=251aa1d2-f9e3-4213-9903-73118fe70de2\",\"Duration\":\"230.0\",\"Genre\":\"Nature\",\"Mood\":\"Peaceful\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Day%2C%20Birds%2C%20Insects%2C%20Yellowstone%20National%20Park%2C%20Wyoming%2002%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=63c16097-06e8-4760-bba0-3fb41b42a17d\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Dunes - Valante\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-benjamin-walsham-159059246-11213644.jpg?alt=media&token=d0dd06e9-7b3d-4a9d-9678-2800795ba46d\",\"Duration\":\"302.0\",\"Genre\":\"Nature\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Dunes%20-%20Valante.mp3?alt=media&token=20781d7e-a24a-42ad-a7e7-0e7701446641\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Field With Crickets, Distant Traffic, Night 01\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-blooddrainer-6805628.jpg?alt=media&token=bb09fb44-f59d-4f60-8e7a-9dfd55b59628\",\"Duration\":\"540.0\",\"Genre\":\"Nature\",\"Mood\":\"Calm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Field%20With%20Crickets%2C%20Distant%20Traffic%2C%20Night%2001%20-%20Epidemic%20Sound.mp3?alt=media&token=42ccf790-53b1-4c46-b9a4-93561ceac2b7\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Fire Whooshes, Fast\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-sidde-62197501-9532342.jpg?alt=media&token=1e44078d-accb-47ad-819e-e3a428a26a9e\",\"Duration\":\"320.0\",\"Genre\":\"Nature\",\"Mood\":\"Warm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Fire%20Whooshes%2C%20Fast%20-%20Epidemic%20Sound.mp3?alt=media&token=cd45b1f0-c08a-4618-a37d-e254213ff390\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Fire, Designed\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-rgfd-4497960.jpg?alt=media&token=a258a111-242f-4d12-86da-3ed542bca901\",\"Duration\":\"312.0\",\"Genre\":\"Nature\",\"Mood\":\"Warm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Fire%2C%20Designed%20-%20Epidemic%20Sound.mp3?alt=media&token=b55df8d8-a040-4f93-8d2c-71508c7d98e6\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Floor Stove, Cabin, Heating Clicks, Room\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-mikhail-nilov-6623917.jpg?alt=media&token=756dc881-6835-4146-b173-0302187820ba\",\"Duration\":\"344.0\",\"Genre\":\"Nature\",\"Mood\":\"Warm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Floor%20Stove%2C%20Cabin%2C%20Heating%20Clicks%2C%20Room%20-%20Epidemic%20Sound.mp3?alt=media&token=71fde7d3-0637-4a6f-bb3c-2ba46f14c6ed\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Forest Ambience Birds, Squirel Calls\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-julia-volk-5652990.jpg?alt=media&token=0ee8a0a1-641d-4acd-8827-a390a6eea361\",\"Duration\":\"141.0\",\"Genre\":\"Nature\",\"Mood\":\"Inspired\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Forest%20Ambience%20Birds%2C%20Squirel%20Calls%20-%20Epidemic%20Sound%20(1).mp3?alt=media&token=b39e2ff5-fae3-46f7-bb98-53069f5ecda4\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Forest Lullaby - Center of Attention\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-doma-16274147.jpg?alt=media&token=cef64c86-b9cf-4d39-91eb-18cf6f59e362\",\"Duration\":\"224.0\",\"Genre\":\"Nature\",\"Mood\":\"Serene\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Forest%20Lullaby%20-%20Center%20of%20Attention.mp3?alt=media&token=b2c886bd-91e6-43e7-bf0f-dea368fa0076\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Forest Summer High Pitched Birds\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-jayde-8463686.jpg?alt=media&token=4efe4f63-2c25-4e7a-9ab9-8858da4900d0\",\"Duration\":\"128.0\",\"Genre\":\"Nature\",\"Mood\":\"Serene\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Forest%20Summer%20High%20Pitched%20Birds%20-%20Epidemic%20Sound.mp3?alt=media&token=f1a6a7a1-1961-470f-9bad-67d491379737\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Meadow, Summer, Birds Sing, Wind, Light Rustle In Trees\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-jeronimo-spasoff-294202650-14060282.jpg?alt=media&token=14e3dc71-d720-4c81-ad23-280cfaaf64e8\",\"Duration\":\"247.0\",\"Genre\":\"Nature\",\"Mood\":\"Serene\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Meadow%2C%20Summer%2C%20Birds%20Sing%2C%20Wind%2C%20Light%20Rustle%20In%20Trees%20-%20Epidemic%20Sound.mp3?alt=media&token=36214f17-7366-424c-a553-568b81d3e20a\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Murmurations - Hanna Lindgren\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-joni-tuohimaa-1936935-12736977.jpg?alt=media&token=63b18f35-3170-4ddf-be34-ad5dd347d951\",\"Duration\":\"256.0\",\"Genre\":\"Nature\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Murmurations%20-%20Hanna%20Lindgren.mp3?alt=media&token=3ce7a245-c702-4054-8a90-197a379ff3d8\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Ocean, Crashing In On Beach, Foam Details\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-jothamsutharson-12587288.jpg?alt=media&token=a092f712-0f6b-4b10-99e2-25a914725fd0\",\"Duration\":\"113.0\",\"Genre\":\"Nature\",\"Mood\":\"Calm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Ocean%2C%20Crashing%20In%20On%20Beach%2C%20Foam%20Details%20-%20Epidemic%20Sound.mp3?alt=media&token=cbb8b65a-2ae4-465c-9917-a340705d772a\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_Osiris - Ben Elson\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FAlbumArt%2Fpexels-katie-mukhina-975382726-33463120.jpg?alt=media&token=03c0cda8-a810-469d-bb66-7533afb0c510\",\"Duration\":\"252.0\",\"Genre\":\"Nature\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Nature%20Tab%2FES_Osiris%20-%20Ben%20Elson.mp3?alt=media&token=a4a4b8f0-0a76-43d4-b7e7-c1d94bed49f2\"}'))
  ];
  List<SoundscapesStruct> get SoundscapesNatureTab => _SoundscapesNatureTab;
  set SoundscapesNatureTab(List<SoundscapesStruct> value) {
    _SoundscapesNatureTab = value;
  }

  void addToSoundscapesNatureTab(SoundscapesStruct value) {
    SoundscapesNatureTab.add(value);
  }

  void removeFromSoundscapesNatureTab(SoundscapesStruct value) {
    SoundscapesNatureTab.remove(value);
  }

  void removeAtIndexFromSoundscapesNatureTab(int index) {
    SoundscapesNatureTab.removeAt(index);
  }

  void updateSoundscapesNatureTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesNatureTab[index] = updateFn(_SoundscapesNatureTab[index]);
  }

  void insertAtIndexInSoundscapesNatureTab(int index, SoundscapesStruct value) {
    SoundscapesNatureTab.insert(index, value);
  }

  List<SoundscapesStruct> _SoundscapesMusicMeditationsTab = [
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Binaural Alpha\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-wolfart-10082927.jpg?alt=media&token=a9db7de6-ea99-4c42-be53-bf8fe27d8a87\",\"Duration\":\"317.0\",\"Genre\":\"Music Mediations\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Binaural%20Alpha%20-%20Syntropy.mp3?alt=media&token=7360273c-e63b-4a8d-94f3-c179e8c92a43\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Binaural Cloud (Alpha 7 Hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-tracehudson-7241400.jpg?alt=media&token=0fac6b37-42d3-4a87-a8da-30efe12bb44a\",\"Duration\":\"258.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Binaural%20Cloud%20(Alpha%207%20Hz)%20-%20Syntropy.mp3?alt=media&token=77c3037b-396c-490f-ab32-e1630b556db7\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Center of Attention\",\"SongTitle\":\"Birdsong by the River\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-tobiasbjorkli-2239485.jpg?alt=media&token=97255f3d-131c-4366-9b5c-3e4207739f36\",\"Duration\":\"251.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Birdsong%20by%20the%20River%20-%20Center%20of%20Attention.mp3?alt=media&token=9ee2f718-f2a1-4edc-8f15-68cfd6427f8f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Luwaks\",\"SongTitle\":\"Blossom\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-sanlad-35473504.jpg?alt=media&token=726b76fb-e324-464c-949e-d0ad9dac82d8\",\"Duration\":\"355.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Loving\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Blossom%20-%20Luwaks.mp3?alt=media&token=4fec3060-d446-44af-ae60-a7dab5cc4f80\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Valante\",\"SongTitle\":\"Carried by Current\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-ourpicstoyou-org-733507-1577610.jpg?alt=media&token=862b3d17-94e8-4172-a00f-d519dbc99312\",\"Duration\":\"242.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"hhttps://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Carried%20by%20Current%20-%20Valante.mp3?alt=media&token=bffada8b-b30b-490b-bcfb-2f762db104dc\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Convexations\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-olesia-libra-417944690-15378631.jpg?alt=media&token=6a821e18-7a1d-4388-bbca-659c8086f481\",\"Duration\":\"341.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Convexations%20-%20Syntropy.mp3?alt=media&token=6e351e5c-95c4-431c-83d4-25934594e2a9\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Valante\",\"SongTitle\":\"Crowned With Spirit\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-mikhail-nilov-8108400.jpg?alt=media&token=78c0f4e6-4b36-4ab2-be94-b8b07046dc67\",\"Duration\":\"303.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Expressive\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Crowned%20With%20Spirit%20-%20Valante.mp3?alt=media&token=a9d0696e-e083-4a8c-b1e9-a41111614f9a\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Joseph Beg\",\"SongTitle\":\"Crystalis\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-marlon-martinez-505085-1450082.jpg?alt=media&token=067c5fc2-a76e-420e-9ac7-b441496a7a74\",\"Duration\":\"515.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Dreamy\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Crystalis%20-%20Joseph%20Beg.mp3?alt=media&token=41d57733-bd27-4875-a30b-06ed5d1a8ae4\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"baegel\",\"SongTitle\":\"Filtered Smiles\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-lina-pfeiffer-188403171-33417410.jpg?alt=media&token=fdd13622-1ddb-4a01-a907-34ab4156ec63\",\"Duration\":\"227.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Inspiring\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Filtered%20Smiles%20-%20baegel.mp3?alt=media&token=41ca94ce-24a7-47de-b378-fc1f5d7a4c26\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Calm Shores\",\"SongTitle\":\"Floating Through Clouds\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-lidia-li-2152784403-32482695.jpg?alt=media&token=2742dba3-1c7b-4691-920e-f1a96dae19f6\",\"Duration\":\"348.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Calm\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Floating%20through%20Clouds%20-%20Calm%20Shores.mp3?alt=media&token=53e840e3-4d15-4eeb-9aa9-dcd8b265ba1c\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\" August Wilhelmsson\",\"SongTitle\":\"Floating, Floating\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-kellie-churchman-371878-1001682.jpg?alt=media&token=e6963461-869a-43d7-af5f-02ad76069aab\",\"Duration\":\"200.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Hopeful\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Floating%2C%20Floating%20-%20August%20Wilhelmsson.mp3?alt=media&token=aa515ef2-40f6-4c5b-9dc1-1f608c6fc565\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\" Center of Attention\",\"SongTitle\":\"Havsdrommar\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-kata-tsumuri-395883531-20031115.jpg?alt=media&token=5f4c25fc-1e64-4545-8ed6-e1f5adc10533\",\"Duration\":\"239.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Dreamy\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Havsdrommar%20-%20Center%20of%20Attention.mp3?alt=media&token=6e8e13f0-bc01-4a93-894b-51cd8e95f131\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ProdByCamz\",\"SongTitle\":\"Incognito\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-joerg-hartmann-626385254-19854780.jpg?alt=media&token=864ab32f-5111-4eef-a884-5ca586d57d68\",\"Duration\":\"311.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Afro-House\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Incognito%20-%20ProdByCamz.mp3?alt=media&token=bb940309-5dd9-4db9-afa9-810cc676199f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Amber Glow\",\"SongTitle\":\"inner Motion\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-fabianreck-17888996.jpg?alt=media&token=ba6e25ba-9479-4b6b-b54b-6e2ad761dfb5\",\"Duration\":\"745.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Inner%20Motion%20-%20Amber%20Glow.mp3?alt=media&token=9b940fa2-476b-477c-a5ca-9d6418a3f89d\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Lars Meyer\",\"SongTitle\":\"Just Surrender\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-job-26346659-9547631.jpg?alt=media&token=6cc13145-7992-409c-874b-df07de274021\",\"Duration\":\"237.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Creative\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Just%20Surrender%20-%20Lars%20Meyer.mp3?alt=media&token=d714c8bb-08c9-41c8-930f-60abcae5e2a4\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Daniella Ljungsberg\",\"SongTitle\":\"Long Term and Ashes\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-fabianreck-17888996.jpg?alt=media&token=ba6e25ba-9479-4b6b-b54b-6e2ad761dfb5\",\"Duration\":\"603.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Ominous\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Long%20Term%20and%20Ashes%20-%20Daniella%20Ljungsberg.mp3?alt=media&token=7737f806-f0e1-4605-a733-dac7d8da0f89\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Lofive\",\"SongTitle\":\"M\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-asadphoto-3426870.jpg?alt=media&token=ce77d7e0-b798-4931-86b8-52cc714d3cd9\",\"Duration\":\"257.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_M%20-%20Lofive.mp3?alt=media&token=2b273c8f-43c4-4310-b43a-6388f7f9ee89\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Lupus Nocte\",\"SongTitle\":\"Maniamaster\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FAlbum%20Art%2Fpexels-afatihdagli-29574021.jpg?alt=media&token=7a417c20-70a5-4d1c-83bd-57adde60d0fe\",\"Duration\":\"240.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Nostalgia\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Maniamaster%20-%20Lupus%20Nocte.mp3?alt=media&token=65c66140-af7a-4ad5-bc99-b16c2f2a66f7\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Ben Elson\",\"SongTitle\":\"Midnight Call\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FAlbum%20Art%2Fpexels-martin-de-arriba-25131490-6739524.jpg?alt=media&token=c9fbc754-a3a2-4caf-8b8e-7f641ea8c174\",\"Duration\":\"333.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Nostalgia\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Midnight%20Call%20-%20Ben%20Elson.mp3?alt=media&token=5f837ef7-69b4-451b-b3bc-5f46bb3b077f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Mizlo\",\"SongTitle\":\"Overboard\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Vaporwave%2FAlbum%20Art%2Fpexels-pramodtiwari-13594336.jpg?alt=media&token=36fb8d0b-2781-4b65-98ca-43f8889d531d\",\"Duration\":\"153.0\",\"Genre\":\"Music Meditations\",\"Mood\":\"Thoughtful\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/Soundscapes%20Music%20Meditations%20Tab%2FES_Overboard%20-%20Mizlo.mp3?alt=media&token=7d4e9882-79ff-40b0-8c37-0f1b718e6649\"}'))
  ];
  List<SoundscapesStruct> get SoundscapesMusicMeditationsTab =>
      _SoundscapesMusicMeditationsTab;
  set SoundscapesMusicMeditationsTab(List<SoundscapesStruct> value) {
    _SoundscapesMusicMeditationsTab = value;
  }

  void addToSoundscapesMusicMeditationsTab(SoundscapesStruct value) {
    SoundscapesMusicMeditationsTab.add(value);
  }

  void removeFromSoundscapesMusicMeditationsTab(SoundscapesStruct value) {
    SoundscapesMusicMeditationsTab.remove(value);
  }

  void removeAtIndexFromSoundscapesMusicMeditationsTab(int index) {
    SoundscapesMusicMeditationsTab.removeAt(index);
  }

  void updateSoundscapesMusicMeditationsTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesMusicMeditationsTab[index] =
        updateFn(_SoundscapesMusicMeditationsTab[index]);
  }

  void insertAtIndexInSoundscapesMusicMeditationsTab(
      int index, SoundscapesStruct value) {
    SoundscapesMusicMeditationsTab.insert(index, value);
  }

  List<SoundscapesStruct> _SoundscapesSleepTab = [
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Rocket Noise\",\"SongTitle\":\"Affirmations\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-carlos-montelara-3450804-5861727.jpg?alt=media&token=8e5ae3bf-a5c3-4e73-b232-bf8e6c0af287\",\"Duration\":\"253.0\",\"Genre\":\"Sleep\",\"Mood\":\"Binaural\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Affirmations%20-%20Rocket%20Noise.mp3?alt=media&token=f7d2d7e9-cded-42ff-a293-34349e101f5f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Valante\",\"SongTitle\":\"Alonia\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-clubhouseconvos-13620067.jpg?alt=media&token=d27dd553-56b2-4047-b49d-22857191eb45\",\"Duration\":\"255.0\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Alonia%20-%20Valante.mp3?alt=media&token=832fd567-12f5-4875-ac30-fdafca43064c\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"Ambient Area, Dark Hum\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-clubhouseconvos-13620069.jpg?alt=media&token=14f4d998-0425-4aab-a37d-925833686838\",\"Duration\":\"100.0\",\"Genre\":\"Sleep\",\"Mood\":\"Real World\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Ambient%20Area%2C%20Dark%20Hum%20-%20Epidemic%20Sound.mp3?alt=media&token=1a0a0ce8-bf04-408c-bd79-0f3b713ddc8b\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Valante\",\"SongTitle\":\"Anantya Vihara\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-0ldpikes-31636696.jpg?alt=media&token=0e8c1493-bb13-4128-be61-0e2bee66c4b6\",\"Duration\":\"251.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Anantya%20Vihara%20-%20Valante.mp3?alt=media&token=36bfdadc-3e00-41aa-996b-9562819a2596\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"Brooding Ambience Space\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-0ldpikes-31636696.jpg?alt=media&token=0e8c1493-bb13-4128-be61-0e2bee66c4b6\",\"Duration\":\"300.0\",\"Genre\":\"Sleep\",\"Mood\":\"White Noise\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Brooding%20Ambience%20Space%20-%20Epidemic%20Sound.mp3?alt=media&token=822a74aa-f500-4e9e-9269-e5a87e4aebe4\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"Crickets Ambience, Night, Meadow 03\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-67120628-8376091.jpg?alt=media&token=59bcde0e-44ea-49b6-a0cb-994201d5fd0f\",\"Duration\":\"118.0\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Crickets%20Ambience%2C%20Night%2C%20Meadow%2003%20-%20Epidemic%20Sound.mp3?alt=media&token=5b718f1d-619a-4d15-9a1f-a47e1d062202\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"Designed Water, Aquarium, Bubbles 03\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-alina-rossoshanska-338724645-29319453.jpg?alt=media&token=3e65463f-0090-44f8-ac38-1b095790506a\",\"Duration\":\"588.0\",\"Genre\":\"Sleep\",\"Mood\":\"Calm Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Designed%20Water%2C%20Aquarium%2C%20Bubbles%2003%20-%20Epidemic%20Sound.mp3?alt=media&token=edca8bd5-7422-4583-8fce-18e24e01fdbb\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Mandala Dreams\",\"SongTitle\":\"Dream Focus Beta Waves (146-160 Hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-artbovich-6283973.jpg?alt=media&token=267a54f3-8ce8-4392-9399-4bfabf769b3a\",\"Duration\":\"305.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Dream%20Focus%20Beta%20Waves%20(146-160%20Hz)%20-%20Mandala%20Dreams.mp3?alt=media&token=c85cdaeb-faad-4974-9683-f7c90fe2e925\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Hanna Lindgren\",\"SongTitle\":\"End of a Dream\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-artbovich-6585625.jpg?alt=media&token=23e0cb7c-0605-40f7-95af-c4d6674f9387\",\"Duration\":\"347.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ominous\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_End%20of%20a%20Dream%20-%20Hanna%20Lindgren.mp3?alt=media&token=b667a8c6-4e08-4d4f-b74e-24260c6584bf\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Amber Glow\",\"SongTitle\":\"Enlightened Drift\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-clubhouseconvos-13620071.jpg?alt=media&token=aa72c4a7-caac-4046-bb27-779b73e18478\",\"Duration\":\"316.0\",\"Genre\":\"Sleep\",\"Mood\":\"Calm Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Enlightened%20Drift%20-%20Amber%20Glow.mp3?alt=media&token=5fca2b29-30b8-4ae6-bc94-b69dcbfb02ce\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Blue Saga\",\"SongTitle\":\"Helt stilla\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-durmussarica-10108905.jpg?alt=media&token=38aecb9c-9ee7-4d64-a68b-39b72fa3cffd\",\"Duration\":\"545.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Helt%20stilla%20-%20Blue%20Saga.mp3?alt=media&token=5f0aaf40-0847-47e0-a031-72768ab03771\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Hanna Lindgren\",\"SongTitle\":\"Intermission\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-duygugungor-24038436.jpg?alt=media&token=0c36019f-ecc5-47db-925e-785a5f36c101\",\"Duration\":\"356.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ominous\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Intermission%20-%20Hanna%20Lindgren.mp3?alt=media&token=02e5cbe9-08e2-4e99-a50b-9a676ced2f6d\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Valante\",\"SongTitle\":\"Kindled\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-efce-705477.jpg?alt=media&token=d55713a9-d314-40fa-8173-5fc610e2fdce\",\"Duration\":\"313.0\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Kindled%20-%20Valante.mp3?alt=media&token=981176ca-bebb-4e0c-a595-6503551c18c9\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Valante\",\"SongTitle\":\"Kokoro\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-ekaterina-bolovtsova-7445324.jpg?alt=media&token=51e47202-41b3-4354-8b03-d474b47dad56\",\"Duration\":\"339.0\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Kokoro%20-%20Valante.mp3?alt=media&token=bd516146-1302-4f13-928f-3ccbc2394afe\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"Living Room, Distant Traffic 01\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-ekaterina-bolovtsova-7445347.jpg?alt=media&token=b1e21f3c-ce46-4d92-989d-07e021d854eb\",\"Duration\":\"126.0\",\"Genre\":\"Sleep\",\"Mood\":\"White Noise\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Living%20Room%2C%20Distant%20Traffic%2001%20-%20Epidemic%20Sound.mp3?alt=media&token=106d8c4c-552a-4f87-ac8a-a2749bc91510\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Strom\",\"SongTitle\":\"Midnattssol\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-flavia-dias-127252601-34952201.jpg?alt=media&token=8c69868c-5b14-44cd-916d-ae481182770c\",\"Duration\":\"307.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Midnattssol%20-%20Strom.mp3?alt=media&token=18cfc2fe-6c81-4d08-ae24-063e68831a7f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"By Lotus\",\"SongTitle\":\"Mirai\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-flavia-dias-127252601-34952201.jpg?alt=media&token=8c69868c-5b14-44cd-916d-ae481182770c\",\"Duration\":\"325.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Mirai%20-%20By%20Lotus.mp3?alt=media&token=73716ad6-16f4-41f5-b18d-e2c4e0b5a225\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Hanna Lindgren\",\"SongTitle\":\"Murmurations\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-guiirossi-1705073.jpg?alt=media&token=6e9e0bc2-c037-4a82-a5b2-e7e2fb9e8311\",\"Duration\":\"256.0\",\"Genre\":\"Sleep\",\"Mood\":\"Deep Rest\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Murmurations%20-%20Hanna%20Lindgren.mp3?alt=media&token=4549b46f-ce49-4ce4-8c56-ec431a6962fb\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"DEX 1200\",\"SongTitle\":\"Oppland\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-houwng-nguyen-3756130-33521561.jpg?alt=media&token=0aa5de25-b0e4-4253-b8a6-cf392467b6fd\",\"Duration\":\"307.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Oppland%20-%20DEX%201200.mp3?alt=media&token=29cfd0b2-4089-4118-9aea-19c402a29cd1\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Hanna Lindgren\",\"SongTitle\":\"Sense of Relief\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FAlbum%20Art%2Fpexels-introspectivedsgn-17716285.jpg?alt=media&token=583ff292-5aaf-4d09-bf9f-c3318cefe591\",\"Duration\":\"322.0\",\"Genre\":\"Sleep\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesSleepTab%2FES_Sense%20of%20Relief%20-%20Hanna%20Lindgren.mp3?alt=media&token=d8a33e13-75d0-4388-ae7d-709251a9e952\"}'))
  ];
  List<SoundscapesStruct> get SoundscapesSleepTab => _SoundscapesSleepTab;
  set SoundscapesSleepTab(List<SoundscapesStruct> value) {
    _SoundscapesSleepTab = value;
  }

  void addToSoundscapesSleepTab(SoundscapesStruct value) {
    SoundscapesSleepTab.add(value);
  }

  void removeFromSoundscapesSleepTab(SoundscapesStruct value) {
    SoundscapesSleepTab.remove(value);
  }

  void removeAtIndexFromSoundscapesSleepTab(int index) {
    SoundscapesSleepTab.removeAt(index);
  }

  void updateSoundscapesSleepTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesSleepTab[index] = updateFn(_SoundscapesSleepTab[index]);
  }

  void insertAtIndexInSoundscapesSleepTab(int index, SoundscapesStruct value) {
    SoundscapesSleepTab.insert(index, value);
  }

  List<SoundscapesStruct> _SoundscapesFocusTab = [
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"ES_3rd Solar Plexus Chakra Kundalini Breathing\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-afroromanzo-5483044.jpg?alt=media&token=1b740591-be79-4dbc-9f08-b972bb851a66\",\"Duration\":\"807.0\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_3rd%20Solar%20Plexus%20Chakra%20Kundalini%20Breathing%20-%20369.mp3?alt=media&token=5de197f0-cc17-4f40-aac3-30516002228b\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Experia\",\"SongTitle\":\"ES_A Focused Mind - Experia\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-sebastiaan9977-3379261.jpg?alt=media&token=f163aadd-f52a-4941-aa02-08239cc4cc35\",\"Duration\":\"203.0\",\"Genre\":\"Focus\",\"Mood\":\"Cinematic\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_A%20Focused%20Mind%20-%20Experia.mp3?alt=media&token=39ef5781-f149-41f7-a5c9-e6b35caf6f86\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"DAJANA\",\"SongTitle\":\"Already Know (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rethaferguson-3059892.jpg?alt=media&token=1afc68f7-6e73-4c49-bd38-5ae6c281cb9f\",\"Duration\":\"414.0\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Already%20Know%20(Instrumental%20Version)%20-%20DAJANA.mp3?alt=media&token=1b86de22-1051-4dd7-b859-d340410ca2e6\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Binaural (Alpha)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-ravikant-5337636.jpg?alt=media&token=b1fab4c5-b62b-4e04-bdb9-df80ef51a82f\",\"Duration\":\"317.0\",\"Genre\":\"Focus\",\"Mood\":\"Cerebral\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Binaural%20Alpha%20-%20Syntropy.mp3?alt=media&token=b4ddf9de-857b-4f08-9c81-a0db8508941f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Binaural Cloud (Alpha 7 Hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-ravikant-5337636.jpg?alt=media&token=b1fab4c5-b62b-4e04-bdb9-df80ef51a82f\",\"Duration\":\"258.0\",\"Genre\":\"Focus\",\"Mood\":\"Stress-Reducing\",\"SongUrl\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Magonia\",\"SongTitle\":\"Binaural Schumann Alpha\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rafaalem-14847096.jpg?alt=media&token=6bedac41-aeb3-4911-9105-803475a45043\",\"Duration\":\"258.0\",\"Genre\":\"Focus\",\"Mood\":\"Cerebral\",\"SongUrl\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Clairvoyance (Alpha Waves 8 hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-rafaalem-14845614.jpg?alt=media&token=42db3023-ad81-4351-8a77-dbf5a8385a9c\",\"Duration\":\"247.0\",\"Genre\":\"Focus\",\"Mood\":\"Ambient\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Clairvoyance%20(Alpha%20Waves%208%20hz)%20-%20Syntropy.mp3?alt=media&token=6c03a6ed-0143-4087-8cbb-187ca173f66a\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Crystalimbic (Beta Waves)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pnw-prod-8980953.jpg?alt=media&token=4e0e92e5-eb17-4474-96e2-9b27e80150fe\",\"Duration\":\"317.0\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Crystalimbic%20(Beta%20Waves)%20-%20Syntropy.mp3?alt=media&token=d1e8a2f9-f043-48bd-a982-39baee344c42\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Norman Sann\",\"SongTitle\":\"ES_D.W.B (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pnw-prod-8980943.jpg?alt=media&token=ec542353-6ed3-43af-a327-c4b2972c9005\",\"Duration\":\"317.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_D.W.B%20(Instrumental%20Version)%20-%20Norman%20Sann.mp3?alt=media&token=61796edc-58e0-4195-9837-9d6936136ab8\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Hector Gabriel\",\"SongTitle\":\"Dance in the Light (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pixabay-159193.jpg?alt=media&token=6adb486b-cb8e-4a4d-a7d7-4ff83ca326bb\",\"Duration\":\"318.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Dance%20in%20the%20Light%20(Instrumental%20Version)%20-%20Hector%20Gabriel.mp3?alt=media&token=11f058f8-98c1-417d-a2d1-5b081dc1b9c3\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Trevor Kawalski\",\"SongTitle\":\"Focus On the Moment\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-pattjjee-18156531.jpg?alt=media&token=41dbc742-bbfe-491c-a2d2-741bcbb8c0e3\",\"Duration\":\"232.0\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Focus%20On%20the%20Moment%20-%20Trevor%20Kowalski.mp3?alt=media&token=b5a9c165-452f-4fa0-9cd6-5d546e28d1bf\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Dama Beatz\",\"SongTitle\":\"Focused\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-nicollazzi-xiong-208366-668353.jpg?alt=media&token=d4929129-60d7-4861-b41b-f36e50bc9f44\",\"Duration\":\"343.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Focused%20-%20Damma%20Beatz.mp3?alt=media&token=fce16c23-fcb0-4259-a282-9007cc5e6cf5\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"ES\",\"SongTitle\":\"Forest Summer High Pitched Birds\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-marleneleppanen-16981566.jpg?alt=media&token=cbbfad0b-f246-4a54-8b76-2449050f7e05\",\"Duration\":\"128.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Forest%20Summer%20High%20Pitched%20Birds%20-%20Epidemic%20Sound.mp3?alt=media&token=6ff92b49-2dd7-4683-8e08-37430ce102d1\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Zorro\",\"SongTitle\":\"I\'m Summer (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-koolshooters-8534781.jpg?alt=media&token=39475db4-beff-4202-9761-5955c2f2ea9f\",\"Duration\":\"222.0\",\"Genre\":\"Focus\",\"Mood\":\"Uplifting\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_I\'m%20Summer%20(Instrumental%20Version)%20-%20Zorro.mp3?alt=media&token=44b91186-d6ce-4397-b05b-11e9f913cefa\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Syntropy\",\"SongTitle\":\"Koan II (Alpha 10 Hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-klub-boks-1437055-10868847.jpg?alt=media&token=4f37f5af-56c3-45e8-84b5-46f91a789a7d\",\"Duration\":\"234.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Koan%20II%20(Alpha%2010%20Hz)%20-%20Syntropy.mp3?alt=media&token=7cc8c805-3ef2-4d8f-a3e8-9f9618321095\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Mimi Bangoura\",\"SongTitle\":\"Meant to Be (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-hebertsantos-8461246.jpg?alt=media&token=fb7f5f49-ade9-4c6a-a6b8-b7c46c618542\",\"Duration\":\"305.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Meant%20to%20Be%20(Instrumental%20Version)%20-%20Mimmi%20Bangoura.mp3?alt=media&token=776950c9-8695-4902-857a-06cda02a3c9c\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Mimi Bangoura\",\"SongTitle\":\"Might As Well Be on the Moon (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-gustavodenuncio-31923252.jpg?alt=media&token=d08baf5e-a3a7-4e37-8f61-17a342c31c11\",\"Duration\":\"346.0\",\"Genre\":\"Focus\",\"Mood\":\"Cultured\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Might%20As%20Well%20Be%20on%20the%20Moon%20(Instrumental%20Version)%20-%20Mimmi%20Bangoura.mp3?alt=media&token=6ad8b314-fb58-4be8-baeb-aa99f4ca780f\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Ira Moon\",\"SongTitle\":\"My Deja Vu (Instrumental Version)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-fotios-photos-13230724.jpg?alt=media&token=1e22bd64-a354-4bb3-bcf0-697f2fc85190\",\"Duration\":\"242.0\",\"Genre\":\"Focus\",\"Mood\":\"Chill\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_My%20Deja%20Vu%20(Instrumental%20Version)%20-%20Ira%20Moon.mp3?alt=media&token=40473f6c-9135-4b60-b815-b8ad563eddad\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Bruce Brus\",\"SongTitle\":\"Nordic Sunrise (Alpha Drone 8Hz)\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-faruktokluoglu-10063057.jpg?alt=media&token=6b505e90-1c3f-48db-88e7-100e06efc633\",\"Duration\":\"238.0\",\"Genre\":\"Focus\",\"Mood\":\"Transformative\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Nordic%20Sunrise%20(Alpha%20Drone%208Hz)%20-%20Bruce%20Brus.mp3?alt=media&token=dd363342-9f64-4459-a89e-4e48d35d194c\"}')),
    SoundscapesStruct.fromSerializableMap(jsonDecode(
        '{\"Artist\":\"Strom\",\"SongTitle\":\"Omfamnad\",\"AlbumArt\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FAlbumArt%2Fpexels-duy-nguyen-489946968-28899238.jpg?alt=media&token=d2f8d835-2e87-4515-8904-fb462b04dd35\",\"Duration\":\"311.0\",\"Genre\":\"Focus\",\"Mood\":\"Transformative\",\"SongUrl\":\"https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/SoundscapesFocusTab%2FSongs%2FES_Omfamnad%20-%20Strom.mp3?alt=media&token=88de8214-fd07-4fb2-ab24-c61be046c687\"}'))
  ];
  List<SoundscapesStruct> get SoundscapesFocusTab => _SoundscapesFocusTab;
  set SoundscapesFocusTab(List<SoundscapesStruct> value) {
    _SoundscapesFocusTab = value;
  }

  void addToSoundscapesFocusTab(SoundscapesStruct value) {
    SoundscapesFocusTab.add(value);
  }

  void removeFromSoundscapesFocusTab(SoundscapesStruct value) {
    SoundscapesFocusTab.remove(value);
  }

  void removeAtIndexFromSoundscapesFocusTab(int index) {
    SoundscapesFocusTab.removeAt(index);
  }

  void updateSoundscapesFocusTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesFocusTab[index] = updateFn(_SoundscapesFocusTab[index]);
  }

  void insertAtIndexInSoundscapesFocusTab(int index, SoundscapesStruct value) {
    SoundscapesFocusTab.insert(index, value);
  }

  List<String> _LastJournalContent = [];
  List<String> get LastJournalContent => _LastJournalContent;
  set LastJournalContent(List<String> value) {
    _LastJournalContent = value;
  }

  void addToLastJournalContent(String value) {
    LastJournalContent.add(value);
  }

  void removeFromLastJournalContent(String value) {
    LastJournalContent.remove(value);
  }

  void removeAtIndexFromLastJournalContent(int index) {
    LastJournalContent.removeAt(index);
  }

  void updateLastJournalContentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    LastJournalContent[index] = updateFn(_LastJournalContent[index]);
  }

  void insertAtIndexInLastJournalContent(int index, String value) {
    LastJournalContent.insert(index, value);
  }

  String _preferredSessionLength = '';
  String get preferredSessionLength => _preferredSessionLength;
  set preferredSessionLength(String value) {
    _preferredSessionLength = value;
  }

  DateTime? _PreferredTimeOfDayToMeditate;
  DateTime? get PreferredTimeOfDayToMeditate => _PreferredTimeOfDayToMeditate;
  set PreferredTimeOfDayToMeditate(DateTime? value) {
    _PreferredTimeOfDayToMeditate = value;
  }

  String _TimeOfDayToMeditate = '';
  String get TimeOfDayToMeditate => _TimeOfDayToMeditate;
  set TimeOfDayToMeditate(String value) {
    _TimeOfDayToMeditate = value;
  }

  List<SoundscapesStruct> _SoundscapesJazzTab = [];
  List<SoundscapesStruct> get SoundscapesJazzTab => _SoundscapesJazzTab;
  set SoundscapesJazzTab(List<SoundscapesStruct> value) {
    _SoundscapesJazzTab = value;
  }

  void addToSoundscapesJazzTab(SoundscapesStruct value) {
    SoundscapesJazzTab.add(value);
  }

  void removeFromSoundscapesJazzTab(SoundscapesStruct value) {
    SoundscapesJazzTab.remove(value);
  }

  void removeAtIndexFromSoundscapesJazzTab(int index) {
    SoundscapesJazzTab.removeAt(index);
  }

  void updateSoundscapesJazzTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesJazzTab[index] = updateFn(_SoundscapesJazzTab[index]);
  }

  void insertAtIndexInSoundscapesJazzTab(int index, SoundscapesStruct value) {
    SoundscapesJazzTab.insert(index, value);
  }

  List<SoundscapesStruct> _SoundscapesVaporwaveTab = [];
  List<SoundscapesStruct> get SoundscapesVaporwaveTab =>
      _SoundscapesVaporwaveTab;
  set SoundscapesVaporwaveTab(List<SoundscapesStruct> value) {
    _SoundscapesVaporwaveTab = value;
  }

  void addToSoundscapesVaporwaveTab(SoundscapesStruct value) {
    SoundscapesVaporwaveTab.add(value);
  }

  void removeFromSoundscapesVaporwaveTab(SoundscapesStruct value) {
    SoundscapesVaporwaveTab.remove(value);
  }

  void removeAtIndexFromSoundscapesVaporwaveTab(int index) {
    SoundscapesVaporwaveTab.removeAt(index);
  }

  void updateSoundscapesVaporwaveTabAtIndex(
    int index,
    SoundscapesStruct Function(SoundscapesStruct) updateFn,
  ) {
    SoundscapesVaporwaveTab[index] = updateFn(_SoundscapesVaporwaveTab[index]);
  }

  void insertAtIndexInSoundscapesVaporwaveTab(
      int index, SoundscapesStruct value) {
    SoundscapesVaporwaveTab.insert(index, value);
  }

  SoundscapesStruct _currentMediaAllTab = SoundscapesStruct();
  SoundscapesStruct get currentMediaAllTab => _currentMediaAllTab;
  set currentMediaAllTab(SoundscapesStruct value) {
    _currentMediaAllTab = value;
    secureStorage.setString('ff_currentMediaAllTab', value.serialize());
  }

  void deleteCurrentMediaAllTab() {
    secureStorage.delete(key: 'ff_currentMediaAllTab');
  }

  void updateCurrentMediaAllTabStruct(Function(SoundscapesStruct) updateFn) {
    updateFn(_currentMediaAllTab);
    secureStorage.setString(
        'ff_currentMediaAllTab', _currentMediaAllTab.serialize());
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

  bool _isMiniPlayerVisible = false;
  bool get isMiniPlayerVisible => _isMiniPlayerVisible;
  set isMiniPlayerVisible(bool value) {
    _isMiniPlayerVisible = value;
    secureStorage.setBool('ff_isMiniPlayerVisible', value);
  }

  void deleteIsMiniPlayerVisible() {
    secureStorage.delete(key: 'ff_isMiniPlayerVisible');
  }

  double _audioBufferedPosition = 0.0;
  double get audioBufferedPosition => _audioBufferedPosition;
  set audioBufferedPosition(double value) {
    _audioBufferedPosition = value;
  }

  double _currentAudioVolume = 1.0;
  double get currentAudioVolume => _currentAudioVolume;
  set currentAudioVolume(double value) {
    _currentAudioVolume = value;
  }

  double _audioVolume = 1.0;
  double get audioVolume => _audioVolume;
  set audioVolume(double value) {
    _audioVolume = value;
  }

  double _currentPositionOfAudioInSeconds = 0.0;
  double get currentPositionOfAudioInSeconds =>
      _currentPositionOfAudioInSeconds;
  set currentPositionOfAudioInSeconds(double value) {
    _currentPositionOfAudioInSeconds = value;
  }

  double _totalDurationOfSeconds = 0.0;
  double get totalDurationOfSeconds => _totalDurationOfSeconds;
  set totalDurationOfSeconds(double value) {
    _totalDurationOfSeconds = value;
  }

  bool _isAudioPlayerShuffling = false;
  bool get isAudioPlayerShuffling => _isAudioPlayerShuffling;
  set isAudioPlayerShuffling(bool value) {
    _isAudioPlayerShuffling = value;
  }

  bool _isAudioPlayerPlaying = false;
  bool get isAudioPlayerPlaying => _isAudioPlayerPlaying;
  set isAudioPlayerPlaying(bool value) {
    _isAudioPlayerPlaying = value;
  }

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

  bool _isAllTab = false;
  bool get isAllTab => _isAllTab;
  set isAllTab(bool value) {
    _isAllTab = value;
  }

  bool _isNatureTab = false;
  bool get isNatureTab => _isNatureTab;
  set isNatureTab(bool value) {
    _isNatureTab = value;
  }

  bool _isMusicMeditationsTab = false;
  bool get isMusicMeditationsTab => _isMusicMeditationsTab;
  set isMusicMeditationsTab(bool value) {
    _isMusicMeditationsTab = value;
  }

  bool _isFocusTab = false;
  bool get isFocusTab => _isFocusTab;
  set isFocusTab(bool value) {
    _isFocusTab = value;
  }

  bool _isSleepTab = false;
  bool get isSleepTab => _isSleepTab;
  set isSleepTab(bool value) {
    _isSleepTab = value;
  }

  bool _isOnboardingFinished = false;
  bool get isOnboardingFinished => _isOnboardingFinished;
  set isOnboardingFinished(bool value) {
    _isOnboardingFinished = value;
  }

  int _onboardingTabIndex = 0;
  int get onboardingTabIndex => _onboardingTabIndex;
  set onboardingTabIndex(int value) {
    _onboardingTabIndex = value;
  }

  List<OnboardingGoalsStruct> _OnboardingGoals = [
    OnboardingGoalsStruct.fromSerializableMap(
        jsonDecode('{\"title\":\"Hello World\",\"color\":\"#0000\"}'))
  ];
  List<OnboardingGoalsStruct> get OnboardingGoals => _OnboardingGoals;
  set OnboardingGoals(List<OnboardingGoalsStruct> value) {
    _OnboardingGoals = value;
  }

  void addToOnboardingGoals(OnboardingGoalsStruct value) {
    OnboardingGoals.add(value);
  }

  void removeFromOnboardingGoals(OnboardingGoalsStruct value) {
    OnboardingGoals.remove(value);
  }

  void removeAtIndexFromOnboardingGoals(int index) {
    OnboardingGoals.removeAt(index);
  }

  void updateOnboardingGoalsAtIndex(
    int index,
    OnboardingGoalsStruct Function(OnboardingGoalsStruct) updateFn,
  ) {
    OnboardingGoals[index] = updateFn(_OnboardingGoals[index]);
  }

  void insertAtIndexInOnboardingGoals(int index, OnboardingGoalsStruct value) {
    OnboardingGoals.insert(index, value);
  }

  List<String> _OnboardingInterest = [];
  List<String> get OnboardingInterest => _OnboardingInterest;
  set OnboardingInterest(List<String> value) {
    _OnboardingInterest = value;
  }

  void addToOnboardingInterest(String value) {
    OnboardingInterest.add(value);
  }

  void removeFromOnboardingInterest(String value) {
    OnboardingInterest.remove(value);
  }

  void removeAtIndexFromOnboardingInterest(int index) {
    OnboardingInterest.removeAt(index);
  }

  void updateOnboardingInterestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    OnboardingInterest[index] = updateFn(_OnboardingInterest[index]);
  }

  void insertAtIndexInOnboardingInterest(int index, String value) {
    OnboardingInterest.insert(index, value);
  }

  bool _isFirstTimeUser = true;
  bool get isFirstTimeUser => _isFirstTimeUser;
  set isFirstTimeUser(bool value) {
    _isFirstTimeUser = value;
    secureStorage.setBool('ff_isFirstTimeUser', value);
  }

  void deleteIsFirstTimeUser() {
    secureStorage.delete(key: 'ff_isFirstTimeUser');
  }

  bool _isFirstTimeUserLucille = false;
  bool get isFirstTimeUserLucille => _isFirstTimeUserLucille;
  set isFirstTimeUserLucille(bool value) {
    _isFirstTimeUserLucille = value;
  }

  bool _isFirstTimeUserSoundscapes = false;
  bool get isFirstTimeUserSoundscapes => _isFirstTimeUserSoundscapes;
  set isFirstTimeUserSoundscapes(bool value) {
    _isFirstTimeUserSoundscapes = value;
  }

  bool _isMoodScanned = false;
  bool get isMoodScanned => _isMoodScanned;
  set isMoodScanned(bool value) {
    _isMoodScanned = value;
  }

  DocumentReference? _coinsEarned;
  DocumentReference? get coinsEarned => _coinsEarned;
  set coinsEarned(DocumentReference? value) {
    _coinsEarned = value;
  }

  bool _hasCleansedRoot = false;
  bool get hasCleansedRoot => _hasCleansedRoot;
  set hasCleansedRoot(bool value) {
    _hasCleansedRoot = value;
    secureStorage.setBool('ff_hasCleansedRoot', value);
  }

  void deleteHasCleansedRoot() {
    secureStorage.delete(key: 'ff_hasCleansedRoot');
  }

  String _voiceNote = '';
  String get voiceNote => _voiceNote;
  set voiceNote(String value) {
    _voiceNote = value;
    secureStorage.setString('ff_voiceNote', value);
  }

  void deleteVoiceNote() {
    secureStorage.delete(key: 'ff_voiceNote');
  }

  bool _isAudioRecording = false;
  bool get isAudioRecording => _isAudioRecording;
  set isAudioRecording(bool value) {
    _isAudioRecording = value;
    secureStorage.setBool('ff_isAudioRecording', value);
  }

  void deleteIsAudioRecording() {
    secureStorage.delete(key: 'ff_isAudioRecording');
  }

  bool _isAudioStopped = false;
  bool get isAudioStopped => _isAudioStopped;
  set isAudioStopped(bool value) {
    _isAudioStopped = value;
  }

  bool _isFinishedIntroWalkthrough = false;
  bool get isFinishedIntroWalkthrough => _isFinishedIntroWalkthrough;
  set isFinishedIntroWalkthrough(bool value) {
    _isFinishedIntroWalkthrough = value;
    secureStorage.setBool('ff_isFinishedIntroWalkthrough', value);
  }

  void deleteIsFinishedIntroWalkthrough() {
    secureStorage.delete(key: 'ff_isFinishedIntroWalkthrough');
  }

  double _pointsEarnedPercentage = 0.0;
  double get pointsEarnedPercentage => _pointsEarnedPercentage;
  set pointsEarnedPercentage(double value) {
    _pointsEarnedPercentage = value;
    secureStorage.setDouble('ff_pointsEarnedPercentage', value);
  }

  void deletePointsEarnedPercentage() {
    secureStorage.delete(key: 'ff_pointsEarnedPercentage');
  }

  List<int> _currentChakraLevel = [];
  List<int> get currentChakraLevel => _currentChakraLevel;
  set currentChakraLevel(List<int> value) {
    _currentChakraLevel = value;
  }

  void addToCurrentChakraLevel(int value) {
    currentChakraLevel.add(value);
  }

  void removeFromCurrentChakraLevel(int value) {
    currentChakraLevel.remove(value);
  }

  void removeAtIndexFromCurrentChakraLevel(int index) {
    currentChakraLevel.removeAt(index);
  }

  void updateCurrentChakraLevelAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    currentChakraLevel[index] = updateFn(_currentChakraLevel[index]);
  }

  void insertAtIndexInCurrentChakraLevel(int index, int value) {
    currentChakraLevel.insert(index, value);
  }

  bool _chakraRewardShown = false;
  bool get chakraRewardShown => _chakraRewardShown;
  set chakraRewardShown(bool value) {
    _chakraRewardShown = value;
    secureStorage.setBool('ff_chakraRewardShown', value);
  }

  void deleteChakraRewardShown() {
    secureStorage.delete(key: 'ff_chakraRewardShown');
  }

  bool _isFirstTimeUsingEnergyScan = false;
  bool get isFirstTimeUsingEnergyScan => _isFirstTimeUsingEnergyScan;
  set isFirstTimeUsingEnergyScan(bool value) {
    _isFirstTimeUsingEnergyScan = value;
    secureStorage.setBool('ff_isFirstTimeUsingEnergyScan', value);
  }

  void deleteIsFirstTimeUsingEnergyScan() {
    secureStorage.delete(key: 'ff_isFirstTimeUsingEnergyScan');
  }

  String _gorqKey = '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';
  String get gorqKey => _gorqKey;
  set gorqKey(String value) {
    _gorqKey = value;
    secureStorage.setString('ff_gorqKey', value);
  }

  void deleteGorqKey() {
    secureStorage.delete(key: 'ff_gorqKey');
  }

  int _NewReorderedIndex = 0;
  int get NewReorderedIndex => _NewReorderedIndex;
  set NewReorderedIndex(int value) {
    _NewReorderedIndex = value;
    secureStorage.setInt('ff_NewReorderedIndex', value);
  }

  void deleteNewReorderedIndex() {
    secureStorage.delete(key: 'ff_NewReorderedIndex');
  }

  int _ReorderedVideosIndex = 0;
  int get ReorderedVideosIndex => _ReorderedVideosIndex;
  set ReorderedVideosIndex(int value) {
    _ReorderedVideosIndex = value;
    secureStorage.setInt('ff_ReorderedVideosIndex', value);
  }

  void deleteReorderedVideosIndex() {
    secureStorage.delete(key: 'ff_ReorderedVideosIndex');
  }

  String _activeExerciseSessionID = '';
  String get activeExerciseSessionID => _activeExerciseSessionID;
  set activeExerciseSessionID(String value) {
    _activeExerciseSessionID = value;
    secureStorage.setString('ff_activeExerciseSessionID', value);
  }

  void deleteActiveExerciseSessionID() {
    secureStorage.delete(key: 'ff_activeExerciseSessionID');
  }

  String _currentSoundscapeID = '';
  String get currentSoundscapeID => _currentSoundscapeID;
  set currentSoundscapeID(String value) {
    _currentSoundscapeID = value;
    secureStorage.setString('ff_currentSoundscapeID', value);
  }

  void deleteCurrentSoundscapeID() {
    secureStorage.delete(key: 'ff_currentSoundscapeID');
  }

  String _exerciseID = '';
  String get exerciseID => _exerciseID;
  set exerciseID(String value) {
    _exerciseID = value;
    secureStorage.setString('ff_exerciseID', value);
  }

  void deleteExerciseID() {
    secureStorage.delete(key: 'ff_exerciseID');
  }

  List<TheoryOfMindLucilleStreamChatStruct> _messagesTheoryOfMind = [];
  List<TheoryOfMindLucilleStreamChatStruct> get messagesTheoryOfMind =>
      _messagesTheoryOfMind;
  set messagesTheoryOfMind(List<TheoryOfMindLucilleStreamChatStruct> value) {
    _messagesTheoryOfMind = value;
    secureStorage.setStringList(
        'ff_messagesTheoryOfMind', value.map((x) => x.serialize()).toList());
  }

  void deleteMessagesTheoryOfMind() {
    secureStorage.delete(key: 'ff_messagesTheoryOfMind');
  }

  void addToMessagesTheoryOfMind(TheoryOfMindLucilleStreamChatStruct value) {
    messagesTheoryOfMind.add(value);
    secureStorage.setStringList('ff_messagesTheoryOfMind',
        _messagesTheoryOfMind.map((x) => x.serialize()).toList());
  }

  void removeFromMessagesTheoryOfMind(
      TheoryOfMindLucilleStreamChatStruct value) {
    messagesTheoryOfMind.remove(value);
    secureStorage.setStringList('ff_messagesTheoryOfMind',
        _messagesTheoryOfMind.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMessagesTheoryOfMind(int index) {
    messagesTheoryOfMind.removeAt(index);
    secureStorage.setStringList('ff_messagesTheoryOfMind',
        _messagesTheoryOfMind.map((x) => x.serialize()).toList());
  }

  void updateMessagesTheoryOfMindAtIndex(
    int index,
    TheoryOfMindLucilleStreamChatStruct Function(
            TheoryOfMindLucilleStreamChatStruct)
        updateFn,
  ) {
    messagesTheoryOfMind[index] = updateFn(_messagesTheoryOfMind[index]);
    secureStorage.setStringList('ff_messagesTheoryOfMind',
        _messagesTheoryOfMind.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMessagesTheoryOfMind(
      int index, TheoryOfMindLucilleStreamChatStruct value) {
    messagesTheoryOfMind.insert(index, value);
    secureStorage.setStringList('ff_messagesTheoryOfMind',
        _messagesTheoryOfMind.map((x) => x.serialize()).toList());
  }

  bool _hasSeenOnboarding = false;
  bool get hasSeenOnboarding => _hasSeenOnboarding;
  set hasSeenOnboarding(bool value) {
    _hasSeenOnboarding = value;
    secureStorage.setBool('ff_hasSeenOnboarding', value);
  }

  void deleteHasSeenOnboarding() {
    secureStorage.delete(key: 'ff_hasSeenOnboarding');
  }

  bool _isWellnessCheckInStressedDecision = false;
  bool get isWellnessCheckInStressedDecision =>
      _isWellnessCheckInStressedDecision;
  set isWellnessCheckInStressedDecision(bool value) {
    _isWellnessCheckInStressedDecision = value;
  }

  bool _isEnergyScore = false;
  bool get isEnergyScore => _isEnergyScore;
  set isEnergyScore(bool value) {
    _isEnergyScore = value;
    secureStorage.setBool('ff_isEnergyScore', value);
  }

  void deleteIsEnergyScore() {
    secureStorage.delete(key: 'ff_isEnergyScore');
  }

  int _energyScore = 0;
  int get energyScore => _energyScore;
  set energyScore(int value) {
    _energyScore = value;
    secureStorage.setInt('ff_energyScore', value);
  }

  void deleteEnergyScore() {
    secureStorage.delete(key: 'ff_energyScore');
  }

  String _energyLevel = '';
  String get energyLevel => _energyLevel;
  set energyLevel(String value) {
    _energyLevel = value;
  }

  double _stressLevel = 0.0;
  double get stressLevel => _stressLevel;
  set stressLevel(double value) {
    _stressLevel = value;
  }

  String _firebaseIDToken =
      'cc273c8e6eaff5487bf644bf5d5f0d048cc96d5308fb87651d2551ec716206da';
  String get firebaseIDToken => _firebaseIDToken;
  set firebaseIDToken(String value) {
    _firebaseIDToken = value;
  }

  String _lucilleUserID = '';
  String get lucilleUserID => _lucilleUserID;
  set lucilleUserID(String value) {
    _lucilleUserID = value;
  }

  String _lucilleMessage = '';
  String get lucilleMessage => _lucilleMessage;
  set lucilleMessage(String value) {
    _lucilleMessage = value;
  }

  final _lucilleSuggestedExercisesManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> lucilleSuggestedExercises({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _lucilleSuggestedExercisesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLucilleSuggestedExercisesCache() =>
      _lucilleSuggestedExercisesManager.clear();
  void clearLucilleSuggestedExercisesCacheKey(String? uniqueKey) =>
      _lucilleSuggestedExercisesManager.clearRequest(uniqueKey);

  final _recommendedExercisesMoodScanManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> recommendedExercisesMoodScan({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _recommendedExercisesMoodScanManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRecommendedExercisesMoodScanCache() =>
      _recommendedExercisesMoodScanManager.clear();
  void clearRecommendedExercisesMoodScanCacheKey(String? uniqueKey) =>
      _recommendedExercisesMoodScanManager.clearRequest(uniqueKey);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
