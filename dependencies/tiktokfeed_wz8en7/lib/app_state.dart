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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<TiktokPageStruct> _ListTikTokPages = [
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"video1\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744993440/Download_1_yra0ld.mp4\",\"userPicture\":\"https://res.cloudinary.com/dcato1y8g/image/upload/v1701558081/People_Circle23_s4sjmm.png\",\"profilename\":\"John\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"video2\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"1\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744992912/Download_qccjju.mp4\",\"userPicture\":\"https://res.cloudinary.com/dcato1y8g/image/upload/v1701558081/People_Circle18_ss1xia.png\",\"profilename\":\"Nick\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"video3\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"2\",\"urlvideo\":\"https://res.cloudinary.com/dcato1y8g/video/upload/v1717458332/h1cstbyekaq8mnlcrntv.mp4\",\"userPicture\":\"https://res.cloudinary.com/dcato1y8g/image/upload/v1713905966/1713905965041000_gesssg.png\",\"profilename\":\"Alex\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Meditation\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744993439/Download_2_qw2mdv.mp4\",\"userPicture\":\"\",\"profilename\":\"\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994648/Download_7_ktaowq.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994628/Download_8_ffhfxw.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994629/Download_3_sfz1n8.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994628/Download_5_dv7dxz.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994627/Download_6_tvuh5s.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}'))
  ];
  List<TiktokPageStruct> get ListTikTokPages => _ListTikTokPages;
  set ListTikTokPages(List<TiktokPageStruct> value) {
    _ListTikTokPages = value;
  }

  void addToListTikTokPages(TiktokPageStruct value) {
    ListTikTokPages.add(value);
  }

  void removeFromListTikTokPages(TiktokPageStruct value) {
    ListTikTokPages.remove(value);
  }

  void removeAtIndexFromListTikTokPages(int index) {
    ListTikTokPages.removeAt(index);
  }

  void updateListTikTokPagesAtIndex(
    int index,
    TiktokPageStruct Function(TiktokPageStruct) updateFn,
  ) {
    ListTikTokPages[index] = updateFn(_ListTikTokPages[index]);
  }

  void insertAtIndexInListTikTokPages(int index, TiktokPageStruct value) {
    ListTikTokPages.insert(index, value);
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

  int _videoID = 0;
  int get videoID => _videoID;
  set videoID(int value) {
    _videoID = value;
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

  List<TiktokPageStruct> _BreathingTikTok = [
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998504/Download_11_n6onoj.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998506/Download_9_vltml4.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998504/Download_10_plbezp.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998501/Download_12_xee5fu.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998500/Download_13_xrbaff.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998497/Download_15_zvsun6.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998497/Download_15_zvsun6.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998497/Download_16_a40edl.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998491/Download_22_fz96kq.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}'))
  ];
  List<TiktokPageStruct> get BreathingTikTok => _BreathingTikTok;
  set BreathingTikTok(List<TiktokPageStruct> value) {
    _BreathingTikTok = value;
  }

  void addToBreathingTikTok(TiktokPageStruct value) {
    BreathingTikTok.add(value);
  }

  void removeFromBreathingTikTok(TiktokPageStruct value) {
    BreathingTikTok.remove(value);
  }

  void removeAtIndexFromBreathingTikTok(int index) {
    BreathingTikTok.removeAt(index);
  }

  void updateBreathingTikTokAtIndex(
    int index,
    TiktokPageStruct Function(TiktokPageStruct) updateFn,
  ) {
    BreathingTikTok[index] = updateFn(_BreathingTikTok[index]);
  }

  void insertAtIndexInBreathingTikTok(int index, TiktokPageStruct value) {
    BreathingTikTok.insert(index, value);
  }

  List<TiktokPageStruct> _BodyTikToks = [
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998494/Download_18_kdrylz.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998493/Download_19_koimmh.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998491/Download_20_grrrsn.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998491/Download_21_qcusmr.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998490/Download_23_ximpym.mp4\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}'))
  ];
  List<TiktokPageStruct> get BodyTikToks => _BodyTikToks;
  set BodyTikToks(List<TiktokPageStruct> value) {
    _BodyTikToks = value;
  }

  void addToBodyTikToks(TiktokPageStruct value) {
    BodyTikToks.add(value);
  }

  void removeFromBodyTikToks(TiktokPageStruct value) {
    BodyTikToks.remove(value);
  }

  void removeAtIndexFromBodyTikToks(int index) {
    BodyTikToks.removeAt(index);
  }

  void updateBodyTikToksAtIndex(
    int index,
    TiktokPageStruct Function(TiktokPageStruct) updateFn,
  ) {
    BodyTikToks[index] = updateFn(_BodyTikToks[index]);
  }

  void insertAtIndexInBodyTikToks(int index, TiktokPageStruct value) {
    BodyTikToks.insert(index, value);
  }
}
