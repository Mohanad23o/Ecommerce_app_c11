import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_state.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/widget/cart_item_widget.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/widget/custom_bottom_app_bar.dart';
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
                leading: const BackButton(
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
                  const ImageIcon(
                    AssetImage(IconAssets.icSearch),
                    color: ColorManager.primary,
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: const ImageIcon(
                      AssetImage(IconAssets.icCart),
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  state is GetCartSuccessState
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: state.getCartResponseEntity.data
                                      ?.products?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                final products =
                                    state.getCartResponseEntity.data?.products;
                                return Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: CartItemWidget(
                                    title:
                                        products?[index].product?.title ?? '',
                                    id: products?[index].product?.id ?? '',
                                    url: products?[index].product?.imageCover ??
                                        '',
                                    itemCount:
                                        products?[index].count.toString() ?? '',
                                    price:
                                        products?[index].price.toString() ?? '',
                                  ),
                                );
                              }),
                        )
                      : const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.primaryDark,
                            ),
                          ),
                        ),
                ],
              ));
        });
  }
}
//ListView.builder(
//                       itemCount:
//                           state.getCartResponseEntity.data?.products?.length ??
//                               0,
//                       itemBuilder: (context, index) {
//                         return CustomProductView(
//                           productsEntity: state
//                               .getCartResponseEntity.data!.products![index],
//                           numOfItem: state.getCartResponseEntity.data
//                                   ?.products?[index].count
//                                   ?.toInt() ??
//                               0,
//                         );
//                       })
