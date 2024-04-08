import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast_app/utills/extensions/string.dart';
import 'error.dart';

const Map<String, String> defaultHeaders = {
  'Content-Type': 'application/json',
  'accept': 'application/json',
};

/// HTTP `GET` request that returns the decoded body of payload
/// Handles different error scenarios with appropriate exceptions
Future<dynamic> getJson(String url, {Map<String, String>? headers}) {
  "--> requesting $url ${headers != null ? "with headers $headers" : ""}"
      .log(Reaction.info);
  return http
      .get(Uri.parse(url), headers: {...defaultHeaders, ...?headers})
      .timeout(const Duration(minutes: 1))
      .then((response) {
        "--> response ${response.statusCode} $url".log(Reaction.info);
        if (response.statusCode <= 230 && response.statusCode >= 200) {
          return jsonDecode(response.body);
        }
        switch (response.statusCode) {
          case 400:
            throw TimeOutException(apiResponseError(response));
          case 401:
            throw UnauthorisedException(apiResponseError(response));
          case 404:
            throw NotFoundException(apiResponseError(response));
          case 500:
            throw ServerException(apiResponseError(response));
          default:
            final error = ApiError(
                'Error occurred while communication with server with status_code: ${response.statusCode} and url $url');
            throw error;
        }
      }, onError: (error) {
        "--> API ERROR $url".log(Reaction.error);
        if (error is SocketException) {
          String errorMessage = "No internet or api offline";
          debugPrint("--> error: $errorMessage");
          throw RemoteSourceNotAvailable(errorMessage);
        }
        debugPrint(error.runtimeType.toString());
        throw ApiError("Unexpected error occurred");
      });
}