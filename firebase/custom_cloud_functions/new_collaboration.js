const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.newCollaboration = functions
  .region("europe-west3")
  .firestore.document("collaborations/{collaborationId}")
  .onCreate(async (snap, context) => {
    // Write your code below!
    // Get the value of the newly created collaboration document
    const newCollaboration = snap.data();

    // Reference to the 'users' collection
    const usersRef = admin.firestore().collection("users");

    try {
      // Get all users
      const usersSnapshot = await usersRef.get();

      // Iterate through each user
      usersSnapshot.forEach((userDoc) => {
        // Reference to the 'notifications' subcollection for each user
        const notificationsRef = userDoc.ref.collection("notifications");
        const isCash = newCollaboration["discount_type"] === "Cash";
        const discountValue = newCollaboration["discount_value"];
        const company = newCollaboration["company_name"];
        // Create a new notification document
        notificationsRef.add({
          notification_type: "Nieuwe voucher",
          isCommunity: false,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
          content: ` bij ${company}. Bekijk de details en gebruik het snel!`,
          bold_content: isCash
            ? `€${discountValue} korting`
            : `${discountValue}% korting`,
          userRef: userDoc.ref,
        });
      });
      console.log("Notifications sent to all users");
    } catch (error) {
      console.error("Error sending notifications:", error);
    }
    // Write your code above!
  });
