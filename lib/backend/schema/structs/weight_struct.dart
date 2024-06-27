// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WeightStruct extends FFFirebaseStruct {
  WeightStruct({
    double? weight,
    DateTime? date,
    double? differenceWithPrevious,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weight = weight,
        _date = date,
        _differenceWithPrevious = differenceWithPrevious,
        super(firestoreUtilData);

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "differenceWithPrevious" field.
  double? _differenceWithPrevious;
  double get differenceWithPrevious => _differenceWithPrevious ?? 0.0;
  set differenceWithPrevious(double? val) => _differenceWithPrevious = val;

  void incrementDifferenceWithPrevious(double amount) =>
      differenceWithPrevious = differenceWithPrevious + amount;

  bool hasDifferenceWithPrevious() => _differenceWithPrevious != null;

  static WeightStruct fromMap(Map<String, dynamic> data) => WeightStruct(
        weight: castToType<double>(data['weight']),
        date: data['date'] as DateTime?,
        differenceWithPrevious:
            castToType<double>(data['differenceWithPrevious']),
      );

  static WeightStruct? maybeFromMap(dynamic data) =>
      data is Map ? WeightStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'weight': _weight,
        'date': _date,
        'differenceWithPrevious': _differenceWithPrevious,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'differenceWithPrevious': serializeParam(
          _differenceWithPrevious,
          ParamType.double,
        ),
      }.withoutNulls;

  static WeightStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeightStruct(
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        differenceWithPrevious: deserializeParam(
          data['differenceWithPrevious'],
          ParamType.double,
          false,
        ),
      );

  static WeightStruct fromAlgoliaData(Map<String, dynamic> data) =>
      WeightStruct(
        weight: convertAlgoliaParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        differenceWithPrevious: convertAlgoliaParam(
          data['differenceWithPrevious'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'WeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeightStruct &&
        weight == other.weight &&
        date == other.date &&
        differenceWithPrevious == other.differenceWithPrevious;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([weight, date, differenceWithPrevious]);
}

WeightStruct createWeightStruct({
  double? weight,
  DateTime? date,
  double? differenceWithPrevious,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeightStruct(
      weight: weight,
      date: date,
      differenceWithPrevious: differenceWithPrevious,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeightStruct? updateWeightStruct(
  WeightStruct? weightStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weightStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeightStructData(
  Map<String, dynamic> firestoreData,
  WeightStruct? weightStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weightStruct == null) {
    return;
  }
  if (weightStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weightStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weightStructData = getWeightFirestoreData(weightStruct, forFieldValue);
  final nestedData =
      weightStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weightStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeightFirestoreData(
  WeightStruct? weightStruct, [
  bool forFieldValue = false,
]) {
  if (weightStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weightStruct.toMap());

  // Add any Firestore field values
  weightStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeightListFirestoreData(
  List<WeightStruct>? weightStructs,
) =>
    weightStructs?.map((e) => getWeightFirestoreData(e, true)).toList() ?? [];
