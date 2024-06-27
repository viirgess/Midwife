// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BabyHeightStruct extends FFFirebaseStruct {
  BabyHeightStruct({
    DateTime? date,
    double? height,
    double? difference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _height = height,
        _difference = difference,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "difference" field.
  double? _difference;
  double get difference => _difference ?? 0.0;
  set difference(double? val) => _difference = val;

  void incrementDifference(double amount) => difference = difference + amount;

  bool hasDifference() => _difference != null;

  static BabyHeightStruct fromMap(Map<String, dynamic> data) =>
      BabyHeightStruct(
        date: data['date'] as DateTime?,
        height: castToType<double>(data['height']),
        difference: castToType<double>(data['difference']),
      );

  static BabyHeightStruct? maybeFromMap(dynamic data) => data is Map
      ? BabyHeightStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'height': _height,
        'difference': _difference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'difference': serializeParam(
          _difference,
          ParamType.double,
        ),
      }.withoutNulls;

  static BabyHeightStruct fromSerializableMap(Map<String, dynamic> data) =>
      BabyHeightStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        difference: deserializeParam(
          data['difference'],
          ParamType.double,
          false,
        ),
      );

  static BabyHeightStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BabyHeightStruct(
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        height: convertAlgoliaParam(
          data['height'],
          ParamType.double,
          false,
        ),
        difference: convertAlgoliaParam(
          data['difference'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BabyHeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BabyHeightStruct &&
        date == other.date &&
        height == other.height &&
        difference == other.difference;
  }

  @override
  int get hashCode => const ListEquality().hash([date, height, difference]);
}

BabyHeightStruct createBabyHeightStruct({
  DateTime? date,
  double? height,
  double? difference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BabyHeightStruct(
      date: date,
      height: height,
      difference: difference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BabyHeightStruct? updateBabyHeightStruct(
  BabyHeightStruct? babyHeight, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    babyHeight
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBabyHeightStructData(
  Map<String, dynamic> firestoreData,
  BabyHeightStruct? babyHeight,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (babyHeight == null) {
    return;
  }
  if (babyHeight.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && babyHeight.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final babyHeightData = getBabyHeightFirestoreData(babyHeight, forFieldValue);
  final nestedData = babyHeightData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = babyHeight.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBabyHeightFirestoreData(
  BabyHeightStruct? babyHeight, [
  bool forFieldValue = false,
]) {
  if (babyHeight == null) {
    return {};
  }
  final firestoreData = mapToFirestore(babyHeight.toMap());

  // Add any Firestore field values
  babyHeight.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBabyHeightListFirestoreData(
  List<BabyHeightStruct>? babyHeights,
) =>
    babyHeights?.map((e) => getBabyHeightFirestoreData(e, true)).toList() ?? [];
