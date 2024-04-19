
import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';


class MyCustomButtonAllUse extends StatelessWidget {
  const MyCustomButtonAllUse({super.key,required this.onPressed,required this.backgroundColor,required this.text});
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: 303,
        decoration: BoxDecoration(
          color:backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(text,style: TextStyle(
          fontSize: 17,
          color: AppColors.white,
        ),),),
      ),
    );
  }
}
