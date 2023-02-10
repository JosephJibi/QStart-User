import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qstart/Controller/AuthController.dart';
import 'package:qstart/MainScreens/LoginScreen.dart';
import 'package:qstart/utilities/inputBox.dart';

//Here setState is called in password field so I used statefull, change to stateless by adding getx
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
  

  //used for show/hide in password two textformfield
  // bool _obscurePasswordTwo = true;
  //set getx instance
  final ctr3 = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Text('Create Account',
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amaranth-Bold')),
          Text('to get started now !',
              style: GoogleFonts.firaSans(
                fontSize: 25,
              )),
          //hold photo(gif-Lottie Signup)
          Container(
            height: 230, // +#
            width: MediaQuery.of(context).size.width, // +#
            child: Image.asset(
              'assets/images/LottieSignup.gif',
              fit: BoxFit.cover,
            ),
          ),
          //Second contaier(Main)
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width, // +#
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 97, 85, 85),
                      spreadRadius: 1,
                      blurRadius: 15,
                    )
                  ]),
              //Second container(Main) 's first child
              child: ListView(physics: BouncingScrollPhysics(), children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      //Full Name
                      TextFormField(
                        controller: ctr3.username,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: Icon(Icons.person),
                            label: Text('Full Name')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Department
                      TextFormField(
                        controller: ctr3.dep,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: Icon(Icons.class_),
                            label: Text('Department')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Unique number
                      TextFormField(
                        controller: ctr3.uniqueNo,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: Icon(Icons.numbers_sharp),
                            label: Text('Unique Number')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Phone Number
                      TextFormField(
                        controller: ctr3.phoneNo,
                        keyboardType: TextInputType.phone,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: Icon(Icons.phone),
                            label: Text('Phone Number')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Email id
                      TextFormField(
                        controller: ctr3.registeremail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: Icon(Icons.email),
                            label: Text('Email Id')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //password One
                      Obx(
                        ()=>TextFormField(
                          controller: ctr3.registerpass,
                            // _obscureText hold a bool value which tell hide or show password
                            obscureText: ctr3.obscurePassOneSignup.value,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12)),
                                label: const Text('Password'),
                                //hide and show button on password field
                                suffixIcon: IconButton(
                                  icon: Icon(ctr3.obscurePassOneSignup.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    
                                      ctr3.obscurePassOneSignup.value = !ctr3.obscurePassOneSignup.value;
                                   
                                  },
                                ))),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      //
                      //reenter password(password two)

                      // TextFormField(
                      //     // _obscureText hold a bool value which tell hide or show password
                      //     obscureText: _obscurePasswordTwo,
                      //     decoration: InputDecoration(
                      //         prefixIcon: Icon(Icons.lock),
                      //         fillColor: Colors.grey[200],
                      //         border: OutlineInputBorder(
                      //             borderSide:
                      //                 const BorderSide(color: Colors.white),
                      //             borderRadius: BorderRadius.circular(12)),
                      //         label: const Text('Comfirm Password'),
                      //         //hide and show button on password field
                      //         suffixIcon: IconButton(
                      //           icon: Icon(_obscurePasswordTwo
                      //               ? Icons.visibility
                      //               : Icons.visibility_off),
                      //           onPressed: () {
                      //             setState(() {
                      //               _obscurePasswordTwo = !_obscurePasswordTwo;
                      //             });
                      //           },
                      //         ))),

                      SizedBox(
                        height: 20,
                      ),
                      //sign up button
                      GestureDetector(
                        onTap: (){
                          ctr3.signUp();
                        },
                        child: Obx(
                          ()=> Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 39, 183, 240),
                                borderRadius: BorderRadius.circular(12)),
                            child:  Center(
                                child: (ctr3.loading.value == true)?
                                    CircularProgressIndicator(color: Colors.white,):
                                const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                      ),
                      //sign in
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have a account ? '),
                          TextButton(
                              onPressed: () {
                                Get.off(LoginScreen());
                              },
                              child: const Text(
                                'Sign In',
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
