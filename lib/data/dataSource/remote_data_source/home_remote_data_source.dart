import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryResponseEntity>> getAllBrands();
}
