import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository}); // constructor injection

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      {required String productId}) {
    return homeRepository.addToCart(productId: productId);
  }
}
