import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/core/resources/utils/shared_preferences_utils.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/app_constants.dart';
import '../../../../domain/error.dart';
import '../../../api_manager.dart';
import '../../../model/get_cart_response_dto.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager
            .getData(ApiConstants.addToCartApi, headers: {'token': token});
        var getCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMessage: getCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      {required String productId}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager.deleteData(
            '${ApiConstants.addToCartApi}/$productId',
            headers: {'token': token.toString()});
        var deleteCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(errorMessage: deleteCartResponse.message!));
        } else {
          return Left(ServerError(errorMessage: deleteCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteCartData() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager.deleteData(ApiConstants.addToCartApi, headers: {'token': token});
        var deleteAllCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteAllCartResponse);
        } else {
          return Left(
              ServerError(errorMessage: deleteAllCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
