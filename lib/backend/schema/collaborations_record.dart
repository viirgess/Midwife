import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CollaborationsRecord extends FirestoreRecord {
  CollaborationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "button_text" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  bool hasButtonText() => _buttonText != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _text = snapshotData['text'] as String?;
    _buttonText = snapshotData['button_text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collaborations');

  static Stream<CollaborationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollaborationsRecord.fromSnapshot(s));

  static Future<CollaborationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollaborationsRecord.fromSnapshot(s));

  static CollaborationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollaborationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollaborationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollaborationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollaborationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollaborationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollaborationsRecordData({
  String? title,
  String? image,
  String? text,
  String? buttonText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'text': text,
      'button_text': buttonText,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollaborationsRecordDocumentEquality
    implements Equality<CollaborationsRecord> {
  const CollaborationsRecordDocumentEquality();

  @override
  bool equals(CollaborationsRecord? e1, CollaborationsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.text == e2?.text &&
        e1?.buttonText == e2?.buttonText;
  }

  @override
  int hash(CollaborationsRecord? e) =>
      const ListEquality().hash([e?.title, e?.image, e?.text, e?.buttonText]);

  @override
  bool isValidKey(Object? o) => o is CollaborationsRecord;
}
