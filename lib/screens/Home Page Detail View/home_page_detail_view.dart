

import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';
import 'package:healthcare_ui_challenge/screens/book_an_appointment_page/book_an_appointment_page.dart';

import '../../models/appointment_model.dart';

class HomePageDetailView extends StatefulWidget {
  const HomePageDetailView({Key? key});

  @override
  State<HomePageDetailView> createState() => _HomePageDetailViewState();
}

class _HomePageDetailViewState extends State<HomePageDetailView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Book an Appointment',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.black2,
          ),
        ),
      ),
    /*bottomNavigation start here*/
      bottomNavigationBar: SizedBox(
      height: 88,
      child: Container(
        height: 88,
        width: 375,
        decoration: BoxDecoration(
color: AppColors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),
        ),
      ),
child: Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Container(
    height: 5,
    width: 134,
    decoration: BoxDecoration(
      color: Color(0xff020E22),
    ),
  ),
],),
      ),   ),
   /*bottomNavigationBar end here*/
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          /*first portion start here*/
          Text('Medical Specialties',style: TextStyle(
            fontSize:16,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),),
          /*first portion end here*/
          const SizedBox(height: 20,),
          /*second portion start here*/
          Text('Wide selection of doctor\'s specialties',style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color:AppColors.black1,
          ),),
          /*second portion end here*/
            const SizedBox(height: 20,),
            /*third portion start here*/
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
                  child: Icon(Icons.filter_list,color: AppColors.iconColor),
                ),
              ],
            ),
            /*third portion end here*/
            /*four portion portion start here*/
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 1,
              child:ListView.builder(
                itemCount: AppointmentData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final appointment = AppointmentData[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookAppointmentPage(
title:appointment.title,

                               ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: appointment.iconColor,
                        child: Icon(appointment.icon),
                      ),
                      title: Text(
                        appointment.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        appointment.subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),

            ),


            /*four portion end here*/
            /*last portion start here*/
            Row(children: [
              const Text('See more',style: TextStyle(
                color: Color(0xFF254EDB),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),),
            const SizedBox(width: 5,),
              Icon(Icons.arrow_forward_ios,color: Color(0xFF254EDB),),
            ],),
            /*last portion end here*/
        ],),
      ),
    ),
    );
  }
}
/*Custom ListTile start here*/

class CustomListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;



  const CustomListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },

      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.kSecondaryColor,
          child: Icon(icon,color: iconColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
/*Custom ListTile end here*/