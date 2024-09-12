import 'package:e_commerce_app_c11/domain/useCases/add_to_favourites_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/delete_item_in_favourite_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_all_favourites_use_case.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/favourite/cubit/favourite_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavouritesTabViewModel extends Cubit<FavouriteTabState> {
  AddToFavouritesUseCase addToFavouritesUseCase;
  GetAllFavouritesUseCase getAllFavouritesUseCase;
  DeleteItemInFavouriteUseCase deleteItemInFavouriteUseCase;

  FavouritesTabViewModel(
      {required this.addToFavouritesUseCase,
      required this.deleteItemInFavouriteUseCase,
      required this.getAllFavouritesUseCase})
      : super(AddToFavouriteTabInitialState());

  static FavouritesTabViewModel get(context) =>
      BlocProvider.of<FavouritesTabViewModel>(context);

  void addToFavourites({required String productId}) async {
    emit(AddToFavouriteTabLoadingState());
    var response =
        await addToFavouritesUseCase.addToFavourites(productId: productId);
    response.fold((l) {
      emit(AddToFavouriteTabErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(AddToFavouriteTabSuccessState(addToFavouriteEntity: r));
    });
  }

  void getAllFavourites() async {
    emit(GetAllFavouriteTabLoadingState());
    var response = await getAllFavouritesUseCase.getAllFavourites();
    response.fold((l) {
      emit(GetAllFavouriteTabErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(GetAllFavouriteTabSuccessState(getAllFavouritesResponseEntity: r));
    });
  }

  void deleteItemInFavourites({required String productId}) async {
    emit(GetAllFavouriteTabLoadingState());
    var response = await deleteItemInFavouriteUseCase.deleteItemInFavourites(
        productId: productId);
    response.fold((l) {
      emit(GetAllFavouriteTabErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(DeleteItemInFavouriteTabSuccessState(
          deleteItemInFavouriteResponseEntity: r));
    });
  }
}
