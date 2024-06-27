import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemoriesRecord extends FirestoreRecord {
  MemoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pregnancy" field.
  bool? _pregnancy;
  bool get pregnancy => _pregnancy ?? false;
  bool hasPregnancy() => _pregnancy != null;

  // "weeks" field.
  int? _weeks;
  int get weeks => _weeks ?? 0;
  bool hasWeeks() => _weeks != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "captions" field.
  List<String>? _captions;
  List<String> get captions => _captions ?? const [];
  bool hasCaptions() => _captions != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _pregnancy = snapshotData['pregnancy'] as bool?;
    _weeks = castToType<int>(snapshotData['weeks']);
    _date = snapshotData['date'] as DateTime?;
    _photos = getDataList(snapshotData['photos']);
    _captions = getDataList(snapshotData['captions']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('memories')
          : FirebaseFirestore.instance.collectionGroup('memories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('memories').doc(id);

  static Stream<MemoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemoriesRecord.fromSnapshot(s));

  static Future<MemoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemoriesRecord.fromSnapshot(s));

  static MemoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemoriesRecordData({
  bool? pregnancy,
  int? weeks,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pregnancy': pregnancy,
      'weeks': weeks,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemoriesRecordDocumentEquality implements Equality<MemoriesRecord> {
  const MemoriesRecordDocumentEquality();

  @override
  bool equals(MemoriesRecord? e1, MemoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pregnancy == e2?.pregnancy &&
        e1?.weeks == e2?.weeks &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        listEquality.equals(e1?.captions, e2?.captions);
  }

  @override
  int hash(MemoriesRecord? e) => const ListEquality()
      .hash([e?.pregnancy, e?.weeks, e?.date, e?.photos, e?.captions]);

  @override
  bool isValidKey(Object? o) => o is MemoriesRecord;
}
