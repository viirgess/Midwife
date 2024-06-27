// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BabyGrowthStruct extends FFFirebaseStruct {
  BabyGrowthStruct({
    DateTime? date,
    double? weight,
    double? height,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _weight = weight,
        _height = height,
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

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  static BabyGrowthStruct fromMap(Map<String, dynamic> data) =>
      BabyGrowthStruct(
        date: data['date'] as DateTime?,
        weight: castToType<double>(data['weight']),
        height: castToType<double>(data['height']),
      );

  static BabyGrowthStruct? maybeFromMap(dynamic data) => data is Map
      ? BabyGrowthStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'weight': _weight,
        'height': _height,
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
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
      }.withoutNulls;

  static BabyGrowthStruct fromSerializableMap(Map<String, dynamic> data) =>
      BabyGrowthStruct(
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
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
      );

  static BabyGrowthStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BabyGrowthStruct(
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
        height: convertAlgoliaParam(
          data['height'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BabyGrowthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BabyGrowthStruct &&
        date == other.date &&
        weight == other.weight &&
        height == other.height;
  }

  @override
  int get hashCode => const ListEquality().hash([date, weight, height]);
}

BabyGrowthStruct createBabyGrowthStruct({
  DateTime? date,
  double? weight,
  double? height,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BabyGrowthStruct(
      date: date,
      weight: weight,
      height: height,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BabyGrowthStruct? updateBabyGrowthStruct(
  BabyGrowthStruct? babyGrowth, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    babyGrowth
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBabyGrowthStructData(
  Map<String, dynamic> firestoreData,
  BabyGrowthStruct? babyGrowth,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (babyGrowth == null) {
    return;
  }
  if (babyGrowth.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && babyGrowth.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final babyGrowthData = getBabyGrowthFirestoreData(babyGrowth, forFieldValue);
  final nestedData = babyGrowthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = babyGrowth.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBabyGrowthFirestoreData(
  BabyGrowthStruct? babyGrowth, [
  bool forFieldValue = false,
]) {
  if (babyGrowth == null) {
    return {};
  }
  final firestoreData = mapToFirestore(babyGrowth.toMap());

  // Add any Firestore field values
  babyGrowth.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBabyGrowthListFirestoreData(
  List<BabyGrowthStruct>? babyGrowths,
) =>
    babyGrowths?.map((e) => getBabyGrowthFirestoreData(e, true)).toList() ?? [];
