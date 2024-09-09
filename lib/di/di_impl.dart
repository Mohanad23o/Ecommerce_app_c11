import 'package:e_commerce_app_c11/data/api_manager.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/impl/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/impl/home_remote_data_source_impl.dart';
import 'package:e_commerce_app_c11/data/repository/auth_repository_impl.dart';
import 'package:e_commerce_app_c11/data/repository/home_repository_impl.dart';
import 'package:e_commerce_app_c11/domain/repository/auth_repository.dart';
import 'package:e_commerce_app_c11/domain/repository/home_repository.dart';
import 'package:e_commerce_app_c11/domain/useCases/add_to_cart_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_all_categories_or_brands_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_all_products_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/login_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/register_use_case.dart';
import 'package:e_commerce_app_c11/features/main_layout/cubit/home_screen_view_model.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl();
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

ApiManager injectApiManager() {
  return ApiManager.getInstance();
}

HomeRepository injectHomeRepository() {
  return HomeRepositoryImpl(homeRemoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: injectApiManager());
}

HomeScreenViewModel injectHomeTabViewModel() {
  return HomeScreenViewModel(
      getAllCategoriesOrBrandsUseCase: injectGetAllCategoriesUseCase());
}

GetAllCategoriesOrBrandsUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesOrBrandsUseCase(
      homeRepository: injectHomeRepository());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(homeRepository: injectHomeRepository());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(homeRepository: injectHomeRepository());
}