const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateFieldMonthly = functions
  .region("europe-west3")
  .https.onCall(async (data, context) => {
    if (!context.auth.uid) {
      return;
    }
    const userRef = data.userRef;
    // Write your code below!
    const firestore = admin.firestore();

    const userId = userRef; // Replace with the actual user ID
    const fieldName = "ai_requests"; // Replace with the field to update

    try {
      const docRef = firestore.collection("users").doc(userId);
      const doc = await docRef.get();

      if (doc.exists) {
        const newFieldValue = 0; // Replace with your logic to determine the new value
        await docRef.update({ [fieldName]: newFieldValue });
        console.log("Field updated successfully!");
      } else {
        console.log("Document not found for user:", userId);
      }
    } catch (error) {
      console.error("Error updating field:", error);
    }
    // Write your code above!
  });
