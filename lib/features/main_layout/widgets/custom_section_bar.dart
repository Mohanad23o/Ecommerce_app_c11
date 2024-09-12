import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionBar extends StatelessWidget {
  String sectionName;
  VoidCallback? onViewAllTap;

  CustomSectionBar({super.key, required this.sectionName, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: getMediumStyle(
                    color: ColorManager.primaryDark, fontSize: FontSize.s18),
              ),
              InkWell(
                  onTap: onViewAllTap,
                  child: Text(
                    'view all',
                    style: getRegularStyle(
                        color: ColorManager.primaryDark,
                        fontSize: FontSize.s12),
                  )),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
