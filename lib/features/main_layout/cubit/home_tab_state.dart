import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';

abstract class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class HomeTabLoadingState extends HomeTabState {}

class HomeTabSuccessState extends HomeTabState {
  CategoryResponseEntity categoryResponseEntity;

  HomeTabSuccessState({required this.categoryResponseEntity});
}

class HomeTabErrorState extends HomeTabState {
  String errorMessage;

  HomeTabErrorState({required this.errorMessage});
}
