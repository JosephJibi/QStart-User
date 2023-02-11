import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/User/UserNavScreen.dart';
import 'package:qstart/utilities/dimensions.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
                height: Dimensions.height280, //
                child: Image.asset(
                  'assets/images/emailverification.gif',
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                  child: Text(
                'Note: Verify your email id and tap the here to continue',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: Dimensions.height22,
                    color: Colors.lightBlue),
                textAlign: TextAlign.center,
                
              ),
              onTap: (){
                checkVerified();
              },
              ),
              Text(
                '(Check your email)',
                style: GoogleFonts.poppins(fontSize: Dimensions.height15),
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
     final firebaseAuth = FirebaseAuth.instance;
    var user = firebaseAuth.currentUser!;
    await user.reload();
    user = firebaseAuth.currentUser!;
    bool flag = user.emailVerified;
    if (flag == true) {
      Get.offAll(UserNavScreen());
    } else {
      Get.snackbar("Email", "Email not verified");
    }
  }
