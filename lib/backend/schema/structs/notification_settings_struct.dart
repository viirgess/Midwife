// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NotificationSettingsStruct extends FFFirebaseStruct {
  NotificationSettingsStruct({
    bool? offersFromPartners,
    bool? tipsAndUpdates,
    bool? mentionsAndReplies,
    bool? comments,
    bool? friendRequests,
    bool? messaging,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _offersFromPartners = offersFromPartners,
        _tipsAndUpdates = tipsAndUpdates,
        _mentionsAndReplies = mentionsAndReplies,
        _comments = comments,
        _friendRequests = friendRequests,
        _messaging = messaging,
        super(firestoreUtilData);

  // "offersFromPartners" field.
  bool? _offersFromPartners;
  bool get offersFromPartners => _offersFromPartners ?? true;
  set offersFromPartners(bool? val) => _offersFromPartners = val;

  bool hasOffersFromPartners() => _offersFromPartners != null;

  // "tipsAndUpdates" field.
  bool? _tipsAndUpdates;
  bool get tipsAndUpdates => _tipsAndUpdates ?? true;
  set tipsAndUpdates(bool? val) => _tipsAndUpdates = val;

  bool hasTipsAndUpdates() => _tipsAndUpdates != null;

  // "mentionsAndReplies" field.
  bool? _mentionsAndReplies;
  bool get mentionsAndReplies => _mentionsAndReplies ?? true;
  set mentionsAndReplies(bool? val) => _mentionsAndReplies = val;

  bool hasMentionsAndReplies() => _mentionsAndReplies != null;

  // "comments" field.
  bool? _comments;
  bool get comments => _comments ?? true;
  set comments(bool? val) => _comments = val;

  bool hasComments() => _comments != null;

  // "friendRequests" field.
  bool? _friendRequests;
  bool get friendRequests => _friendRequests ?? true;
  set friendRequests(bool? val) => _friendRequests = val;

  bool hasFriendRequests() => _friendRequests != null;

  // "messaging" field.
  bool? _messaging;
  bool get messaging => _messaging ?? true;
  set messaging(bool? val) => _messaging = val;

  bool hasMessaging() => _messaging != null;

  static NotificationSettingsStruct fromMap(Map<String, dynamic> data) =>
      NotificationSettingsStruct(
        offersFromPartners: data['offersFromPartners'] as bool?,
        tipsAndUpdates: data['tipsAndUpdates'] as bool?,
        mentionsAndReplies: data['mentionsAndReplies'] as bool?,
        comments: data['comments'] as bool?,
        friendRequests: data['friendRequests'] as bool?,
        messaging: data['messaging'] as bool?,
      );

  static NotificationSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'offersFromPartners': _offersFromPartners,
        'tipsAndUpdates': _tipsAndUpdates,
        'mentionsAndReplies': _mentionsAndReplies,
        'comments': _comments,
        'friendRequests': _friendRequests,
        'messaging': _messaging,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'offersFromPartners': serializeParam(
          _offersFromPartners,
          ParamType.bool,
        ),
        'tipsAndUpdates': serializeParam(
          _tipsAndUpdates,
          ParamType.bool,
        ),
        'mentionsAndReplies': serializeParam(
          _mentionsAndReplies,
          ParamType.bool,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.bool,
        ),
        'friendRequests': serializeParam(
          _friendRequests,
          ParamType.bool,
        ),
        'messaging': serializeParam(
          _messaging,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NotificationSettingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationSettingsStruct(
        offersFromPartners: deserializeParam(
          data['offersFromPartners'],
          ParamType.bool,
          false,
        ),
        tipsAndUpdates: deserializeParam(
          data['tipsAndUpdates'],
          ParamType.bool,
          false,
        ),
        mentionsAndReplies: deserializeParam(
          data['mentionsAndReplies'],
          ParamType.bool,
          false,
        ),
        comments: deserializeParam(
          data['comments'],
          ParamType.bool,
          false,
        ),
        friendRequests: deserializeParam(
          data['friendRequests'],
          ParamType.bool,
          false,
        ),
        messaging: deserializeParam(
          data['messaging'],
          ParamType.bool,
          false,
        ),
      );

  static NotificationSettingsStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      NotificationSettingsStruct(
        offersFromPartners: convertAlgoliaParam(
          data['offersFromPartners'],
          ParamType.bool,
          false,
        ),
        tipsAndUpdates: convertAlgoliaParam(
          data['tipsAndUpdates'],
          ParamType.bool,
          false,
        ),
        mentionsAndReplies: convertAlgoliaParam(
          data['mentionsAndReplies'],
          ParamType.bool,
          false,
        ),
        comments: convertAlgoliaParam(
          data['comments'],
          ParamType.bool,
          false,
        ),
        friendRequests: convertAlgoliaParam(
          data['friendRequests'],
          ParamType.bool,
          false,
        ),
        messaging: convertAlgoliaParam(
          data['messaging'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NotificationSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationSettingsStruct &&
        offersFromPartners == other.offersFromPartners &&
        tipsAndUpdates == other.tipsAndUpdates &&
        mentionsAndReplies == other.mentionsAndReplies &&
        comments == other.comments &&
        friendRequests == other.friendRequests &&
        messaging == other.messaging;
  }

  @override
  int get hashCode => const ListEquality().hash([
        offersFromPartners,
        tipsAndUpdates,
        mentionsAndReplies,
        comments,
        friendRequests,
        messaging
      ]);
}

NotificationSettingsStruct createNotificationSettingsStruct({
  bool? offersFromPartners,
  bool? tipsAndUpdates,
  bool? mentionsAndReplies,
  bool? comments,
  bool? friendRequests,
  bool? messaging,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationSettingsStruct(
      offersFromPartners: offersFromPartners,
      tipsAndUpdates: tipsAndUpdates,
      mentionsAndReplies: mentionsAndReplies,
      comments: comments,
      friendRequests: friendRequests,
      messaging: messaging,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationSettingsStruct? updateNotificationSettingsStruct(
  NotificationSettingsStruct? notificationSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationSettingsStructData(
  Map<String, dynamic> firestoreData,
  NotificationSettingsStruct? notificationSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationSettings == null) {
    return;
  }
  if (notificationSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationSettingsData =
      getNotificationSettingsFirestoreData(notificationSettings, forFieldValue);
  final nestedData =
      notificationSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      notificationSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationSettingsFirestoreData(
  NotificationSettingsStruct? notificationSettings, [
  bool forFieldValue = false,
]) {
  if (notificationSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationSettings.toMap());

  // Add any Firestore field values
  notificationSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationSettingsListFirestoreData(
  List<NotificationSettingsStruct>? notificationSettingss,
) =>
    notificationSettingss
        ?.map((e) => getNotificationSettingsFirestoreData(e, true))
        .toList() ??
    [];
