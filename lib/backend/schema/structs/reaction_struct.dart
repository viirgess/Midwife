// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ReactionStruct extends FFFirebaseStruct {
  ReactionStruct({
    DocumentReference? userRef,
    Reaction? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _type = type,
        super(firestoreUtilData);

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "type" field.
  Reaction? _type;
  Reaction get type => _type ?? Reaction.Like;
  set type(Reaction? val) => _type = val;

  bool hasType() => _type != null;

  static ReactionStruct fromMap(Map<String, dynamic> data) => ReactionStruct(
        userRef: data['user_ref'] as DocumentReference?,
        type: deserializeEnum<Reaction>(data['type']),
      );

  static ReactionStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReactionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user_ref': _userRef,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static ReactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReactionStruct(
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        type: deserializeParam<Reaction>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  static ReactionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ReactionStruct(
        userRef: convertAlgoliaParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        type: convertAlgoliaParam<Reaction>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ReactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReactionStruct &&
        userRef == other.userRef &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([userRef, type]);
}

ReactionStruct createReactionStruct({
  DocumentReference? userRef,
  Reaction? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReactionStruct(
      userRef: userRef,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReactionStruct? updateReactionStruct(
  ReactionStruct? reaction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    reaction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReactionStructData(
  Map<String, dynamic> firestoreData,
  ReactionStruct? reaction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (reaction == null) {
    return;
  }
  if (reaction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && reaction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reactionData = getReactionFirestoreData(reaction, forFieldValue);
  final nestedData = reactionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = reaction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReactionFirestoreData(
  ReactionStruct? reaction, [
  bool forFieldValue = false,
]) {
  if (reaction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(reaction.toMap());

  // Add any Firestore field values
  reaction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReactionListFirestoreData(
  List<ReactionStruct>? reactions,
) =>
    reactions?.map((e) => getReactionFirestoreData(e, true)).toList() ?? [];
