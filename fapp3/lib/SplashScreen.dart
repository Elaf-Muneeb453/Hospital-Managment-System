import 'dart:async';
import 'package:HeartDisease/FirstPage.dart';
import 'package:HeartDisease/startpage.dart';
import 'package:flutter/material.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}): super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
       const Duration(seconds: 3),
            () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartPage())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
