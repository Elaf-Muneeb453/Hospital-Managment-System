// import 'package:HeartDisease/doctor_dashboard.dart';
// import 'package:HeartDisease/patient.dart';
// import 'package:HeartDisease/patient_dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:HeartDisease/doctor.dart'; // Import the doctor page
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class FirstPage extends StatefulWidget {
//   const FirstPage({super.key});
//
//   @override
//   FirstPageFormState createState() => FirstPageFormState();
// }
//
// class FirstPageFormState extends State<FirstPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool isPatientSelected = false;
//   bool isDoctorSelected = false;
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   void _authentication() {
//     _auth
//         .createUserWithEmailAndPassword(
//             email: _emailController.text.toString(),
//             password: _emailController.text.toString())
//         .then((value) {
//       Fluttertoast.showToast(
//           msg: value.user!.email.toString(),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }).onError((error, stackTrace) {
//       Fluttertoast.showToast(
//           msg: error.toString(),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     });
//   }
//   // void _toggleSelection(String role) {
//   //   setState(() {
//   //     if (role == 'patient') {
//   //       isPatientSelected = true;
//   //       isDoctorSelected = false;
//   //     } else if (role == 'doctor') {
//   //       isPatientSelected = false;
//   //       isDoctorSelected = true;
//   //     }
//   //   });
//   // }
//
//   void _validateAndNavigate() {
//     if (_formKey.currentState!.validate()) {
//       _authentication();
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const PDashboard()),
//       );
//       //     if (isPatientSelected) {
//       //       _authentication();
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(builder: (context) => const PDashboard()),
//       //       );
//       //     } else if (isDoctorSelected) {
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(builder: (context) => const DoctorDashboard()),
//       //       );
//       //     }
//     }
//   }
//   //
//   // void _navigateToSignUp() {
//   //     if (isPatientSelected) {
//   //       Navigator.push(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => const PatientPage()),
//   //       );
//   //     } else if (isDoctorSelected) {
//   //       Navigator.push(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => const DoctorPage()),
//   //       );
//   //     }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Heart Disease System'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding:
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: SizedBox(
//             width: 800,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _emailController,
//                         decoration: const InputDecoration(
//                           labelText: 'Enter Email',
//                           contentPadding: EdgeInsets.all(10),
//                           prefixIcon: Icon(Icons.alternate_email),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.black,
//                               width: 2.5,
//                             ),
//                           ),
//                         ),
//                         validator: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           labelText: 'Enter password',
//                           contentPadding: EdgeInsets.all(10),
//                           prefixIcon: Icon(Icons.lock_open),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.black,
//                               width: 2.5,
//                             ),
//                           ),
//                         ),
//                         validator: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 45),
//                       ElevatedButton(
//                         onPressed: _validateAndNavigate,
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const PatientPage()),
//                           );
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // const SizedBox(height: 80), // Adjust as needed
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     AnimatedOpacity(
//                 //       opacity: isDoctorSelected ? 0.4 : 1.0,
//                 //       duration: const Duration(milliseconds: 500),
//                 //       child: ElevatedButton(
//                 //         onPressed: () {
//                 //           _toggleSelection('patient');
//                 //         },
//                 //         child: const Text('Patient'),
//                 //       ),
//                 //     ),
//                 //     const SizedBox(width: 90),
//                 //     AnimatedOpacity(
//                 //       opacity: isPatientSelected ? 0.4 : 1.0,
//                 //       duration: const Duration(milliseconds: 500),
//                 //       child: ElevatedButton(
//                 //         onPressed: () {
//                 //           _toggleSelection('doctor');
//                 //         },
//                 //         child: const Text('Doctor'),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:HeartDisease/doctor_dashboard.dart';
// import 'package:HeartDisease/patient.dart';
// import 'package:HeartDisease/patient_dashboard.dart';
// import 'package:HeartDisease/secondpage.dart';
// import 'package:flutter/material.dart';
// import 'package:HeartDisease/doctor.dart'; // Import the doctor page
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class FirstPage extends StatefulWidget {
//   const FirstPage({super.key});
//
//   @override
//   FirstPageFormState createState() => FirstPageFormState();
// }
//
// class FirstPageFormState extends State<FirstPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool isPatientSelected = false;
//   bool isDoctorSelected = false;
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   void _signIn() async {
//     await _auth
//         .signInWithEmailAndPassword(
//         email: _emailController.text.toString(),
//         password: _passwordController.text.toString())
//         .then((value) {
//       Fluttertoast.showToast(
//           msg: value.user!.email.toString(),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const PDashboard()),
//       );
//     }).onError((error, stackTrace) {
//       debugPrint(error.toString());
//       Fluttertoast.showToast(
//           msg: "Error: ${error.toString()}",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     });
//   }
//
//   void _validateAndNavigate() {
//     if (_formKey.currentState!.validate()) {
//       _signIn();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Heart Disease System'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: SizedBox(
//             width: 800,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _emailController,
//                         decoration: const InputDecoration(
//                           labelText: 'Enter Email',
//                           contentPadding: EdgeInsets.all(10),
//                           prefixIcon: Icon(Icons.alternate_email),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.black,
//                               width: 2.5,
//                             ),
//                           ),
//                         ),
//                         validator: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           labelText: 'Enter password',
//                           contentPadding: EdgeInsets.all(10),
//                           prefixIcon: Icon(Icons.lock_open),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.black,
//                               width: 2.5,
//                             ),
//                           ),
//                         ),
//                         validator: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 45),
//                       ElevatedButton(
//                         onPressed: _validateAndNavigate,
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const PatientPage()),
//                           );
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

