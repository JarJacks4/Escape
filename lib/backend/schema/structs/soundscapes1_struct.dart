// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Soundscapes1Struct extends FFFirebaseStruct {
  Soundscapes1Struct({
    String? soundscapeId,
    String? category,
    String? title,
    String? description,
    int? durationSeconds,
    List<String>? targetEmotions,
    List<String>? targetContexts,
    String? audioUrl,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _soundscapeId = soundscapeId,
        _category = category,
        _title = title,
        _description = description,
        _durationSeconds = durationSeconds,
        _targetEmotions = targetEmotions,
        _targetContexts = targetContexts,
        _audioUrl = audioUrl,
        _icon = icon,
        super(firestoreUtilData);

  // "soundscape_id" field.
  String? _soundscapeId;
  String get soundscapeId => _soundscapeId ?? '';
  set soundscapeId(String? val) => _soundscapeId = val;

  bool hasSoundscapeId() => _soundscapeId != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "duration_seconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  set durationSeconds(int? val) => _durationSeconds = val;

  void incrementDurationSeconds(int amount) =>
      durationSeconds = durationSeconds + amount;

  bool hasDurationSeconds() => _durationSeconds != null;

  // "target_emotions" field.
  List<String>? _targetEmotions;
  List<String> get targetEmotions => _targetEmotions ?? const [];
  set targetEmotions(List<String>? val) => _targetEmotions = val;

  void updateTargetEmotions(Function(List<String>) updateFn) {
    updateFn(_targetEmotions ??= []);
  }

  bool hasTargetEmotions() => _targetEmotions != null;

  // "target_contexts" field.
  List<String>? _targetContexts;
  List<String> get targetContexts => _targetContexts ?? const [];
  set targetContexts(List<String>? val) => _targetContexts = val;

  void updateTargetContexts(Function(List<String>) updateFn) {
    updateFn(_targetContexts ??= []);
  }

  bool hasTargetContexts() => _targetContexts != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static Soundscapes1Struct fromMap(Map<String, dynamic> data) =>
      Soundscapes1Struct(
        soundscapeId: data['soundscape_id'] as String?,
        category: data['category'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        durationSeconds: castToType<int>(data['duration_seconds']),
        targetEmotions: getDataList(data['target_emotions']),
        targetContexts: getDataList(data['target_contexts']),
        audioUrl: data['audio_url'] as String?,
        icon: data['icon'] as String?,
      );

  static Soundscapes1Struct? maybeFromMap(dynamic data) => data is Map
      ? Soundscapes1Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'soundscape_id': _soundscapeId,
        'category': _category,
        'title': _title,
        'description': _description,
        'duration_seconds': _durationSeconds,
        'target_emotions': _targetEmotions,
        'target_contexts': _targetContexts,
        'audio_url': _audioUrl,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'soundscape_id': serializeParam(
          _soundscapeId,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration_seconds': serializeParam(
          _durationSeconds,
          ParamType.int,
        ),
        'target_emotions': serializeParam(
          _targetEmotions,
          ParamType.String,
          isList: true,
        ),
        'target_contexts': serializeParam(
          _targetContexts,
          ParamType.String,
          isList: true,
        ),
        'audio_url': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static Soundscapes1Struct fromSerializableMap(Map<String, dynamic> data) =>
      Soundscapes1Struct(
        soundscapeId: deserializeParam(
          data['soundscape_id'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        durationSeconds: deserializeParam(
          data['duration_seconds'],
          ParamType.int,
          false,
        ),
        targetEmotions: deserializeParam<String>(
          data['target_emotions'],
          ParamType.String,
          true,
        ),
        targetContexts: deserializeParam<String>(
          data['target_contexts'],
          ParamType.String,
          true,
        ),
        audioUrl: deserializeParam(
          data['audio_url'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'Soundscapes1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is Soundscapes1Struct &&
        soundscapeId == other.soundscapeId &&
        category == other.category &&
        title == other.title &&
        description == other.description &&
        durationSeconds == other.durationSeconds &&
        listEquality.equals(targetEmotions, other.targetEmotions) &&
        listEquality.equals(targetContexts, other.targetContexts) &&
        audioUrl == other.audioUrl &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([
        soundscapeId,
        category,
        title,
        description,
        durationSeconds,
        targetEmotions,
        targetContexts,
        audioUrl,
        icon
      ]);
}

Soundscapes1Struct createSoundscapes1Struct({
  String? soundscapeId,
  String? category,
  String? title,
  String? description,
  int? durationSeconds,
  String? audioUrl,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Soundscapes1Struct(
      soundscapeId: soundscapeId,
      category: category,
      title: title,
      description: description,
      durationSeconds: durationSeconds,
      audioUrl: audioUrl,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

Soundscapes1Struct? updateSoundscapes1Struct(
  Soundscapes1Struct? soundscapes1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    soundscapes1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSoundscapes1StructData(
  Map<String, dynamic> firestoreData,
  Soundscapes1Struct? soundscapes1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (soundscapes1 == null) {
    return;
  }
  if (soundscapes1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && soundscapes1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final soundscapes1Data =
      getSoundscapes1FirestoreData(soundscapes1, forFieldValue);
  final nestedData =
      soundscapes1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = soundscapes1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSoundscapes1FirestoreData(
  Soundscapes1Struct? soundscapes1, [
  bool forFieldValue = false,
]) {
  if (soundscapes1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(soundscapes1.toMap());

  // Add any Firestore field values
  mapToFirestore(soundscapes1.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSoundscapes1ListFirestoreData(
  List<Soundscapes1Struct>? soundscapes1s,
) =>
    soundscapes1s?.map((e) => getSoundscapes1FirestoreData(e, true)).toList() ??
    [];
