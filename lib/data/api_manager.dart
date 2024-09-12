import 'package:dio/dio.dart';
import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return dio.get(ApiConstants.baseUrl + endPoint,
        options: Options(validateStatus: ((status) => true), headers: headers),
        queryParameters: queryParameters);
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) {
    return dio.post(ApiConstants.baseUrl + endPoint,
        options: Options(headers: headers, validateStatus: ((status) => true)),
        data: body,
        queryParameters: queryParameters);
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) {
    return dio.delete(ApiConstants.baseUrl + endPoint,
        options: Options(headers: headers, validateStatus: ((status) => true)),
        data: body,
        queryParameters: queryParameters);
  }
}
