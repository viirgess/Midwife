// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContractrionStatisticsStruct extends FFFirebaseStruct {
  ContractrionStatisticsStruct({
    int? qtyPerHour,
    String? avgDuration,
    String? avgInterval,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _qtyPerHour = qtyPerHour,
        _avgDuration = avgDuration,
        _avgInterval = avgInterval,
        super(firestoreUtilData);

  // "qtyPerHour" field.
  int? _qtyPerHour;
  int get qtyPerHour => _qtyPerHour ?? 0;
  set qtyPerHour(int? val) => _qtyPerHour = val;

  void incrementQtyPerHour(int amount) => qtyPerHour = qtyPerHour + amount;

  bool hasQtyPerHour() => _qtyPerHour != null;

  // "avgDuration" field.
  String? _avgDuration;
  String get avgDuration => _avgDuration ?? '';
  set avgDuration(String? val) => _avgDuration = val;

  bool hasAvgDuration() => _avgDuration != null;

  // "avgInterval" field.
  String? _avgInterval;
  String get avgInterval => _avgInterval ?? '';
  set avgInterval(String? val) => _avgInterval = val;

  bool hasAvgInterval() => _avgInterval != null;

  static ContractrionStatisticsStruct fromMap(Map<String, dynamic> data) =>
      ContractrionStatisticsStruct(
        qtyPerHour: castToType<int>(data['qtyPerHour']),
        avgDuration: data['avgDuration'] as String?,
        avgInterval: data['avgInterval'] as String?,
      );

  static ContractrionStatisticsStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractrionStatisticsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'qtyPerHour': _qtyPerHour,
        'avgDuration': _avgDuration,
        'avgInterval': _avgInterval,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'qtyPerHour': serializeParam(
          _qtyPerHour,
          ParamType.int,
        ),
        'avgDuration': serializeParam(
          _avgDuration,
          ParamType.String,
        ),
        'avgInterval': serializeParam(
          _avgInterval,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContractrionStatisticsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ContractrionStatisticsStruct(
        qtyPerHour: deserializeParam(
          data['qtyPerHour'],
          ParamType.int,
          false,
        ),
        avgDuration: deserializeParam(
          data['avgDuration'],
          ParamType.String,
          false,
        ),
        avgInterval: deserializeParam(
          data['avgInterval'],
          ParamType.String,
          false,
        ),
      );

  static ContractrionStatisticsStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      ContractrionStatisticsStruct(
        qtyPerHour: convertAlgoliaParam(
          data['qtyPerHour'],
          ParamType.int,
          false,
        ),
        avgDuration: convertAlgoliaParam(
          data['avgDuration'],
          ParamType.String,
          false,
        ),
        avgInterval: convertAlgoliaParam(
          data['avgInterval'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ContractrionStatisticsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractrionStatisticsStruct &&
        qtyPerHour == other.qtyPerHour &&
        avgDuration == other.avgDuration &&
        avgInterval == other.avgInterval;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([qtyPerHour, avgDuration, avgInterval]);
}

ContractrionStatisticsStruct createContractrionStatisticsStruct({
  int? qtyPerHour,
  String? avgDuration,
  String? avgInterval,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContractrionStatisticsStruct(
      qtyPerHour: qtyPerHour,
      avgDuration: avgDuration,
      avgInterval: avgInterval,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContractrionStatisticsStruct? updateContractrionStatisticsStruct(
  ContractrionStatisticsStruct? contractrionStatistics, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contractrionStatistics
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContractrionStatisticsStructData(
  Map<String, dynamic> firestoreData,
  ContractrionStatisticsStruct? contractrionStatistics,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contractrionStatistics == null) {
    return;
  }
  if (contractrionStatistics.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      contractrionStatistics.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contractrionStatisticsData = getContractrionStatisticsFirestoreData(
      contractrionStatistics, forFieldValue);
  final nestedData =
      contractrionStatisticsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      contractrionStatistics.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContractrionStatisticsFirestoreData(
  ContractrionStatisticsStruct? contractrionStatistics, [
  bool forFieldValue = false,
]) {
  if (contractrionStatistics == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contractrionStatistics.toMap());

  // Add any Firestore field values
  contractrionStatistics.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContractrionStatisticsListFirestoreData(
  List<ContractrionStatisticsStruct>? contractrionStatisticss,
) =>
    contractrionStatisticss
        ?.map((e) => getContractrionStatisticsFirestoreData(e, true))
        .toList() ??
    [];
