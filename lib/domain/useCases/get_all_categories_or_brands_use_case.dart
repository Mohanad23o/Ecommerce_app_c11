import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesOrBrandsUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesOrBrandsUseCase(
      {required this.homeRepository}); // constructor injection

  Future<Either<Failures, CategoryResponseEntity>> getAllCategories() {
    return homeRepository.getAllCategories();
  }

  Future<Either<Failures, CategoryResponseEntity>> getAllBrands() {
    return homeRepository.getAllBrands();
  }
}
