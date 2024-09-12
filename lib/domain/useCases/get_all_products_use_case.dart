import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepository homeRepository;

  GetAllProductsUseCase(
      {required this.homeRepository}); // constructor injection

  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return homeRepository.getAllProducts();
  }
}
