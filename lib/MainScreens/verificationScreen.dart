import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/AuthController.dart';
import 'package:qstart/User/UserNavScreen.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  // FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // var verify = auth.currentUser?.emailVerified.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 280, //
                child: Image.asset(
                  'assets/images/emailverification.gif',
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                  child: Text(
                'Note: Verify your email id and tap the here to continue',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 22,
                    color: Colors.lightBlue),
                textAlign: TextAlign.center,
                
              ),
              onTap: (){
                checkVerified();
              },
              ),
              Text(
                '(Check your email)',
                style: GoogleFonts.poppins(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
 checkVerified() async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    // await auth.reload();
    // var verify = auth.currentUser?.emailVerified;
    // print(auth.currentUser?.emailVerified);
    // print(auth.currentUser?.email);
     final _firebaseAuth = FirebaseAuth.instance;
    var user = _firebaseAuth.currentUser!;
    await user.reload();
    user = await _firebaseAuth.currentUser!;
    bool flag = user.emailVerified;
    if (flag == true) {
      Get.offAll(UserNavScreen());
      print('working');
    } else {
      Get.snackbar("Email", "Email not verified");
    }
  }
