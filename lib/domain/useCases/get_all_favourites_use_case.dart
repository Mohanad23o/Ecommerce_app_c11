import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/get_all_favourites_response_entity.dart';
import 'package:e_commerce_app_c11/domain/repository/favourites_repository.dart';
import 'package:injectable/injectable.dart';

import '../error.dart';

@injectable
class GetAllFavouritesUseCase {
  FavouritesRepository favouritesRepository;

  GetAllFavouritesUseCase({required this.favouritesRepository});

  Future<Either<Failures, GetAllFavouritesResponseEntity>> getAllFavourites() {
    return favouritesRepository.getAllFavourites();
  }
}
