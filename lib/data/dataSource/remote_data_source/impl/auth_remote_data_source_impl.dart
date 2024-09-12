import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:e_commerce_app_c11/data/api_manager.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app_c11/data/model/login_response_dto.dart';
import 'package:e_commerce_app_c11/data/model/register_response_dto.dart';
import 'package:e_commerce_app_c11/di/di.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failures, RegisterResponseDto>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String rePassword}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(ApiConstants.signUpApi, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(
      {required String email, required String password}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(ApiConstants.signInApi, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
