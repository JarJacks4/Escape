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
        '{\"video\":\"video1\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744993440/Download_1_yra0ld.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"1\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744992912/Download_qccjju.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"2\",\"urlvideo\":\"https://res.cloudinary.com/dcato1y8g/video/upload/v1717458332/h1cstbyekaq8mnlcrntv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744993439/Download_2_qw2mdv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994648/Download_7_ktaowq.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994628/Download_8_ffhfxw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994629/Download_3_sfz1n8.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994628/Download_5_dv7dxz.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744994627/Download_6_tvuh5s.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}'))
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
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998504/Download_11_n6onoj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998506/Download_9_vltml4.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998504/Download_10_plbezp.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998501/Download_12_xee5fu.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998500/Download_13_xrbaff.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998497/Download_15_zvsun6.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998497/Download_15_zvsun6.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998497/Download_16_a40edl.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998491/Download_22_fz96kq.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604047/588b57e1dfd96a53c9bef7d0d9baab03_daoswp.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604047/b65740305d9f721b703061d843565c4e_oanmc3.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604040/e744e44480bbdf8e17ffeb8d3be25e72_o9oqbb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604037/59ece56067de09704c5befe5abc9d25a_eqm8sc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604036/62e89d09d9eccc65a1db302fd0192da9_zj5xhy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604036/39d374d8c9410c16a300b8aa36d9e45c_rw3bss.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604036/cc3157ae2467df9ef1025ed0ea809b57_ka2s2h.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604029/69729711a4f2b6a2095a7cf593c09955_cpa4hj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604029/79d559d448a1d938e0d5f5d27afc6d39_dw52pc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604028/96c931f97b84b28b167bbabdd692e949_prrcmm.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604028/3c7bc2dd16f3389b790eb956647a1278_qmiqda.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604028/d18aac755aba901350593d4de7717409_abgvbw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604021/6c0bd47d31832f516f621460c3fec309_gnwxrn.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604020/e9a5f897d3297cc82fef3744f703f64f_nto6ql.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604020/e8ef22aa2605f40b04cbdcb79da92392_dn8czs.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604019/d1f96c4a7dd137c10d7d70567ba99bc1_etbunj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604019/d1f96c4a7dd137c10d7d70567ba99bc1_etbunj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604014/096cfdd90d53e4fc0d21a96802c4bb57_g9cl4s.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}'))
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
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998494/Download_18_kdrylz.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998493/Download_19_koimmh.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998491/Download_20_grrrsn.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998491/Download_21_qcusmr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1744998490/Download_23_ximpym.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604019/d1f96c4a7dd137c10d7d70567ba99bc1_etbunj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604014/096cfdd90d53e4fc0d21a96802c4bb57_g9cl4s.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604014/a0005e6aa527b09410de3e68cbbc10ae_yrcfng.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604014/c41f57cce7dd6c038733b11a688e7b4d_x8tt7s.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604013/3eb5a4bcbf90d994b71bb11b5fa8b995_madhh9.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604013/3e04542e301ae648df70da36b2168683_apqndr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604013/6fdb5e1981904baf379c070382b410be_uvhruy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604012/8c435a4a31fff61e04a183cf47e7eaae_j6yin0.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604012/0b526c3b91c33084f3e1a643fd7a22a7_k8tpxg.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604012/8a16b6583e3bfca56e0540b258ad005d_frkdij.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604012/2dbb82ac04cc27b41070a303bea07074_ecdq0j.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604008/b8d0513e5d46be9aa8c28a38d596af47_t0v65y.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604007/f4b5010abcf7dfcd42af9aa57ba23531_temxz0.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604007/ac34006e6a0acd8b8e3d974736765d82_q3n06a.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604004/fe77661a51c2c6508d7a0732c957e375_chgbzs.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604006/5d43708b36991fc15f39f5a880093241_oqxyic.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604006/85ed9261f358eb6e3285206c94eaddf4_famfls.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604004/fe77661a51c2c6508d7a0732c957e375_chgbzs.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604003/9c60b717307916906329692b1168d643_tqbzcu.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604002/3e6994586df08fafbccb57d12a90a4a1_djfk78.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604001/4418662efde983ef1f9b106bbeec4483_mj7f4h.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604001/d6247386afbd55885539706a96612b3a_f8znx3.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747273730/dotsave.app_pinterest_video_downloader_1747273217681_ilmykb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747273722/dotsave.app_pinterest_video_downloader_1747273329264_hone4t.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"Hello World\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}'))
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

  List<TiktokPageStruct> _meditationTikToks = [
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604109/d8d8a34cc26f59bd8789096881c32b40_jt3jfy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604105/337474901981bea82ccb352733355d7f_cxksfz.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604105/dbacae154920fa63f482f88cbb8becf1_bibmxx.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604104/a355dde69ccad511622282071539d01b_vzbjm1.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604104/8306986c6c4e59605fecf532e2ec0f89_zonxqe.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604103/29491cf9fdc3087d8aeb0f9b52566257_se9eyh.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604103/7cbb1a1a19573b7231eb8e859c4185e2_genb7y.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604103/a157bf1efd3e73f5b412c876539406b2_hujt7t.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604102/dc51b0ca79caeb4b10c7a080e8ffe678_ns92gb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604102/d9c1c322a26bab2a370ed754edebada6_qcppjv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604091/486d530ec0c837903ffb229c8d22cd8c_exqsb4.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604090/9ffff119b410ef388d60b6e97f4e1312_xpqj13.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604090/92a2b0ae85a91d85b420f97e0ec6f54b_qh3bro.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604090/92a2b0ae85a91d85b420f97e0ec6f54b_qh3bro.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604089/eec6496efe12efcaa4ad623be6bc4bf0_kuvsbg.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604089/a9714e72f9bef742e8a2b35e87f95dbb_roqoh7.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604088/d4b914ef6a1ea931894f276537996813_vy4o4z.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604088/75ce33bd03931e5b56f3f338597e615d_kjug7u.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604088/9d48e828599b30b7c145c71684c0dd04_tnuwo9.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604088/7c51befa0164c9a04dd1cb269339e972_t7kcqg.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604075/425e178f40bdd46ae45f28112fa4863d_z6ncbr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604075/4400c7f9fd66d8bdc193366bde3abcb3_dfnwxc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604075/6f070b85dc055ecfbb657ee2685546a4_fwf1dr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604074/a3b360226a1b1aa1f57f59d3598104c5_tfldwk.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604074/c90e96af29b4cc9debff77f0d87021ac_rkkiu2.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604074/2e64cec55da014f8eb5124140956f19e_wcpgyt.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604074/305f8a3f78e0da6aa42a640bafc69ccc_nzhknj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604073/10494053d20d31d71687fd2b9e4681d9_yvzt8w.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604072/5376f6a1d1757d9892c96c24abd6cefc_wd35bu.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604072/fc32d8944ebf9021e3c030cce499968c_maemik.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604072/2e0cdc1c54d6ab67369630106a4878d3_ov7d0i.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604072/93595fa8fc89ced6301e576ea4f4ae0a_ppp1gl.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604071/0f68cd14f97e7dd1ebf6c60fcbe3fe52_jqhjob.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604071/a4fc047cee51112151e2936aaae0b281_ctrmwy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604062/dfa2af3c2300e4b56e36f37d804e2993_lx2g8u.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604062/6e3e5c69cd3c36c0660cc57dd0d84980_fzs5sz.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604061/3cad74378ca0adcf47514a43cb1d6e33_nd5fcy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604061/72b5a2371603c23570e215ede0a21f17_zigipw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604061/72b5a2371603c23570e215ede0a21f17_zigipw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604060/36a54e09b08f60b4eeec0b090e9e98af_mhigpi.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604060/ae1c72e7e431d8897b7c8744f16f370d_eom8zf.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604059/ec8a2cb740e2a860ee80489b0f6a0997_aramye.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604059/c26790cbf1f62f3252237b58ae3ca72b_hrefv0.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604058/3a78b214f6793e5c44fa1406ae8ba5fc_lvffmw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604051/8dde5c2512e984372f09cb8f5a3ae16c_mjdhsh.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604050/7f88b2a9d426819651d744ba29c1d9ff_aelnjv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604049/dc5d893087420d92dea63b33350583c0_mscssq.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604048/d1d009c51a8212ae556bc6f589fdf0b2_uquqma.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/dbyduwpud/video/upload/v1747604048/fa064c879f9e1e96f4508337a3822ae8_rn7dze.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"Hello World\",\"userPicture\":\"Hello World\",\"profilename\":\"Hello World\"}'))
  ];
  List<TiktokPageStruct> get meditationTikToks => _meditationTikToks;
  set meditationTikToks(List<TiktokPageStruct> value) {
    _meditationTikToks = value;
  }

  void addToMeditationTikToks(TiktokPageStruct value) {
    meditationTikToks.add(value);
  }

  void removeFromMeditationTikToks(TiktokPageStruct value) {
    meditationTikToks.remove(value);
  }

  void removeAtIndexFromMeditationTikToks(int index) {
    meditationTikToks.removeAt(index);
  }

  void updateMeditationTikToksAtIndex(
    int index,
    TiktokPageStruct Function(TiktokPageStruct) updateFn,
  ) {
    meditationTikToks[index] = updateFn(_meditationTikToks[index]);
  }

  void insertAtIndexInMeditationTikToks(int index, TiktokPageStruct value) {
    meditationTikToks.insert(index, value);
  }
}
