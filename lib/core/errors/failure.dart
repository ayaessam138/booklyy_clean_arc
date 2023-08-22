import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;

  Failure(this.errormessage);
}

class Serverfailure extends Failure {
  Serverfailure(super.errormessage);

  factory Serverfailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure('Connection Timeout with Apiserver');
      case DioExceptionType.sendTimeout:
        return Serverfailure('Send Timeout with Apiserver');
      case DioExceptionType.receiveTimeout:
        return Serverfailure('Recive Timeout with Apiserver');
      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return Serverfailure('Requset  to Apiserver was Cancelled');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return Serverfailure('No internet Connection');
        } else {
          return Serverfailure('Unexcepcted error, Please try Later');
        }
      case DioExceptionType.badCertificate:
        return Serverfailure('Unexcepcted error, Please try Later');

      case DioExceptionType.connectionError:
        return Serverfailure('No internet Connection');
    }
  }

  factory Serverfailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return Serverfailure(response['error']['message']);
    } else if (statuscode == 404) {
      return Serverfailure(' Your Requset Not Found ,Please try again');
    } else if (statuscode == 500) {
      return Serverfailure('Internal Server error ,Please try again');
    } else {
      return Serverfailure('OPPS There is an error, Please Try Again');
    }
  }
}
