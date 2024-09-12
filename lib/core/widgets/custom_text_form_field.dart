import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:flutter/material.dart';

typedef MyVaildator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  int? maxLine;
  bool obscureText;
  MyVaildator validator;
  String? hintText;
  bool? isReadOnly;
  TextInputType? textInputType;
  Color? borderSideColor;
  Widget? suffixIcon;
  TextStyle? labelStyle;
  String? labelText;

  CustomTextFormField({super.key, this.controller,
      this.suffixIcon,
      this.isReadOnly,
      this.borderSideColor,
      this.textInputType,
      this.labelStyle,
      this.labelText,
      this.maxLine,
      this.obscureText = false,
      this.validator,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly!,
      keyboardType: textInputType,
      controller: controller,
      maxLines: maxLine,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          errorMaxLines: 2,
          helperMaxLines: 2,
          hintMaxLines: 2,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1, color: borderSideColor!)),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: ColorManager.white,
          hintText: hintText,
          hintStyle:
              getLightStyle(color: ColorManager.black, fontSize: FontSize.s18),
          labelText: labelText,
          labelStyle: labelStyle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1, color: borderSideColor!)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1, color: borderSideColor!)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.redAccent))),
    );
  }
}
