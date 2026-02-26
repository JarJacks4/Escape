import 'package:flutter/material.dart';
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

  List<String> _shapes = [
    'Right Triangle',
    'Square',
    'Circle',
    'Pentagon',
    'Hexagon',
    'Star',
    'Heart'
  ];
  List<String> get shapes => _shapes;
  set shapes(List<String> value) {
    _shapes = value;
  }

  void addToShapes(String value) {
    shapes.add(value);
  }

  void removeFromShapes(String value) {
    shapes.remove(value);
  }

  void removeAtIndexFromShapes(int index) {
    shapes.removeAt(index);
  }

  void updateShapesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    shapes[index] = updateFn(_shapes[index]);
  }

  void insertAtIndexInShapes(int index, String value) {
    shapes.insert(index, value);
  }
}
