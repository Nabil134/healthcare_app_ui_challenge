import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/screens/Payment%20Success/payment_success.dart';


import '../../constant/App_Colors.dart';
import '../Book An Appointment Detail Page/book_an_appointment_details_page.dart';
import 'Payment Page Widget/MyCustomButton_allUses.dart';

class PaymentPageView extends StatefulWidget {
  final List<Map<String, dynamic>> allDays;
  final List<Map<String, dynamic>> morningTimings;
  final Map<String, dynamic> selectedDay;
  final Map<String, dynamic> selectedTime;


  PaymentPageView({required this.allDays, required this.morningTimings,required this.selectedDay,required this.selectedTime});


  @override
  State<PaymentPageView> createState() => _PaymentPageViewState();
}

class _PaymentPageViewState extends State<PaymentPageView> {
  int selectedOption = 1;


  @override
  Widget build(BuildContext context) {
    final doctorDataSingleton = DoctorDataSingleton();
    final Map<String, dynamic> doctorDataMap = doctorDataSingleton.doctorDataMap;
    final Map<String, dynamic> selectedDay;
    // Function to show the edit dialog//
    void _showEditDialog(BuildContext context) {
      TextEditingController dateController = TextEditingController(text: widget.selectedDay['date']);
      TextEditingController dayController = TextEditingController(text: widget.selectedDay['day']);
      TextEditingController timeController = TextEditingController(text: widget.selectedTime['time']);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Date, Day, and Time"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: dayController,
                  decoration: InputDecoration(labelText: 'Day'),
                ),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(labelText: 'Time'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.selectedDay['date'] = dateController.text;
                    widget.selectedDay['day'] = dayController.text;
                    widget.selectedTime['time'] = timeController.text;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }
    // Function to show the edit dialog//


    return Scaffold(
      /*bottomNavigationBar start here*/
      bottomNavigationBar: SizedBox(
      height: 88,
      child: Container(
        height: 88,
        width: 375,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),
          ),
        ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('Total',style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.kSecondaryColor,
  ),),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(doctorDataMap['price'],style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),),
    MyCustomButtonAllUse(onPressed: (){Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccess(
          selectedDay: widget.selectedDay,
          selectedTime: widget.selectedTime,
        ),
      ),
    );

    }, backgroundColor: AppColors.kPrimaryColor, text: "Pay"),
  ],),
  const SizedBox(height: 5,),
  Container(
    height: 5,
    width: 134,
    margin: const EdgeInsets.only(left: 100),
    decoration: BoxDecoration(
      color: Color(0xff020E22),
    ),
  ),
],),




      ),   ),
      /*bottomNavigationBar end here*/
      appBar: AppBar(
        title: Text(
          'Payment',
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
         children: [
           /*first portion start here*/
           ListTile(
             leading: Image.asset(doctorDataMap['image']),
             title: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
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
                 Text(doctorDataMap['name'],style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w700,
                   color: AppColors.black,
                 ),),
                ],
             ),
             subtitle:  Text('Ear, Nose & Throat specialist',style: TextStyle(
               fontSize: 12,
               fontWeight: FontWeight.w500,
               color: AppColors.kSecondaryColor,
             ),),
           ),
           /*first portion end here*/
           const SizedBox(height: 10,),
           /*second portion start here*/
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text('Schedule Date',style: TextStyle(
               fontSize: 14,
               fontWeight: FontWeight.w700,
               color: AppColors.black,
             ),),
           Row(children: [
             IconButton(onPressed: (){
               _showEditDialog(context);
             }, icon: Icon(Icons.edit),color: AppColors.kPrimaryColor,),
             Text('Edit',style: TextStyle(
               fontSize: 12,
               fontWeight: FontWeight.w700,
               color: AppColors.kPrimaryColor,
             ),),
           ],),
           ],),
           /*second portion end here*/
           const SizedBox(height: 10,),
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
        /*third portion end here*/
           const SizedBox(height: 10,),
           /*four portion start here*/
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Select Payment Methode',style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w700,
                 color: AppColors.black,
               ),),
               Text('See All',style: TextStyle(
                 fontSize: 12,
                 fontWeight: FontWeight.w700,
                 color: AppColors.kPrimaryColor,
               ),),
             ],
           ),
           /*four portion end here*/
           const SizedBox(height: 10,),

/*five portion end here*/
           const SizedBox(height: 10,),
           /*six portion start here*/
           CustomRadioButtonTile(
             value: 1, // Provide your value
             groupValue: selectedOption, // Provide your group value
             onChanged: (value) {
               // Handle onChanged event
               setState(() {
                 selectedOption = value!;
                 print("Button value: $value");
               });
             },
             title: 'Credit Card', // Provide your title
             image: 'assets/images/Image1.png', // Provide your image asset path
           ),
         /*six portion end here*/
           const SizedBox(height: 10,),
           /*seven portion start here*/
           CustomRadioButtonTile(
             value: 2, // Provide your value
             groupValue: selectedOption, // Provide your group value
             onChanged: (value) {
               // Handle onChanged event
               setState(() {
                 selectedOption = value!;
                 print("Button value: $value");
               });
             },
             title: 'Mandiri', // Provide your title
             image: 'assets/images/Image2.png', // Provide your image asset path
           ),
/*seven portion end here*/
         const SizedBox(height: 10,),
           /*seven portion start here*/
           CustomRadioButtonTile(
             value: 3, // Provide your value
             groupValue: selectedOption, // Provide your group value
             onChanged: (value) {
               // Handle onChanged event
               setState(() {
                 selectedOption = value!;
                 print("Button value: $value");
               });
             },
             title: 'BCD', // Provide your title
             image: 'assets/images/Image3.png', // Provide your image asset path
           ),
/*seven portion end here*/
         const SizedBox(height: 10,),
           /*eight portion start here*/
           Text('Total payment',style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w700,
             color: AppColors.black,
           ),),
           /*eight portion end here*/
           const SizedBox(height: 10,),
           /*nine portion start here*/
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text('Total payment',style: TextStyle(
               fontSize: 14,
               fontWeight: FontWeight.w500,
               color: AppColors.kSecondaryColor,
             ),),
             Text(doctorDataMap['price'],style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w700,
               color: AppColors.black,
             ),),
           ],),
         /*eight portion end here*/
           const SizedBox(height: 10,),
           /*last portion start here*/
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Admin',style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
                 color: AppColors.kSecondaryColor,
               ),),
               Text('Free',style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w700,
                 color: AppColors.black,
               ),),
             ],),
           /*last portion end here*/
         ],
       ),
     ),
   ),
    );
  }
}
/*CustomRadioButton start here*/
class CustomRadioButtonTile extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  final String title;
  final String image;

  const CustomRadioButtonTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Radio<int>(
        activeColor: AppColors.kPrimaryColor, // You can customize the active color here
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

/*CustomRadioButton end here*/
