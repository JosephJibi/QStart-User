import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qstart/MainScreens/LoginScreen.dart';
import 'package:qstart/MainScreens/verificationScreen.dart';
import 'package:qstart/User/UserNavScreen.dart';
import 'package:qstart/utilities/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/AuthController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //authcontroller instance
   final ctrl = Get.put(AuthController());
    //auth
   FirebaseAuth auth = FirebaseAuth.instance;
  String? userUid;
  @override
  void initState() {
    super.initState();
    getUid().whenComplete(() {
        Timer(const Duration(seconds: 3), () {
            if(userUid==null){
           
              Get.offAll(LoginScreen());
            }
            else{

              Get.offAll(const UserNavScreen());
            }
         
      
                
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: MediaQuery.of(context).size.height /5,
            width: MediaQuery.of(context).size.width/5,
            fit: BoxFit.cover,
          ),
          Text(
            'QSTART',
            style: TextStyle(
                color: const Color.fromARGB(255, 77, 82, 89),
                letterSpacing: Dimensions.height2,
                fontSize: Dimensions.height40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Amaranth-Bold'),
          ),
          // Spacer(),
          // Text('where the question ends, we begin'),

        ],
      )),
    );
  }
  Future getUid()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userUid= prefs.getString("uid");
    if(userUid!= null){
        await ctrl.profiledetails();
    }
    

  }
}
