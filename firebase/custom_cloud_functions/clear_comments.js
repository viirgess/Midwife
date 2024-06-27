const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.clearComments = functions
  .region("europe-west3")
  .firestore.document("users/{documentID}")
  .onDelete(async (snap, context) => {
    const docID = snap.ref;

    try {
      const db = admin.firestore();

      // Delete comments referencing the deleted user
      const querySnapshotComments = await db.collection("posts").get();
      for (const postDoc of querySnapshotComments.docs) {
        const commentsRef = postDoc.ref.collection("comments");
        const querySnapshotComments = await commentsRef
          .where("created_by", "==", docID)
          .get();
        const batchComments = db.batch();
        querySnapshotComments.forEach((doc) => {
          batchComments.delete(doc.ref);
        });
        await batchComments.commit();
      }

      // Delete replies referencing the deleted user
      const querySnapshotReplies = await db.collection("posts").get();
      for (const postDoc of querySnapshotReplies.docs) {
        const repliesRef = postDoc.ref.collection("replies");
        const querySnapshotReplies = await repliesRef
          .where("created_by", "==", docID)
          .get();
        const batchReplies = db.batch();
        querySnapshotReplies.forEach((replyDoc) => {
          batchReplies.delete(replyDoc.ref);
        });
        await batchReplies.commit();
      }
    } catch (error) {
      console.error("Error deleting user comments: ", error);
    }
  });
