// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PumpFeedinStruct extends FFFirebaseStruct {
  PumpFeedinStruct({
    int? leftAmount,
    int? rightAmount,
    DateTime? date,
    int? totalAmount,
    String? notes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leftAmount = leftAmount,
        _rightAmount = rightAmount,
        _date = date,
        _totalAmount = totalAmount,
        _notes = notes,
        super(firestoreUtilData);

  // "leftAmount" field.
  int? _leftAmount;
  int get leftAmount => _leftAmount ?? 0;
  set leftAmount(int? val) => _leftAmount = val;

  void incrementLeftAmount(int amount) => leftAmount = leftAmount + amount;

  bool hasLeftAmount() => _leftAmount != null;

  // "rightAmount" field.
  int? _rightAmount;
  int get rightAmount => _rightAmount ?? 0;
  set rightAmount(int? val) => _rightAmount = val;

  void incrementRightAmount(int amount) => rightAmount = rightAmount + amount;

  bool hasRightAmount() => _rightAmount != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "totalAmount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  set totalAmount(int? val) => _totalAmount = val;

  void incrementTotalAmount(int amount) => totalAmount = totalAmount + amount;

  bool hasTotalAmount() => _totalAmount != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  static PumpFeedinStruct fromMap(Map<String, dynamic> data) =>
      PumpFeedinStruct(
        leftAmount: castToType<int>(data['leftAmount']),
        rightAmount: castToType<int>(data['rightAmount']),
        date: data['date'] as DateTime?,
        totalAmount: castToType<int>(data['totalAmount']),
        notes: data['notes'] as String?,
      );

  static PumpFeedinStruct? maybeFromMap(dynamic data) => data is Map
      ? PumpFeedinStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'leftAmount': _leftAmount,
        'rightAmount': _rightAmount,
        'date': _date,
        'totalAmount': _totalAmount,
        'notes': _notes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'leftAmount': serializeParam(
          _leftAmount,
          ParamType.int,
        ),
        'rightAmount': serializeParam(
          _rightAmount,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'totalAmount': serializeParam(
          _totalAmount,
          ParamType.int,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
      }.withoutNulls;

  static PumpFeedinStruct fromSerializableMap(Map<String, dynamic> data) =>
      PumpFeedinStruct(
        leftAmount: deserializeParam(
          data['leftAmount'],
          ParamType.int,
          false,
        ),
        rightAmount: deserializeParam(
          data['rightAmount'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        totalAmount: deserializeParam(
          data['totalAmount'],
          ParamType.int,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
      );

  static PumpFeedinStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PumpFeedinStruct(
        leftAmount: convertAlgoliaParam(
          data['leftAmount'],
          ParamType.int,
          false,
        ),
        rightAmount: convertAlgoliaParam(
          data['rightAmount'],
          ParamType.int,
          false,
        ),
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        totalAmount: convertAlgoliaParam(
          data['totalAmount'],
          ParamType.int,
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
  String toString() => 'PumpFeedinStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PumpFeedinStruct &&
        leftAmount == other.leftAmount &&
        rightAmount == other.rightAmount &&
        date == other.date &&
        totalAmount == other.totalAmount &&
        notes == other.notes;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([leftAmount, rightAmount, date, totalAmount, notes]);
}

PumpFeedinStruct createPumpFeedinStruct({
  int? leftAmount,
  int? rightAmount,
  DateTime? date,
  int? totalAmount,
  String? notes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PumpFeedinStruct(
      leftAmount: leftAmount,
      rightAmount: rightAmount,
      date: date,
      totalAmount: totalAmount,
      notes: notes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PumpFeedinStruct? updatePumpFeedinStruct(
  PumpFeedinStruct? pumpFeedin, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pumpFeedin
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPumpFeedinStructData(
  Map<String, dynamic> firestoreData,
  PumpFeedinStruct? pumpFeedin,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pumpFeedin == null) {
    return;
  }
  if (pumpFeedin.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pumpFeedin.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pumpFeedinData = getPumpFeedinFirestoreData(pumpFeedin, forFieldValue);
  final nestedData = pumpFeedinData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pumpFeedin.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPumpFeedinFirestoreData(
  PumpFeedinStruct? pumpFeedin, [
  bool forFieldValue = false,
]) {
  if (pumpFeedin == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pumpFeedin.toMap());

  // Add any Firestore field values
  pumpFeedin.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPumpFeedinListFirestoreData(
  List<PumpFeedinStruct>? pumpFeedins,
) =>
    pumpFeedins?.map((e) => getPumpFeedinFirestoreData(e, true)).toList() ?? [];
