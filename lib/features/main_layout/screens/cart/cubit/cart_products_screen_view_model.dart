import 'package:e_commerce_app_c11/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce_app_c11/domain/useCases/delete_all_item_data_in_cart_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/delete_item_in_cart_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_cart_use_case.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartProductsScreenViewModel extends Cubit<CartState> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  DeleteAllItemDataInCartUseCase deleteAllItemDataInCartUseCase;
  List<GetCartProductsEntity>? productsList;
  int? numOfItems;

  CartProductsScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.deleteAllItemDataInCartUseCase})
      : super(GetCartInitialState());

  static CartProductsScreenViewModel get(context) =>
      BlocProvider.of<CartProductsScreenViewModel>(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.getCart();
    either.fold((l) {
      emit(GetCartErrorState(errorMessage: l.errorMessage));
    }, (r) {
      numOfItems = r.numOfCartItems?.toInt();
      productsList = r.data?.products;
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }

  void deleteItemInCart({required String productId}) async {
    emit(DeleteCartLoadingState());
    var either =
        await deleteItemInCartUseCase.deleteItemInCart(productId: productId);
    either.fold(
        (error) => emit(DeleteCartErrorState(errorMessage: error.errorMessage)),
        (response) {
      // productList = response.data!.products ?? [];
      print('item in cart : ${response.numOfCartItems}');
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }
}
