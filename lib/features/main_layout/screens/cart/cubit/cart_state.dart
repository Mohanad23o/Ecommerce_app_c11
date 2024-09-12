import 'package:e_commerce_app_c11/domain/entities/get_cart_response_entity.dart';

abstract class CartState {}

class GetCartInitialState extends CartState {}

class GetCartLoadingState extends CartState {}

class GetCartErrorState extends CartState {
  String errorMessage;

  GetCartErrorState({required this.errorMessage});
}

class GetCartSuccessState extends CartState {
  GetCartResponseEntity getCartResponseEntity;

  GetCartSuccessState({required this.getCartResponseEntity});
}

class DeleteCartLoadingState extends CartState {}

class DeleteCartErrorState extends CartState {
  String errorMessage;

  DeleteCartErrorState({required this.errorMessage});
}

class DeleteCartSuccessState extends CartState {
  GetCartResponseEntity getCartResponseEntity;

  DeleteCartSuccessState({required this.getCartResponseEntity});
}
