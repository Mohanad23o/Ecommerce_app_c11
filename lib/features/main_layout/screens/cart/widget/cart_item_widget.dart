import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  String url;
  String title;
  String price;
  String itemCount;
  String id;

  CartItemWidget(
      {required this.url,
      required this.title,
      required this.price,
      required this.itemCount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              url,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: getMediumStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s18.sp)),
                SizedBox(height: 4.h),
                Text('EGP $price',
                    style: getMediumStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s18.sp)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: ColorManager.white,
                  ),
                  onPressed: () {},
                ),
                Text('$itemCount',
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: FontSize.s18.sp)),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: ColorManager.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(width: 3.w),
          InkWell(
              onTap: () {
                CartProductsScreenViewModel.get(context)
                    .deleteItemInCart(productId: id);
              },
              child: const ImageIcon(
                AssetImage(
                  IconAssets.icDelete,
                ),
                color: ColorManager.primaryDark,
              )),
        ],
      ),
    );
  }
}
