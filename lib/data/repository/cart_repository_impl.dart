import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/get_cart_response_entity.dart';
import '../../domain/error.dart';
import '../../domain/repository/cart_repository.dart';
import '../dataSource/remote_data_source/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      {required String productId}) {
    return cartRemoteDataSource.deleteItemInCart(productId: productId);
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteAllCartData() {
    return cartRemoteDataSource.deleteCartData();
  }
}
