const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.clearNotifications = functions
  .region("europe-west3")
  .firestore.document("users/{documentID}")
  .onDelete(async (snap, context) => {
    const docID = snap.ref;

    try {
      const db = admin.firestore();
      // Delete comments referencing the deleted user
      const querySnapshotUsers = await db.collection("users").get();
      for (const userDoc of querySnapshotUsers.docs) {
        const notificationsRef = userDoc.ref.collection("notifications");
        const querySnapshotNotifications = await notificationsRef
          .where("userRef", "==", docID)
          .get();
        const batchNotifications = db.batch();
        querySnapshotNotifications.forEach((doc) => {
          batchNotifications.delete(doc.ref);
        });
        await batchNotifications.commit();
      }
    } catch (error) {
      console.error("Error deleting user comments: ", error);
    }
  });
