import 'package:e_commerce_app_c11/di/di.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/domain/useCases/add_to_cart_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_all_products_use_case.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsScreenViewModel extends Cubit<ProductState> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  List<ProductEntity>? productList;
  int numOfCartItems = 0;

  ProductsScreenViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  static ProductsScreenViewModel get(context) =>
      getIt<ProductsScreenViewModel>();

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.getAllProducts();
    either.fold((error) {
      emit(ProductErrorState(errorMessage: error.errorMessage));
    }, (response) {
      productList = response.data;
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart({required String productId}) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.addToCart(productId: productId);
    either.fold((error) {
      emit(AddToCartErrorState(errorMessage: error.errorMessage));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
      print('numOfCartItems : $numOfCartItems');
    });
  }
}
