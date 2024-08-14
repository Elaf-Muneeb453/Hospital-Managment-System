import 'package:HeartDisease/appointment.dart';
import 'package:HeartDisease/startpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'controllers/appointment_controller.dart';
import 'controllers/patient_controller.dart';

class PDashboard extends StatefulWidget {
  const PDashboard({super.key});

  @override
  State<PDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PDashboard> {
  final PatientController _patientController = Get.find<PatientController>();
  //final AppointmentController _appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Dashboard'),
      ),
      body: Obx(() {
        if (_patientController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_patientController.patientData.isEmpty) {
          return const Center(child: Text('No data available'));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Name: ${_patientController.patientData['name']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                Text(
                  'Age: ${_patientController.patientData['age']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 40),
                Text(
                  'Gender: ${_patientController.patientData['gender']}',
                  style: const TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 90,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPage()),
                        );
                      },
                    child: const Text("Home"),
                  ),
                ),
              ],
            ),
          ),
          // children: [
          //   Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     //crossAxisAlignment: CrossAxisAlignment.center,
          //     //mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       const SizedBox(width: 20),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Name: ${_patientcontroller.patientData['name']}',
          //             style: const TextStyle(fontSize: 18),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Appointments",
          //       style: TextStyle(
          //           fontSize: 18, fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          //

          // ],
        );
      }),
        );
  }
}

// Container(
//   height: 550,
//   child: Obx(() {
//     if (_appointmentController.isLoading.value) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     if (_appointmentController.appointments.isEmpty) {
//       return const Center(child: Text('No appointments found'));
//     }
//
//     return ListView.builder(
//       itemCount: _appointmentController.appointments.length,
//       itemBuilder: (context, index) {
//         final appointment =
//         _appointmentController.appointments[index];
//         return Column(
//           children: [
//             ListTile(
//               title: Text(
//                   'Patient: ${appointment['patientName']}'),
//               subtitle: Text(
//                   'Doctor: ${appointment['doctorName']}'),
//               trailing: Text('Time: ${appointment['timeSlot']}'),
//             ),
//             const Divider(),
//           ],
//         );
//       },
//     );
//   }),
// ),

// ElevatedButton(
//   // onPressed: () {
//   //   Get.to(() => const AppointmentPage());
//   // },
//   child: const Text("Book Appointment"),
// ),

// const SizedBox(height: 10),
// Text(
//   'Age: ${_patientcontroller.patientData['age']}',
//   style: const TextStyle(fontSize: 18),
// ),
// const SizedBox(height: 10),
// Text(
//   'Gender: ${_patientcontroller.patientData['gender']}',
//   style: const TextStyle(fontSize: 18),
// ),

// _patientcontroller.patientData['imageUrl'] != null
//     ? CircleAvatar(
//   radius: 64,
//   backgroundImage: NetworkImage(
//       _patientcontroller.patientData['imageUrl']),
// )
//     : const CircleAvatar(
//   radius: 64,
//   backgroundImage:
//   NetworkImage('https://via.placeholder.com/150'),
// ),
