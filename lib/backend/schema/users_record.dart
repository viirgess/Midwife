import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "liked_names_boy" field.
  List<BabyNameStruct>? _likedNamesBoy;
  List<BabyNameStruct> get likedNamesBoy => _likedNamesBoy ?? const [];
  bool hasLikedNamesBoy() => _likedNamesBoy != null;

  // "liked_names_girl" field.
  List<BabyNameStruct>? _likedNamesGirl;
  List<BabyNameStruct> get likedNamesGirl => _likedNamesGirl ?? const [];
  bool hasLikedNamesGirl() => _likedNamesGirl != null;

  // "reports" field.
  List<DocumentReference>? _reports;
  List<DocumentReference> get reports => _reports ?? const [];
  bool hasReports() => _reports != null;

  // "searchHistory" field.
  List<String>? _searchHistory;
  List<String> get searchHistory => _searchHistory ?? const [];
  bool hasSearchHistory() => _searchHistory != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "hasWeightReminder" field.
  bool? _hasWeightReminder;
  bool get hasWeightReminder => _hasWeightReminder ?? false;
  bool hasHasWeightReminder() => _hasWeightReminder != null;

  // "hasBabyReminder" field.
  bool? _hasBabyReminder;
  bool get hasBabyReminder => _hasBabyReminder ?? false;
  bool hasHasBabyReminder() => _hasBabyReminder != null;

  // "blogs" field.
  List<DocumentReference>? _blogs;
  List<DocumentReference> get blogs => _blogs ?? const [];
  bool hasBlogs() => _blogs != null;

  // "babyWasBorn" field.
  bool? _babyWasBorn;
  bool get babyWasBorn => _babyWasBorn ?? false;
  bool hasBabyWasBorn() => _babyWasBorn != null;

  // "babyGender" field.
  Gender? _babyGender;
  Gender? get babyGender => _babyGender;
  bool hasBabyGender() => _babyGender != null;

  // "subscriptions" field.
  List<SubscriptionStruct>? _subscriptions;
  List<SubscriptionStruct> get subscriptions => _subscriptions ?? const [];
  bool hasSubscriptions() => _subscriptions != null;

  // "notification_settings" field.
  NotificationSettingsStruct? _notificationSettings;
  NotificationSettingsStruct get notificationSettings =>
      _notificationSettings ?? NotificationSettingsStruct();
  bool hasNotificationSettings() => _notificationSettings != null;

  // "userRefMe" field.
  DocumentReference? _userRefMe;
  DocumentReference? get userRefMe => _userRefMe;
  bool hasUserRefMe() => _userRefMe != null;

  // "userRefs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  // "reminderDaysOfWeek" field.
  List<String>? _reminderDaysOfWeek;
  List<String> get reminderDaysOfWeek => _reminderDaysOfWeek ?? const [];
  bool hasReminderDaysOfWeek() => _reminderDaysOfWeek != null;

  // "reminderTimeOfDay" field.
  String? _reminderTimeOfDay;
  String get reminderTimeOfDay => _reminderTimeOfDay ?? '';
  bool hasReminderTimeOfDay() => _reminderTimeOfDay != null;

  // "sex" field.
  bool? _sex;
  bool get sex => _sex ?? false;
  bool hasSex() => _sex != null;

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
    _aiRequests = castToType<int>(snapshotData['ai_requests']);
    _isPregnant = snapshotData['is_pregnant'] as bool?;
    _isAdmin = snapshotData['is_admin'] as bool?;
    _likedNamesBoy = getStructList(
      snapshotData['liked_names_boy'],
      BabyNameStruct.fromMap,
    );
    _likedNamesGirl = getStructList(
      snapshotData['liked_names_girl'],
      BabyNameStruct.fromMap,
    );
    _reports = getDataList(snapshotData['reports']);
    _searchHistory = getDataList(snapshotData['searchHistory']);
    _location = snapshotData['location'] as LatLng?;
    _locationName = snapshotData['locationName'] as String?;
    _hasWeightReminder = snapshotData['hasWeightReminder'] as bool?;
    _hasBabyReminder = snapshotData['hasBabyReminder'] as bool?;
    _blogs = getDataList(snapshotData['blogs']);
    _babyWasBorn = snapshotData['babyWasBorn'] as bool?;
    _babyGender = deserializeEnum<Gender>(snapshotData['babyGender']);
    _subscriptions = getStructList(
      snapshotData['subscriptions'],
      SubscriptionStruct.fromMap,
    );
    _notificationSettings = NotificationSettingsStruct.maybeFromMap(
        snapshotData['notification_settings']);
    _userRefMe = snapshotData['userRefMe'] as DocumentReference?;
    _userRefs = getDataList(snapshotData['userRefs']);
    _reminderDaysOfWeek = getDataList(snapshotData['reminderDaysOfWeek']);
    _reminderTimeOfDay = snapshotData['reminderTimeOfDay'] as String?;
    _sex = snapshotData['sex'] as bool?;
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

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'first_name': snapshot.data['first_name'],
          'last_name': snapshot.data['last_name'],
          'calculated_date': convertAlgoliaParam(
            snapshot.data['calculated_date'],
            ParamType.DateTime,
            false,
          ),
          'user_friends': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['user_friends'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'friend_requests_pending': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['friend_requests_pending'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'ai_requests': convertAlgoliaParam(
            snapshot.data['ai_requests'],
            ParamType.int,
            false,
          ),
          'is_pregnant': snapshot.data['is_pregnant'],
          'is_admin': snapshot.data['is_admin'],
          'liked_names_boy': safeGet(
            () => (snapshot.data['liked_names_boy'] as Iterable)
                .map((d) => BabyNameStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'liked_names_girl': safeGet(
            () => (snapshot.data['liked_names_girl'] as Iterable)
                .map((d) => BabyNameStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'reports': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['reports'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'searchHistory': safeGet(
            () => snapshot.data['searchHistory'].toList(),
          ),
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'locationName': snapshot.data['locationName'],
          'hasWeightReminder': snapshot.data['hasWeightReminder'],
          'hasBabyReminder': snapshot.data['hasBabyReminder'],
          'blogs': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['blogs'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'babyWasBorn': snapshot.data['babyWasBorn'],
          'babyGender': convertAlgoliaParam<Gender>(
            snapshot.data['babyGender'],
            ParamType.Enum,
            false,
          ),
          'subscriptions': safeGet(
            () => (snapshot.data['subscriptions'] as Iterable)
                .map((d) => SubscriptionStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'notification_settings': NotificationSettingsStruct.fromAlgoliaData(
                  snapshot.data['notification_settings'] ?? {})
              .toMap(),
          'userRefMe': convertAlgoliaParam(
            snapshot.data['userRefMe'],
            ParamType.DocumentReference,
            false,
          ),
          'userRefs': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['userRefs'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'reminderDaysOfWeek': safeGet(
            () => snapshot.data['reminderDaysOfWeek'].toList(),
          ),
          'reminderTimeOfDay': snapshot.data['reminderTimeOfDay'],
          'sex': snapshot.data['sex'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  int? aiRequests,
  bool? isPregnant,
  bool? isAdmin,
  LatLng? location,
  String? locationName,
  bool? hasWeightReminder,
  bool? hasBabyReminder,
  bool? babyWasBorn,
  Gender? babyGender,
  NotificationSettingsStruct? notificationSettings,
  DocumentReference? userRefMe,
  String? reminderTimeOfDay,
  bool? sex,
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
      'ai_requests': aiRequests,
      'is_pregnant': isPregnant,
      'is_admin': isAdmin,
      'location': location,
      'locationName': locationName,
      'hasWeightReminder': hasWeightReminder,
      'hasBabyReminder': hasBabyReminder,
      'babyWasBorn': babyWasBorn,
      'babyGender': babyGender,
      'notification_settings': NotificationSettingsStruct().toMap(),
      'userRefMe': userRefMe,
      'reminderTimeOfDay': reminderTimeOfDay,
      'sex': sex,
    }.withoutNulls,
  );

  // Handle nested data for "notification_settings" field.
  addNotificationSettingsStructData(
      firestoreData, notificationSettings, 'notification_settings');

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
        e1?.aiRequests == e2?.aiRequests &&
        e1?.isPregnant == e2?.isPregnant &&
        e1?.isAdmin == e2?.isAdmin &&
        listEquality.equals(e1?.likedNamesBoy, e2?.likedNamesBoy) &&
        listEquality.equals(e1?.likedNamesGirl, e2?.likedNamesGirl) &&
        listEquality.equals(e1?.reports, e2?.reports) &&
        listEquality.equals(e1?.searchHistory, e2?.searchHistory) &&
        e1?.location == e2?.location &&
        e1?.locationName == e2?.locationName &&
        e1?.hasWeightReminder == e2?.hasWeightReminder &&
        e1?.hasBabyReminder == e2?.hasBabyReminder &&
        listEquality.equals(e1?.blogs, e2?.blogs) &&
        e1?.babyWasBorn == e2?.babyWasBorn &&
        e1?.babyGender == e2?.babyGender &&
        listEquality.equals(e1?.subscriptions, e2?.subscriptions) &&
        e1?.notificationSettings == e2?.notificationSettings &&
        e1?.userRefMe == e2?.userRefMe &&
        listEquality.equals(e1?.userRefs, e2?.userRefs) &&
        listEquality.equals(e1?.reminderDaysOfWeek, e2?.reminderDaysOfWeek) &&
        e1?.reminderTimeOfDay == e2?.reminderTimeOfDay &&
        e1?.sex == e2?.sex;
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
        e?.aiRequests,
        e?.isPregnant,
        e?.isAdmin,
        e?.likedNamesBoy,
        e?.likedNamesGirl,
        e?.reports,
        e?.searchHistory,
        e?.location,
        e?.locationName,
        e?.hasWeightReminder,
        e?.hasBabyReminder,
        e?.blogs,
        e?.babyWasBorn,
        e?.babyGender,
        e?.subscriptions,
        e?.notificationSettings,
        e?.userRefMe,
        e?.userRefs,
        e?.reminderDaysOfWeek,
        e?.reminderTimeOfDay,
        e?.sex
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
