import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ChatGPTServiceCall {
  static Future<ApiCallResponse> call({
    String? assistantId = 'asst_NloFw7Pdy26VtS7oNLIwaKvC',
    String? question = '',
    String? aPIKey = 'sk-proj-rbH5j5NIo9yFPH19yne2T3BlbkFJpvJ34mVTMDZr9Gpi8l3n',
    String? instruction =
        'You are assistant. Zwangerschapsmentor is a specialized tool for providing advice to pregnant women, based on the information from deverloskundige.nl. This GPT takes a balanced approach between formal and informal language, making the advice both accessible and authoritative. It emphasizes research information, ensuring accuracy and relevance in the advice. Crucially, Pregnancy Mentor does not diagnose or recommend medical treatments. This is the sole responsibility of qualified medical personnel. The GPT remains faithful to the content of deverloskundige.nl, to ensure consistency and reliability in supporting pregnancy-related questions and concerns. The GPT will expressly indicate that users must consult their medical provider for diagnoses and treatments. Here is your question',
    String? language =
        'Please provide the response in Dutch or English. Depends on which languages you were ask.',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo-instruct",
  "prompt": "<$language> <$instruction> <$question>",
  "temperature": 0.3,
  "max_tokens": 1000,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chatGPTService',
      apiUrl: 'https://api.openai.com/v1/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $aPIKey',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].text''',
      ));
}

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? subject = '',
    String? body = '',
    String? toEmail = 'maxlabyk@gmail.com',
  }) async {
    final ffApiRequestBody = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "$toEmail"
        }
      ],
      "subject": "$subject"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "$body"
    }
  ],
  "from": {
    "email": "maksym.labyk@archysoft.com",
    "name": "Outerly Support Team"
  },
  "reply_to": {
    "email": "maksym.labyk@archysoft.com",
    "name": "Outerly Support Team"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send?ref=blog.flutterflow.io',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
