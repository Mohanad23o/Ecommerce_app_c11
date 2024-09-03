import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static final ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: ColorManager.transparent,
      brightness: Brightness.light,
      primaryColor: ColorManager.primary);
}
