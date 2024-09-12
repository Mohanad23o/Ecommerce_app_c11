import 'package:e_commerce_app_c11/domain/entities/add_to_favourite_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/delete_item_in_favourite_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/get_all_favourites_response_entity.dart';

abstract class FavouriteTabState {}

class AddToFavouriteTabLoadingState extends FavouriteTabState {}

class GetAllFavouriteTabLoadingState extends FavouriteTabState {}

class DeleteItemInFavouriteTabLoadingState extends FavouriteTabState {}

class AddToFavouriteTabInitialState extends FavouriteTabState {}

class AddToFavouriteTabSuccessState extends FavouriteTabState {
  AddToFavouriteResponseEntity addToFavouriteEntity;

  AddToFavouriteTabSuccessState({required this.addToFavouriteEntity});
}

class AddToFavouriteTabErrorState extends FavouriteTabState {
  String errorMessage;

  AddToFavouriteTabErrorState({required this.errorMessage});
}

class GetAllFavouriteTabSuccessState extends FavouriteTabState {
  GetAllFavouritesResponseEntity getAllFavouritesResponseEntity;

  GetAllFavouriteTabSuccessState(
      {required this.getAllFavouritesResponseEntity});
}

class GetAllFavouriteTabErrorState extends FavouriteTabState {
  String errorMessage;

  GetAllFavouriteTabErrorState({required this.errorMessage});
}

class DeleteItemInFavouriteTabSuccessState extends FavouriteTabState {
  DeleteItemInFavouriteResponseEntity deleteItemInFavouriteResponseEntity;

  DeleteItemInFavouriteTabSuccessState(
      {required this.deleteItemInFavouriteResponseEntity});
}

class DeleteItemInFavouriteTabErrorState extends FavouriteTabState {
  String errorMessage;

  DeleteItemInFavouriteTabErrorState({required this.errorMessage});
}
