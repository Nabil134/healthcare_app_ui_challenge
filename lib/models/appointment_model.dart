import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';

class AppointmentModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  AppointmentModel({required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });
}
List <AppointmentModel> AppointmentData=[
AppointmentModel(icon: Icons.hearing_sharp, title: 'Ear, Nose & Throat',
    subtitle: "Wide selection of doctor's specialties", iconColor: Colors.yellow),
  AppointmentModel(icon: Icons.psychology, title: 'Psychiatrist',
      subtitle: "Wide selection of doctor's specialties", iconColor: Colors.pink),
  AppointmentModel(icon: Icons.medical_information, title: 'Dentist',
      subtitle: "Wide selection of doctor's specialties", iconColor: AppColors.kPrimaryColor),
  AppointmentModel(icon: Icons.clean_hands_outlined, title: 'Dermato-veneorologis',
      subtitle: "Wide selection of doctor's specialties", iconColor: Colors.yellow),

];