import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/repository/favourites_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/delete_item_in_favourite_response_entity.dart';
import '../error.dart';

@injectable
class DeleteItemInFavouriteUseCase {
  FavouritesRepository favouritesRepository;

  DeleteItemInFavouriteUseCase({required this.favouritesRepository});

  Future<Either<Failures, DeleteItemInFavouriteResponseEntity>>
      deleteItemInFavourites({required String productId}) {
    return favouritesRepository.deleteItemInFavourites(productId: productId);
  }
}
