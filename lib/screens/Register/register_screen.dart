import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/screens/Login/login_screen.dart';
import 'package:healthcare_ui_challenge/screens/Register/widgets/custom_input_field.dart';

import '../../constant/App_Colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
/*first portion start here*/
                Text('Sign Up',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),),
                /*first portion end here*/
                  const SizedBox(height: 10,),
                  /*second portion start here*/
                  Text('Please enter a form to sign up this app',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kSecondaryColor,
                  ),),
                  /*second portion end here*/
                  const SizedBox(height: 10,),
                  /*third portion start here*/
                  Text('Email or Username',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kSecondaryColor,
                  ),),
                  /*third portion end here*/
                  const SizedBox(height: 10,),
                  /*four portion start here*/
                  inputField(
                      controller: emailController,
                      hintText: 'Email Address',
                      keyboardType:TextInputType.emailAddress,
                      validate: (value){
                        if(value!.isEmpty){
                          return 'Please enter your email';
                        }
                        return null;
                      }
                  ),
                  /*four portion end here*/
                  const SizedBox(height: 10,),
                  /*five portion start here*/
                  Text('Password',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kSecondaryColor,
                  ),),
                  /*five portion end here*/
                  const SizedBox(height: 10,),
                  /*six portion start here*/
                  inputField(
                      controller: passwordController,
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.lock,color: Colors.grey,),
                      onbscureText: true,
                      validate: (value){
                        if(value!.isEmpty){
                          return 'Please enter your password';
                        }
                        return null;
                      }
                  ),
                  /*six portion end here*/
                  const SizedBox(height: 10,),
                  /*seven portion start here*/
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginScreen(),),);
                  }, child: Text('Sign Up',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:Color(0xFFffffff),
                  ),),),
                  /*seven portion end here*/
                  const SizedBox(height: 10,),
                  /*last portion start here*/
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }, child: RichText(
                    text: const TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),),

                  /*last portion end here*/
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
