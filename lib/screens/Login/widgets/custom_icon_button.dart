import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/App_Colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key,required this.backgroundColor,required this.text,required this.image});
  final Color backgroundColor;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(image),
      const SizedBox(width: 5,),
      Text(text,style: TextStyle(
        fontSize: 17,
        color: AppColors.white,
      ),),
    ],),
    );
  }
}
