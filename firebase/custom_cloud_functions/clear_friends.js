const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.clearFriends = functions
  .region("europe-west3")
  .firestore.document("users/{documentID}")
  .onDelete(async (snap, context) => {
    const docID = snap.ref;

    try {
      const db = admin.firestore();
      const batchFriends = db.batch();

      // Get all users documents
      const querySnapshotUsers = await db.collection("users").get();

      querySnapshotUsers.forEach((userDoc) => {
        const userRef = userDoc.ref;
        const userFriends = userDoc.get("user_friends") || []; // Handle cases where user_friends might not exist

        // Filter out deleted user's reference from user_friends
        const updatedFriends = userFriends.filter(
          (friendRef) => friendRef.id !== docID.id,
        );

        // Update user document with filtered user_friends
        batchFriends.set(
          userRef,
          { user_friends: updatedFriends },
          { merge: true },
        );
      });

      await batchFriends.commit();

      console.log(`Removed ${docID.id} from user_friends lists`);
    } catch (error) {
      console.error("Error removing deleted user from friends: ", error);
    }
  });
