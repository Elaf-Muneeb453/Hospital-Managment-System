
import 'package:HeartDisease/FirstPage.dart';
import 'package:HeartDisease/login_doctor.dart';
import 'package:HeartDisease/patient.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 27),
                _buildButton('assets/admin.png', 'Admin', () {
                  // Handle Admin button press
                }),
                const SizedBox(height: 50),
                _buildButton('assets/doctor.png', 'Doctor', () {
                  // Handle Doctor button press
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginDoctor()),
                                    );
                }),
                const SizedBox(height: 40),
                _buildButton('assets/patient.png', 'Patient', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPatient()),
                  );
                  // Handle Patient button press
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String imagePath, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(
            imagePath,
            width: 50, // Set the desired width
            height: 38, // Set the desired height
          ),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
