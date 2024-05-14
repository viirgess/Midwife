// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BabyNameStruct extends FFFirebaseStruct {
  BabyNameStruct({
    String? name,
    String? sex,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _sex = sex,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  set sex(String? val) => _sex = val;
  bool hasSex() => _sex != null;

  static BabyNameStruct fromMap(Map<String, dynamic> data) => BabyNameStruct(
        name: data['Name'] as String?,
        sex: data['Sex'] as String?,
      );

  static BabyNameStruct? maybeFromMap(dynamic data) =>
      data is Map ? BabyNameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Sex': _sex,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Sex': serializeParam(
          _sex,
          ParamType.String,
        ),
      }.withoutNulls;

  static BabyNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      BabyNameStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        sex: deserializeParam(
          data['Sex'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BabyNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BabyNameStruct && name == other.name && sex == other.sex;
  }

  @override
  int get hashCode => const ListEquality().hash([name, sex]);
}

BabyNameStruct createBabyNameStruct({
  String? name,
  String? sex,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BabyNameStruct(
      name: name,
      sex: sex,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BabyNameStruct? updateBabyNameStruct(
  BabyNameStruct? babyName, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    babyName
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBabyNameStructData(
  Map<String, dynamic> firestoreData,
  BabyNameStruct? babyName,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (babyName == null) {
    return;
  }
  if (babyName.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && babyName.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final babyNameData = getBabyNameFirestoreData(babyName, forFieldValue);
  final nestedData = babyNameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = babyName.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBabyNameFirestoreData(
  BabyNameStruct? babyName, [
  bool forFieldValue = false,
]) {
  if (babyName == null) {
    return {};
  }
  final firestoreData = mapToFirestore(babyName.toMap());

  // Add any Firestore field values
  babyName.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBabyNameListFirestoreData(
  List<BabyNameStruct>? babyNames,
) =>
    babyNames?.map((e) => getBabyNameFirestoreData(e, true)).toList() ?? [];
