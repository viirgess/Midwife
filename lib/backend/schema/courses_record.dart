import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "enrolled_users" field.
  List<DocumentReference>? _enrolledUsers;
  List<DocumentReference> get enrolledUsers => _enrolledUsers ?? const [];
  bool hasEnrolledUsers() => _enrolledUsers != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "forPregnant" field.
  bool? _forPregnant;
  bool get forPregnant => _forPregnant ?? false;
  bool hasForPregnant() => _forPregnant != null;

  // "totalLength" field.
  int? _totalLength;
  int get totalLength => _totalLength ?? 0;
  bool hasTotalLength() => _totalLength != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _enrolledUsers = getDataList(snapshotData['enrolled_users']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _forPregnant = snapshotData['forPregnant'] as bool?;
    _totalLength = castToType<int>(snapshotData['totalLength']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? title,
  String? description,
  String? imageUrl,
  DateTime? createdAt,
  bool? forPregnant,
  int? totalLength,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'forPregnant': forPregnant,
      'totalLength': totalLength,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.enrolledUsers, e2?.enrolledUsers) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.forPregnant == e2?.forPregnant &&
        e1?.totalLength == e2?.totalLength;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.imageUrl,
        e?.enrolledUsers,
        e?.createdAt,
        e?.forPregnant,
        e?.totalLength
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
