class DoctorScheduleSingleton {
  // Private constructor
  DoctorScheduleSingleton._privateConstructor();

  // Instance of the singleton class
  static final DoctorScheduleSingleton _instance =
  DoctorScheduleSingleton._privateConstructor();

  // Factory method to access the instance
  factory DoctorScheduleSingleton() {
    return _instance;
  }

  // Doctor's schedule data
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
}
