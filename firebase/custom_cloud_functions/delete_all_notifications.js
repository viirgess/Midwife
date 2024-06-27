const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteAllNotifications = functions
  .region("europe-west3")
  .pubsub.schedule("*/1 * * * *")
  .timeZone("Europe/Kyiv")
  .onRun(async (context) => {
    // Write your code below!
    const usersRef = admin.firestore().collection("users");

    try {
      // Get all users
      const usersSnapshot = await usersRef.get();

      // Iterate through each user
      const deletePromises = [];
      usersSnapshot.forEach((userDoc) => {
        // Reference to the 'notifications' subcollection for each user
        const notificationsRef = userDoc.ref.collection("notifications");

        // Create a promise to delete all notifications
        deletePromises.push(deleteCollection(notificationsRef, 500));
      });

      // Wait for all deletions to complete
      await Promise.all(deletePromises);

      console.log("Notifications deleted for all users");
    } catch (error) {
      console.error("Error deleting notifications:", error);
    }
    // Write your code above!
  });

/**
 * Helper function to delete all documents in a collection in batches
 * @param {FirebaseFirestore.CollectionReference} collectionRef - Reference to the collection to delete
 * @param {number} batchSize - Number of documents to delete in each batch
 */
async function deleteCollection(collectionRef, batchSize) {
  const snapshot = await collectionRef.get();
  if (snapshot.size === 0) {
    return;
  }

  const batch = admin.firestore().batch();
  snapshot.docs.forEach((doc) => {
    batch.delete(doc.ref);
  });

  await batch.commit();

  // Recursively delete the next batch of documents
  if (snapshot.size === batchSize) {
    return deleteCollection(collectionRef, batchSize);
  }
}
