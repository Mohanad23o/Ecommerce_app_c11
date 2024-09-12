import 'package:e_commerce_app_c11/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/utils/shared_preferences_utils.dart';
import '../../../../core/routes_manager/routes.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Mohamed',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18.sp),
                  ),
                  IconButton(
                      onPressed: () {
                        //todo: remove token
                        SharedPreferencesUtils.removeData('token');
                        //todo: navigate to login
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.signInRoute, (route) => false);
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
              Text(
                'mohamed.N@gmail.com',
                style: getRegularStyle(
                    color: ColorManager.primary.withOpacity(.5),
                    fontSize: FontSize.s14),
              ),
              SizedBox(height: 18.h),
              CustomTextFormField(
                borderSideColor: ColorManager.primary,
                isReadOnly: isFullNameReadOnly,
                hintText: 'Enter your full name',
                labelText: 'Full Name',
                controller:
                    TextEditingController(text: 'Mohamed Mohamed Nabil'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 18.h),
              CustomTextFormField(
                borderSideColor: ColorManager.primary,
                isReadOnly: isEmailReadOnly,
                hintText: 'Enter your email address',
                labelText: 'Email',
                controller:
                    TextEditingController(text: 'MohamedNabil@gmail.com'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 18.h),
              CustomTextFormField(
                borderSideColor: ColorManager.primary,
                isReadOnly: isMobileNumberReadOnly,
                hintText: 'Enter your mobile number',
                labelText: 'Mobile Number',
                controller: TextEditingController(text: '01234567890'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 18.h),
              CustomTextFormField(
                borderSideColor: ColorManager.primary,
                isReadOnly: isPasswordReadOnly,
                hintText: 'Enter your Password',
                labelText: 'Password',
                controller: TextEditingController(text: '123456'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isPasswordReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 18.h),
              CustomTextFormField(
                borderSideColor: ColorManager.primary,
                isReadOnly: isAddressReadOnly,
                hintText: 'Enter your full address',
                labelText: 'Address',
                controller: TextEditingController(text: 'Route Academy'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isAddressReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}