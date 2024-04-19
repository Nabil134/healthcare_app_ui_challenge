import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';
import 'package:healthcare_ui_challenge/screens/Book%20An%20Appointment%20Detail%20Page/book_an_appointment_details_page.dart';

class BookAppointmentPage extends StatefulWidget {
  final String title;

   BookAppointmentPage({required this.title}) ;

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {



  List availabilty_options=[
    {
      'title':'All',
      'value':'All',
    },
    {
      'title':'Available Today',
      'value':"Available Today",
    },
    {
      'title':'Not Available Today',
      'value':"Not Available Today",
    },
  ];

  List gender_options=[
    {'title':'Other','value':'1'},
    {'title':'Male','value':"2"},
    {'title':'Female','value':"3"},
  ];

  List price_options=[
    {'title':'IDR. 100.000','value':'1'},
    {'title':'IDR. 120.000','value':"2"},
    {'title':'IDR. 150.000','value':"3"},
  ];

  String _selectedavailability = 'All';
  String _selectedgender = '1';
  String _selectedprice='1';

  /*_allDoctors start here*/
  final List<Map<String,dynamic>> _allDoctors=[
    {
      "image":"assets/images/Icon1.png",
      "id": 1,
      "name": "Dr. Patricia Ahoy",
      "price": "IDR. 120.000",
      "availability": "Available Today",
      "gender": "3",
    },
    {
      "image":"assets/images/Icon3.png",
      "id": 2,
      "name": "Dr. William",
      "price": "IDR. 120.000",
      "availability": "Available Today",
      "gender": "2",
    },
    {
      "image":"assets/images/Icon2.png",
      "id": 3,
      "name": "Dr. Stone Gaze",
      "price": "IDR. 100.000",
      "availability": "Available Today",
      "gender": "3",
    },
    {
      "image":"assets/images/Icon3.png",
      "id": 4,
      "name": "Dr. Wahyu ",
      "price": "IDR. 150.000",
      "availability": "Available Today",
      "gender": "2",
    },
/*Not Available List*/
    {
      "image":"assets/images/Icon2.png",
      "id": 5,
      "name": "Dr. Stone Gaze",
      "price": "IDR. 100.000",
      "availability": "Not Available Today",
      "gender": "3",
    },
    {
      "image":"assets/images/Icon5.png",
      "id": 6,
      "name": "Dr. Jacky Cun",
      "price": "IDR. 120.000",
      "availability": "Not Available Today",
      "gender": "2",
    },

    {
      "image":"assets/images/Icon4.png",
      "id": 7,
      "name": "Dr. Reza Razor",
      "price": "IDR. 150.000",
      "availability": "Not Available Today",
      "gender": "2",

    },
    {
      "image":"assets/images/Icon1.png",
      "id": 9,
      "name": "Dr. Patricia Ahoy",
      "price": "IDR. 150.000",
      "availability":"Not Available Today",
      "gender": "3",
    },
    {
      "image":"assets/images/Icon2.png",
      "id": 8,
      "name": "Dr. Stone Gaze",
      "price": "IDR. 150.000",
      "availability": "Not Available Today",
      "gender": "3",
    },
    {
      "image":"assets/images/Icon5.png",
      "id": 10,
      "name": "Dr. Nabil",
      "price": "IDR. 100.000",
      "availability": "All",
      "gender": "2",
    },
/*Not Avaialable List*/
  ];
  /*_allDoctors end here*/
  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundDoctors = [];
  @override
  void initState() {
    // TODO: implement initState
    _foundDoctors = _allDoctors;
    super.initState();
  }
  /*runFilter start here*/
  /*
  void _runFilter(String keyword) {
    if (keyword.isEmpty) {
      setState(() {
        _foundDoctors = _allDoctors;
      });
    } else {
      setState(() {
        _foundDoctors = _allDoctors
            .where((doctor) =>
            doctor['name'].toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      });
    }
  }
   */

  void _runFilter(String keyword, String availability, String gender, String price) {
    setState(() {
      _foundDoctors = _allDoctors.where((doctor) {
        final nameMatches = doctor['name'].toLowerCase().contains(keyword.toLowerCase());
        final availabilityMatches = availability.isEmpty ||
            (availability == 'Available Today' && doctor['availability'] == 'Available Today') ||
            (availability == 'Not Available Today' && doctor['availability'] != 'Available Today') ||
            (availability=='All' && doctor['availability']!='Available Today');
        final genderMatches = gender.isEmpty || doctor['gender'] == gender;
        final priceMatches = price.isEmpty || doctor['price'] == price_options[int.parse(price) - 1]['title'];

        return nameMatches && availabilityMatches && genderMatches && priceMatches;
      }).toList();
    });
  }

  /*runFilter end here*/
  /*_clearFilters start here*/
  void _clearFilters() {
    setState(() {
      _foundDoctors = _allDoctors;
    });
  }

  /*_clearFilters end here*/


  @override
  Widget build(BuildContext context) {

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
      appBar: AppBar(
        title: Text(
         widget.title,
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
   body: Padding(
     padding: const EdgeInsets.all(8.0),
     child: SingleChildScrollView(
       child: Column(children: [
         const SizedBox(height: 20,),
         /*first portion portion start here*/
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

              Expanded(child: TextField(
                onChanged: (value){
                  if(value.isEmpty){
                    _clearFilters();
                  }
                  else {
                    _runFilter(value, _selectedavailability, _selectedgender,
                        _selectedprice);
                  }
                  },
              decoration: InputDecoration(
                hintText: "Search Doctor",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color(0xFF71717A),
                ),
              contentPadding: const EdgeInsets.all(8),
              ),
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
         /*firth portion end here*/
         const SizedBox(height: 20,),
 /*second portion start here*/
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children: [
               SizedBox(
                // height: 40,
                // width: 174,
                 height:MediaQuery.of(context).size.height*0.045,
                 width: MediaQuery.of(context).size.width * 0.5,
                 child: InputDecorator(
                   decoration: InputDecoration(
                     border:OutlineInputBorder(
                       borderRadius:BorderRadius.circular(15.0),
                     ),
                     contentPadding: const    EdgeInsets.all(8),
                     filled: true,
                     fillColor:Color(0xFFE5E7EB),

                   ),
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
                       value: _selectedavailability,
                         isExpanded:true,

                         items: [
                            DropdownMenuItem(child: Text('Avaliable Today',style: TextStyle(
                             fontWeight: FontWeight.w700,
                             fontSize: 12,
                             color: AppColors.black,
                           ),),
                             value: ''),

                           ...availabilty_options.map<DropdownMenuItem<String>>((data){
                             return DropdownMenuItem(child: Text(data['title'],style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 12,
                               color: AppColors.black,
                             ),),value: data['value'],
                             );
                           }).toList(),

                         ], onChanged: (value){
print('selected Value:$value');
setState(() {
  _selectedavailability=value!;
  _runFilter('',_selectedavailability,_selectedgender,_selectedprice);
});
                     }),
                   ),
                 ),
               ),
const SizedBox(width: 10,),
               SizedBox(
               //  height: 32,
                // width: 100,
                 height: MediaQuery.of(context).size.height*0.042,
                 width: MediaQuery.of(context).size.width * 0.39,
                 child: InputDecorator(
                   decoration: InputDecoration(
                     border:OutlineInputBorder(
                       borderRadius:BorderRadius.circular(15.0),
                     ),
                     contentPadding: const    EdgeInsets.all(8),
                     filled: true,
                     fillColor:Color(0xFFE5E7EB),

                   ),
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
                         value: _selectedgender,
                         isExpanded:true,
                         items: [
                            DropdownMenuItem(child: Text('Gender',style: TextStyle(
                             fontWeight: FontWeight.w700,
                             fontSize: 12,
                             color: AppColors.black,
                           ),),
                               value: ''),

                           ...gender_options.map<DropdownMenuItem<String>>((data){
                             return DropdownMenuItem(child: Text(data['title'],style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 12,
                               color: AppColors.black,
                             ),),value: data['value']);
                           }).toList(),

                         ], onChanged: (value){
                       print('selected Value:$value');
                       setState(() {
                         _selectedgender=value!;
                         _runFilter('',_selectedavailability,_selectedgender,_selectedprice);
                       });
                     }),
                   ),
                 ),
               ),
const SizedBox(width: 10,),
               SizedBox(
               //  height: 32,
                // width: 130,
                 height: MediaQuery.of(context).size.height*0.042,
                 width: MediaQuery.of(context).size.width * 0.39,
                 child: InputDecorator(
                   decoration: InputDecoration(
                     border:OutlineInputBorder(
                       borderRadius:BorderRadius.circular(15.0),
                     ),
                     contentPadding: const    EdgeInsets.all(8),
                     filled: true,
                     fillColor:Color(0xFFE5E7EB),

                   ),
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
                         value: _selectedprice,
                         isExpanded:true,
                         items: [
                           DropdownMenuItem(child: Text('Price',style: TextStyle(
                             fontWeight: FontWeight.w700,
                             fontSize: 12,
                             color: AppColors.black,
                           ),),
                               value: ''),

                           ...price_options.map<DropdownMenuItem<String>>((data){
                             return DropdownMenuItem(child: Text(data['title'],style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 12,
                               color: AppColors.black,
                             ),),value: data['value']);
                           }).toList(),

                         ], onChanged: (value){
                       print('selected Value:$value');
                       setState(() {
                         _selectedprice=value!;
                         _runFilter('',_selectedavailability,_selectedgender,_selectedprice);
                       });
                     }),
                   ),
                 ),
               ),
             ],
           ),
         ),

         /*second portion end here*/
         const SizedBox(height: 20,),
         /*last portion start here*/
      _foundDoctors.isNotEmpty?   SizedBox(
        height:MediaQuery.of(context).size.height*1.35,
         child: ListView.builder(
           itemCount: _foundDoctors.length,
             physics: const NeverScrollableScrollPhysics(),
             itemBuilder: (context,index){
           return  InkWell(
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => BookAnAppointmentDetailPage(
                     doctorData: _foundDoctors[index],
                   ),
                 ),
               );
             },
             child: ListTile(
               leading: Image.asset(_foundDoctors[index]['image']),
               title: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                 _foundDoctors[index]['name'],
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
                 _foundDoctors[index]['price'],
                 style: TextStyle(
                   fontWeight: FontWeight.w700,
                   color: AppColors.black,
                   fontSize: 16,
                 ),
               ),
               trailing: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Icon(Icons.star,color: Color(0xFFF38744),),
                   const SizedBox(width: 5,),
                   Text(
                     '4.5',
                     style: TextStyle(
                       fontWeight: FontWeight.w700,
                       color: AppColors.black,
                       fontSize: 16,
                     ),
                   ),
                 ],),
             ),
           );
         }),
         ): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset('assets/images/search.gif',fit: BoxFit.contain,
           height: MediaQuery.of(context).size.height*0.4,
           width: MediaQuery.of(context).size.width*0.4,
         ),
          SizedBox(height: 20),
          Text(
            'No results found. Please try a different search.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),

         /*last portion end here*/


       ],),
     ),
   ),
    );
  }
}
