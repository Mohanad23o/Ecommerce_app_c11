import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

import '../../../domain/entities/add_to_cart_response_entity.dart';
abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      {required String productId});
}
