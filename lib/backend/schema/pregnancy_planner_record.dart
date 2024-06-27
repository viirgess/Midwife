import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PregnancyPlannerRecord extends FirestoreRecord {
  PregnancyPlannerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pregnancy_planner');

  static Stream<PregnancyPlannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PregnancyPlannerRecord.fromSnapshot(s));

  static Future<PregnancyPlannerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PregnancyPlannerRecord.fromSnapshot(s));

  static PregnancyPlannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PregnancyPlannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PregnancyPlannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PregnancyPlannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PregnancyPlannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PregnancyPlannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPregnancyPlannerRecordData({
  DocumentReference? userRef,
  String? text,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'text': text,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class PregnancyPlannerRecordDocumentEquality
    implements Equality<PregnancyPlannerRecord> {
  const PregnancyPlannerRecordDocumentEquality();

  @override
  bool equals(PregnancyPlannerRecord? e1, PregnancyPlannerRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.text == e2?.text &&
        e1?.date == e2?.date;
  }

  @override
  int hash(PregnancyPlannerRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.text, e?.date]);

  @override
  bool isValidKey(Object? o) => o is PregnancyPlannerRecord;
}
