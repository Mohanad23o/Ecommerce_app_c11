import 'package:dartz/dartz.dart';

import '../../../domain/entities/get_cart_response_entity.dart';
import '../../../domain/error.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      {required String productId});

  Future<Either<Failures, GetCartResponseEntity>> deleteCartData();
}
