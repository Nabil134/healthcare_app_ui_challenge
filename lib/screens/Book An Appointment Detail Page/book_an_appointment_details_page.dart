import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/screens/Book%20An%20Appointment%20Detail%20Page/Book%20An%20Appointment%20Detail%20Page%20Widget/MyCustomButton_allUses.dart';
import 'package:healthcare_ui_challenge/screens/Make%20Appointment/make_appointment_page.dart';

import '../../constant/App_Colors.dart';
class DoctorDataSingleton {
  static final DoctorDataSingleton _instance = DoctorDataSingleton._internal();

  factory DoctorDataSingleton() {
    return _instance;
  }

  DoctorDataSingleton._internal();

  Map<String, dynamic> doctorDataMap = {};
}

class BookAnAppointmentDetailPage extends StatefulWidget {
  final Map<String,dynamic> doctorData;
  const BookAnAppointmentDetailPage({super.key,required this.doctorData});

  @override
  State<BookAnAppointmentDetailPage> createState() => _BookAnAppointmentDetailPageState();
}

class _BookAnAppointmentDetailPageState extends State<BookAnAppointmentDetailPage> {
  /*_allRatings start here*/
  final List<Map<String,dynamic>> _allRatings=[
    {
      "image":"assets/images/Icon6.png",
      "name": "Abdul Rojak",
      "availability": "Today",
      "subTitle": "Dr.patricia baik bageet ",
    },
    {
      "image":"assets/images/Icon7.png",
      "name": "Antok Godek",
      "availability": "Yesterday",
      "subTitle": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
    },

    {
      "image":"assets/images/Icon8.png",
      "name": "Indah julaiha",
      "availability": "1 Weeks ago",
      "subTitle": " but the majority have suffered alteration in some form, by injected humour",
    },

  ];
  /*_allRatings end here*/
  @override
  Widget build(BuildContext context) {
    final doctorName=widget.doctorData['name'];
    final doctorPrice=widget.doctorData['price'];
    final doctorImage=widget.doctorData['image'];
    /*SingletonData start here*/
    final doctorDataSingleton=DoctorDataSingleton();
    doctorDataSingleton.doctorDataMap={
      'name':doctorName,
      'price':doctorPrice,
      'image':doctorImage,
    };
/*SingletonData end here */
    return Scaffold(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  MyCustomButtonAllUse(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MakeAppointmentPage(),
                      ),
                    );
                  }, backgroundColor: AppColors.kButtonColor,
                      text: "Make Appointment"),
