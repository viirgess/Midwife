import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeksRecord extends FirestoreRecord {
  WeeksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "first_chapter" field.
  String? _firstChapter;
  String get firstChapter => _firstChapter ?? '';
  bool hasFirstChapter() => _firstChapter != null;

  // "second_chapter" field.
  String? _secondChapter;
  String get secondChapter => _secondChapter ?? '';
  bool hasSecondChapter() => _secondChapter != null;

  // "third_chapter" field.
  String? _thirdChapter;
  String get thirdChapter => _thirdChapter ?? '';
  bool hasThirdChapter() => _thirdChapter != null;

  // "fourth_chapter" field.
  String? _fourthChapter;
  String get fourthChapter => _fourthChapter ?? '';
  bool hasFourthChapter() => _fourthChapter != null;

  // "fifth_chapter" field.
  String? _fifthChapter;
  String get fifthChapter => _fifthChapter ?? '';
  bool hasFifthChapter() => _fifthChapter != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _firstChapter = snapshotData['first_chapter'] as String?;
    _secondChapter = snapshotData['second_chapter'] as String?;
    _thirdChapter = snapshotData['third_chapter'] as String?;
    _fourthChapter = snapshotData['fourth_chapter'] as String?;
    _fifthChapter = snapshotData['fifth_chapter'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _model = snapshotData['model'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weeks');

  static Stream<WeeksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeeksRecord.fromSnapshot(s));

  static Future<WeeksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeeksRecord.fromSnapshot(s));

  static WeeksRecord fromSnapshot(DocumentSnapshot snapshot) => WeeksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeeksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeeksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeeksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeeksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeeksRecordData({
  String? title,
  String? firstChapter,
  String? secondChapter,
  String? thirdChapter,
  String? fourthChapter,
  String? fifthChapter,
  int? id,
  String? model,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'first_chapter': firstChapter,
      'second_chapter': secondChapter,
      'third_chapter': thirdChapter,
      'fourth_chapter': fourthChapter,
      'fifth_chapter': fifthChapter,
      'id': id,
      'model': model,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeeksRecordDocumentEquality implements Equality<WeeksRecord> {
  const WeeksRecordDocumentEquality();

  @override
  bool equals(WeeksRecord? e1, WeeksRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.firstChapter == e2?.firstChapter &&
        e1?.secondChapter == e2?.secondChapter &&
        e1?.thirdChapter == e2?.thirdChapter &&
        e1?.fourthChapter == e2?.fourthChapter &&
        e1?.fifthChapter == e2?.fifthChapter &&
        e1?.id == e2?.id &&
        e1?.model == e2?.model;
  }

  @override
  int hash(WeeksRecord? e) => const ListEquality().hash([
        e?.title,
        e?.firstChapter,
        e?.secondChapter,
        e?.thirdChapter,
        e?.fourthChapter,
        e?.fifthChapter,
        e?.id,
        e?.model
      ]);

  @override
  bool isValidKey(Object? o) => o is WeeksRecord;
}
