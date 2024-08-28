import 'package:e_commerce_app_c11/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle getLightStyle(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getRegularStyle(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getMediumStyle(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getSemiBoldStyle(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getBoldStyle({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
