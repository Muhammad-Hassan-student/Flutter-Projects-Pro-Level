import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_projects/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  //initial state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BMI())));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: Colors.orange,
      width: double.infinity,
      child: Center(
        child: Container(
          child: Text(
            "All In One",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Charmonman",
                fontSize: 42,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }
}
