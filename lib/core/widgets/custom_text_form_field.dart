import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  VoidCallback onTap;

  CustomTextFormField({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
    );
  }
}
