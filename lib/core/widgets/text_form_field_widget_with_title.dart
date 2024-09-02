import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:e_commerce_app_c11/core/resources/style_manager.dart';
import 'package:e_commerce_app_c11/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidgetWithTitle extends StatelessWidget {
  String title;
  TextStyle textStyle =
      getMediumStyle(color: ColorManager.white, fontSize: FontSize.s18);
  CustomTextFormField textFormField;

  TextFormFieldWidgetWithTitle(
      {super.key, required this.title, required this.textFormField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: textStyle),
        SizedBox(
          height: 24.h,
        ),
        textFormField // email
      ],
    );
  }
}
