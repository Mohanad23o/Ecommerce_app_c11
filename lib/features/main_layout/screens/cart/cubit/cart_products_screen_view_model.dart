import 'package:e_commerce_app_c11/domain/useCases/delete_item_in_cart_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_cart_use_case.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartProductsScreenViewModel extends Cubit<CartState> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  CartProductsScreenViewModel(
      {required this.getCartUseCase, required this.deleteItemInCartUseCase})
      : super(GetCartInitialState());

  static CartProductsScreenViewModel get(context) =>
      BlocProvider.of<CartProductsScreenViewModel>(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.getCart();
    either.fold((l) {
      emit(GetCartErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }

  void deleteItemInCart({required String productId}) async {
    emit(GetCartLoadingState());
    var either =
        await deleteItemInCartUseCase.deleteItemInCart(productId: productId);
    either.fold((l) {
      emit(GetCartErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }
}
