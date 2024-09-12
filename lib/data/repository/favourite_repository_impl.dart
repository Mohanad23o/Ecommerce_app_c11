import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/favourite_remote_data_source.dart';
import 'package:e_commerce_app_c11/domain/entities/add_to_favourite_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/delete_item_in_favourite_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/get_all_favourites_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/favourites_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavouritesRepository)
class FavouriteRepositoryImpl implements FavouritesRepository {
  FavouriteRemoteDataSource favouriteRemoteDataSource;

  FavouriteRepositoryImpl({required this.favouriteRemoteDataSource});

  @override
  Future<Either<Failures, AddToFavouriteResponseEntity>> addToFavourites(
      {required String productId}) async {
    var either =
        await favouriteRemoteDataSource.addToFavourites(productId: productId);
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, GetAllFavouritesResponseEntity>>
      getAllFavourites() async {
    var either = await favouriteRemoteDataSource.getAllFavourites();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, DeleteItemInFavouriteResponseEntity>>
      deleteItemInFavourites({required String productId}) async {
    var either = await favouriteRemoteDataSource.deleteItemInFavourites(
        productId: productId);
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
