import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/data/api_manager.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/favourite_remote_data_source.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/utils/shared_preferences_utils.dart';
import '../../../model/add_to_favourite_dto.dart';
import '../../../model/delete_item_in_favourite_response_dto.dart';
import '../../../model/get_all_favourites_response_dto.dart';

@Injectable(as: FavouriteRemoteDataSource)
class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  ApiManager apiManager;

  FavouriteRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddToFavouriteDto>> addToFavourites(
      {required String productId}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager.postData(
            ApiConstants.addToFavouritesApi,
            body: {"productId": productId},
            headers: {'token': token});
        var addToFavouritesCartResponse =
            AddToFavouriteDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToFavouritesCartResponse);
        } else {
          return Left(
              ServerError(errorMessage: addToFavouritesCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetAllFavouritesResponseDto>>
      getAllFavourites() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager.getData(ApiConstants.addToFavouritesApi,
            headers: {'token': token});
        var getAllFavouritesResponse =
            GetAllFavouritesResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllFavouritesResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllFavouritesResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, DeleteItemInFavouriteResponseDto>>
      deleteItemInFavourites({required String productId}) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferencesUtils.loadData('token');
        var response = await apiManager.deleteData(
            '${ApiConstants.addToFavouritesApi}/$productId',
            headers: {'token': token});
        var deleteItemInFavouritesResponse =
            DeleteItemInFavouriteResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteItemInFavouritesResponse);
        } else {
          return Left(ServerError(
              errorMessage: deleteItemInFavouritesResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppConstants.noInternet));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
