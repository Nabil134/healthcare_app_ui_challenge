import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';
import 'package:healthcare_ui_challenge/screens/Book%20An%20Appointment%20Detail%20Page/Book%20An%20Appointment%20Detail%20Page%20Widget/MyCustomButton_allUses.dart';

import '../Book An Appointment Detail Page/book_an_appointment_details_page.dart';
import '../Payment Page View/payment_page_view.dart';

class PaymentSuccess extends StatefulWidget {
  final Map<String, dynamic> selectedDay;
  final Map<String, dynamic> selectedTime;
  const PaymentSuccess({super.key,required this.selectedDay,required this.selectedTime});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    final doctorDataSingleton = DoctorDataSingleton();
    final Map<String, dynamic> doctorDataMap = doctorDataSingleton.doctorDataMap;


    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      bottomNavigationBar: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: 5,
            width: 134,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
          ),
        ],),
      ),
   body: SingleChildScrollView(
     child: Column(
       children: [
         const SizedBox(height: 70,),
       Padding(
         padding: const EdgeInsets.only(left: 10,top: 20),
           child: Stack(
             alignment: Alignment.topCenter,
             children: [
               Container(
                 height: 530,
                 width: 335,
                 padding: const EdgeInsets.all(8),
                 margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Color(0xf8ffffff),
                 ),
                 child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const SizedBox(height: 40,),
Text('You have successfully made an appointment',style: TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 20,
  color: AppColors.black,
),),

                     Text('The appointment confirmation has been send to your email.',style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 12,
                       color: AppColors.kSecondaryColor,
                     ),),
                     Center(child: Image.asset(doctorDataMap['image']),),
                     Text(doctorDataMap['name'],style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w700,
                       color: AppColors.black,
                     ),),
                     Text('Ear, Nose & Throat specialist',style: TextStyle(
                       fontSize: 12,
                       fontWeight: FontWeight.w500,
                       color: AppColors.kSecondaryColor,
                     ),),
                     /*third portion start here*/
                     ListTile(
                       leading: Image.asset('assets/images/Icon Illustration1.png'),
                       title: Text('Appointment',style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: AppColors.kSecondaryColor,
                       ),),
                       subtitle: Text("${widget.selectedDay['day']} ${widget.selectedDay['date']} Jan 2024, ${widget.selectedTime['time']}",
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w700,
                           color: AppColors.black,
                         ),),
                     ),
                   const SizedBox(height: 120,),
                   MyCustomButtonAllUse(onPressed: (){
                     Navigator.pop(context);
                   }, backgroundColor:
                   AppColors.kPrimaryColor, text: 'Back to home'),
                   ],
                 ),
               ),

               Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.asset('assets/images/IconImage.png'),
                 ),
               ),

             ],
           ),
       ),
     ],),
   ),
    );
  }
}
