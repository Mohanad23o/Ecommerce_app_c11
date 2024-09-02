import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  Widget child;
  VoidCallback onTap;

  CustomButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          backgroundColor: ColorManager.white,
          padding: EdgeInsets.symmetric(vertical: 14.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: child,
    );
  }
}
