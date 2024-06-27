// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiaperTrackerStruct extends FFFirebaseStruct {
  DiaperTrackerStruct({
    DateTime? date,
    Diaper? type,
    int? wetnessLevel,
    Color? color,
    String? dirtyType,
    String? notes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _type = type,
        _wetnessLevel = wetnessLevel,
        _color = color,
        _dirtyType = dirtyType,
        _notes = notes,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "type" field.
  Diaper? _type;
  Diaper? get type => _type;
  set type(Diaper? val) => _type = val;

  bool hasType() => _type != null;

  // "wetnessLevel" field.
  int? _wetnessLevel;
  int get wetnessLevel => _wetnessLevel ?? 0;
  set wetnessLevel(int? val) => _wetnessLevel = val;

  void incrementWetnessLevel(int amount) =>
      wetnessLevel = wetnessLevel + amount;

  bool hasWetnessLevel() => _wetnessLevel != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "dirtyType" field.
  String? _dirtyType;
  String get dirtyType => _dirtyType ?? '';
  set dirtyType(String? val) => _dirtyType = val;

  bool hasDirtyType() => _dirtyType != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  static DiaperTrackerStruct fromMap(Map<String, dynamic> data) =>
      DiaperTrackerStruct(
        date: data['date'] as DateTime?,
        type: deserializeEnum<Diaper>(data['type']),
        wetnessLevel: castToType<int>(data['wetnessLevel']),
        color: getSchemaColor(data['color']),
        dirtyType: data['dirtyType'] as String?,
        notes: data['notes'] as String?,
      );

  static DiaperTrackerStruct? maybeFromMap(dynamic data) => data is Map
      ? DiaperTrackerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'type': _type?.serialize(),
        'wetnessLevel': _wetnessLevel,
        'color': _color,
        'dirtyType': _dirtyType,
        'notes': _notes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'wetnessLevel': serializeParam(
          _wetnessLevel,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'dirtyType': serializeParam(
          _dirtyType,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
      }.withoutNulls;

  static DiaperTrackerStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiaperTrackerStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        type: deserializeParam<Diaper>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        wetnessLevel: deserializeParam(
          data['wetnessLevel'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        dirtyType: deserializeParam(
          data['dirtyType'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
      );

  static DiaperTrackerStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DiaperTrackerStruct(
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        type: convertAlgoliaParam<Diaper>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        wetnessLevel: convertAlgoliaParam(
          data['wetnessLevel'],
          ParamType.int,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        dirtyType: convertAlgoliaParam(
          data['dirtyType'],
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
  String toString() => 'DiaperTrackerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DiaperTrackerStruct &&
        date == other.date &&
        type == other.type &&
        wetnessLevel == other.wetnessLevel &&
        color == other.color &&
        dirtyType == other.dirtyType &&
        notes == other.notes;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([date, type, wetnessLevel, color, dirtyType, notes]);
}

DiaperTrackerStruct createDiaperTrackerStruct({
  DateTime? date,
  Diaper? type,
  int? wetnessLevel,
  Color? color,
  String? dirtyType,
  String? notes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DiaperTrackerStruct(
      date: date,
      type: type,
      wetnessLevel: wetnessLevel,
      color: color,
      dirtyType: dirtyType,
      notes: notes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DiaperTrackerStruct? updateDiaperTrackerStruct(
  DiaperTrackerStruct? diaperTracker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    diaperTracker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDiaperTrackerStructData(
  Map<String, dynamic> firestoreData,
  DiaperTrackerStruct? diaperTracker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (diaperTracker == null) {
    return;
  }
  if (diaperTracker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && diaperTracker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final diaperTrackerData =
      getDiaperTrackerFirestoreData(diaperTracker, forFieldValue);
  final nestedData =
      diaperTrackerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = diaperTracker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDiaperTrackerFirestoreData(
  DiaperTrackerStruct? diaperTracker, [
  bool forFieldValue = false,
]) {
  if (diaperTracker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(diaperTracker.toMap());

  // Add any Firestore field values
  diaperTracker.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDiaperTrackerListFirestoreData(
  List<DiaperTrackerStruct>? diaperTrackers,
) =>
    diaperTrackers
        ?.map((e) => getDiaperTrackerFirestoreData(e, true))
        .toList() ??
    [];
