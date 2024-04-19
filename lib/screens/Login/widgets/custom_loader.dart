
import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      backgroundColor: Color(0xFF254EDB),
    );
  }
}
