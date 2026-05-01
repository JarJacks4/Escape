// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LucilleChatStruct extends FFFirebaseStruct {
  LucilleChatStruct({
    String? sessionId,
    String? content,
    String? category,
    bool? hasDisclaimer,
    String? disclaimer,
    String? confidence,
    List<String>? conversation,
    String? model,
    int? tokensUsed,
    int? responseLength,
    Role? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sessionId = sessionId,
        _content = content,
        _category = category,
        _hasDisclaimer = hasDisclaimer,
        _disclaimer = disclaimer,
        _confidence = confidence,
        _conversation = conversation,
        _model = model,
        _tokensUsed = tokensUsed,
        _responseLength = responseLength,
        _role = role,
        super(firestoreUtilData);

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "has_disclaimer" field.
  bool? _hasDisclaimer;
  bool get hasDisclaimer => _hasDisclaimer ?? true;
  set hasDisclaimer(bool? val) => _hasDisclaimer = val;

  bool hasHasDisclaimer() => _hasDisclaimer != null;

  // "disclaimer" field.
  String? _disclaimer;
  String get disclaimer => _disclaimer ?? '';
  set disclaimer(String? val) => _disclaimer = val;

  bool hasDisclaimerField() => _disclaimer != null;

  // "confidence" field.
  String? _confidence;
  String get confidence => _confidence ?? '';
  set confidence(String? val) => _confidence = val;

  bool hasConfidence() => _confidence != null;

  // "conversation" field.
  List<String>? _conversation;
  List<String> get conversation => _conversation ?? const [];
  set conversation(List<String>? val) => _conversation = val;

  void updateConversation(Function(List<String>) updateFn) {
    updateFn(_conversation ??= []);
  }

  bool hasConversation() => _conversation != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "tokens_used" field.
  int? _tokensUsed;
  int get tokensUsed => _tokensUsed ?? 0;
  set tokensUsed(int? val) => _tokensUsed = val;

  void incrementTokensUsed(int amount) => tokensUsed = tokensUsed + amount;

  bool hasTokensUsed() => _tokensUsed != null;

  // "response_length" field.
  int? _responseLength;
  int get responseLength => _responseLength ?? 0;
  set responseLength(int? val) => _responseLength = val;

  void incrementResponseLength(int amount) =>
      responseLength = responseLength + amount;

  bool hasResponseLength() => _responseLength != null;

  // "role" field.
  Role? _role;
  Role get role => _role ?? Role.User;
  set role(Role? val) => _role = val;

  bool hasRole() => _role != null;

  static LucilleChatStruct fromMap(Map<String, dynamic> data) =>
      LucilleChatStruct(
        sessionId: data['session_id'] as String?,
        content: data['content'] as String?,
        category: data['category'] as String?,
        hasDisclaimer: data['has_disclaimer'] as bool?,
        disclaimer: data['disclaimer'] as String?,
        confidence: data['confidence'] as String?,
        conversation: getDataList(data['conversation']),
        model: data['model'] as String?,
        tokensUsed: castToType<int>(data['tokens_used']),
        responseLength: castToType<int>(data['response_length']),
        role: data['role'] is Role
            ? data['role']
            : deserializeEnum<Role>(data['role']),
      );

  static LucilleChatStruct? maybeFromMap(dynamic data) => data is Map
      ? LucilleChatStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'session_id': _sessionId,
        'content': _content,
        'category': _category,
        'has_disclaimer': _hasDisclaimer,
        'disclaimer': _disclaimer,
        'confidence': _confidence,
        'conversation': _conversation,
        'model': _model,
        'tokens_used': _tokensUsed,
        'response_length': _responseLength,
        'role': _role?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'session_id': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'has_disclaimer': serializeParam(
          _hasDisclaimer,
          ParamType.bool,
        ),
        'disclaimer': serializeParam(
          _disclaimer,
          ParamType.String,
        ),
        'confidence': serializeParam(
          _confidence,
          ParamType.String,
        ),
        'conversation': serializeParam(
          _conversation,
          ParamType.String,
          isList: true,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'tokens_used': serializeParam(
          _tokensUsed,
          ParamType.int,
        ),
        'response_length': serializeParam(
          _responseLength,
          ParamType.int,
        ),
        'role': serializeParam(
          _role,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static LucilleChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      LucilleChatStruct(
        sessionId: deserializeParam(
          data['session_id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        hasDisclaimer: deserializeParam(
          data['has_disclaimer'],
          ParamType.bool,
          false,
        ),
        disclaimer: deserializeParam(
          data['disclaimer'],
          ParamType.String,
          false,
        ),
        confidence: deserializeParam(
          data['confidence'],
          ParamType.String,
          false,
        ),
        conversation: deserializeParam<String>(
          data['conversation'],
          ParamType.String,
          true,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        tokensUsed: deserializeParam(
          data['tokens_used'],
          ParamType.int,
          false,
        ),
        responseLength: deserializeParam(
          data['response_length'],
          ParamType.int,
          false,
        ),
        role: deserializeParam<Role>(
          data['role'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'LucilleChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LucilleChatStruct &&
        sessionId == other.sessionId &&
        content == other.content &&
        category == other.category &&
        hasDisclaimer == other.hasDisclaimer &&
        disclaimer == other.disclaimer &&
        confidence == other.confidence &&
        listEquality.equals(conversation, other.conversation) &&
        model == other.model &&
        tokensUsed == other.tokensUsed &&
        responseLength == other.responseLength &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([
        sessionId,
        content,
        category,
        hasDisclaimer,
        disclaimer,
        confidence,
        conversation,
        model,
        tokensUsed,
        responseLength,
        role
      ]);
}

LucilleChatStruct createLucilleChatStruct({
  String? sessionId,
  String? content,
  String? category,
  bool? hasDisclaimer,
  String? disclaimer,
  String? confidence,
  String? model,
  int? tokensUsed,
  int? responseLength,
  Role? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LucilleChatStruct(
      sessionId: sessionId,
      content: content,
      category: category,
      hasDisclaimer: hasDisclaimer,
      disclaimer: disclaimer,
      confidence: confidence,
      model: model,
      tokensUsed: tokensUsed,
      responseLength: responseLength,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LucilleChatStruct? updateLucilleChatStruct(
  LucilleChatStruct? lucilleChat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lucilleChat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLucilleChatStructData(
  Map<String, dynamic> firestoreData,
  LucilleChatStruct? lucilleChat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lucilleChat == null) {
    return;
  }
  if (lucilleChat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lucilleChat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lucilleChatData =
      getLucilleChatFirestoreData(lucilleChat, forFieldValue);
  final nestedData =
      lucilleChatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lucilleChat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLucilleChatFirestoreData(
  LucilleChatStruct? lucilleChat, [
  bool forFieldValue = false,
]) {
  if (lucilleChat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lucilleChat.toMap());

  // Add any Firestore field values
  mapToFirestore(lucilleChat.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLucilleChatListFirestoreData(
  List<LucilleChatStruct>? lucilleChats,
) =>
    lucilleChats?.map((e) => getLucilleChatFirestoreData(e, true)).toList() ??
    [];
