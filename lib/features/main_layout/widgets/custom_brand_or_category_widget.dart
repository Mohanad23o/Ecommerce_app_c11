import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandOrCategoryWidget extends StatelessWidget {
  String imagePath;
  String title;

  CustomBrandOrCategoryWidget(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imagePath,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          title,
          style: getRegularStyle(color: ColorManager.primaryDark),
        ),
      ],
    );
  }
}
