import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_state.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/widget/custom_bottom_app_bar.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/widget/custom_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/font_manager.dart';

class CartProductsScreen extends StatelessWidget {
  CartProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductsScreenViewModel, CartState>(
        bloc: CartProductsScreenViewModel.get(context)..getCart(),
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: state is GetCartSuccessState
                  ? CustomBottomAppBar(
                      totalPrice: state
                              .getCartResponseEntity.data?.totalCartPrice
                              .toString() ??
                          '',
                    )
                  : Skeletonizer(
                      enabled: true,
                      child: CustomBottomAppBar(totalPrice: '0')),
              backgroundColor: ColorManager.white,
              appBar: AppBar(
                backgroundColor: ColorManager.white,
                elevation: 0,
                leading: BackButton(
                  color: ColorManager.primaryDark,
                ),
                centerTitle: true,
                title: Text(
                  'Cart',
                  style: getMediumStyle(
                      color: ColorManager.primaryDark,
                      fontSize: FontSize.s20.sp),
                ),
                actions: [
                  ImageIcon(
                    AssetImage(IconAssets.icSearch),
                    color: ColorManager.primary,
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: ImageIcon(
                      AssetImage(IconAssets.icCart),
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              body: state is GetCartSuccessState
                  ? ListView.builder(
                      itemCount:
                          state.getCartResponseEntity.data?.products?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return CustomProductView(
                          productsEntity: state
                              .getCartResponseEntity.data!.products![index],
                          numOfItem: state.getCartResponseEntity.data
                                  ?.products?[index].count
                                  ?.toInt() ??
                              0,
                        );
                      })
                  : Skeletonizer(
                      enabled: true,
                      child: CustomProductView(
                        numOfItem: 0,
                        productsEntity: GetCartProductsEntity(),
                      ),
                    ));
        });
  }
}
/*
if (state is GetCartLoadingState) {
                return Skeletonizer(
                  enabled: true,
                  child: CustomProductView(
                      title: 'title', imageUrl: "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg", price: '200'),
                );
              } else if (state is GetCartErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is GetCartSuccessState) {
                return ListView.builder(
                  itemCount: state.getCartResponseEntity.data?.products?.length?? 0,
                    itemBuilder: (context, index) {
                  return CustomProductView(
                      title: state.getCartResponseEntity.data?.products?[index]
                              .product?.title ??
                          '',
                      imageUrl: state.getCartResponseEntity.data
                              ?.products?[index].product?.imageCover ??
                          '',
                      price:
                          '${state.getCartResponseEntity.data?.products?[index].price ?? ''}');
                });
              } else {
                return Container();
              }
 */
