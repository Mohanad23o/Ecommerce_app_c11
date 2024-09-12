import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/core/resources/utils/shared_preferences_utils.dart';
import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_button.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app_c11/core/widgets/dialog_utils.dart';
import 'package:e_commerce_app_c11/core/widgets/text_form_field_widget_with_title.dart';
import 'package:e_commerce_app_c11/core/widgets/validators.dart';
import 'package:e_commerce_app_c11/di/di.dart';
import 'package:e_commerce_app_c11/features/auth/login/cubit/login_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/auth/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/useCases/login_use_case.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: getIt<LoginUseCase>());
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, massage: 'Loading...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMassage(
              context: context,
              content: state.errorMessage,
              posActionName: 'Ok',
              title: 'Error');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMassage(
              context: context,
              content: 'Login Successful',
              posActionName: 'Ok',
              title: 'Success');
          print(state.loginResponseEntity.token);
          SharedPreferencesUtils.saveData(
              'token', state.loginResponseEntity.token);
          Navigator.pushReplacementNamed(context, Routes.mainRoute);
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
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
                  TextFormFieldWidgetWithTitle(
                    title: AppConstants.email,
                    textFormField: CustomTextFormField(
                      borderSideColor: ColorManager.white,
                      textInputType: TextInputType.emailAddress,
                      hintText: AppConstants.emailHintText,
                      controller: viewModel.emailController,
                      validator: (val) {
                        return AppValidators.validateEmail(val: val);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextFormFieldWidgetWithTitle(
                    title: AppConstants.password,
                    textFormField: CustomTextFormField(
                        borderSideColor: ColorManager.white,
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
                                    : const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Color(0xFF808080),
                                      ))),
                        controller: viewModel.passwordController,
                        hintText: AppConstants.passwordHintText,
                        obscureText: obscurePassword,
                        maxLine: obscurePassword ? 1 : null,
                        validator: (val) {
                          return AppValidators.validatePassword(
                              val: viewModel.passwordController.text,
                              length: 6);
                        }),
                  ),
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
                            color: ColorManager.primary,
                            fontSize: FontSize.s20.sp),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          viewModel.login();
                        }
                      }),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '${AppConstants.haveNoAccount} ',
                        style: getMediumStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s18.sp),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signUpRoute);
                        },
                        child: Text(
                          AppConstants.createAccount,
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
