import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image_preview" field.
  String? _imagePreview;
  String get imagePreview => _imagePreview ?? '';
  bool hasImagePreview() => _imagePreview != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "isProvince" field.
  bool? _isProvince;
  bool get isProvince => _isProvince ?? false;
  bool hasIsProvince() => _isProvince != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "reports" field.
  int? _reports;
  int get reports => _reports ?? 0;
  bool hasReports() => _reports != null;

  // "sex" field.
  bool? _sex;
  bool get sex => _sex ?? false;
  bool hasSex() => _sex != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imagePreview = snapshotData['image_preview'] as String?;
    _members = getDataList(snapshotData['members']);
    _isProvince = snapshotData['isProvince'] as bool?;
    _description = snapshotData['description'] as String?;
    _reports = castToType<int>(snapshotData['reports']);
    _sex = snapshotData['sex'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  static GroupsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      GroupsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'image_preview': snapshot.data['image_preview'],
          'members': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['members'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'isProvince': snapshot.data['isProvince'],
          'description': snapshot.data['description'],
          'reports': convertAlgoliaParam(
            snapshot.data['reports'],
            ParamType.int,
            false,
          ),
          'sex': snapshot.data['sex'],
        },
        GroupsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<GroupsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'groups',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? name,
  String? imagePreview,
  bool? isProvince,
  String? description,
  int? reports,
  bool? sex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image_preview': imagePreview,
      'isProvince': isProvince,
      'description': description,
      'reports': reports,
      'sex': sex,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.imagePreview == e2?.imagePreview &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.isProvince == e2?.isProvince &&
        e1?.description == e2?.description &&
        e1?.reports == e2?.reports &&
        e1?.sex == e2?.sex;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.imagePreview,
        e?.members,
        e?.isProvince,
        e?.description,
        e?.reports,
        e?.sex
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
