import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EBookRecord extends FirestoreRecord {
  EBookRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
    _shortDescription = snapshotData['short_description'] as String?;
    _description = snapshotData['description'] as String?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EBook');

  static Stream<EBookRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EBookRecord.fromSnapshot(s));

  static Future<EBookRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EBookRecord.fromSnapshot(s));

  static EBookRecord fromSnapshot(DocumentSnapshot snapshot) => EBookRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EBookRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EBookRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EBookRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EBookRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEBookRecordData({
  String? image,
  String? title,
  String? shortDescription,
  String? description,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'title': title,
      'short_description': shortDescription,
      'description': description,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class EBookRecordDocumentEquality implements Equality<EBookRecord> {
  const EBookRecordDocumentEquality();

  @override
  bool equals(EBookRecord? e1, EBookRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.description == e2?.description &&
        e1?.link == e2?.link;
  }

  @override
  int hash(EBookRecord? e) => const ListEquality()
      .hash([e?.image, e?.title, e?.shortDescription, e?.description, e?.link]);

  @override
  bool isValidKey(Object? o) => o is EBookRecord;
}
