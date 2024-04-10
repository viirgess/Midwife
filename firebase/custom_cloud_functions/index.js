const admin = require("firebase-admin/app");
admin.initializeApp();

const updateFieldMonthly = require("./update_field_monthly.js");
exports.updateFieldMonthly = updateFieldMonthly.updateFieldMonthly;
const resetAiRequests = require("./reset_ai_requests.js");
exports.resetAiRequests = resetAiRequests.resetAiRequests;
