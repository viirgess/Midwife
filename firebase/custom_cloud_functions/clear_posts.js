const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.clearPosts = functions
  .region("europe-west3")
  .firestore.document("users/{documentID}")
  .onDelete(async (snap, context) => {
    const docID = snap.ref;

    try {
      const db = admin.firestore();
      let batch = db.batch();

      // Delete posts authored by the deleted user
      const querySnapshotPosts = await db
        .collection("posts")
        .where("auther_ref", "==", docID)
        .get();
      querySnapshotPosts.forEach((doc) => {
        batch.delete(doc.ref);
      });

      // Delete comments created by the deleted user
      // const querySnapshotComments = await db.collectionGroup("comments").where("created_by", "==", docID).get();
      // querySnapshotComments.forEach((doc) => {
      //   batch.delete(doc.ref);
      // });

      // // Delete replies created by the deleted user
      // const querySnapshotReplies = await db.collectionGroup("replies").where("created_by", "==", docID).get();
      // querySnapshotReplies.forEach((doc) => {
      //   batch.delete(doc.ref);
      // });

      // Delete notifications related to the deleted user

      // Get all user documents to update the user_friends field
      // const querySnapshotUsers = await db.collection('users').get();
      // querySnapshotUsers.forEach((doc) => {
      //   const userFriends = doc.data().user_friends || [];
      //   if (userFriends.includes(docID)) {
      //     const updatedFriends = userFriends.filter(friendID => friendID !== docID);
      //     batch.update(doc.ref, { user_friends: updatedFriends });
      //   }
      // });

      await batch.commit();

      console.log(`Deleted posts for user {documentID}`);
    } catch (error) {
      console.error("Error deleting user posts: ", error);
    }
  });

//  const querySnapshotNotifications =await db.collection('users').get();
//  querySnapshotNotifications.forEach(async (doc) => {
//   const notificationDocs = await doc.ref.collection('notifications').get();
//   notificationDocs.forEach((doc) => {
//     batch.delete(doc.ref);
//   });
// });

// querySnapshotNotifications.forEach((doc) => {
//   batch.delete(doc.ref);
// });
// const querySnapshotNotifications = await docID.collection('notifications').get();
// querySnapshotNotifications.forEach((doc) => {
//   batch.delete(doc.ref);
// });
