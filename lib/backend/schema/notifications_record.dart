import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "friend_request" field.
  bool? _friendRequest;
  bool get friendRequest => _friendRequest ?? false;
  bool hasFriendRequest() => _friendRequest != null;

  // "friend_request_accepted" field.
  bool? _friendRequestAccepted;
  bool get friendRequestAccepted => _friendRequestAccepted ?? false;
  bool hasFriendRequestAccepted() => _friendRequestAccepted != null;

  // "new_blog_is_posted" field.
  bool? _newBlogIsPosted;
  bool get newBlogIsPosted => _newBlogIsPosted ?? false;
  bool hasNewBlogIsPosted() => _newBlogIsPosted != null;

  // "received_message" field.
  bool? _receivedMessage;
  bool get receivedMessage => _receivedMessage ?? false;
  bool hasReceivedMessage() => _receivedMessage != null;

  // "someone_has_commented" field.
  bool? _someoneHasCommented;
  bool get someoneHasCommented => _someoneHasCommented ?? false;
  bool hasSomeoneHasCommented() => _someoneHasCommented != null;

  // "someone_liked_post" field.
  bool? _someoneLikedPost;
  bool get someoneLikedPost => _someoneLikedPost ?? false;
  bool hasSomeoneLikedPost() => _someoneLikedPost != null;

  // "credit_info" field.
  bool? _creditInfo;
  bool get creditInfo => _creditInfo ?? false;
  bool hasCreditInfo() => _creditInfo != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "user_sent_friend_request" field.
  DocumentReference? _userSentFriendRequest;
  DocumentReference? get userSentFriendRequest => _userSentFriendRequest;
  bool hasUserSentFriendRequest() => _userSentFriendRequest != null;

  // "user_display_name" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  bool hasUserDisplayName() => _userDisplayName != null;

  // "user_photo_url" field.
  String? _userPhotoUrl;
  String get userPhotoUrl => _userPhotoUrl ?? '';
  bool hasUserPhotoUrl() => _userPhotoUrl != null;

  // "user_accepted_friendship" field.
  DocumentReference? _userAcceptedFriendship;
  DocumentReference? get userAcceptedFriendship => _userAcceptedFriendship;
  bool hasUserAcceptedFriendship() => _userAcceptedFriendship != null;

  // "blog_title" field.
  String? _blogTitle;
  String get blogTitle => _blogTitle ?? '';
  bool hasBlogTitle() => _blogTitle != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "isCommunity" field.
  bool? _isCommunity;
  bool get isCommunity => _isCommunity ?? false;
  bool hasIsCommunity() => _isCommunity != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "bold_content" field.
  String? _boldContent;
  String get boldContent => _boldContent ?? '';
  bool hasBoldContent() => _boldContent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _friendRequest = snapshotData['friend_request'] as bool?;
    _friendRequestAccepted = snapshotData['friend_request_accepted'] as bool?;
    _newBlogIsPosted = snapshotData['new_blog_is_posted'] as bool?;
    _receivedMessage = snapshotData['received_message'] as bool?;
    _someoneHasCommented = snapshotData['someone_has_commented'] as bool?;
    _someoneLikedPost = snapshotData['someone_liked_post'] as bool?;
    _creditInfo = snapshotData['credit_info'] as bool?;
    _title = snapshotData['title'] as String?;
    _userSentFriendRequest =
        snapshotData['user_sent_friend_request'] as DocumentReference?;
    _userDisplayName = snapshotData['user_display_name'] as String?;
    _userPhotoUrl = snapshotData['user_photo_url'] as String?;
    _userAcceptedFriendship =
        snapshotData['user_accepted_friendship'] as DocumentReference?;
    _blogTitle = snapshotData['blog_title'] as String?;
    _notificationType = snapshotData['notification_type'] as String?;
    _content = snapshotData['content'] as String?;
    _isCommunity = snapshotData['isCommunity'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _boldContent = snapshotData['bold_content'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notifications')
          : FirebaseFirestore.instance.collectionGroup('notifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notifications').doc(id);

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  bool? friendRequest,
  bool? friendRequestAccepted,
  bool? newBlogIsPosted,
  bool? receivedMessage,
  bool? someoneHasCommented,
  bool? someoneLikedPost,
  bool? creditInfo,
  String? title,
  DocumentReference? userSentFriendRequest,
  String? userDisplayName,
  String? userPhotoUrl,
  DocumentReference? userAcceptedFriendship,
  String? blogTitle,
  String? notificationType,
  String? content,
  bool? isCommunity,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? boldContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'friend_request': friendRequest,
      'friend_request_accepted': friendRequestAccepted,
      'new_blog_is_posted': newBlogIsPosted,
      'received_message': receivedMessage,
      'someone_has_commented': someoneHasCommented,
      'someone_liked_post': someoneLikedPost,
      'credit_info': creditInfo,
      'title': title,
      'user_sent_friend_request': userSentFriendRequest,
      'user_display_name': userDisplayName,
      'user_photo_url': userPhotoUrl,
      'user_accepted_friendship': userAcceptedFriendship,
      'blog_title': blogTitle,
      'notification_type': notificationType,
      'content': content,
      'isCommunity': isCommunity,
      'createdAt': createdAt,
      'userRef': userRef,
      'bold_content': boldContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.friendRequest == e2?.friendRequest &&
        e1?.friendRequestAccepted == e2?.friendRequestAccepted &&
        e1?.newBlogIsPosted == e2?.newBlogIsPosted &&
        e1?.receivedMessage == e2?.receivedMessage &&
        e1?.someoneHasCommented == e2?.someoneHasCommented &&
        e1?.someoneLikedPost == e2?.someoneLikedPost &&
        e1?.creditInfo == e2?.creditInfo &&
        e1?.title == e2?.title &&
        e1?.userSentFriendRequest == e2?.userSentFriendRequest &&
        e1?.userDisplayName == e2?.userDisplayName &&
        e1?.userPhotoUrl == e2?.userPhotoUrl &&
        e1?.userAcceptedFriendship == e2?.userAcceptedFriendship &&
        e1?.blogTitle == e2?.blogTitle &&
        e1?.notificationType == e2?.notificationType &&
        e1?.content == e2?.content &&
        e1?.isCommunity == e2?.isCommunity &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.boldContent == e2?.boldContent;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.friendRequest,
        e?.friendRequestAccepted,
        e?.newBlogIsPosted,
        e?.receivedMessage,
        e?.someoneHasCommented,
        e?.someoneLikedPost,
        e?.creditInfo,
        e?.title,
        e?.userSentFriendRequest,
        e?.userDisplayName,
        e?.userPhotoUrl,
        e?.userAcceptedFriendship,
        e?.blogTitle,
        e?.notificationType,
        e?.content,
        e?.isCommunity,
        e?.createdAt,
        e?.userRef,
        e?.boldContent
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
