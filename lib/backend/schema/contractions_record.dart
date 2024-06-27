import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractionsRecord extends FirestoreRecord {
  ContractionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contractions')
          : FirebaseFirestore.instance.collectionGroup('contractions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('contractions').doc(id);

  static Stream<ContractionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContractionsRecord.fromSnapshot(s));

  static Future<ContractionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContractionsRecord.fromSnapshot(s));

  static ContractionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContractionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContractionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContractionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContractionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContractionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContractionsRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContractionsRecordDocumentEquality
    implements Equality<ContractionsRecord> {
  const ContractionsRecordDocumentEquality();

  @override
  bool equals(ContractionsRecord? e1, ContractionsRecord? e2) {
    return e1?.user == e2?.user;
  }

  @override
  int hash(ContractionsRecord? e) => const ListEquality().hash([e?.user]);

  @override
  bool isValidKey(Object? o) => o is ContractionsRecord;
}
