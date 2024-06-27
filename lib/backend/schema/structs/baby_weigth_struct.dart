// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BabyWeigthStruct extends FFFirebaseStruct {
  BabyWeigthStruct({
    DateTime? date,
    double? weight,
    double? difference,
    double? min,
    double? max,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _weight = weight,
        _difference = difference,
        _min = min,
        _max = max,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "difference" field.
  double? _difference;
  double get difference => _difference ?? 0.0;
  set difference(double? val) => _difference = val;

  void incrementDifference(double amount) => difference = difference + amount;

  bool hasDifference() => _difference != null;

  // "min" field.
  double? _min;
  double get min => _min ?? 0.0;
  set min(double? val) => _min = val;

  void incrementMin(double amount) => min = min + amount;

  bool hasMin() => _min != null;

  // "max" field.
  double? _max;
  double get max => _max ?? 0.0;
  set max(double? val) => _max = val;

  void incrementMax(double amount) => max = max + amount;

  bool hasMax() => _max != null;

  static BabyWeigthStruct fromMap(Map<String, dynamic> data) =>
      BabyWeigthStruct(
        date: data['date'] as DateTime?,
        weight: castToType<double>(data['weight']),
        difference: castToType<double>(data['difference']),
        min: castToType<double>(data['min']),
        max: castToType<double>(data['max']),
      );

  static BabyWeigthStruct? maybeFromMap(dynamic data) => data is Map
      ? BabyWeigthStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'weight': _weight,
        'difference': _difference,
        'min': _min,
        'max': _max,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'difference': serializeParam(
          _difference,
          ParamType.double,
        ),
        'min': serializeParam(
          _min,
          ParamType.double,
        ),
        'max': serializeParam(
          _max,
          ParamType.double,
        ),
      }.withoutNulls;

  static BabyWeigthStruct fromSerializableMap(Map<String, dynamic> data) =>
      BabyWeigthStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        difference: deserializeParam(
          data['difference'],
          ParamType.double,
          false,
        ),
        min: deserializeParam(
          data['min'],
          ParamType.double,
          false,
        ),
        max: deserializeParam(
          data['max'],
          ParamType.double,
          false,
        ),
      );

  static BabyWeigthStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BabyWeigthStruct(
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        weight: convertAlgoliaParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        difference: convertAlgoliaParam(
          data['difference'],
          ParamType.double,
          false,
        ),
        min: convertAlgoliaParam(
          data['min'],
          ParamType.double,
          false,
        ),
        max: convertAlgoliaParam(
          data['max'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BabyWeigthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BabyWeigthStruct &&
        date == other.date &&
        weight == other.weight &&
        difference == other.difference &&
        min == other.min &&
        max == other.max;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, weight, difference, min, max]);
}

BabyWeigthStruct createBabyWeigthStruct({
  DateTime? date,
  double? weight,
  double? difference,
  double? min,
  double? max,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BabyWeigthStruct(
      date: date,
      weight: weight,
      difference: difference,
      min: min,
      max: max,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BabyWeigthStruct? updateBabyWeigthStruct(
  BabyWeigthStruct? babyWeigth, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    babyWeigth
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBabyWeigthStructData(
  Map<String, dynamic> firestoreData,
  BabyWeigthStruct? babyWeigth,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (babyWeigth == null) {
    return;
  }
  if (babyWeigth.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && babyWeigth.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final babyWeigthData = getBabyWeigthFirestoreData(babyWeigth, forFieldValue);
  final nestedData = babyWeigthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = babyWeigth.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBabyWeigthFirestoreData(
  BabyWeigthStruct? babyWeigth, [
  bool forFieldValue = false,
]) {
  if (babyWeigth == null) {
    return {};
  }
  final firestoreData = mapToFirestore(babyWeigth.toMap());

  // Add any Firestore field values
  babyWeigth.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBabyWeigthListFirestoreData(
  List<BabyWeigthStruct>? babyWeigths,
) =>
    babyWeigths?.map((e) => getBabyWeigthFirestoreData(e, true)).toList() ?? [];
