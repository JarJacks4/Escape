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
      _ListTikTokPages = prefs
              .getStringList('ff_ListTikTokPages')
              ?.map((x) {
                try {
                  return TiktokPageStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListTikTokPages;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<TiktokPageStruct> _ListTikTokPages = [
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"video1\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310516/ssstik.io__everyjayliving_1759091822579_shm5yb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"1\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310517/ssstik.io__ethera.collective_1759091701500_a2gtir.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[]\",\"bookmark\":\"[]\",\"id\":\"2\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310522/ssstik.io__katybath_1759091465877_sgkz3o.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310521/ssstik.io__tranquilvibes8_1759091605607_iawohr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310521/ssstik.io__nikki.neisler_1759091523152_xncutw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310520/ssstik.io__growwithguri_1759091627876_u8v1qy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310523/ssstik.io__lealii_1759091437708_edtwlq.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310523/ssstik.io__katybath_1759091410546_gk2tut.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"Hello World\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310523/ssstik.io__iamlarasophiee_1759091491173_rxrg7n.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}'))
  ];
  List<TiktokPageStruct> get ListTikTokPages => _ListTikTokPages;
  set ListTikTokPages(List<TiktokPageStruct> value) {
    _ListTikTokPages = value;
    prefs.setStringList(
        'ff_ListTikTokPages', value.map((x) => x.serialize()).toList());
  }

  void addToListTikTokPages(TiktokPageStruct value) {
    ListTikTokPages.add(value);
    prefs.setStringList('ff_ListTikTokPages',
        _ListTikTokPages.map((x) => x.serialize()).toList());
  }

  void removeFromListTikTokPages(TiktokPageStruct value) {
    ListTikTokPages.remove(value);
    prefs.setStringList('ff_ListTikTokPages',
        _ListTikTokPages.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListTikTokPages(int index) {
    ListTikTokPages.removeAt(index);
    prefs.setStringList('ff_ListTikTokPages',
        _ListTikTokPages.map((x) => x.serialize()).toList());
  }

  void updateListTikTokPagesAtIndex(
    int index,
    TiktokPageStruct Function(TiktokPageStruct) updateFn,
  ) {
    ListTikTokPages[index] = updateFn(_ListTikTokPages[index]);
    prefs.setStringList('ff_ListTikTokPages',
        _ListTikTokPages.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListTikTokPages(int index, TiktokPageStruct value) {
    ListTikTokPages.insert(index, value);
    prefs.setStringList('ff_ListTikTokPages',
        _ListTikTokPages.map((x) => x.serialize()).toList());
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
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310538/ssstik.io__unwindambientmusic_1759090891180_1_uqeyqi.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310539/ssstik.io__sr_animaticdreamfantasy_1759090870652_ii3wfk.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310537/ssstik.io__serenitysoulsounds_1759090948759_dk9rf2.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310542/ssstik.io__big.visual.chill_1759090848819_b6mqxh.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310541/ssstik.io__markdurre_1759090826263_dv8d2p.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310541/ssstik.io__deva_gin_1759090793287_mgdabr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310541/ssstik.io__lesfreemusic_1759090779605_ynjdag.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310542/ssstik.io__vlogbackgroundmusic_1759090916590_orfin3.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310543/ssstik.io__mandala_meditation_1759090695111_fb0ud6.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310542/ssstik.io__ashamaluevmusic_1759090721244_dm1zln.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310547/ssstik.io__sr_animaticdreamfantasy_1759090641182_ufl4vk.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310551/ssstik.io___ausmad_1759066915001_tlotkb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310553/ssstik.io__laurieasmr_1759067831028_hy1gjz.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310555/ssstik.io__ryanclarkinmindset_1759067917387_eyz0cm.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310559/ssstik.io__iamcherenya_1759066563536_q3psnw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310562/ssstik.io__ultrahealer_1759065666860_segg4w.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310565/ssstik.io__rea.earth_1759064650635_i4moeh.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310567/ssstik.io__sendgoodvibes__1759064598979_ol2xnx.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310571/ssstik.io__coachchristo_1759067713232_srjsxj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310562/ssstik.io__nightatlasmusic_1759065636957_upjzld.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310571/ssstik.io__emilymeditates_1759067682716_lpm0fj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310572/ssstik.io__nightatlasmusic_1759064330385_kxczuc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310581/ssstik.io__joeyxoto_1759065727474_oeexan.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}'))
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
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311072/ssstik.io__kharmagrimes_1759012438803_verwwv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763312342/ssstik.io__claudibar_1759091328638_nmq5mq.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763312342/ssstik.io__mellymena_1759091284147_birjmb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763312342/ssstik.io__thecurtisfu_1759091301020_bpq2d0.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763312341/ssstik.io__paigegallardo_1759091315124_lesdos.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311987/ssstik.io__katelynernst4_1759091362726_sdpyuq.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311946/ssstik.io__ashtonvonkessler_1759091376293_wtw2kc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311946/ssstik.io__ruthpilatesstudio_1759091391994_a0udvr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311946/ssstik.io__katybath_1759091410546_j5mjpr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311946/ssstik.io__katybath_1759091465877_sl4krj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311073/ssstik.io__syddyoungyoga_1759012479813_q9cdd2.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311072/ssstik.io__kharmagrimes_1759012438803_verwwv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/ds1fszisq/video/upload/v1759067979/ssstik.io__agelessmobility_1759066937240_sucl2v.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311071/ssstik.io__livebetr_1759012561969_jc3hwo.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310556/ssstik.io__yoga.with.kate.amber_1759066603878_nvi3zy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310556/ssstik.io__emilykchen_1759066637292_sc1zls.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310555/ssstik.io__kamilalyu_1759066715224_gzdzoo.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310555/ssstik.io__kharmagrimes_1759066684642_ivk6cu.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310553/ssstik.io__marlasyoga_1759066835804_ceyhxx.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310552/ssstik.io__itssydneynoelle_1759066861208_w6k50z.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310551/ssstik.io__onthematwithmack_1759066892056_vtim5u.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310551/ssstik.io___ausmad_1759066915001_tlotkb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310550/ssstik.io__agelessmobility_1759066937240_rvhp6b.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310539/ssstik.io__unwindambientmusic_1759090891180_zbmgfk.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310537/ssstik.io__taichi.qingxuan_1759090963421_axzske.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310535/ssstik.io__daouniverse_1759091007797_y3rxzo.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310530/ssstik.io__taichikungfu112_1759091047059_yvukmk.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310530/ssstik.io__daouniverse_1759091123436_yoetgm.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310530/ssstik.io__annataichi_1759091063820_edvysa.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310530/ssstik.io__annataichi_1759091063820_edvysa.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}'))
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
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310523/ssstik.io__brittany_broski_1759091508015_agm7se.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310523/ssstik.io__iamlarasophiee_1759091491173_rxrg7n.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310521/ssstik.io__nikki.neisler_1759091523152_xncutw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310521/ssstik.io__tranquilvibes8_1759091605607_iawohr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310520/ssstik.io__theintuitionschool.co_1759091663659_bhpd4o.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310520/ssstik.io__zencollection108_1759091750274_yh7ud0.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310519/ssstik.io__zencollection108_1759091767278_s74tm1.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310517/ssstik.io__mrcultdaddy_1759091813447_medmi3.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310542/ssstik.io__vlogbackgroundmusic_1759090916590_orfin3.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310543/ssstik.io__mandala_meditation_1759090695111_fb0ud6.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310553/ssstik.io__laurieasmr_1759067831028_hy1gjz.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310559/ssstik.io__iamcherenya_1759066563536_q3psnw.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310568/ssstik.io__thecollectiveritual_1759064413087_iegccb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/ds1fszisq/video/upload/v1759068010/ssstik.io__joeyxoto_1759065727474_if2llc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310566/ssstik.io__dailyaffirmbliss_1759065419510_cswotn.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310568/ssstik.io__thecollectiveritual_1759064413087_iegccb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310565/ssstik.io__rea.earth_1759064650635_i4moeh.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310571/ssstik.io__emilymeditates_1759067682716_lpm0fj.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/ds1fszisq/video/upload/v1759068021/ssstik.io__tranquilwhisperer_1759064797079_xjr5yo.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310581/ssstik.io__joeyxoto_1759065727474_oeexan.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310579/ssstik.io__serenitysoulsounds_1759090929575_ssk3it.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310581/ssstik.io__monkeymindmeditation_1759065752596_zcttzc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310575/ssstik.io__monkeymindmeditation_1759066479466_tqjjvo.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310586/ssstik.io__heatherkonzehypnotherapy_1759065690736_cgtvuy.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310588/ssstik.io__daithi7_1759064740784_xejezs.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310591/ssstik.io__soothing.relaxation_1759067939697_mw4igr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310592/ssstik.io__tranquilwhisperer_1759064797079_p0smte.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310597/ssstik.io__esthers_universe_1759064365629_mqrpkr.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311064/ssstik.io__musicforbodyandspirit_1759013003282_rmnhpm.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311066/ssstik.io__rea.earth_1759012916348_ged3xa.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311066/ssstik.io__loreenofficial_1759012870988_zcrecf.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311067/ssstik.io__meditation4soul_1759013029274_nfkei7.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311067/ssstik.io__meditation4soul_1759013029274_nfkei7.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311069/ssstik.io__estefaniamarroquinl_1759012642727_qhhyni.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311070/ssstik.io__meditation4soul_1759012740840_pjvszc.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311074/ssstik.io__kalisyuga_1759012385500_gfbag5.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311078/ssstik.io__carrieann_bailey_1759012706778_tc757m.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311082/ssstik.io__soul_star_sanctuary_1759011950710_1_t16h7h.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311083/ssstik.io__dreastlks_1759012824738_jn7gwl.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311084/ssstik.io__deeprootmovement_1758933717221_baozxb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311084/ssstik.io__thecollectiveritual_1758933917848_v1mxc8.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311085/ssstik.io__emselement_1759012224318_i5batx.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311085/ssstik.io__intinature_1758933655698_pdcza5.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311089/ssstik.io__ultrahealer_1759013127900_yqyh1m.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311089/ssstik.io__ultrahealer_1759013127900_yqyh1m.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311089/ssstik.io__serenitysoulsounds_1759012613110_znvkrb.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311103/ssstik.io__dralangoodwin_1758933195758_npjpyv.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311103/ssstik.io__biancarosestephenson_1758933262667_qh2zhs.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763311106/ssstik.io__yoga.samantha_1758933316314_z607ys.mp4\",\"userPicture\":\"\",\"profilename\":\"Escape - Featured\"}')),
    TiktokPageStruct.fromSerializableMap(jsonDecode(
        '{\"video\":\"\",\"likes\":\"[\\\"Hello World\\\"]\",\"bookmark\":\"[\\\"Hello World\\\"]\",\"id\":\"0\",\"urlvideo\":\"https://res.cloudinary.com/djm6axyxz/video/upload/v1763310541/ssstik.io__deva_gin_1759090793287_mgdabr.mp4\",\"userPicture\":\"\",\"profilename\":\"\"}'))
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

  List<TiktokPageStruct> _ReorderedForYouVideos = [];
  List<TiktokPageStruct> get ReorderedForYouVideos => _ReorderedForYouVideos;
  set ReorderedForYouVideos(List<TiktokPageStruct> value) {
    _ReorderedForYouVideos = value;
  }

  void addToReorderedForYouVideos(TiktokPageStruct value) {
    ReorderedForYouVideos.add(value);
  }

  void removeFromReorderedForYouVideos(TiktokPageStruct value) {
    ReorderedForYouVideos.remove(value);
  }

  void removeAtIndexFromReorderedForYouVideos(int index) {
    ReorderedForYouVideos.removeAt(index);
  }

  void updateReorderedForYouVideosAtIndex(
    int index,
    TiktokPageStruct Function(TiktokPageStruct) updateFn,
  ) {
    ReorderedForYouVideos[index] = updateFn(_ReorderedForYouVideos[index]);
  }

  void insertAtIndexInReorderedForYouVideos(int index, TiktokPageStruct value) {
    ReorderedForYouVideos.insert(index, value);
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
