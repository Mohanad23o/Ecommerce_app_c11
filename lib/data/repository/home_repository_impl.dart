import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce_app_c11/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      {required String productId}) async {
    var either = await homeRemoteDataSource.addToCart(productId: productId);
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
