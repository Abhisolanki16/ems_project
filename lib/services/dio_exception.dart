import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection Timeout: The server is taking too long to respond. Please check your internet connection and try again.';

      case DioExceptionType.sendTimeout:
        return 'Send Timeout: Your request is taking too long to send.';

      case DioExceptionType.receiveTimeout:
        return 'Receive Timeout: The server took too long to respond.';

      case DioExceptionType.badResponse:
        return 'Api calls too many times. try again later.';

      case DioExceptionType.cancel:
        return 'Request Cancelled: Your request was cancelled. Please try again.';

      case DioExceptionType.connectionError:
        return 'Connection Error: Please check your internet connection and try again.';

      case DioExceptionType.unknown:
        return 'Unknown Error: An unexpected error occurred. Please try again.';

      case DioExceptionType.badCertificate:
        return 'Bad Certificate: The security certificate is not valid.';

      default:
        return 'Unexpected Dio error: ${exception.message}';
    }
    // return errorMessage;
  }
}
