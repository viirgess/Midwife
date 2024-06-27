const admin = require("firebase-admin/app");
admin.initializeApp();

const updateFieldMonthly = require("./update_field_monthly.js");
exports.updateFieldMonthly = updateFieldMonthly.updateFieldMonthly;
const resetAiRequests = require("./reset_ai_requests.js");
exports.resetAiRequests = resetAiRequests.resetAiRequests;
const clearPosts = require("./clear_posts.js");
exports.clearPosts = clearPosts.clearPosts;
const newCollaboration = require("./new_collaboration.js");
exports.newCollaboration = newCollaboration.newCollaboration;
const deleteAllNotifications = require("./delete_all_notifications.js");
exports.deleteAllNotifications = deleteAllNotifications.deleteAllNotifications;
const clearComments = require("./clear_comments.js");
exports.clearComments = clearComments.clearComments;
const clearNotifications = require("./clear_notifications.js");
exports.clearNotifications = clearNotifications.clearNotifications;
const clearFriends = require("./clear_friends.js");
exports.clearFriends = clearFriends.clearFriends;
