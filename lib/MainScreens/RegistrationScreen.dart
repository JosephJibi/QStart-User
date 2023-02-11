import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/AuthController.dart';
import 'package:qstart/MainScreens/LoginScreen.dart';
import 'package:qstart/utilities/dimensions.dart';
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
            height: Dimensions.height10,
          ),
          Text('Create Account',
              style: TextStyle(
                  letterSpacing: Dimensions.height2,
                  fontSize: Dimensions.height35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amaranth-Bold')),
          Text('to get started now !',
              style: GoogleFonts.firaSans(
                fontSize: Dimensions.height25,
              )),
          //hold photo(gif-Lottie Signup)
          Container(
            height: Dimensions.height230, // +#
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
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height30),
                    topRight: Radius.circular(Dimensions.height30),
                  ),
                  boxShadow:  [
                    BoxShadow(
                      color: const Color.fromARGB(255, 97, 85, 85),
                      spreadRadius: Dimensions.height1,
                      blurRadius: Dimensions.height15,
                    )
                  ]),
              //Second container(Main) 's first child
              child: ListView(physics: const BouncingScrollPhysics(), children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
                  child: Column(
                    children: [
                      //Full Name
                      TextFormField(
                        controller: ctr3.username,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: const Icon(Icons.person),
                            label: const Text('Full Name')),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //Department
                      TextFormField(
                        controller: ctr3.dep,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: const Icon(Icons.class_),
                            label: const Text('Department')),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //Unique number
                      TextFormField(
                        controller: ctr3.uniqueNo,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: const Icon(Icons.numbers_sharp),
                            label: const Text('Unique Number')),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //Phone Number
                      TextFormField(
                        controller: ctr3.phoneNo,
                        keyboardType: TextInputType.phone,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: const Icon(Icons.phone),
                            label: const Text('Phone Number')),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //Email id
                      TextFormField(
                        controller: ctr3.registeremail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputBoxes().maininputDecoration.copyWith(
                            prefixIcon: const Icon(Icons.email),
                            label: const Text('Email Id')),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //password One
                      Obx(
                        ()=>TextFormField(
                          controller: ctr3.registerpass,
                            // _obscureText hold a bool value which tell hide or show password
                            obscureText: ctr3.obscurePassOneSignup.value,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outline),
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(Dimensions.height12)),
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
                        height: Dimensions.height20,
                      ),
                      //sign up button
                      GestureDetector(
                        onTap: (){
                          ctr3.signUp();
                        },
                        child: Obx(
                          ()=> Container(
                            padding:  EdgeInsets.all(Dimensions.height20),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 39, 183, 240),
                                borderRadius: BorderRadius.circular(Dimensions.height12)),
                            child:  Center(
                                child: (ctr3.loading.value == true)?
                                    const CircularProgressIndicator(color: Colors.white,):
                                 Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.height18),
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
