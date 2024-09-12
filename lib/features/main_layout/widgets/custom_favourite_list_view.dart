import 'package:e_commerce_app_c11/features/main_layout/tabs/favourite/cubit/favourites_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/image_assets.dart';
import '../../../core/resources/style_manager.dart';
import '../../../domain/entities/get_all_favourites_response_entity.dart';

class CustomFavouriteListView extends StatelessWidget {
  GetAllFavouritesDataResponseEntity product;

  CustomFavouriteListView({required this.product});

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
              product.imageCover ?? '',
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
                Text(product.title ?? '',
                    style: getMediumStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s18.sp)),
                SizedBox(height: 4.h),
                Text('EGP ${product.price}',
                    style: getMediumStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s18.sp)),
              ],
            ),
          ),
          SizedBox(width: 3.w),
          InkWell(
              onTap: () {
                //todo: delete item from fav
                FavouritesTabViewModel.get(context)
                    .deleteItemInFavourites(productId: product.id ?? '');
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
