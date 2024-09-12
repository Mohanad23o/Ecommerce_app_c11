// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager.dart' as _i704;
import '../data/dataSource/remote_data_source/auth_remote_data_source.dart'
    as _i929;
import '../data/dataSource/remote_data_source/cart_remote_data_source.dart'
    as _i202;
import '../data/dataSource/remote_data_source/favourite_remote_data_source.dart'
    as _i850;
import '../data/dataSource/remote_data_source/home_remote_data_source.dart'
    as _i144;
import '../data/dataSource/remote_data_source/impl/auth_remote_data_source_impl.dart'
    as _i159;
import '../data/dataSource/remote_data_source/impl/cart_remote_data_source_impl.dart'
    as _i177;
import '../data/dataSource/remote_data_source/impl/favourite_remote_data_source_impl.dart'
    as _i163;
import '../data/dataSource/remote_data_source/impl/home_remote_data_source_impl.dart'
    as _i332;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/cart_repository_impl.dart' as _i47;
import '../data/repository/favourite_repository_impl.dart' as _i977;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/cart_repository.dart' as _i130;
import '../domain/repository/favourites_repository.dart' as _i720;
import '../domain/repository/home_repository.dart' as _i250;
import '../domain/useCases/add_to_cart_use_case.dart' as _i20;
import '../domain/useCases/add_to_favourites_use_case.dart' as _i623;
import '../domain/useCases/delete_all_item_data_in_cart_use_case.dart' as _i998;
import '../domain/useCases/delete_item_in_cart_use_case.dart' as _i438;
import '../domain/useCases/delete_item_in_favourite_use_case.dart' as _i205;
import '../domain/useCases/get_all_categories_or_brands_use_case.dart' as _i317;
import '../domain/useCases/get_all_favourites_use_case.dart' as _i151;
import '../domain/useCases/get_all_products_use_case.dart' as _i794;
import '../domain/useCases/get_cart_use_case.dart' as _i220;
import '../domain/useCases/login_use_case.dart' as _i793;
import '../domain/useCases/register_use_case.dart' as _i74;
import '../features/auth/login/cubit/login_screen_view_model.dart' as _i434;
import '../features/auth/register/cubit/register_screen_view_model.dart'
    as _i875;
import '../features/main_layout/cubit/home_screen_view_model.dart' as _i72;
import '../features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart'
    as _i322;
import '../features/main_layout/tabs/category/cubit/products_screen_view_model.dart'
    as _i576;
import '../features/main_layout/tabs/favourite/cubit/favourites_tab_view_model.dart'
    as _i465;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i704.ApiManager>(() => _i704.ApiManager());
    gh.factory<_i929.AuthRemoteDataSource>(
        () => _i159.AuthRemoteDataSourceImpl());
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i929.AuthRemoteDataSource>()));
    gh.factory<_i144.HomeRemoteDataSource>(() =>
        _i332.HomeRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i250.HomeRepository>(() => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i144.HomeRemoteDataSource>()));
    gh.factory<_i850.FavouriteRemoteDataSource>(() =>
        _i163.FavouriteRemoteDataSourceImpl(
            apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i202.CartRemoteDataSource>(() =>
        _i177.CartRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i793.LoginUseCase>(
        () => _i793.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i74.RegisterUseCase>(
        () => _i74.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i434.LoginScreenViewModel>(() =>
        _i434.LoginScreenViewModel(loginUseCase: gh<_i793.LoginUseCase>()));
    gh.factory<_i875.RegisterScreenViewModel>(() =>
        _i875.RegisterScreenViewModel(
            registerUseCase: gh<_i74.RegisterUseCase>()));
    gh.factory<_i720.FavouritesRepository>(() => _i977.FavouriteRepositoryImpl(
        favouriteRemoteDataSource: gh<_i850.FavouriteRemoteDataSource>()));
    gh.factory<_i20.AddToCartUseCase>(() =>
        _i20.AddToCartUseCase(homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i317.GetAllCategoriesOrBrandsUseCase>(() =>
        _i317.GetAllCategoriesOrBrandsUseCase(
            homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i794.GetAllProductsUseCase>(() => _i794.GetAllProductsUseCase(
        homeRepository: gh<_i250.HomeRepository>()));
    gh.factory<_i130.CartRepository>(() => _i47.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i202.CartRemoteDataSource>()));
    gh.factory<_i72.HomeScreenViewModel>(() => _i72.HomeScreenViewModel(
        getAllCategoriesOrBrandsUseCase:
            gh<_i317.GetAllCategoriesOrBrandsUseCase>()));
    gh.factory<_i623.AddToFavouritesUseCase>(() => _i623.AddToFavouritesUseCase(
        favouritesRepository: gh<_i720.FavouritesRepository>()));
    gh.factory<_i151.GetAllFavouritesUseCase>(() =>
        _i151.GetAllFavouritesUseCase(
            favouritesRepository: gh<_i720.FavouritesRepository>()));
    gh.factory<_i205.DeleteItemInFavouriteUseCase>(() =>
        _i205.DeleteItemInFavouriteUseCase(
            favouritesRepository: gh<_i720.FavouritesRepository>()));
    gh.factory<_i576.ProductsScreenViewModel>(
        () => _i576.ProductsScreenViewModel(
              getAllProductsUseCase: gh<_i794.GetAllProductsUseCase>(),
              addToCartUseCase: gh<_i20.AddToCartUseCase>(),
            ));
    gh.factory<_i220.GetCartUseCase>(
        () => _i220.GetCartUseCase(cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i438.DeleteItemInCartUseCase>(() =>
        _i438.DeleteItemInCartUseCase(
            cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i998.DeleteAllItemDataInCartUseCase>(() =>
        _i998.DeleteAllItemDataInCartUseCase(
            cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i322.CartProductsScreenViewModel>(
        () => _i322.CartProductsScreenViewModel(
              getCartUseCase: gh<_i220.GetCartUseCase>(),
              deleteItemInCartUseCase: gh<_i438.DeleteItemInCartUseCase>(),
              deleteAllItemDataInCartUseCase:
                  gh<_i998.DeleteAllItemDataInCartUseCase>(),
            ));
    gh.factory<_i465.FavouritesTabViewModel>(() => _i465.FavouritesTabViewModel(
          addToFavouritesUseCase: gh<_i623.AddToFavouritesUseCase>(),
          deleteItemInFavouriteUseCase:
              gh<_i205.DeleteItemInFavouriteUseCase>(),
          getAllFavouritesUseCase: gh<_i151.GetAllFavouritesUseCase>(),
        ));
    return this;
  }
}
