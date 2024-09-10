import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/useCases/get_all_categories_or_brands_use_case.dart';
import 'package:e_commerce_app_c11/features/main_layout/cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeTabState> {
  GetAllCategoriesOrBrandsUseCase getAllCategoriesOrBrandsUseCase;

  HomeScreenViewModel({required this.getAllCategoriesOrBrandsUseCase})
      : super(HomeTabInitialState());
  List<CategoryEntity>? categoryList;
  List<CategoryEntity>? brandsList;

  void getAllCategories() async {
    emit(HomeTabLoadingState());
    var either = await getAllCategoriesOrBrandsUseCase.getAllCategories();
    either.fold((error) {
      emit(HomeTabErrorState(errorMessage: error.errorMessage));
    }, (response) {
      categoryList = response.data;
      emit(HomeTabSuccessState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(HomeTabLoadingState());
    var either = await getAllCategoriesOrBrandsUseCase.getAllBrands();
    either.fold((error) {
      emit(HomeTabErrorState(errorMessage: error.errorMessage));
    }, (response) {
      brandsList = response.data;
      emit(HomeTabSuccessState(categoryResponseEntity: response));
    });
  }
}
