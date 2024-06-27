import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackersRecord extends FirestoreRecord {
  TrackersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "weight_tracker" field.
  List<WeightStruct>? _weightTracker;
  List<WeightStruct> get weightTracker => _weightTracker ?? const [];
  bool hasWeightTracker() => _weightTracker != null;

  // "baby_heights" field.
  List<BabyHeightStruct>? _babyHeights;
  List<BabyHeightStruct> get babyHeights => _babyHeights ?? const [];
  bool hasBabyHeights() => _babyHeights != null;

  // "baby_weigths" field.
  List<BabyWeigthStruct>? _babyWeigths;
  List<BabyWeigthStruct> get babyWeigths => _babyWeigths ?? const [];
  bool hasBabyWeigths() => _babyWeigths != null;

  // "breast_feedings" field.
  List<BreastFeedingStruct>? _breastFeedings;
  List<BreastFeedingStruct> get breastFeedings => _breastFeedings ?? const [];
  bool hasBreastFeedings() => _breastFeedings != null;

  // "pump_feedings" field.
  List<PumpFeedinStruct>? _pumpFeedings;
  List<PumpFeedinStruct> get pumpFeedings => _pumpFeedings ?? const [];
  bool hasPumpFeedings() => _pumpFeedings != null;

  // "bottle_feedings" field.
  List<BottleFeedingStruct>? _bottleFeedings;
  List<BottleFeedingStruct> get bottleFeedings => _bottleFeedings ?? const [];
  bool hasBottleFeedings() => _bottleFeedings != null;

  // "diapers_change" field.
  List<DiaperTrackerStruct>? _diapersChange;
  List<DiaperTrackerStruct> get diapersChange => _diapersChange ?? const [];
  bool hasDiapersChange() => _diapersChange != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _weightTracker = getStructList(
      snapshotData['weight_tracker'],
      WeightStruct.fromMap,
    );
    _babyHeights = getStructList(
      snapshotData['baby_heights'],
      BabyHeightStruct.fromMap,
    );
    _babyWeigths = getStructList(
      snapshotData['baby_weigths'],
      BabyWeigthStruct.fromMap,
    );
    _breastFeedings = getStructList(
      snapshotData['breast_feedings'],
      BreastFeedingStruct.fromMap,
    );
    _pumpFeedings = getStructList(
      snapshotData['pump_feedings'],
      PumpFeedinStruct.fromMap,
    );
    _bottleFeedings = getStructList(
      snapshotData['bottle_feedings'],
      BottleFeedingStruct.fromMap,
    );
    _diapersChange = getStructList(
      snapshotData['diapers_change'],
      DiaperTrackerStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('trackers')
          : FirebaseFirestore.instance.collectionGroup('trackers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('trackers').doc(id);

  static Stream<TrackersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrackersRecord.fromSnapshot(s));

  static Future<TrackersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrackersRecord.fromSnapshot(s));

  static TrackersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrackersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrackersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrackersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrackersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrackersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrackersRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TrackersRecordDocumentEquality implements Equality<TrackersRecord> {
  const TrackersRecordDocumentEquality();

  @override
  bool equals(TrackersRecord? e1, TrackersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.weightTracker, e2?.weightTracker) &&
        listEquality.equals(e1?.babyHeights, e2?.babyHeights) &&
        listEquality.equals(e1?.babyWeigths, e2?.babyWeigths) &&
        listEquality.equals(e1?.breastFeedings, e2?.breastFeedings) &&
        listEquality.equals(e1?.pumpFeedings, e2?.pumpFeedings) &&
        listEquality.equals(e1?.bottleFeedings, e2?.bottleFeedings) &&
        listEquality.equals(e1?.diapersChange, e2?.diapersChange);
  }

  @override
  int hash(TrackersRecord? e) => const ListEquality().hash([
        e?.weightTracker,
        e?.babyHeights,
        e?.babyWeigths,
        e?.breastFeedings,
        e?.pumpFeedings,
        e?.bottleFeedings,
        e?.diapersChange
      ]);

  @override
  bool isValidKey(Object? o) => o is TrackersRecord;
}
