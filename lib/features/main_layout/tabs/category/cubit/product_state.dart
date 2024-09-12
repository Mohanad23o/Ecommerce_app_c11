import 'package:e_commerce_app_c11/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductInitialState extends ProductState {}

class ProductErrorState extends ProductState {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductState {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductState {}

class AddToCartInitialState extends ProductState {}

class AddToCartErrorState extends ProductState {
  String errorMessage;

  AddToCartErrorState({required this.errorMessage});
}

class AddToCartSuccessState extends ProductState {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}


