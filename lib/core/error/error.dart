import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class Error extends Failure {
  Error({required super.errMessage});
  factory Error.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return Error(
            errMessage: "There was connection error ,please try later");
      case DioExceptionType.sendTimeout:
        return Error(errMessage: "Send time out with aoi service");

      case DioExceptionType.receiveTimeout:
        return Error(errMessage: "Receive time out with aoi service");

      case DioExceptionType.badCertificate:
        return Error(errMessage: "Bad Certificate time out with aoi service");

      case DioExceptionType.badResponse:
        return Error.badResponse(
            statusCode: dioError.response!.statusCode!,
            response: dioError.response!.data);

      case DioExceptionType.cancel:
        return Error(errMessage: "Request to api service was cancel");

      case DioExceptionType.connectionError:
        return Error(
            errMessage: "There was connection error ,please try later");

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return Error(errMessage: 'No internet connection ');
        }
        return Error(errMessage: 'Unexpected error , please try again');

      default:
        return Error(errMessage: 'oops there was an error , please try again');
    }
  }
  factory Error.badResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return Error(errMessage: response.toString());
    } else if (statusCode == 404) {
      return Error(errMessage: 'Your request not found , please try later  ');
    } else if (statusCode == 500) {
      return Error(errMessage: 'Internal server error , please try later  ');
    } else {
      return Error(errMessage: ' oops there was an error , please try again  ');
    }
  }
}
