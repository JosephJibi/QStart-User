import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/AuthController.dart';
import 'package:qstart/MainScreens/QuestionScreen.dart';
import 'package:qstart/MainScreens/RegistrationScreen.dart';

import '../utilities/inputBox.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

  

  final ctr = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 10, //+#
          ),
          //this center and column holds text for welcome
          Center(
            child: Column(
              children: [
                Text('Welcome,',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amaranth-Bold')),
                Text(
                  'Glad to see you!',
                  style: GoogleFonts.firaSans(
                    fontSize: 38,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ), //+#
          //this container holds gif
          Container(
            height: 230, // +#
            width: MediaQuery.of(context).size.width, // +#
            child: Image.asset(
              'assets/images/LottieSignin.gif',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 40,
          ), //+#
          //column for textfields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //email id
                TextFormField(
                  controller: ctr.loginemail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputBoxes().maininputDecoration.copyWith(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      label: Text('Email Id')),
                ),
                SizedBox(
                  height: 15,
                ), //+#
                //password
               
                
                  Obx(
                   () =>TextFormField(
                    controller: ctr.loginpass,
                         // _obscureText hold a bool value which tell hide or show password
                        obscureText: ctr.obscurePassSignin.value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            label: const Text('Password'),
                            //hide and show button on password field
                            suffixIcon: IconButton(
                              icon: Icon( ctr.obscurePassSignin.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                print( ctr.obscurePassSignin.value);
                                // obs() {
                                   ctr.obscurePassSignin.value =  !ctr.obscurePassSignin.value;
                                  print( ctr.obscurePassSignin.value);
                                // }
                              },
                            ),),),
                  ),
                
                
                //forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          popUpBox(context);
                        }, child: const Text('forget password')),
                  ],
                ),
                //sign In button
                GestureDetector(
                  onTap: (){
                    ctr.signin();
                  },
                  child: Obx(
                    ()=> Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 39, 183, 240),
                          borderRadius: BorderRadius.circular(12)),
                      child:  Center(
                          child: (ctr.loading.value == true)?
                          const CircularProgressIndicator(color: Colors.white,):
                          const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ),
                //sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have a account ? '),
                    TextButton(
                        onPressed: () {
                          Get.off( QuestionScreen());
                        },
                        child: const Text(
                          'Sign Up',
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  //popup
   Future popUpBox(BuildContext ctx) async
  {
    print('working');
    return showDialog(
      context: ctx,
          builder: (ctx1) {
      return 
          AlertDialog(
             
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(25))),
            content: Container(
               width: MediaQuery.of(ctx).size.width,
            height: 300,
               padding: EdgeInsets.all(11.0),
            color: Colors.white,
              child: ListView(
                children: [
                  Center(child: Text('Forgot Password',style: GoogleFonts.poppins(fontSize: 30))),
                  SizedBox(height: 10,),
                TextFormField(
                  controller: ctr.resetEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputBoxes().maininputDecoration.copyWith(
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          label: Text('Email Id')),
                    ),
                SizedBox(height: 20,),
                 GestureDetector(
                  onTap: (){
                    ctr.resetpassword();
                  },
                   child: Container(
                      height: 50,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 39, 183, 240),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          'Send Reset Link',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                      ),
                 ),
                    SizedBox(height: 20,),
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop();
                    }, child: Text('Close'))
                
              ]),
            ),
          );
          }
    );
  }
}
