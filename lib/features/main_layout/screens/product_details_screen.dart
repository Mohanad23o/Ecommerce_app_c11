import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../core/resources/font_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductEntity product;

  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(
              color: ColorManager.primaryDark, fontSize: FontSize.s20.sp),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: ColorManager.primary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,
                color: ColorManager.primary),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 300.h,
                width: 398.w,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff004182)),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: CachedNetworkImage(
                          imageUrl: widget.product.imageCover!,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              // Product Name and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReadMoreText(
                      widget.product.title!,
                      colorClickableText: ColorManager.primaryDark,
                      style: getMediumStyle(
                          color: ColorManager.primaryDark,
                          fontSize: FontSize.s18.sp),
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      moreStyle: getRegularStyle(
                          color: ColorManager.primaryDark,
                          fontSize: FontSize.s14.sp),
                      lessStyle: getRegularStyle(
                          color: ColorManager.primaryDark,
                          fontSize: FontSize.s14.sp),
                    ),
                  ),
                  Text(
                    'EGP ${widget.product.price}',
                    style: getMediumStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s18.sp),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              // Sold and Review
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xff004182), width: .5),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      '${widget.product.sold} Sold',
                      style: getMediumStyle(
                          color: ColorManager.primaryDark,
                          fontSize: FontSize.s14.sp),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '${widget.product.ratingsAverage} (${widget.product.ratingsQuantity})',
                        style: getRegularStyle(
                            color: ColorManager.primaryDark,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Description',
                    style: getMediumStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s18.sp),
                  ),
                  Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline,
                              color: Colors.white),
                          onPressed: () {
                            count != 0 ? count-- : count = 1;
                            setState(() {});
                          },
                        ),
                        Text(
                          '$count',
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline,
                              color: Colors.white),
                          onPressed: () {
                            count++;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              ReadMoreText(
                widget.product.description!,
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: ColorManager.primaryDark,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                style: getRegularStyle(
                    color: Colors.grey, fontSize: FontSize.s14.sp),
                moreStyle: getRegularStyle(
                    color: ColorManager.primaryDark, fontSize: FontSize.s14.sp),
                lessStyle: getRegularStyle(
                    color: ColorManager.primaryDark, fontSize: FontSize.s14.sp),
              ),
              SizedBox(height: 8.h),
              SizedBox(height: 16.h),
              // Size Selector
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: ColorManager.primary),
                      color: index == 2 ? ColorManager.primary : Colors.white,
                    ),
                    child: Text(
                      '${38 + index}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: index == 2 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Color Selector
              Text(
                'Color',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: [
                        Colors.brown,
                        Colors.black,
                        Colors.blue,
                        Colors.green,
                        Colors.red
                      ][index],
                      border: Border.all(color: Colors.white, width: 2.w),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: getMediumStyle(
                            color: Colors.grey, fontSize: FontSize.s18.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'EGP ${widget.product.price}',
                        style: getMediumStyle(
                            color: ColorManager.primaryDark,
                            fontSize: FontSize.s18.sp),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ProductsScreenViewModel.get(context)
                          .addToCart(productId: widget.product.id ?? '');
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white70,
                    ),
                    label: Text(
                      'Add to cart',
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: FontSize.s20.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.sp),
                      backgroundColor: ColorManager.primary,
                      // minimumSize: Size(double.infinity, 48.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Add to Cart Button
            ],
          ),
        ),
      ),
    );
  }
}
