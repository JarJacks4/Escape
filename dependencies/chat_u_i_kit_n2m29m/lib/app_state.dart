import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
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

  List<AttachmentStruct> _dummyAttachments = [
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"type\":\"IMAGE\",\"size\":\"0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\"}')),
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"type\":\"IMAGE\",\"size\":\"0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\"}')),
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"type\":\"IMAGE\",\"size\":\"0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\"}')),
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"type\":\"IMAGE\",\"size\":\"0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\"}')),
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"type\":\"IMAGE\",\"size\":\"0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\"}'))
  ];
  List<AttachmentStruct> get dummyAttachments => _dummyAttachments;
  set dummyAttachments(List<AttachmentStruct> value) {
    _dummyAttachments = value;
  }

  void addToDummyAttachments(AttachmentStruct value) {
    dummyAttachments.add(value);
  }

  void removeFromDummyAttachments(AttachmentStruct value) {
    dummyAttachments.remove(value);
  }

  void removeAtIndexFromDummyAttachments(int index) {
    dummyAttachments.removeAt(index);
  }

  void updateDummyAttachmentsAtIndex(
    int index,
    AttachmentStruct Function(AttachmentStruct) updateFn,
  ) {
    dummyAttachments[index] = updateFn(_dummyAttachments[index]);
  }

  void insertAtIndexInDummyAttachments(int index, AttachmentStruct value) {
    dummyAttachments.insert(index, value);
  }

  List<AttachmentStruct> _dummyGifAttachment = [
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExY3Nmemtzb2szNjhtZHdzY3pvOTluODZoZDM5ajRqdzVyeGlibmF4ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mcJohbfGPATW8/giphy.gif\",\"size\":\"70.0\",\"thumbnailUrl\":\"https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExY3Nmemtzb2szNjhtZHdzY3pvOTluODZoZDM5ajRqdzVyeGlibmF4ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mcJohbfGPATW8/giphy.gif\",\"fileName\":\"\",\"fileExtension\":\"\",\"sizeText\":\"70KB\"}'))
  ];
  List<AttachmentStruct> get dummyGifAttachment => _dummyGifAttachment;
  set dummyGifAttachment(List<AttachmentStruct> value) {
    _dummyGifAttachment = value;
  }

  void addToDummyGifAttachment(AttachmentStruct value) {
    dummyGifAttachment.add(value);
  }

  void removeFromDummyGifAttachment(AttachmentStruct value) {
    dummyGifAttachment.remove(value);
  }

  void removeAtIndexFromDummyGifAttachment(int index) {
    dummyGifAttachment.removeAt(index);
  }

  void updateDummyGifAttachmentAtIndex(
    int index,
    AttachmentStruct Function(AttachmentStruct) updateFn,
  ) {
    dummyGifAttachment[index] = updateFn(_dummyGifAttachment[index]);
  }

  void insertAtIndexInDummyGifAttachment(int index, AttachmentStruct value) {
    dummyGifAttachment.insert(index, value);
  }

  List<AttachmentStruct> _dummyAttachments2 = [
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"size\":\"0.0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"fileName\":\"Hello World\",\"fileExtension\":\"\",\"sizeText\":\"Hello World\"}')),
    AttachmentStruct.fromSerializableMap(jsonDecode(
        '{\"url\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"size\":\"0.0\",\"thumbnailUrl\":\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NDI3OTk3OTl8MA&ixlib=rb-4.0.3&q=80&w=1080\",\"fileName\":\"Hello World\",\"fileExtension\":\"\",\"sizeText\":\"Hello World\"}'))
  ];
  List<AttachmentStruct> get dummyAttachments2 => _dummyAttachments2;
  set dummyAttachments2(List<AttachmentStruct> value) {
    _dummyAttachments2 = value;
  }

  void addToDummyAttachments2(AttachmentStruct value) {
    dummyAttachments2.add(value);
  }

  void removeFromDummyAttachments2(AttachmentStruct value) {
    dummyAttachments2.remove(value);
  }

  void removeAtIndexFromDummyAttachments2(int index) {
    dummyAttachments2.removeAt(index);
  }

  void updateDummyAttachments2AtIndex(
    int index,
    AttachmentStruct Function(AttachmentStruct) updateFn,
  ) {
    dummyAttachments2[index] = updateFn(_dummyAttachments2[index]);
  }

  void insertAtIndexInDummyAttachments2(int index, AttachmentStruct value) {
    dummyAttachments2.insert(index, value);
  }
}
