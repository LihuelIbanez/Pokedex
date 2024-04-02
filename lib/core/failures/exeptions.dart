import 'dart:io';

import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int statusCode;
  final String error;
  const ServerException(
      {required this.message, required this.statusCode, required this.error});

  @override
  String toString() {
    return 'statusCode: $statusCode / message: $message / error: $error';
  }
}

class NetworkException implements Exception {}

class BadRequestException implements Exception {}

class ExceptionUtils {
  static Exception getExceptionFromStatusCode(DioException error) {
    if (error.error is IOException) {
      return NetworkException();
    }
    return _throwByStatusCode(error);
  }

  static Exception _throwByStatusCode(DioException error) {
    final statusCode = error.response!.data['statusCode'];
    try {
      switch (statusCode) {
        case 400:
          throw BadRequestException();
        case 500:
          throw ServerException(
              message: error.response!.data['message'],
              statusCode: statusCode,
              error: error.response!.data['error']);
        default:
          throw Exception(error.response!.data['message']);
      }
    } catch (e) {
      throw Exception(error.response!.data['message']);
    }
  }
}
