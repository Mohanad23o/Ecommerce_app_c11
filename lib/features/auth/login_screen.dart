import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 91.h,
            ),
            Center(child: Image.asset(IconAssets.routeIcon)),
            SizedBox(
              height: 86.9.h,
            ),
            Text(
              'Welcome Back To Route',
              style: getSemiBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s24),
            ),
            Text(
              'Please sign in with your mail',
              style: getLightStyle(
                  color: ColorManager.white, fontSize: FontSize.s16),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'User Name',
              style: getMediumStyle(
                  color: ColorManager.white, fontSize: FontSize.s18),
            ),
          ],
        ),
      ),
    );
  }
}
