// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'controllers/appointment_controller.dart';
//
// class AppointmentPage extends StatefulWidget {
//   const AppointmentPage({super.key});
//
//   @override
//   State<AppointmentPage> createState() => _AppointmentPageState();
// }
//
// class _AppointmentPageState extends State<AppointmentPage> {
//   String? selectedValue;
//   String? selectedHistory;
//   String? diseaseName;
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _doctorController = TextEditingController();
//   final TextEditingController _timeSlotController = TextEditingController();
//
//   final AppointmentController _appointmentController = Get.put(AppointmentController());
//
//   void bookAppointment() {
//     final appointmentData = {
//       'Name': _nameController.text,
//       'gender': selectedValue,
//       'age': _ageController.text,
//       'phone': _phoneController.text,
//       'address': _addressController.text,
//       'diseaseName': diseaseName,
//       'doctor': _doctorController.text,
//       'timeSlot': _timeSlotController.text,
//       'previousHistory': selectedHistory,
//     };
//
//     _appointmentController.addAppointment(appointmentData);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Appointment Booking'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       labelText: 'First Name',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Gender'),
//                     value: selectedValue,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedValue = newValue!;
//                       });
//                     },
//                     items: <String>['Male', 'Female']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _ageController,
//                     decoration: const InputDecoration(
//                       labelText: 'Age',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _phoneController,
//                     decoration: const InputDecoration(
//                       labelText: 'Phone Number',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _addressController,
//                     decoration: const InputDecoration(
//                       labelText: 'Address',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Disease Name'),
//                     value: diseaseName,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         diseaseName = newValue!;
//                       });
//                     },
//                     items: <String>['Disease1', 'Disease2']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Available Doctor'),
//                     value: diseaseName,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         diseaseName = newValue!;
//                       });
//                     },
//                     items: <String>['Doctor1', 'Doctor2']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _timeSlotController,
//                     decoration: const InputDecoration(
//                       labelText: 'Time Slot',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Previous History'),
//                     value: selectedHistory,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedHistory = newValue!;
//                       });
//                     },
//                     items: <String>['Yes', 'No']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 60),
//                 ElevatedButton(
//                   onPressed: bookAppointment,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 10), // Adjust padding as needed
//                   ),
//                   child: const Text('Book Appointment'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controllers/appointment_controller.dart';
// import 'controllers/doctor_controller.dart';
// //
// class AppointmentPage extends StatefulWidget {
//   const AppointmentPage({super.key});
//
//   @override
//   State<AppointmentPage> createState() => _AppointmentPageState();
// }
//
// class _AppointmentPageState extends State<AppointmentPage> {
//   String? selectedValue;
//   String? selectedHistory;
//   String? diseaseName;
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _timeSlotController = TextEditingController();
//
//   final AppointmentController _appointmentController =
//       Get.put(AppointmentController());
//   final DoctorController _doctorController = Get.put(DoctorController());
//   //
//   void bookAppointment() {
//     final appointmentData = {
//       'Name': _nameController.text,
//       'gender': selectedValue,
//       'age': _ageController.text,
//       'phone': _phoneController.text,
//       'address': _addressController.text,
//       'diseaseName': diseaseName,
//       'doctor': selectedValue,
//       'timeSlot': _timeSlotController.text,
//       'previousHistory': selectedHistory,
//     };
//
//     _appointmentController.addAppointment(appointmentData);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Appointment Booking'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       labelText: 'First Name',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Gender'),
//                     value: selectedValue,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedValue = newValue!;
//                       });
//                     },
//                     items: <String>['Male', 'Female']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _ageController,
//                     decoration: const InputDecoration(
//                       labelText: 'Age',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _phoneController,
//                     decoration: const InputDecoration(
//                       labelText: 'Phone Number',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _addressController,
//                     decoration: const InputDecoration(
//                       labelText: 'Address',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Disease Name'),
//                     value: diseaseName,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         diseaseName = newValue!;
//                       });
//                     },
//                     items: <String>['Disease1', 'Disease2']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: TextField(
//                     controller: _timeSlotController,
//                     decoration: const InputDecoration(
//                       labelText: 'Time Slot',
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: DropdownButtonFormField<String>(
//                     hint: const Text('Previous History'),
//                     value: selectedHistory,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedHistory = newValue!;
//                       });
//                     },
//                     items: <String>['Yes', 'No']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30.5),
//                 SizedBox(
//                   width: 800,
//                   child: Obx(() {
//                     return DropdownButtonFormField<String>(
//                       hint: const Text('Available Doctor'),
//                       value: selectedValue,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedValue = newValue!;
//                         });
//                       },
//                       items: _doctorController.doctorNames
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.all(10),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 2.5,
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 60),
//                 ElevatedButton(
//                   onPressed: bookAppointment,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 10), // Adjust padding as needed
//                   ),
//                   child: const Text('Book Appointment'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
