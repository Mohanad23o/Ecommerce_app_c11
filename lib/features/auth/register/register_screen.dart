import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_button.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app_c11/core/widgets/dialog_utils.dart';
import 'package:e_commerce_app_c11/core/widgets/text_form_field_widget_with_title.dart';
import 'package:e_commerce_app_c11/core/widgets/validators.dart';
import 'package:e_commerce_app_c11/di/di.dart';
import 'package:e_commerce_app_c11/domain/useCases/register_use_case.dart';
import 'package:e_commerce_app_c11/features/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/auth/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: getIt<RegisterUseCase>());
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, massage: 'Loading');
        } else if (state is RegisterErrorStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMassage(
              context: context,
              content: state.failures.errorMessage,
              posActionName: 'Ok',
              title: 'Error');
        } else if (state is RegisterSuccessStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMassage(
              context: context,
              content: 'Register Completed',
              posActionName: 'Ok',
              posAction: () {
                Navigator.pushReplacementNamed(context, Routes.mainRoute);
              },
              title: 'Success');
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
                    height: 46.9.h,
                  ),
                  TextFormFieldWidgetWithTitle(
                      title: AppConstants.fullName,
                      textFormField: CustomTextFormField(
                        borderSideColor: ColorManager.white,
                        controller: viewModel.nameController,
                        validator: (val) {
                          return AppValidators.validateUserName(val: val);
                        },
                        hintText: AppConstants.fullName,
                      )),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextFormFieldWidgetWithTitle(
                      title: AppConstants.phoneNumber,
                      textFormField: CustomTextFormField(
                        borderSideColor: ColorManager.white,
                        textInputType: TextInputType.phone,
                        controller: viewModel.phoneNumController,
                        validator: (val) {
                          return AppValidators.validatePhoneNum(val: val);
                        },
                        hintText: AppConstants.enterPhone,
                      )),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextFormFieldWidgetWithTitle(
                      title: AppConstants.email,
                      textFormField: CustomTextFormField(
                        borderSideColor: ColorManager.white,
                        textInputType: TextInputType.emailAddress,
                        controller: viewModel.emailController,
                        validator: (val) {
                          return AppValidators.validateEmail(val: val);
                        },
                        hintText: AppConstants.enterEmail,
                      )),
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
                    height: 32.h,
                  ),
                  TextFormFieldWidgetWithTitle(
                    title: AppConstants.confirmPassword,
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
                        controller: viewModel.rePasswordController,
                        hintText: AppConstants.passwordHintText,
                        obscureText: obscurePassword,
                        maxLine: obscurePassword ? 1 : null,
                        validator: (val) {
                          return AppValidators.validateConfirmPassword(
                              val: val,
                              password: viewModel.passwordController.text);
                        }),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  CustomButton(
                      child: Text(
                        'Sign Up',
                        style: getSemiBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s20.sp),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          viewModel.register();
                        }
                      }),
                  SizedBox(
                    height: 30.h,
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
