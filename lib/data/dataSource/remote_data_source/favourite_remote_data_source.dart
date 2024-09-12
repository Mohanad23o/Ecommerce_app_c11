import 'package:dartz/dartz.dart';

import '../../../domain/entities/add_to_favourite_response_entity.dart';
import '../../../domain/entities/delete_item_in_favourite_response_entity.dart';
import '../../../domain/entities/get_all_favourites_response_entity.dart';
import '../../../domain/error.dart';

abstract class FavouriteRemoteDataSource {
  Future<Either<Failures, AddToFavouriteResponseEntity>> addToFavourites(
      {required String productId});

  Future<Either<Failures, GetAllFavouritesResponseEntity>> getAllFavourites();

  Future<Either<Failures, DeleteItemInFavouriteResponseEntity>>
      deleteItemInFavourites({required String productId});
}
