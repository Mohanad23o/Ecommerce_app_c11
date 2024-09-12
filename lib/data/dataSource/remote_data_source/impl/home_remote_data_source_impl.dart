import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/core/resources/utils/shared_preferences_utils.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/app_constants.dart';
import '../../../../domain/error.dart';
import '../../../api_manager.dart';
import '../../../model/add_to_cart_response_dto.dart';
import '../../../model/category_response_dto.dart';
import '../../../model/product_response_dto.dart';
import '../home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
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
  Future<Either<Failures, CategoryResponseDto>> getAllBrands() async {
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

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(ApiConstants.productsApi);
        var productResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      {required String productId}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager.postData(ApiConstants.addToCartApi,
            body: {'productId': productId},
            headers: {'token': token.toString()});
        var productResponse = AddToCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
