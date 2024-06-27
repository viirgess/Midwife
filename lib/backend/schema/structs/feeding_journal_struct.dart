// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FeedingJournalStruct extends FFFirebaseStruct {
  FeedingJournalStruct({
    DateTime? date,
    int? totalBreastfeed,
    int? totalLiquid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _totalBreastfeed = totalBreastfeed,
        _totalLiquid = totalLiquid,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "totalBreastfeed" field.
  int? _totalBreastfeed;
  int get totalBreastfeed => _totalBreastfeed ?? 0;
  set totalBreastfeed(int? val) => _totalBreastfeed = val;

  void incrementTotalBreastfeed(int amount) =>
      totalBreastfeed = totalBreastfeed + amount;

  bool hasTotalBreastfeed() => _totalBreastfeed != null;

  // "totalLiquid" field.
  int? _totalLiquid;
  int get totalLiquid => _totalLiquid ?? 0;
  set totalLiquid(int? val) => _totalLiquid = val;

  void incrementTotalLiquid(int amount) => totalLiquid = totalLiquid + amount;

  bool hasTotalLiquid() => _totalLiquid != null;

  static FeedingJournalStruct fromMap(Map<String, dynamic> data) =>
      FeedingJournalStruct(
        date: data['date'] as DateTime?,
        totalBreastfeed: castToType<int>(data['totalBreastfeed']),
        totalLiquid: castToType<int>(data['totalLiquid']),
      );

  static FeedingJournalStruct? maybeFromMap(dynamic data) => data is Map
      ? FeedingJournalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'totalBreastfeed': _totalBreastfeed,
        'totalLiquid': _totalLiquid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'totalBreastfeed': serializeParam(
          _totalBreastfeed,
          ParamType.int,
        ),
        'totalLiquid': serializeParam(
          _totalLiquid,
          ParamType.int,
        ),
      }.withoutNulls;

  static FeedingJournalStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeedingJournalStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        totalBreastfeed: deserializeParam(
          data['totalBreastfeed'],
          ParamType.int,
          false,
        ),
        totalLiquid: deserializeParam(
          data['totalLiquid'],
          ParamType.int,
          false,
        ),
      );

  static FeedingJournalStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FeedingJournalStruct(
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        totalBreastfeed: convertAlgoliaParam(
          data['totalBreastfeed'],
          ParamType.int,
          false,
        ),
        totalLiquid: convertAlgoliaParam(
          data['totalLiquid'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FeedingJournalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeedingJournalStruct &&
        date == other.date &&
        totalBreastfeed == other.totalBreastfeed &&
        totalLiquid == other.totalLiquid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, totalBreastfeed, totalLiquid]);
}

FeedingJournalStruct createFeedingJournalStruct({
  DateTime? date,
  int? totalBreastfeed,
  int? totalLiquid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedingJournalStruct(
      date: date,
      totalBreastfeed: totalBreastfeed,
      totalLiquid: totalLiquid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeedingJournalStruct? updateFeedingJournalStruct(
  FeedingJournalStruct? feedingJournal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feedingJournal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeedingJournalStructData(
  Map<String, dynamic> firestoreData,
  FeedingJournalStruct? feedingJournal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feedingJournal == null) {
    return;
  }
  if (feedingJournal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feedingJournal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feedingJournalData =
      getFeedingJournalFirestoreData(feedingJournal, forFieldValue);
  final nestedData =
      feedingJournalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = feedingJournal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeedingJournalFirestoreData(
  FeedingJournalStruct? feedingJournal, [
  bool forFieldValue = false,
]) {
  if (feedingJournal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feedingJournal.toMap());

  // Add any Firestore field values
  feedingJournal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeedingJournalListFirestoreData(
  List<FeedingJournalStruct>? feedingJournals,
) =>
    feedingJournals
        ?.map((e) => getFeedingJournalFirestoreData(e, true))
        .toList() ??
    [];
