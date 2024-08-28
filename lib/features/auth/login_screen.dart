import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_button.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  AppConstants.welcomeBack,
                  style: getSemiBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s24),
                ),
                Text(
                  AppConstants.signInWithMail,
                  style: getLightStyle(
                      color: ColorManager.white, fontSize: FontSize.s16),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  AppConstants.email,
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: FontSize.s18),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  hintText: AppConstants.emailHintText,
                  controller: emailController,
                  vaildator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Fill This Field';
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return 'Please Enter A Valid Email';
                    }
                    return null;
                  },
                ), // email
                // --------------------------------------------------------
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppConstants.password,
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: FontSize.s18),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  suffixIcon: InkWell(
                      onTap: () {
                        if (obscurePassword) {
                          obscurePassword = false;
                        } else {
                          obscurePassword = true;
                        }
                        setState(() {});
                      },
                      child: Tab(
                          child: !obscurePassword
                              ? Image.asset(IconAssets.showPasswordIcon)
                              : Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Color(0xFF808080),
                                ))),
                  controller: passwordController,
                  hintText: AppConstants.passwordHintText,
                  obscureText: obscurePassword,
                  maxLine: obscurePassword ? 1 : null,
                  vaildator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Fill This Field';
                    }
                    if (text.length < 6) {
                      'Password Should Be More Than 6 Characters';
                    }
                    return null;
                  },
                ), // password
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppConstants.forgotPassword,
                    textAlign: TextAlign.end,
                    style: getRegularStyle(
                        color: ColorManager.white, fontSize: FontSize.s18),
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),
                CustomButton(
                    child: Text(
                      AppConstants.login,
                      style: getSemiBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s20),
                    ),
                    onTap: () {
                      login();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {}
  }
}
