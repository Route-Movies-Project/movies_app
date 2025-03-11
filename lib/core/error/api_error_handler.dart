import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';

class ApiErrorHandler {
  static MoviesAppExceptions handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw const RemoteExpetion(
          "Connection timeout. Please check your internet.",
        );
      case DioExceptionType.sendTimeout:
        throw const RemoteExpetion(
          "Send timeout. The request took too long.",
        );
      case DioExceptionType.receiveTimeout:
        throw const RemoteExpetion(
          "Receive timeout. Server response took too long.",
        );
      case DioExceptionType.badCertificate:
        throw const RemoteExpetion(
          "Invalid SSL certificate. The connection is not secure.",
        );
      case DioExceptionType.badResponse:
        throw RemoteExpetion(
          e.response?.data["message"] ?? 'Failed To Login',
        );
      case DioExceptionType.cancel:
        throw const RemoteExpetion("Request was cancelled.");
      case DioExceptionType.connectionError:
        throw const RemoteExpetion(
          "No internet connection. Please check your network.",
        );
      case DioExceptionType.unknown:
        throw RemoteExpetion(
          "An unknown error occurred: ${e.message}",
        );
    }
  }
}
