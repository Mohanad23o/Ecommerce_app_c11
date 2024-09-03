import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:e_commerce_app_c11/data/api_manager.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce_app_c11/data/model/category_response_dto.dart';
import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseDto>> getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(ApiConstants.categoriesApi);
        var categoryResponse = CategoryResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(ApiConstants.brandsApi);
        var brandsResponse = CategoryResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandsResponse);
        } else {
          return Left(ServerError(errorMessage: brandsResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
