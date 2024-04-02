const admin = require("firebase-admin/app");
admin.initializeApp();

const updateFieldMonthly = require("./update_field_monthly.js");
exports.updateFieldMonthly = updateFieldMonthly.updateFieldMonthly;
