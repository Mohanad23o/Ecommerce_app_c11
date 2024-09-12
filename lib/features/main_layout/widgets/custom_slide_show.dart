import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/typeDef_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSlideShow extends StatelessWidget {
  List<Widget> slideShows = [
    Image.asset(
      ImageAssets.slideShowImage1,
      fit: BoxFit.cover,
    ),
    Image.asset(
      ImageAssets.slideShowImage2,
      fit: BoxFit.cover,
    ),
    Image.asset(
      ImageAssets.slideShowImage3,
      fit: BoxFit.cover,
    ),
  ];
  OnSlideShowImageChanged onPageChanged;

  CustomSlideShow({super.key, this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        indicatorColor: ColorManager.primary,
        autoPlayInterval: 3000,
        onPageChanged: onPageChanged,
        indicatorPadding: 6.w,
        indicatorRadius: 4,
        initialPage: 0,
        isLoop: true,
        children: slideShows);
  }
}
