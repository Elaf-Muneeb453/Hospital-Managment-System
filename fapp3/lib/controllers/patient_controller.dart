import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../patient_dashboard.dart';

class PatientController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final FirebaseAuth _loginauth = FirebaseAuth.instance;

  var patientData = {}.obs;
  var isLoading = true.obs;

  var doctorData = {}.obs;
  //var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPatientData();
  }

  Future<void> registerUser({
    required String name,
    required String age,
    required String address,
    required String phone,
    required String email,
    required String password,
    required String gender,
    Uint8List? image,
  }) async {
    try {
      // Register user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String imageUrl = '';

      // Upload image if available
      if (image != null) {
        String uid = userCredential.user!.uid;
        debugPrint("Uploading image for user: $uid");
        UploadTask uploadTask = _storage
            .ref()
            .child('profileImages')
            .child(uid)
            .putData(image);

        TaskSnapshot snap = await uploadTask;
        imageUrl = await snap.ref.getDownloadURL();
      }

      // Save user data to Firestore
      await _firestore.collection('patients').doc(userCredential.user!.uid).set({
        'name': name,
        'age': age,
        'address': address,
        'phone': phone,
        'email': email,
        'gender': gender,
        'imageUrl': imageUrl,
      });

      Get.snackbar('Success', 'User registered successfully!');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Future<void> fetchPatientData() async {
  //   try {
  //     isLoading(true);
  //     debugPrint("Fetching patient data...");
  //
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       DocumentSnapshot<Map<String, dynamic>> doc =
  //       await FirebaseFirestore.instance.collection('patients').doc(user.uid).get();
  //
  //       if (doc.exists && doc.data() != null) {
  //         patientData.value = doc.data()!;
  //       } else {
  //         debugPrint("No patient data found for the user.");
  //         Get.snackbar('Error', 'No patient data found.');
  //       }
  //     } else {
  //       debugPrint("No authenticated user found.");
  //       Get.snackbar('Error', 'User not authenticated.');
  //     }
  //   } catch (e) {
  //     debugPrint("Error fetching patient data: $e");
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  Future<void> fetchPatientData() async {
    try {
      isLoading(true);  // Show loading indicator while fetching data
      debugPrint("Fetching patient data...");

      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> doc =
        await _firestore.collection('patients').doc(user.uid).get();

        if (doc.exists && doc.data() != null) {
          patientData.value = doc.data()!;
        } else {
          debugPrint("No patient data found for the user.");
          Get.snackbar('Error', 'No patient data found.');
        }
      } else {
        debugPrint("No authenticated user found.");
        Get.snackbar('Error', 'User not authenticated.');
      }
    } catch (e) {
      debugPrint("Error fetching patient data: $e");
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);  // Stop loading indicator after data fetch
    }
  }



  Future<void> signInUser(String email, String password) async {
    try {
      await _loginauth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Success', 'User signed in successfully!');
      // Fetch patient data after signing in
      await fetchPatientData();
      Get.offAll(() => const PDashboard());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}


// Future<void> fetchPatientData() async {
//   try {
//     isLoading(true);
//     debugPrint("Fetching patient data...");
//     User? user =  FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot doc = await FirebaseFirestore.instance.collection('patients').doc(user.uid).get();
//       if (doc.exists) {
//         patientData.value = doc.data() as Map<String, dynamic>;
//       }
//     }
//   } catch (e) {
//     Get.snackbar('Error', e.toString());
//   } finally {
//     isLoading(false);
//   }
// }