Container(
  height: 48,
  width: 48,
  decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
    color: AppColors.white,
  ),
  child: Image.asset('assets/images/Icon.png'),
),
                ],),
              ),
             const SizedBox(height: 20,),
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
      appBar: AppBar(
        title: Text(
          'Ear, Nose & Throat',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
   body:SingleChildScrollView(
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         /*first portion start here*/
         ListTile(
           leading: Image.asset(doctorImage),
           title: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text(
               doctorName,
               style: TextStyle(
                 fontWeight: FontWeight.w700,
                 color: AppColors.black,
                 fontSize: 16,
               ),
             ),
             Text(
               'Ear, Nose & Throat specialist',
               style: TextStyle(
                 fontWeight: FontWeight.w500,
                 color: AppColors.kSecondaryColor,
                 fontSize: 12,
               ),
             ),
           ],),
           subtitle:  Text(
             doctorPrice,
             style: TextStyle(
               fontWeight: FontWeight.w700,
               color: AppColors.black,
               fontSize: 16,
             ),
           ),
         ),
         /*first portion end here*/
         const SizedBox(height: 5,),
         /*second portion start here*/
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           Row(children: [
             Icon(Icons.local_hospital,color: Colors.red,),
             const SizedBox(width: 2,),
             Text('Hospital',style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 12,
               color: AppColors.black1,
             ),),
           ],),
           Row(children: [
             Icon(Icons.access_time_filled,color: AppColors.kPrimaryColor,),
             const SizedBox(width: 5,),
             Text('Working Hours',style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 12,
               color: AppColors.black1,
             ),),
           ],),
         ],),
         /*second portion end here*/
         const SizedBox(height:20),
         /*third portion start here*/
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Text('RS. Hermina',style: TextStyle(
             fontWeight: FontWeight.w500,
             fontSize: 14,
             color: AppColors.black1,
           ),),
           Text('07.00 - 18.00',style: TextStyle(
             fontWeight: FontWeight.w500,
             fontSize: 14,
             color: AppColors.black1,
           ),),
        /*third portion end here*/
         ],),
         const SizedBox(height: 10,),
         /*four portion start here*/
         Text('Biography',style: TextStyle(
           fontWeight: FontWeight.w700,
           fontSize:17,
           color: AppColors.black2,
         ),),
         /*four portion end here*/
           const SizedBox(height: 10,),
           /*five portion start here*/
           Text("Dr. Patricia Ahoy specialist in Ear, Nose & Throat, and work in RS. Hermina Malang. It is a long established fact that a reader will be distracted by the readable content.",style: TextStyle(
             fontWeight: FontWeight.w700,
             fontSize:12,
             color: Colors.grey,
           ),),
           /*five portion end here*/
           const SizedBox(height: 10,),
           /*six portion start here*/
           Text('Work Location',style: TextStyle(
             fontWeight: FontWeight.w700,
             fontSize:17,
             color: AppColors.black2,
           ),),
           /*six portion end here*/
           const SizedBox(height: 10,),
           /*seven portion start here*/
           Text("Jl. Tangkuban Perahu No.31-33, Kauman, Kec. Klojen, Kota Malang, Jawa Timur 65119",style: TextStyle(
             fontWeight: FontWeight.w700,
             fontSize:12,
             color: Colors.grey,
           ),),
           /*seven portion end here*/
           const SizedBox(height: 10,),
           /*eight portion start here*/
           Image.asset('assets/images/Maps.png',height:128,
             width:double.infinity,
             fit: BoxFit.fitWidth,
           ),
           /*eight portion end here*/
           const SizedBox(height: 10,),
           /*nine portion start here*/
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text('Rating (72)',style: TextStyle(
               fontWeight: FontWeight.w700,
               fontSize:16,
               color: AppColors.black2,
             ),),
          Row(children: [
            Icon(Icons.star,color: Colors.yellow,),
            Text('4.5',style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize:16,
              color: AppColors.black1,
            ),),

          ],),
           ],),
           /*nine porttion end here*/
           const SizedBox(height: 10,),
           /*last portion start here*/
           SizedBox(
             height: MediaQuery.of(context).size.height*0.8,
             child: ListView.builder(
               itemCount: _allRatings.length,
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemBuilder: (context,index){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Image.asset(_allRatings[index]['image']),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text(_allRatings[index]['name'],style: TextStyle(
                       fontWeight: FontWeight.w700,
                       fontSize:16,
                       color: AppColors.black1,
                     ),),
                  Row(
                    children: [
                    AnimatedRatingStars(
                      initialRating: 4.5,
                      minRating: 0.0,
                      maxRating: 5.0,
                      filledColor: Colors.amber,
                      emptyColor: Colors.grey,
                      filledIcon: Icons.star,
                      halfFilledIcon: Icons.star_half,
                      emptyIcon: Icons.star_border,
                      onChanged: (double rating) {
                        // Handle the rating change here
                        print('Rating: $rating');
                      },
                      displayRatingValue: true,
                      interactiveTooltips: true,
                      customFilledIcon: Icons.star,
                      customHalfFilledIcon: Icons.star_half,
                      customEmptyIcon: Icons.star_border,
                      starSize: 15.0,
                      animationDuration: Duration(milliseconds: 300),
                      animationCurve: Curves.easeInOut,
                      readOnly: false,
                    ),
                    const SizedBox(width: 1,),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kSecondaryColor,
                      ),
                    ),
                  ],),
                   ],),

                   Text(_allRatings[index]['availability'],style: TextStyle(
                     fontWeight: FontWeight.w700,
                     fontSize:16,
                     color: AppColors.black1,
                   ),),
                 ],),
                   Padding(
                     padding: const EdgeInsets.only(left: 76,top: 5,bottom: 5),
                     child: Text(
                     _allRatings[index]['subTitle'],
                     style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w500,
                     color: AppColors.kSecondaryColor,
                     ),
                     ),
                   ),
               ],);
             }),
           ),
           /*last portion end here*/
       ],),
     ),
   ),);
  }
}
