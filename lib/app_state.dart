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

  DocumentReference? _historyReference;
  DocumentReference? get historyReference => _historyReference;
  set historyReference(DocumentReference? value) {
    _historyReference = value;
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

  bool _isBookmarked = false;
  bool get isBookmarked => _isBookmarked;
  set isBookmarked(bool value) {
    _isBookmarked = value;
  }
}
