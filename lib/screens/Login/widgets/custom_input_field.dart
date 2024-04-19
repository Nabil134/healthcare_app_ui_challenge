import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';

Widget inputField({TextEditingController? controller,
  String hintText='Enter Text',
  bool onbscureText=false,
  String? Function(String?)? validate,
  TextInputType? keyboardType,
  Widget? suffixIcon,
  double borderRadius = 12.0,

}){
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      controller: controller,
      keyboardAppearance: Brightness.light,
      keyboardType: keyboardType,
      validator: validate,
      obscureText: onbscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          color: AppColors.kSecondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: AppColors.kSecondaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
    ),
  );
}