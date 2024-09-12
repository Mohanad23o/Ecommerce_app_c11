import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/repository/favourites_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/add_to_favourite_response_entity.dart';
import '../error.dart';

@injectable
class AddToFavouritesUseCase {
  FavouritesRepository favouritesRepository;

  AddToFavouritesUseCase({required this.favouritesRepository});

  Future<Either<Failures, AddToFavouriteResponseEntity>> addToFavourites(
      {required String productId}) {
    return favouritesRepository.addToFavourites(productId: productId);
  }
}
