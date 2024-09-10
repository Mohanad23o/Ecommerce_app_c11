import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/core/resources/typeDef_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final int cartItemCount;
  final OnSearchBarChanged? onChanged;
  final VoidCallback? onCartPressed;

  const CustomSearchBar({
    super.key,
    required this.cartItemCount,
    this.hintText = 'what do you search for?',
    this.onChanged,
    this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 45.w, left: 16.w),
            child: SearchBar(
              enabled: true,
              side: const WidgetStatePropertyAll(
                BorderSide(width: 0.5, color: ColorManager.primary),
              ),
              elevation: const WidgetStatePropertyAll(0),
              hintText: hintText,
              onChanged: onChanged,
              hintStyle: WidgetStatePropertyAll(
                getLightStyle(
                  fontSize: FontSize.s14,
                  color: const Color(0xff06004F),
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(ColorManager.white),
              leading: Image.asset(IconAssets.icSearch),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: badges.Badge(
            badgeStyle: badges.BadgeStyle(
              badgeColor: ColorManager.primary,
              padding: EdgeInsets.all(5.sp),
            ),
            position: badges.BadgePosition.topEnd(top: -10, end: -5),
            badgeContent: Text('$cartItemCount',
                style: const TextStyle(color: Colors.white)),
            child: IconButton(
              onPressed: onCartPressed,
              icon: const ImageIcon(AssetImage(IconAssets.icCart)),
            ),
          ),
        ),
      ],
    );
  }
}
