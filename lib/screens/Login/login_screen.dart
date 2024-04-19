import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';
import 'package:healthcare_ui_challenge/screens/Login/widgets/custom_icon_button.dart';
import 'package:healthcare_ui_challenge/screens/home/home_page.dart';

import '../Register/register_screen.dart';
import 'widgets/custom_input_field.dart';
import 'widgets/custom_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading=false;
  /*_login function start here*/
  Future<void> _login() async {
    if (isLoading) return;
    setState(() {
      isLoading=true;
    });
    String email=emailController.text;
    String password=passwordController.text;
    if(formKey.currentState!.validate()){
      await Future.delayed(Duration(seconds: 2));
      if(email=='mohammad.nabil.ashraf@gmail.com'&& password=='12345'){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Email or password is incorrect'),
            backgroundColor: AppColors.kPrimaryColor,
          ),
        );
      }
    }
    setState(() {
      isLoading=false;
    });
  }
  /*_login function end here*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                /*first portion start here*/
                Text('Welcome Back',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),),
                /*first portion end here*/
                const SizedBox(height: 10,),
                /*second portion start here*/
                Text('Please enter a form to login this app',style: TextStyle(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget Password',style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kSecondaryColor,
                      ),),
                    ],
                  ),
                  /*seven portion end here*/
                  const SizedBox(height: 10,),
                  /*eight portion start here*/
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed:
                    isLoading?null:_login,

                    child:isLoading?const CustomLoader()//show loader indicator
                        :const Text("Login",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:Color(0xFFffffff),
                    ),),),
                  /*eight portion end here*/
                  const SizedBox(height: 10,),
                  /*nine portion start here*/
CustomIconButton(backgroundColor:AppColors.kPrimaryColor, text: 'Sign In', image: 'assets/images/google.png'),
                  /*nine portion end here*/
const SizedBox(height: 10,),
                  /*ten portion start here*/
                  CustomIconButton(backgroundColor:AppColors.kPrimaryColor, text: 'Sign in with Apple',
                      image: 'assets/images/apple.png'),
                  /*ten portion end here*/
                  const SizedBox(height: 16.0,),
                  /*last portion start here*/
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  }, child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Register',
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
