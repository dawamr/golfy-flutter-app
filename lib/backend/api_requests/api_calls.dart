import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start CMS Group Code

class CmsGroup {
  static String baseUrl = 'https://cmsgolfy.codeai.my.id';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [accessToken]',
  };
  static GetAppMenuHomeCall getAppMenuHomeCall = GetAppMenuHomeCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static GetGolfCourseCall getGolfCourseCall = GetGolfCourseCall();
  static SearchGolfCourseCall searchGolfCourseCall = SearchGolfCourseCall();
}

class GetAppMenuHomeCall {
  Future<ApiCallResponse> call({
    String? accessToken = 'g1XUlV2EaBxJG2jvSuu6jaikdXGRjt9m',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAppMenuHome',
      apiUrl: '${CmsGroup.baseUrl}/items/AppMenu?fields=*,icon.filename_disk',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic itemName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  dynamic itemAsset(dynamic response) => getJsonField(
        response,
        r'''$.data[:].icon.filename_disk''',
        true,
      );
  dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken =
        'eG7R8CEjfZ6V6Zkm4wnG0f4JhM20kSFPHjJYhtT45AcPgQR1UrF2fey-QsGMRtW0',
    String? accessToken = 'g1XUlV2EaBxJG2jvSuu6jaikdXGRjt9m',
  }) async {
    final ffApiRequestBody = '''
{
  "refresh_token": "$refreshToken",
  "mode": "json"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'refreshToken',
      apiUrl: '${CmsGroup.baseUrl}/auth/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.data.access_token''',
      );
  dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.data.refresh_token''',
      );
}

class GetGolfCourseCall {
  Future<ApiCallResponse> call({
    String? accessToken = 'g1XUlV2EaBxJG2jvSuu6jaikdXGRjt9m',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGolfCourse',
      apiUrl: '${CmsGroup.baseUrl}/items/GolfCourse',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "*,facilities.GolfFacility_id.name,facilities.GolfFacility_id.icon.filename_disk,photo.filename_disk",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic placeName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
  dynamic placeCity(dynamic response) => getJsonField(
        response,
        r'''$.data[:].city''',
      );
  dynamic placeCoordinate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].map.coordinates''',
        true,
      );
  dynamic placeFacility(dynamic response) => getJsonField(
        response,
        r'''$.data[:].facilities[:].GolfFacility_id''',
        true,
      );
  dynamic dataGolfCourse(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class SearchGolfCourseCall {
  Future<ApiCallResponse> call({
    String? search = 'jakarta',
    String? accessToken = 'g1XUlV2EaBxJG2jvSuu6jaikdXGRjt9m',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchGolfCourse',
      apiUrl: '${CmsGroup.baseUrl}/items/GolfCourse',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'fields':
            "*,facilities.GolfFacility_id.name,facilities.GolfFacility_id.icon.filename_disk,photo.filename_disk",
        'filter[_or][0][name][_icontains]': search,
        'filter[_or][1][city][_icontains]': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic placeName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
  dynamic placeCity(dynamic response) => getJsonField(
        response,
        r'''$.data[:].city''',
      );
  dynamic placeCoordinate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].map.coordinates''',
        true,
      );
  dynamic placeFacility(dynamic response) => getJsonField(
        response,
        r'''$.data[:].facilities[:].GolfFacility_id''',
        true,
      );
  dynamic dataGolfCourse(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

/// End CMS Group Code

class EmailLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailLogin',
      apiUrl: 'https://cmsgolfy.codeai.my.id/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic bearerToken(dynamic response) => getJsonField(
        response,
        r'''$.data.access_token''',
      );
  static dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.data.refresh_token''',
      );
}

class MeProfileCall {
  static Future<ApiCallResponse> call({
    String? accessToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFiZTRkNWI2LTc2OTctNDg3Yi1hNzM0LTViYTc2Y2QzZGQ0NyIsInJvbGUiOiI1OWU4MTk2MS1iOWY5LTQ4NWQtOWNkNi1jODcxOTFiMjhjODUiLCJhcHBfYWNjZXNzIjp0cnVlLCJhZG1pbl9hY2Nlc3MiOmZhbHNlLCJpYXQiOjE3MDA4NDY1MDUsImV4cCI6MTcwMDg0NzQwNSwiaXNzIjoiZGlyZWN0dXMifQ.v2SIJ94Zl2BAdibBSDMX0LQybJqElBpc_WbwxYKl5gw',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'meProfile',
      apiUrl: 'https://cmsgolfy.codeai.my.id/users/me?fields=*,avatar.*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'accessToken': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic meId(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  static dynamic meFristName(dynamic response) => getJsonField(
        response,
        r'''$.data.first_name''',
      );
  static dynamic meLastNae(dynamic response) => getJsonField(
        response,
        r'''$.data.last_name''',
      );
  static dynamic meEmail(dynamic response) => getJsonField(
        response,
        r'''$.data.email''',
      );
  static dynamic meLocation(dynamic response) => getJsonField(
        response,
        r'''$.data.location''',
      );
  static dynamic meAvatar(dynamic response) => getJsonField(
        response,
        r'''$.data.avatar.filename_disk''',
      );
}

class CurrentLocationCall {
  static Future<ApiCallResponse> call({
    String? latlong = '-6.189993,106.738146',
    String? keyMapbox =
        'sk.eyJ1IjoiZGF3YW1yYWphIiwiYSI6ImNscGRubGN2MjExNzAyam82eXo2Yms0YnMifQ.5dPaE1Eb6IWemi1HS1072g',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'currentLocation',
      apiUrl:
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$latlong.json?access_token=$keyMapbox',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlong': latlong,
        'keyMapbox': keyMapbox,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GeoLocationGmapsCall {
  static Future<ApiCallResponse> call({
    String? latlong = '-6.189993, 106.738146',
    String? keyGMaps = 'AIzaSyALucBfHUKCcau-cuJ4U8pzAHdcqssbiBE',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'geoLocationGmaps',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latlong&key=$keyGMaps',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlong': latlong,
        'keyGMaps': keyGMaps,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic currentAddress(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      );
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
