// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PercentileDataStruct extends FFFirebaseStruct {
  PercentileDataStruct({
    int? age,
    double? lowerBound,
    double? upperBound,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _age = age,
        _lowerBound = lowerBound,
        _upperBound = upperBound,
        super(firestoreUtilData);

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "lowerBound" field.
  double? _lowerBound;
  double get lowerBound => _lowerBound ?? 0.0;
  set lowerBound(double? val) => _lowerBound = val;

  void incrementLowerBound(double amount) => lowerBound = lowerBound + amount;

  bool hasLowerBound() => _lowerBound != null;

  // "upperBound" field.
  double? _upperBound;
  double get upperBound => _upperBound ?? 0.0;
  set upperBound(double? val) => _upperBound = val;

  void incrementUpperBound(double amount) => upperBound = upperBound + amount;

  bool hasUpperBound() => _upperBound != null;

  static PercentileDataStruct fromMap(Map<String, dynamic> data) =>
      PercentileDataStruct(
        age: castToType<int>(data['age']),
        lowerBound: castToType<double>(data['lowerBound']),
        upperBound: castToType<double>(data['upperBound']),
      );

  static PercentileDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PercentileDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'age': _age,
        'lowerBound': _lowerBound,
        'upperBound': _upperBound,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'lowerBound': serializeParam(
          _lowerBound,
          ParamType.double,
        ),
        'upperBound': serializeParam(
          _upperBound,
          ParamType.double,
        ),
      }.withoutNulls;

  static PercentileDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PercentileDataStruct(
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        lowerBound: deserializeParam(
          data['lowerBound'],
          ParamType.double,
          false,
        ),
        upperBound: deserializeParam(
          data['upperBound'],
          ParamType.double,
          false,
        ),
      );

  static PercentileDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PercentileDataStruct(
        age: convertAlgoliaParam(
          data['age'],
          ParamType.int,
          false,
        ),
        lowerBound: convertAlgoliaParam(
          data['lowerBound'],
          ParamType.double,
          false,
        ),
        upperBound: convertAlgoliaParam(
          data['upperBound'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PercentileDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PercentileDataStruct &&
        age == other.age &&
        lowerBound == other.lowerBound &&
        upperBound == other.upperBound;
  }

  @override
  int get hashCode => const ListEquality().hash([age, lowerBound, upperBound]);
}

PercentileDataStruct createPercentileDataStruct({
  int? age,
  double? lowerBound,
  double? upperBound,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PercentileDataStruct(
      age: age,
      lowerBound: lowerBound,
      upperBound: upperBound,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PercentileDataStruct? updatePercentileDataStruct(
  PercentileDataStruct? percentileData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    percentileData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPercentileDataStructData(
  Map<String, dynamic> firestoreData,
  PercentileDataStruct? percentileData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (percentileData == null) {
    return;
  }
  if (percentileData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && percentileData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final percentileDataData =
      getPercentileDataFirestoreData(percentileData, forFieldValue);
  final nestedData =
      percentileDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = percentileData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPercentileDataFirestoreData(
  PercentileDataStruct? percentileData, [
  bool forFieldValue = false,
]) {
  if (percentileData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(percentileData.toMap());

  // Add any Firestore field values
  percentileData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPercentileDataListFirestoreData(
  List<PercentileDataStruct>? percentileDatas,
) =>
    percentileDatas
        ?.map((e) => getPercentileDataFirestoreData(e, true))
        .toList() ??
    [];
