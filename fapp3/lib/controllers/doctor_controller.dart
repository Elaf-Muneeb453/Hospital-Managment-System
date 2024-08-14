// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import '../doctor_dashboard.dart';
//
// class DoctorController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   var doctorData = {}.obs;
//   var isLoading = true.obs;
//   var doctorNames = <String>[].obs; // Observable list of doctor names
//   var appointments = <Map<String, dynamic>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchDoctorData();
//     fetchDoctorNames(); // Fetch doctor names on initialization
//     fetchAppointments();
//   }
//
//   Future<void> registerUser({
//     required String name,
//     required String phone,
//     required String specialization,
//     required String email,
//     required String password,
//     required String gender,
//     Uint8List? image,
//   }) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       String imageUrl = '';
//
//       if (image != null) {
//         String uid = userCredential.user!.uid;
//         UploadTask uploadTask = _storage
//             .ref()
//             .child('profileImages')
//             .child(uid)
//             .putData(image);
//
//         TaskSnapshot snap = await uploadTask;
//         imageUrl = await snap.ref.getDownloadURL();
//       }
//
//       await _firestore.collection('doctors').doc(userCredential.user!.uid).set({
//         'name': name,
//         'phone': phone,
//         'specialization': specialization,
//         'email': email,
//         'gender': gender,
//         'imageUrl': imageUrl,
//       });
//
//       Get.snackbar('Success', 'Doctor registered successfully!');
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }
//
//   Future<void> fetchDoctorData() async {
//     try {
//       isLoading(true);
//       User? user = _auth.currentUser;
//       if (user != null) {
//         _firestore.collection('doctors').doc(user.uid).snapshots().listen((doc) {
//           if (doc.exists) {
//             doctorData.value = doc.data() as Map<String, dynamic>;
//           }
//         });
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   Future<void> fetchDoctorNames() async {
//     try {
//       // Fetch all doctor documents and extract names
//       QuerySnapshot querySnapshot = await _firestore.collection('doctors').get();
//       doctorNames.value = querySnapshot.docs.map((doc) => doc['name'] as String).toList();
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }
//
//   Future<void> signInUser(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
//
//       User? user = userCredential.user;
//       if (user == null) {
//         Get.snackbar('Error', 'User not found');
//         return;
//       }
//
//       DocumentSnapshot doctorDoc = await _firestore.collection('doctors').doc(user.uid).get();
//       if (doctorDoc.exists) {
//         Get.offAll(() => const DoctorDashboard());
//       } else {
//         Get.snackbar('Error', 'User not recognized as a doctor');
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }
//
//   Future<void> fetchAppointments() async {
//     try {
//       isLoading(true);
//       User? user = _auth.currentUser;
//       if (user != null) {
//         QuerySnapshot querySnapshot = await _firestore
//             .collection('appointments')
//             .where('doctor', isEqualTo: user.uid)
//             .get();
//         appointments.value = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../doctor_dashboard.dart';

class DoctorController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  var doctorData = {}.obs;
  var isLoading = true.obs;

  //
  // var doctorNames = <String>[].obs; // Observable list of doctor names
  // var appointments = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctorData();
    // fetchDoctorNames(); // Fetch doctor names on initialization
    // fetchAppointments();
  }

  Future<void> registerUser({
    required String name,
    required String phone,
    required String specialization,
    required String email,
    required String password,
    required String gender,
    Uint8List? image,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String imageUrl = '';

      if (image != null) {
        String uid = userCredential.user!.uid;
        UploadTask uploadTask = _storage
            .ref()
            .child('profileImages')
            .child(uid)
            .putData(image);

        TaskSnapshot snap = await uploadTask;
        imageUrl = await snap.ref.getDownloadURL();
      }

      await _firestore.collection('doctors').doc(userCredential.user!.uid).set({
        'name': name,
        'phone': phone,
        'specialization': specialization,
        'email': email,
        'gender': gender,
        'imageUrl': imageUrl,
      });

      Get.snackbar('Success', 'Doctor registered successfully!');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> fetchDoctorData() async {
    try {
      isLoading(true);
      debugPrint("Fetching patient data...");

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('doctors').doc(user.uid).get();

        if (doc.exists && doc.data() != null) {
          doctorData.value = doc.data()!;
        } else {
          debugPrint("No doctors data found for the user.");
          Get.snackbar('Error', 'No doctors data found.');
        }
      } else {
        debugPrint("No authenticated user found.");
        Get.snackbar('Error', 'User not authenticated.');
      }
    } catch (e) {
      debugPrint("Error fetching doctors data: $e");
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = userCredential.user;
      if (user == null) {
        Get.snackbar('Error', 'User not found');
        return;
      }

      DocumentSnapshot doctorDoc = await _firestore.collection('doctors').doc(
          user.uid).get();
      if (doctorDoc.exists) {
        Get.offAll(() => const DoctorDashboard());
      } else {
        Get.snackbar('Error', 'User not recognized as a doctor');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}


// Future<void> fetchDoctorData() async {
//   try {
//     isLoading(true);
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot doc = await FirebaseFirestore.instance.collection(
//           'doctors').doc(user.uid).get();
//       if (doc.exists) {
//         doctorData.value = doc.data() as Map<String, dynamic>;
//       }
//     }
//   } catch (e) {
//     Get.snackbar('Error', e.toString());
//   } finally {
//     isLoading(false);
//   }
// }

// Future<void> fetchAppointments() async {
//   try {
//     isLoading(true);
//     User? user = _auth.currentUser;
//     if (user != null) {
//       _firestore.collection('appointments').where('doctor', isEqualTo: user.uid).snapshots().listen((querySnapshot) {
//         appointments.value = querySnapshot.docs.map((doc) => doc.data()).toList();
//       });
//     }
//   } catch (e) {
//     Get.snackbar('Error', e.toString());
//   } finally {
//     isLoading(false);
//   }
// }

// Future<void> fetchDoctorNames() async {
//   try {
//     // Fetch all doctor documents and extract names
//     QuerySnapshot querySnapshot = await _firestore.collection('doctors').get();
//     doctorNames.value = querySnapshot.docs.map((doc) => doc['name'] as String).toList();
//   } catch (e) {
//     Get.snackbar('Error', e.toString());
//   }
// }

    //   Future<void> signInUser(String email, String password) async {
    //     try {
    //       await _loginauth.signInWithEmailAndPassword(
    //           email: email, password: password);
    //       Get.snackbar('Success', 'User signed in successfully!');
    //       Get.offAll(() => const DoctorDashboard());
    //     } catch (e) {
    //       Get.snackbar('Error', e.toString());
    //     }
    //   }
    // }


