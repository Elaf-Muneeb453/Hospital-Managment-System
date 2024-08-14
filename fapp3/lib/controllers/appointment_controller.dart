// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// class AppointmentController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   var appointments = [].obs;
//   var isLoading = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchAppointments();
//   }
//
//   Future<void> addAppointment(Map<String, dynamic> appointmentData) async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         await _firestore.collection('appointments').add({
//           ...appointmentData,
//           'userId': user.uid,
//         });
//         fetchAppointments();
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
//             .where('userId', isEqualTo: user.uid)
//             .get();
//         appointments.value = querySnapshot.docs.map((doc) => doc.data()).toList();
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
// }

