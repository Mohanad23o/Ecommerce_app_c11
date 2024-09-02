import 'package:dio/dio.dart';
import 'package:e_commerce_app_c11/core/resources/app_constants.dart';

class ApiManager {
  static ApiManager? _instance;
  Dio dio = Dio();

  ApiManager._();

  static ApiManager getInstance() {
    if (ApiManager._instance == null) {
      _instance = ApiManager._();
      return _instance!;
    }
    return _instance!;
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(ApiConstants.baseUrl + endPoint,
        options: Options(validateStatus: ((status) => true)),
        queryParameters: queryParameters);
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    return dio.post(ApiConstants.baseUrl + endPoint,
        options: Options(validateStatus: ((status) => true)),
        data: body,
        queryParameters: queryParameters);
  }
}
