import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AskCall {
  static Future<ApiCallResponse> call({
    String? query = 'NA',
    dynamic chatHistoryJson,
  }) async {
    final chatHistory = _serializeJson(chatHistoryJson);
    final ffApiRequestBody = '''
{
  "query": "${escapeStringForJson(query)}",
  "chat_history": ${chatHistory}
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'ask',
      apiUrl: 'https://sweetreactions.fly.dev/ask',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization':
            'Bearer 6s9xqobpirM7mooKFLokOisf5B8d7hyfHvhtrZCW0fpH5hDtSkeGcn5uFOHMvmQxEKGtRBrvkfdHlePWqe4CZ8vLjkk1bjJaDqxPFopU1Uitivv7jeAVCy4RoXLL0kMs',
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

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  static bool? limit(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.counts_toward_limit''',
      ));
}

class TimeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'time',
      apiUrl: 'https://sweetreactions.fly.dev/time',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'timezone': "Asia/Kolkata",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.server_time.utc''',
      ));
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
