import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
      _sampleSongsEpidemic =
          prefs.getStringList('ff_sampleSongsEpidemic') ?? _sampleSongsEpidemic;
    });
    _safeInit(() {
      _uploadedSongs =
          prefs.getString('ff_uploadedSongs')?.ref ?? _uploadedSongs;
    });
    _safeInit(() {
      _isSubscriber = prefs.getBool('ff_isSubscriber') ?? _isSubscriber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<String> _sampleSongsEpidemic = ['gs://escape-ujuzxr.appspot.com'];
  List<String> get sampleSongsEpidemic => _sampleSongsEpidemic;
  set sampleSongsEpidemic(List<String> value) {
    _sampleSongsEpidemic = value;
    prefs.setStringList('ff_sampleSongsEpidemic', value);
  }

  void addToSampleSongsEpidemic(String value) {
    sampleSongsEpidemic.add(value);
    prefs.setStringList('ff_sampleSongsEpidemic', _sampleSongsEpidemic);
  }

  void removeFromSampleSongsEpidemic(String value) {
    sampleSongsEpidemic.remove(value);
    prefs.setStringList('ff_sampleSongsEpidemic', _sampleSongsEpidemic);
  }

  void removeAtIndexFromSampleSongsEpidemic(int index) {
    sampleSongsEpidemic.removeAt(index);
    prefs.setStringList('ff_sampleSongsEpidemic', _sampleSongsEpidemic);
  }

  void updateSampleSongsEpidemicAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sampleSongsEpidemic[index] = updateFn(_sampleSongsEpidemic[index]);
    prefs.setStringList('ff_sampleSongsEpidemic', _sampleSongsEpidemic);
  }

  void insertAtIndexInSampleSongsEpidemic(int index, String value) {
    sampleSongsEpidemic.insert(index, value);
    prefs.setStringList('ff_sampleSongsEpidemic', _sampleSongsEpidemic);
  }

  DocumentReference? _uploadedSongs;
  DocumentReference? get uploadedSongs => _uploadedSongs;
  set uploadedSongs(DocumentReference? value) {
    _uploadedSongs = value;
    value != null
        ? prefs.setString('ff_uploadedSongs', value.path)
        : prefs.remove('ff_uploadedSongs');
  }

  bool _isSubscriber = false;
  bool get isSubscriber => _isSubscriber;
  set isSubscriber(bool value) {
    _isSubscriber = value;
    prefs.setBool('ff_isSubscriber', value);
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
