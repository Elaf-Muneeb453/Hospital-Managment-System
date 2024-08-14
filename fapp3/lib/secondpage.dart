// import 'package:HeartDisease/FirstPage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class SecondPage extends StatefulWidget {
//   const SecondPage({super.key});
//
//   @override
//   State<SecondPage> createState() => _SecondPageState();
// }
//
// class _SecondPageState extends State<SecondPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool isPatientSelected = false;
//   bool isDoctorSelected = false;
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   void _authentication() async {
//     await _auth
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
//
//   void _validateAndNavigate() {
//     if (_formKey.currentState!.validate()) {
//       _authentication();
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const FirstPage()),
//       );
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
//                           'Save',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       // const SizedBox(height: 20),
//                       // ElevatedButton(
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //           builder: (context) => const PatientPage()),
//                       //     );
//                       //   },
//                       //   child: const Text(
//                       //     'Sign Up',
//                       //     style: TextStyle(
//                       //       fontWeight: FontWeight.bold,
//                       //     ),
//                       //   ),
//                       // ),
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
