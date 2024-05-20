import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException.fromDioError(DioExceptionType dioError) {
    switch (dioError) {
      case DioExceptionType.connectionError:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad Certificate";
        break;
      case DioExceptionType.badResponse:
        message = "Bad Response";
        break;
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionError:
        message = "Connection to API server error";
        break;
      case DioExceptionType.unknown:
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  @override
  String toString() => message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['error'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}
