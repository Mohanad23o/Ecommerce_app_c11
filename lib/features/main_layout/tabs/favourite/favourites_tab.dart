import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/widgets/dialog_utils.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/favourite/cubit/favourite_tab_state.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/favourite/cubit/favourites_tab_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_favourite_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: FavouritesTabViewModel.get(context)..getAllFavourites(),
      listener: (context, state) {
        if (state is GetAllFavouriteTabErrorState) {
          return DialogUtils.showMassage(
              context: context, content: state.errorMessage);
        }
      },
      child: BlocBuilder<FavouritesTabViewModel, FavouriteTabState>(
        bloc: FavouritesTabViewModel.get(context)..getAllFavourites(),
        builder: (context, state) {
          if (state is GetAllFavouriteTabLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryDark,
              ),
            );
          } else if (state is GetAllFavouriteTabErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is GetAllFavouriteTabSuccessState) {
            return ListView.builder(
                itemCount:
                    state.getAllFavouritesResponseEntity.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return CustomFavouriteListView(
                      product:
                          state.getAllFavouritesResponseEntity.data![index]);
                });
          }
          return Container();
        },
      ),
    );
  }
}
