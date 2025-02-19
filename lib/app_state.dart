import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _ProfilePicture = '';
  String get ProfilePicture => _ProfilePicture;
  set ProfilePicture(String value) {
    _ProfilePicture = value;
  }

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

  DocumentReference? _userProfile;
  DocumentReference? get userProfile => _userProfile;
  set userProfile(DocumentReference? value) {
    _userProfile = value;
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

  DocumentReference? _activeChat;
  DocumentReference? get activeChat => _activeChat;
  set activeChat(DocumentReference? value) {
    _activeChat = value;
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
}
