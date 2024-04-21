import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchMultipleIndicesCategoriesRestaurantsCall {
  static Future<ApiCallResponse> call({
    String? applicationId = 'L418MOLAHS',
    String? queryStringVar = 'fwfwq',
  }) async {
    final ffApiRequestBody = '''
{
  "requests": [
    {
      "indexName": "browseCategories",
      "params": "query=${queryStringVar}"
    },
    {
      "indexName": "restaurants",
      "params": "query=${queryStringVar}"
    }
  ],
  "strategy": "none"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Search multiple indices Categories Restaurants',
      apiUrl: 'https://${applicationId}-dsn.algolia.net/1/indexes/*/queries',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-API-Key': '0b3ecce0d31400cf9d1692e353a0b2ca',
        'X-Algolia-Application-Id': 'L418MOLAHS',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? categoriesPath(dynamic response) => getJsonField(
        response,
        r'''$.results[0].hits''',
        true,
      ) as List?;
  static List? restaurantsPath(dynamic response) => getJsonField(
        response,
        r'''$.results[1].hits''',
        true,
      ) as List?;
}

class RestaurantSearchCall {
  static Future<ApiCallResponse> call({
    String? applicationId = 'L418MOLAHS',
    String? searchVar = '*',
    String? filtersVar = '',
  }) async {
    final ffApiRequestBody = '''
{
  "params": "query=${searchVar}&filters=${filtersVar}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Restaurant Search',
      apiUrl:
          'https://${applicationId}-dsn.algolia.net/1/indexes/restaurants/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-API-Key': '6b34f7d44c0d1ee4f6c8f3164a2c244b',
        'X-Algolia-Application-Id': 'L418MOLAHS',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchIndexPOSTCall {
  static Future<ApiCallResponse> call({
    String? applicationId = 'L418MOLAHS',
    String? indexName = 'restaurants',
    String? query = '*',
    String? optionalFilters = '',
  }) async {
    final ffApiRequestBody = '''
{
  "params": "query=${query}&optionalFilters=${optionalFilters}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' Search index POST',
      apiUrl:
          'https://${applicationId}-dsn.algolia.net/1/indexes/${indexName}/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-API-Key': 'f9b38e43721884c8ad71c63f6701aa88',
        'X-Algolia-Application-Id': 'L418MOLAHS',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GeoAddressCall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'AIzaSyD5RXwHAajysFEZHMOB2KVy9lmlyS90dIs',
    String? coord = '24.4624768,54.3786677',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GEO ADDRESS',
      apiUrl:
          'https://maps.google.com/maps/api/geocode/json?key=${apiKey}&latlng=${coord}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
