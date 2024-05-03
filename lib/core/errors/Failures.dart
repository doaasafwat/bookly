import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class FailureServices extends Failure {
  FailureServices(super.errMessage);
  factory FailureServices.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return FailureServices('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return FailureServices('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return FailureServices('Receive timeout with ApiServer');

      case DioErrorType.badResponse:
        return FailureServices.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return FailureServices('Request to ApiServer was canceld');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return FailureServices('No Internet Connection');
        }
        return FailureServices('Unexpected Error, Please try again!');
      default:
        return FailureServices('Opps There was an Error, Please try again');
    }
  }
  factory FailureServices.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return FailureServices(response['error']['message']);
    } else if (statusCode == 404) {
      return FailureServices('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return FailureServices('Internal Server error, Please try later');
    } else {
      return FailureServices('Opps There was an Error, Please try again');
    }
  }
}
