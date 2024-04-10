import '/backend/schema/structs/index.dart';

class UpdateFieldMonthlyCloudFunctionCallResponse {
  UpdateFieldMonthlyCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class ResetAiRequestsCloudFunctionCallResponse {
  ResetAiRequestsCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
