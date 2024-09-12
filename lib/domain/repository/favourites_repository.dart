import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/add_to_favourite_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/delete_item_in_favourite_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/get_all_favourites_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

abstract class FavouritesRepository {
  Future<Either<Failures, AddToFavouriteResponseEntity>> addToFavourites(
      {required String productId});

  Future<Either<Failures, GetAllFavouritesResponseEntity>> getAllFavourites();

  Future<Either<Failures, DeleteItemInFavouriteResponseEntity>>
      deleteItemInFavourites({required String productId});
}
