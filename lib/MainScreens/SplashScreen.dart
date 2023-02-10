import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qstart/MainScreens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offAll(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            
            child: Image.asset(
              "assets/images/logo.png",
              height: MediaQuery.of(context).size.height /5,
              width: MediaQuery.of(context).size.width/5,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'QSTART',
            style: TextStyle(
                color: Color.fromARGB(255, 77, 82, 89),
                letterSpacing: 2,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Amaranth-Bold'),
          ),
          // Spacer(),
          // Text('where the question ends, we begin'),

        ],
      )),
    );
  }
}
