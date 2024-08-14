import 'package:HeartDisease/Doctor.dart';
import 'package:HeartDisease/doctor_dashboard.dart';
import 'package:HeartDisease/login.dart';
import 'package:HeartDisease/login_doctor.dart';
import 'package:HeartDisease/patient.dart';
import 'package:HeartDisease/SplashScreen.dart';
import 'package:HeartDisease/patient_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //   // Get.put(() => AppointmentController());
  //Get.put(() => DoctorController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GetMaterialApp(
    initialBinding:  BindingsBuilder(() {
      // Get.put(() => PatientController());
      // Get.lazyPut<DoctorController>(() => DoctorController());
      // Get.lazyPut<PatientController>(() => PatientController());
    //   // Get.put(() => AppointmentController());
      //Get.put(() => DoctorController());
    }),
    debugShowCheckedModeBanner: false,
    home: const Splashscreen(),
    routes: {
      // 'FirstPage': (context) => const FirstPage(),
      'login': (context) => const LoginPatient(),
      'patient': (context) => const PatientPage(),
      'doctor': (context) => const DoctorPage(),
      'login_doctor': (context) => const LoginDoctor(),
      'doctor_dashboard': (context) => const DoctorDashboard(),
      'patient_dashboard': (context) => const PDashboard()
    },
  ));
}
