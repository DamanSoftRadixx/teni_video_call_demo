import 'package:dio/dio.dart' show DioException, DioExceptionType;

import '../constants/app_strings.dart' show ErrorStrings;

class DioExceptions implements Exception {
  DioExceptions();
  late String message;

  DioExceptions.fromDioError(DioException dioException) {
    print("=-=-=-= dioException: ${dioException.type}");
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = ErrorStrings.cancelRequest;
        break;
      case DioExceptionType.connectionTimeout:
        message = ErrorStrings.connectionTimeOut;
        break;
      case DioExceptionType.receiveTimeout:
        message = ErrorStrings.receiveTimeOut;
        break;
      case DioExceptionType.badResponse:
        message = handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = ErrorStrings.sendTimeOut;
        break;
      case DioExceptionType.connectionError:
        message = ErrorStrings.socketException;
        break;
      default:
        message = ErrorStrings.unknownError;
        break;
    }
  }

  String handleError(int? statusCode, dynamic error) {
    print("=-=-=-= handleError: $statusCode and $error");
    switch (statusCode) {
      case 400:
        return ErrorStrings.badRequest;
      case 401:
        return ErrorStrings.unauthorized;
      case 403:
        return ErrorStrings.forbidden;
      case 404:
        return ErrorStrings.notFound;
      case 422:
        return ErrorStrings.duplicateEmail;
      case 500:
        return ErrorStrings.internalServerError;
      case 502:
        return ErrorStrings.badGateway;
      default:
        return ErrorStrings.unknownError;
    }
  }

  String handleError2(int? statusCode, dynamic error) {
    // Check if server sent custom message
    if (error is Map<String, dynamic>) {
      if (error.containsKey('message') && error['message'] is String) {
        return error['message'];
      } else if (error.containsKey('error') && error['error'] is String) {
        return error['error'];
      }
    }

    switch (statusCode) {
      case 400:
        return ErrorStrings.badRequest;
      case 401:
        return ErrorStrings.unauthorized;
      case 403:
        return ErrorStrings.forbidden;
      case 404:
        return ErrorStrings.notFound;
      case 422:
        return ErrorStrings.duplicateEmail;
      case 500:
        return ErrorStrings.internalServerError;
      case 502:
        return ErrorStrings.badGateway;
      default:
        return error?.toString().isNotEmpty == true
            ? error.toString()
            : ErrorStrings.unknownError;
    }
  }

  @override
  String toString() => message;
}
