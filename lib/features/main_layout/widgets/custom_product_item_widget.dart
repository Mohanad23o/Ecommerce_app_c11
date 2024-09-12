import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/products_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/favourite/cubit/favourites_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/image_assets.dart';

class CustomProductItemWidget extends StatelessWidget {
  ProductEntity productEntity;

  CustomProductItemWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.transparent,
        border: Border.all(color: const Color(0xff004182), width: 0.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: productEntity.imageCover ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: InkWell(
                  onTap: () {
                    FavouritesTabViewModel.get(context)
                        .addToFavourites(productId: productEntity.id ?? '');
                  },
                  child: Container(
                    padding: EdgeInsets.all(3.sp),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.all(Radius.circular(100.r))),
                    child: ImageIcon(
                      const AssetImage(
                        IconAssets.icFavourite,
                      ),
                      size: 30.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.title ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  productEntity.description ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'EGP ${productEntity.price}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Review (${productEntity.ratingsAverage})',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 14.sp,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Icon(
                          Icons.add,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        ProductsScreenViewModel.get(context)
                            .addToCart(productId: productEntity.id ?? '');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
