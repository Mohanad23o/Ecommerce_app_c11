import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      {required String productId});

  Future<Either<Failures, GetCartResponseEntity>> deleteAllCartData();
}
