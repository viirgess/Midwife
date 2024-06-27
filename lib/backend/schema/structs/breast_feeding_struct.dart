// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BreastFeedingStruct extends FFFirebaseStruct {
  BreastFeedingStruct({
    DateTime? startDate,
    int? totalDuration,
    int? leftDuration,
    int? rightDuration,
    String? notes,
    bool? firstBreast,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startDate = startDate,
        _totalDuration = totalDuration,
        _leftDuration = leftDuration,
        _rightDuration = rightDuration,
        _notes = notes,
        _firstBreast = firstBreast,
        super(firestoreUtilData);

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "totalDuration" field.
  int? _totalDuration;
  int get totalDuration => _totalDuration ?? 0;
  set totalDuration(int? val) => _totalDuration = val;

  void incrementTotalDuration(int amount) =>
      totalDuration = totalDuration + amount;

  bool hasTotalDuration() => _totalDuration != null;

  // "leftDuration" field.
  int? _leftDuration;
  int get leftDuration => _leftDuration ?? 0;
  set leftDuration(int? val) => _leftDuration = val;

  void incrementLeftDuration(int amount) =>
      leftDuration = leftDuration + amount;

  bool hasLeftDuration() => _leftDuration != null;

  // "rightDuration" field.
  int? _rightDuration;
  int get rightDuration => _rightDuration ?? 0;
  set rightDuration(int? val) => _rightDuration = val;

  void incrementRightDuration(int amount) =>
      rightDuration = rightDuration + amount;

  bool hasRightDuration() => _rightDuration != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "firstBreast" field.
  bool? _firstBreast;
  bool get firstBreast => _firstBreast ?? false;
  set firstBreast(bool? val) => _firstBreast = val;

  bool hasFirstBreast() => _firstBreast != null;

  static BreastFeedingStruct fromMap(Map<String, dynamic> data) =>
      BreastFeedingStruct(
        startDate: data['startDate'] as DateTime?,
        totalDuration: castToType<int>(data['totalDuration']),
        leftDuration: castToType<int>(data['leftDuration']),
        rightDuration: castToType<int>(data['rightDuration']),
        notes: data['notes'] as String?,
        firstBreast: data['firstBreast'] as bool?,
      );

  static BreastFeedingStruct? maybeFromMap(dynamic data) => data is Map
      ? BreastFeedingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startDate': _startDate,
        'totalDuration': _totalDuration,
        'leftDuration': _leftDuration,
        'rightDuration': _rightDuration,
        'notes': _notes,
        'firstBreast': _firstBreast,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'totalDuration': serializeParam(
          _totalDuration,
          ParamType.int,
        ),
        'leftDuration': serializeParam(
          _leftDuration,
          ParamType.int,
        ),
        'rightDuration': serializeParam(
          _rightDuration,
          ParamType.int,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'firstBreast': serializeParam(
          _firstBreast,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BreastFeedingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BreastFeedingStruct(
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        totalDuration: deserializeParam(
          data['totalDuration'],
          ParamType.int,
          false,
        ),
        leftDuration: deserializeParam(
          data['leftDuration'],
          ParamType.int,
          false,
        ),
        rightDuration: deserializeParam(
          data['rightDuration'],
          ParamType.int,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        firstBreast: deserializeParam(
          data['firstBreast'],
          ParamType.bool,
          false,
        ),
      );

  static BreastFeedingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BreastFeedingStruct(
        startDate: convertAlgoliaParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        totalDuration: convertAlgoliaParam(
          data['totalDuration'],
          ParamType.int,
          false,
        ),
        leftDuration: convertAlgoliaParam(
          data['leftDuration'],
          ParamType.int,
          false,
        ),
        rightDuration: convertAlgoliaParam(
          data['rightDuration'],
          ParamType.int,
          false,
        ),
        notes: convertAlgoliaParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        firstBreast: convertAlgoliaParam(
          data['firstBreast'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BreastFeedingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BreastFeedingStruct &&
        startDate == other.startDate &&
        totalDuration == other.totalDuration &&
        leftDuration == other.leftDuration &&
        rightDuration == other.rightDuration &&
        notes == other.notes &&
        firstBreast == other.firstBreast;
  }

  @override
  int get hashCode => const ListEquality().hash([
        startDate,
        totalDuration,
        leftDuration,
        rightDuration,
        notes,
        firstBreast
      ]);
}

BreastFeedingStruct createBreastFeedingStruct({
  DateTime? startDate,
  int? totalDuration,
  int? leftDuration,
  int? rightDuration,
  String? notes,
  bool? firstBreast,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BreastFeedingStruct(
      startDate: startDate,
      totalDuration: totalDuration,
      leftDuration: leftDuration,
      rightDuration: rightDuration,
      notes: notes,
      firstBreast: firstBreast,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BreastFeedingStruct? updateBreastFeedingStruct(
  BreastFeedingStruct? breastFeeding, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    breastFeeding
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBreastFeedingStructData(
  Map<String, dynamic> firestoreData,
  BreastFeedingStruct? breastFeeding,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (breastFeeding == null) {
    return;
  }
  if (breastFeeding.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && breastFeeding.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final breastFeedingData =
      getBreastFeedingFirestoreData(breastFeeding, forFieldValue);
  final nestedData =
      breastFeedingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = breastFeeding.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBreastFeedingFirestoreData(
  BreastFeedingStruct? breastFeeding, [
  bool forFieldValue = false,
]) {
  if (breastFeeding == null) {
    return {};
  }
  final firestoreData = mapToFirestore(breastFeeding.toMap());

  // Add any Firestore field values
  breastFeeding.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBreastFeedingListFirestoreData(
  List<BreastFeedingStruct>? breastFeedings,
) =>
    breastFeedings
        ?.map((e) => getBreastFeedingFirestoreData(e, true))
        .toList() ??
    [];
