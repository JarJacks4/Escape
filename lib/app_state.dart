import 'package:flutter/material.dart';
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
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
      _AmbientMusic = prefs.getStringList('ff_AmbientMusic') ?? _AmbientMusic;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<String> _SoundscapeScenario = [];
  List<String> get SoundscapeScenario => _SoundscapeScenario;
  set SoundscapeScenario(List<String> value) {
    _SoundscapeScenario = value;
  }

  void addToSoundscapeScenario(String value) {
    SoundscapeScenario.add(value);
  }

  void removeFromSoundscapeScenario(String value) {
    SoundscapeScenario.remove(value);
  }

  void removeAtIndexFromSoundscapeScenario(int index) {
    SoundscapeScenario.removeAt(index);
  }

  void updateSoundscapeScenarioAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SoundscapeScenario[index] = updateFn(_SoundscapeScenario[index]);
  }

  void insertAtIndexInSoundscapeScenario(int index, String value) {
    SoundscapeScenario.insert(index, value);
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
    prefs.setStringList('ff_AmbientMusic', value);
  }

  void addToAmbientMusic(String value) {
    AmbientMusic.add(value);
    prefs.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void removeFromAmbientMusic(String value) {
    AmbientMusic.remove(value);
    prefs.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void removeAtIndexFromAmbientMusic(int index) {
    AmbientMusic.removeAt(index);
    prefs.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void updateAmbientMusicAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AmbientMusic[index] = updateFn(_AmbientMusic[index]);
    prefs.setStringList('ff_AmbientMusic', _AmbientMusic);
  }

  void insertAtIndexInAmbientMusic(int index, String value) {
    AmbientMusic.insert(index, value);
    prefs.setStringList('ff_AmbientMusic', _AmbientMusic);
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

  List<LucilleStreamResponseFINALStruct> _messages = [];
  List<LucilleStreamResponseFINALStruct> get messages => _messages;
  set messages(List<LucilleStreamResponseFINALStruct> value) {
    _messages = value;
  }

  void addToMessages(LucilleStreamResponseFINALStruct value) {
    messages.add(value);
  }

  void removeFromMessages(LucilleStreamResponseFINALStruct value) {
    messages.remove(value);
  }

  void removeAtIndexFromMessages(int index) {
    messages.removeAt(index);
  }

  void updateMessagesAtIndex(
    int index,
    LucilleStreamResponseFINALStruct Function(LucilleStreamResponseFINALStruct)
        updateFn,
  ) {
    messages[index] = updateFn(_messages[index]);
  }

  void insertAtIndexInMessages(
      int index, LucilleStreamResponseFINALStruct value) {
    messages.insert(index, value);
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
