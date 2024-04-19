import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';
import 'package:healthcare_ui_challenge/screens/home/home%20page%20widget/home_page_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                /*first portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Hi Dwiky!',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),),
                      Text('May you always in a good condition',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:AppColors.black1,
                      ),),
                    ],),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.iconContainerColor,
                      ),
                  child: Icon(Icons.notifications_none),
                    ),
                  ],
                ),
                /*first portion end here*/
                const SizedBox(height: 20,),
                /*second portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48,
                      width: 287,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
               child: Row(children: [
                     Icon(Icons.search,size: 24,),
                     const SizedBox(width: 10,),
                     const Text('symptoms, diseases...',style: TextStyle(
                       color: Color(0xFF71717A),
                     ),),
               ],),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.iconContainerColor,
                      ),
                      child: Icon(Icons.filter_list,color: AppColors.iconColor,),
                    ),
                  ],
                ),
                /*second portion end here*/
                const SizedBox(height: 20,),
                /*third portion start here*/
               HomePageGridItem(),
                /*third portion end here*/
                const SizedBox(height: 20,),
                /*last portion start here*/
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                    Image.asset('assets/images/Promotion Card1.png'),
                    const SizedBox(width: 10,),
                    Image.asset('assets/images/Promotion Card2.png'),
                  ],),
                ),
                /*last portion end heere*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
