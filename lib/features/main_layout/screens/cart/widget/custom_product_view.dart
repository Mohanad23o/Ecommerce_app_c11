import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/font_manager.dart';

class CustomProductView extends StatelessWidget {
  int numOfItem;
  GetCartProductsEntity productsEntity;

  CustomProductView({required this.numOfItem, required this.productsEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: Colors.grey, width: .5.w)),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
            ),
            width: 120.w,
            height: 113.h,
            child: CachedNetworkImage(
              imageUrl: productsEntity.product?.imageCover ?? '',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsEntity.product?.title ?? '',
                  style: getMediumStyle(
                      color: ColorManager.primaryDark,
                      fontSize: FontSize.s18.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                Text(
                  'EGP ${productsEntity.price}',
                  style: getMediumStyle(
                      color: ColorManager.primaryDark,
                      fontSize: FontSize.s18.sp),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(30.r)),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline,
                      color: Colors.white),
                  onPressed: () {},
                ),
                Text(
                  '$numOfItem',
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: FontSize.s18.sp),
                ),
                IconButton(
                  icon:
                      const Icon(Icons.add_circle_outline, color: Colors.white),
                  onPressed: () {
                    numOfItem++;
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              CartProductsScreenViewModel.get(context)
                ..deleteItemInCart(productId: productsEntity.id ?? '');
            },
            icon: Icon(Icons.delete_rounded),
          ),
        ],
      ),
    );
  }
}
