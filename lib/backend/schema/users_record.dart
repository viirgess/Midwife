import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "calculated_date" field.
  DateTime? _calculatedDate;
  DateTime? get calculatedDate => _calculatedDate;
  bool hasCalculatedDate() => _calculatedDate != null;

  // "user_friends" field.
  List<DocumentReference>? _userFriends;
  List<DocumentReference> get userFriends => _userFriends ?? const [];
  bool hasUserFriends() => _userFriends != null;

  // "friend_requests_pending" field.
  List<DocumentReference>? _friendRequestsPending;
  List<DocumentReference> get friendRequestsPending =>
      _friendRequestsPending ?? const [];
  bool hasFriendRequestsPending() => _friendRequestsPending != null;

  // "monthly_subscription" field.
  bool? _monthlySubscription;
  bool get monthlySubscription => _monthlySubscription ?? false;
  bool hasMonthlySubscription() => _monthlySubscription != null;

  // "annual_subscription" field.
  bool? _annualSubscription;
  bool get annualSubscription => _annualSubscription ?? false;
  bool hasAnnualSubscription() => _annualSubscription != null;

  // "ai_requests" field.
  int? _aiRequests;
  int get aiRequests => _aiRequests ?? 0;
  bool hasAiRequests() => _aiRequests != null;

  // "is_pregnant" field.
  bool? _isPregnant;
  bool get isPregnant => _isPregnant ?? false;
  bool hasIsPregnant() => _isPregnant != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _calculatedDate = snapshotData['calculated_date'] as DateTime?;
    _userFriends = getDataList(snapshotData['user_friends']);
    _friendRequestsPending =
        getDataList(snapshotData['friend_requests_pending']);
    _monthlySubscription = snapshotData['monthly_subscription'] as bool?;
    _annualSubscription = snapshotData['annual_subscription'] as bool?;
    _aiRequests = castToType<int>(snapshotData['ai_requests']);
    _isPregnant = snapshotData['is_pregnant'] as bool?;
    _isAdmin = snapshotData['is_admin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  DateTime? calculatedDate,
  bool? monthlySubscription,
  bool? annualSubscription,
  int? aiRequests,
  bool? isPregnant,
  bool? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'calculated_date': calculatedDate,
      'monthly_subscription': monthlySubscription,
      'annual_subscription': annualSubscription,
      'ai_requests': aiRequests,
      'is_pregnant': isPregnant,
      'is_admin': isAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.calculatedDate == e2?.calculatedDate &&
        listEquality.equals(e1?.userFriends, e2?.userFriends) &&
        listEquality.equals(
            e1?.friendRequestsPending, e2?.friendRequestsPending) &&
        e1?.monthlySubscription == e2?.monthlySubscription &&
        e1?.annualSubscription == e2?.annualSubscription &&
        e1?.aiRequests == e2?.aiRequests &&
        e1?.isPregnant == e2?.isPregnant &&
        e1?.isAdmin == e2?.isAdmin;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstName,
        e?.lastName,
        e?.calculatedDate,
        e?.userFriends,
        e?.friendRequestsPending,
        e?.monthlySubscription,
        e?.annualSubscription,
        e?.aiRequests,
        e?.isPregnant,
        e?.isAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
