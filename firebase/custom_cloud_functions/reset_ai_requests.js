const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// 0 0 1 * *
exports.resetAiRequests = functions
  .region("europe-west3")
  .pubsub.schedule("0 0 1 * *")
  .timeZone("Europe/Kyiv")
  .onRun(async (context) => {
    // Write your code below!
    const firestore = admin.firestore();

    try {
      const usersRef = firestore.collection("users");

      const snapshot = await usersRef.get();

      for (const doc of snapshot.docs) {
        await doc.ref.update({ ai_requests: 0 });
      }
    } catch (error) {
      console.error("Error updating field:", error);
    }
    // Write your code above!
  });
