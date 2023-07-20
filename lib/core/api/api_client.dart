// ignore_for_file: prefer_typing_uninitialized_variables, avoid_dynamic_calls, parameter_assignments import 'dart:convert'; import 'dart:convert';
import 'dart:convert';
import 'dart:io';

import 'package:cbt_platform/core/app/domains/providers/app_provider.dart';
import 'package:cbt_platform/utilities/service_locator.dart';
import 'package:cbt_platform/utilities/snack_bar_util.dart';
import 'package:http/http.dart' as http;
import 'package:validators/sanitizers.dart';

import '../../main.dart';
import '../../utilities/helper_util.dart';
import '../error_handlers/error_exceptions.dart';

class ApiClient {
  late http.Client client;
  String? accessToken;
  String baseUrl = "http://localhost:8000/api/";
  bool showError = false;
  ApiClient({
    http.Client? client,
    accessToken,
    this.showError = true,
  })  : accessToken = accessToken ?? locator.get<AppProvider>().user.accessToken,
        client = client ?? http.Client();

  int _sessionExpiredResponse = 0;
  Future<dynamic> get(String url, {Map<String, dynamic>? queries}) async {
    if (queries != null) {
      url += queries.keys.fold(
        '?',
        (previousValue, key) => '$previousValue$key=${queries[key]}&',
      );
      url = trim(url, '&');
    }
    Helpers.logc("Url: $url");
    var responseJson;
    try {
      final response = await client.get(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw AppTimeoutException("Connection Timed Out");
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? queries}) async {
    if (queries != null) {
      url += queries.keys.fold(
        '?',
        (previousValue, key) => '$previousValue$key=${queries[key]}&',
      );
      url = trim(url, '&');
    }
    var responseJson;
    try {
      Helpers.logc("Url: $url");
      final response = await client.delete(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw AppTimeoutException("Connection Timed Out");
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    Helpers.logc(baseUrl + url);
    Helpers.logc(data.toString());
    var responseJson;
    try {
      final response = await client
          .post(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(data),
      )
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw AppTimeoutException("Connection Timed Out");
        },
      );
      Helpers.logc(response.body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    final responseJson;
    try {
      Helpers.logc("Url: $url");
      Helpers.logc("sending => ${json.encode(data)}");

      final response = await client
          .put(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(data),
      )
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw AppTimeoutException("Connection Timed Out");
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future upload(String url, {required Map<String, dynamic> data}) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));

    data.forEach((key, value) async {
      if (value.runtimeType != Null && value.runtimeType != int && value.runtimeType != bool && value.runtimeType != String && value.runtimeType != double) {
        request.files.add(
          http.MultipartFile.fromBytes(
            key,
            (value as File).readAsBytesSync(),
            filename: value.path.split('/').last,
          ),
        );
      } else {
        request.fields.putIfAbsent(
          key,
          () => value.runtimeType == bool ? json.encode(value) : value.toString(),
        );
      }
    });

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      "Accept": "application/json",
      'Authorization': 'Bearer $accessToken',
      "Access-Control-Allow-Origin": "*",
    });
    var responseJson;
    try {
      final res = await client.send(request).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw AppTimeoutException("Connection Timed Out");
        },
      );
      responseJson = _returnResponse(await http.Response.fromStream(res));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on HandshakeException {
      throw FetchDataException(
        'Poor internet connection, please try again with a stronger connection.',
      );
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    try {
      return _getResponse(response);
      // ignore: unused_catch_clause
    } on AppException catch (e) {
      if (showError) {
        Helpers.logc("code::${response.statusCode}", error: true);
        Helpers.logc(">>>>> error is $e", error: true);
        throw FetchDataException(processError(response));
      }
      rethrow;
    }
  }

  dynamic _getResponse(http.Response response) {
    final code = response.statusCode;
    if (response.body.contains("Access Token has expired") || response.body.contains("JWT Token is expired")) {
      _sessionExpiredResponse += 1;
      if (_sessionExpiredResponse == 1) {
        SnackbarUtil.showErrorSnack(navigatorKey.currentState!.context, "Session Expired");
        Future.delayed(const Duration(seconds: 2), () {
          // locator.get<AuthRepository>().logout(navigatorKey.currentState!.context);
        });
      }

      throw TokenServerErrorException(processError(response));
    }
    try {
      if (code == 400) {
        throw FetchDataException(processError(response));
      } else if (code == 404) {
        throw FetchDataException(processError(response));
      } else if (code == 401) {
        throw InvalidTokenException(processError(response));
      } else if (code == 403) {
        throw UnauthorisedException(processError(response));
      } else if (code == 422) {
        throw BadRequestException(processError(response));
      } else if (code >= 423 && code <= 499) {
        throw GeneralErrorException(processError(response));
      } else if (code >= 500) {
        throw ServerErrorException(processError(response));
      } else {
        if (isResponseOk(response.statusCode)) {
          final responseJson = json.decode(response.body);
          return responseJson;
        } else {
          throw FetchDataException(
            '\n statusCode : ${response.statusCode}.'
            '\n message: ${response.body}',
          );
        }
      }
    } catch (e) {
      throw BadRequestException(processError(response));
    }
  }

  bool isResponseOk(int statusCode) {
    return statusCode >= 200 && statusCode <= 299;
  }

  dynamic processError(http.Response response) {
    return json.decode(response.body)["message"] ??
        json.decode(response.body)['error']["message"] ??
        json.decode(response.body)['error']["fields"] ??
        json.decode(response.body)['error']["code"] ??
        json.decode(response.body)["amount"][0];
  }
}
