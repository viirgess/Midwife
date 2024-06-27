// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BottleFeedingStruct extends FFFirebaseStruct {
  BottleFeedingStruct({
    DateTime? date,
    int? bottleAmount,
    String? type,
    String? notes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _bottleAmount = bottleAmount,
        _type = type,
        _notes = notes,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "bottleAmount" field.
  int? _bottleAmount;
  int get bottleAmount => _bottleAmount ?? 0;
  set bottleAmount(int? val) => _bottleAmount = val;

  void incrementBottleAmount(int amount) =>
      bottleAmount = bottleAmount + amount;

  bool hasBottleAmount() => _bottleAmount != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  static BottleFeedingStruct fromMap(Map<String, dynamic> data) =>
      BottleFeedingStruct(
        date: data['date'] as DateTime?,
        bottleAmount: castToType<int>(data['bottleAmount']),
        type: data['type'] as String?,
        notes: data['notes'] as String?,
      );

  static BottleFeedingStruct? maybeFromMap(dynamic data) => data is Map
      ? BottleFeedingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'bottleAmount': _bottleAmount,
        'type': _type,
        'notes': _notes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'bottleAmount': serializeParam(
          _bottleAmount,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
      }.withoutNulls;

  static BottleFeedingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BottleFeedingStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        bottleAmount: deserializeParam(
          data['bottleAmount'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
      );

  static BottleFeedingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BottleFeedingStruct(
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        bottleAmount: convertAlgoliaParam(
          data['bottleAmount'],
          ParamType.int,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        notes: convertAlgoliaParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BottleFeedingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BottleFeedingStruct &&
        date == other.date &&
        bottleAmount == other.bottleAmount &&
        type == other.type &&
        notes == other.notes;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, bottleAmount, type, notes]);
}

BottleFeedingStruct createBottleFeedingStruct({
  DateTime? date,
  int? bottleAmount,
  String? type,
  String? notes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BottleFeedingStruct(
      date: date,
      bottleAmount: bottleAmount,
      type: type,
      notes: notes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BottleFeedingStruct? updateBottleFeedingStruct(
  BottleFeedingStruct? bottleFeeding, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bottleFeeding
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBottleFeedingStructData(
  Map<String, dynamic> firestoreData,
  BottleFeedingStruct? bottleFeeding,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bottleFeeding == null) {
    return;
  }
  if (bottleFeeding.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bottleFeeding.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bottleFeedingData =
      getBottleFeedingFirestoreData(bottleFeeding, forFieldValue);
  final nestedData =
      bottleFeedingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bottleFeeding.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBottleFeedingFirestoreData(
  BottleFeedingStruct? bottleFeeding, [
  bool forFieldValue = false,
]) {
  if (bottleFeeding == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bottleFeeding.toMap());

  // Add any Firestore field values
  bottleFeeding.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBottleFeedingListFirestoreData(
  List<BottleFeedingStruct>? bottleFeedings,
) =>
    bottleFeedings
        ?.map((e) => getBottleFeedingFirestoreData(e, true))
        .toList() ??
    [];
