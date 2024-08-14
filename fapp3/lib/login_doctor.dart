// // import 'package:HeartDisease/doctor_dashboard.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:HeartDisease/doctor.dart'; // Import the doctor page
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:HeartDisease/controllers/doctor_controller.dart';
// // import 'package:get/get.dart';
// //
// // class LoginDoctor extends StatefulWidget {
// //   const LoginDoctor({super.key});
// //   @override
// //   State<LoginDoctor> createState() => _LoginDoctorState();
// // }
// //
// // class _LoginDoctorState extends State<LoginDoctor> {
// //
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   final DoctorController _doctorController = Get.put(DoctorController());
// //
// //   void _signIn() async {
// //       try {
// //         await _doctorController.signInUser(
// //           _emailController.text.trim(),
// //           _passwordController.text.trim(),
// //         );
// //         Fluttertoast.showToast(
// //           msg: FirebaseAuth.instance.currentUser?.email ?? '',
// //           toastLength: Toast.LENGTH_SHORT,
// //           gravity: ToastGravity.BOTTOM,
// //           timeInSecForIosWeb: 2,
// //           backgroundColor: Colors.green,
// //           textColor: Colors.white,
// //           fontSize: 16.0,
// //         );
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (context) => const DoctorDashboard()),
// //         );
// //       } catch (e) {
// //         // If there's an error, display it in a toast
// //         Fluttertoast.showToast(
// //           msg: "Error: ${e.toString()}",
// //           toastLength: Toast.LENGTH_SHORT,
// //           gravity: ToastGravity.BOTTOM,
// //           timeInSecForIosWeb: 2,
// //           backgroundColor: Colors.red,
// //           textColor: Colors.white,
// //           fontSize: 16.0,
// //         );
// //       }
// //   }
// //
// //   void _validateAndNavigate() {
// //     if (_formKey.currentState!.validate()) {
// //       _signIn();
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Heart Disease System'),
// //       ),
// //       body: Center(
// //         child: SingleChildScrollView(
// //           padding:
// //           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// //           child: SizedBox(
// //             width: 800,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     children: [
// //                       const SizedBox(height: 10),
// //                       TextFormField(
// //                         keyboardType: TextInputType.text,
// //                         controller: _emailController,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Email',
// //                           contentPadding: EdgeInsets.all(10),
// //                           prefixIcon: Icon(Icons.alternate_email),
// //                           border: OutlineInputBorder(
// //                             borderSide: BorderSide(
// //                               color: Colors.black,
// //                               width: 2.5,
// //                             ),
// //                           ),
// //                         ),
// //                         validator: (String? value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter email';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                      const SizedBox(height: 30),
// //                       TextFormField(
// //                         keyboardType: TextInputType.text,
// //                         controller: _passwordController,
// //                         obscureText: true,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Password',
// //                           contentPadding: EdgeInsets.all(10),
// //                           prefixIcon: Icon(Icons.lock_open),
// //                           border: OutlineInputBorder(
// //                             borderSide: BorderSide(
// //                               color: Colors.black,
// //                               width: 2.5,
// //                             ),
// //                           ),
// //                         ),
// //                         validator: (String? value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter password';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 45),
// //                       ElevatedButton(
// //                         onPressed: _validateAndNavigate,
// //                         child: const Text(
// //                           'Login',
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 20),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => const DoctorPage()),
// //                           );
// //                         },
// //                         child: const Text(
// //                           'Sign Up',
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
//


import 'package:HeartDisease/doctor_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:HeartDisease/controllers/doctor_controller.dart';
import 'package:get/get.dart';

import 'Doctor.dart';

class LoginDoctor extends StatefulWidget {
  const LoginDoctor({super.key});
  @override
  State<LoginDoctor> createState() => _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  final DoctorController _doctorController = Get.put(DoctorController());

  void _signIn() async {
    try {
      await _doctorController.signInUser(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      // If sign-in is successful, display a toast with the user's email
      Fluttertoast.showToast(
        msg: FirebaseAuth.instance.currentUser?.email ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const DoctorDashboard()),
      );
    } catch (e) {
      // If there's an error, display it in a toast
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _validateAndNavigate() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            width: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.alternate_email),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.5,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.lock_open),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.5,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 45),
                      ElevatedButton(
                        onPressed: _validateAndNavigate,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DoctorPage()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

