import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/screens/Book%20An%20Appointment%20Detail%20Page/Book%20An%20Appointment%20Detail%20Page%20Widget/MyCustomButton_allUses.dart';
import 'package:healthcare_ui_challenge/screens/Payment%20Page%20View/payment_page_view.dart';
import '../../constant/App_Colors.dart';

class MakeAppointmentPage extends StatefulWidget {
  const MakeAppointmentPage({Key? key}) : super(key: key);

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPageState();
}

class _MakeAppointmentPageState extends State<MakeAppointmentPage> {
  final List<Map<String, dynamic>> allDays = [
    {"day": "Wed", "date": "10"},
    {"day": "Thurs", "date": "11"},
    {"day": "Fri", "date": "12"},
    {"day": "Sat", "date": "13"},
    {"day": "Sun", "date": "14"},
  ];

  final List<Map<String, dynamic>> morningTimings = [
    {"time": "10:00"},
    {"time": "11:00"},
    {"time": "12:00"},
    {"time": "13:30"},
  ];

  final List<Map<String, dynamic>> afternoonTimings = [
    {"time": "18:00"},
    {"time": "19:00"},
    {"time": "20:00"},
  ];

  int _currentindex = 0;
  int _currentindex1 = 0;
  int _currentindex2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Make Appointment',
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.calendar_today),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 88,
        child: Container(
          height: 88,
          width: 375,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              MyCustomButtonAllUse(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPageView(
                        allDays: allDays,
                        morningTimings: morningTimings,
                        selectedDay: allDays[_currentindex],
                        selectedTime: morningTimings[_currentindex1],
                      ),
                    ),
                  );
                },
                backgroundColor: AppColors.kPrimaryColor,
                text: "Confirm",
              ),
              const SizedBox(height: 30),
              Container(
                height: 5,
                width: 134,
                decoration: BoxDecoration(
                  color: Color(0xff020E22),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your visit date & Time',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You can choose the date and time from the available doctor\'s schedule',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Choose Day, Jan  2024',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: allDays.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _currentindex = index;
                        });
                      },
                      child: Container(
                        height: 76,
                        width: 90,
                        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _currentindex == index
                              ? AppColors.kPrimaryColor
                              : AppColors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              allDays[index]['day'],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: _currentindex == index
                                    ? AppColors.white
                                    : AppColors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              allDays[index]['date'],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: _currentindex == index
                                    ? AppColors.white
                                    : AppColors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Morning Set',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: morningTimings.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _currentindex1 = index;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 70,
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _currentindex1 == index
                              ? AppColors.kPrimaryColor
                              : AppColors.white,
                        ),
                        child: Text(
                          morningTimings[index]['time'],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: _currentindex1 == index
                                ? AppColors.white
                                : AppColors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Afternoon Set',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: afternoonTimings.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _currentindex2 = index;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 70,
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _currentindex2 == index
                              ? AppColors.kPrimaryColor
                              : AppColors.white,
                        ),
                        child: Text(
                          afternoonTimings[index]['time'],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: _currentindex2 == index
                                ? AppColors.white
                                : AppColors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
