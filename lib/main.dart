import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:qstart/MainScreens/LoginScreen.dart';
import 'package:qstart/MainScreens/QuestionScreen.dart';
import 'package:qstart/MainScreens/RegistrationScreen.dart';
import 'package:qstart/MainScreens/SplashScreen.dart';
import 'package:qstart/User/AddComplaint.dart';
import 'package:qstart/User/DetailsPage.dart';
import 'package:qstart/User/UserNavScreen.dart';
import 'package:qstart/User/UserScreenHome.dart';

void main(List<String> args)async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(0,37, 150, 190),
      ),
      home:SplashScreen(), 
      debugShowCheckedModeBanner: false,
    );
  }
}