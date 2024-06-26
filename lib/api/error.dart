import 'dart:convert';
import 'package:http/http.dart';

class Error implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  Error([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class LocalSourceNotAvailable extends Error {
  LocalSourceNotAvailable([String? message])
      : super(message, "LocalDataSource Error: ");

  get message => _message;
}

class ApiError implements Error {
  @override
  final dynamic _message;
  @override
  final dynamic _prefix;

  ApiError([this._message, this._prefix]);

  String get errorMessage => _message;
  dynamic get errorPrefix => _prefix;
}

class RemoteSourceNotAvailable extends ApiError {
  RemoteSourceNotAvailable([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiError {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class TimeOutException extends ApiError {
  TimeOutException([message]) : super(message, "Timeout Exception: ");
}

class UnauthorisedException extends ApiError {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class NotFoundException extends ApiError {
  NotFoundException([message]) : super(message, "Not Found: ");
}

class ServerException extends ApiError {
  ServerException([message]) : super(message, "Server Error: ");
}

class InvalidInputException extends ApiError {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

/// api response error function
String apiResponseError(Response response) {
  Map<String, dynamic> error = jsonDecode(response.body);
  return error["message"];
}
