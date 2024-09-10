import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class CustomBottomAppBar extends StatelessWidget {
  String totalPrice;

  CustomBottomAppBar({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorManager.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Total price',
                style: getMediumStyle(
                    color: ColorManager.primary.withOpacity(0.5),
                    fontSize: FontSize.s18.sp),
              ),
              Text(
                'EGP $totalPrice',
                style: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18.sp),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 50.w),
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(25.r)),
              child: Row(
                children: [
                  Text(
                    'Check Out',
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: FontSize.s20.sp),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 25.sp,
                    color: ColorManager.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
