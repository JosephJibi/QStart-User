import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qstart/MainScreens/RegistrationScreen.dart';

import '../Controller/AuthController.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

//   @override
//   State<QuestionScreen> createState() => _QuestionScreenState();
// }

// class _QuestionScreenState extends State<QuestionScreen> {
   final ctr1 = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 30, // +#
          ),
          //text
          const Text('Who are you ?',
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amaranth-Bold')),
          const SizedBox(
            height: 20,
          ), // +#
          //photo container
          Container(
            height: 300, // +#
            width: MediaQuery.of(context).size.width, // +#
            child: Image.asset(
              'assets/images/LottieQuestion.gif',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
            
            SizedBox(height: 30,),        //+#
            //row for student?
            Obx(
              () =>  Row(
              
                children: [
                  Checkbox(
                      value: ctr1.isCheckedStudent.value,
                      onChanged: (bool? value) {
                      
                          ctr1.isCheckedStudent.value = value!;
                          ctr1.isCheckedEmployee.value = false;
                          ctr1.isCheckedWorker.value = false;
                      
                      }),
                  Text(
                    'I\'m a student   ',
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  if(ctr1.isCheckedStudent.value== true)
                  //  Icon(
                  //   Icons.check,
                  //   color: Colors.green,
                  //   size: 30,
                  // ),
                  Lottie.network("https://assets8.lottiefiles.com/packages/lf20_AWGRRVDFNv.json",
                  animate: true,
                  repeat: false,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 90
                  )
                ],
              ),
            ),
            //row for employees?
            Obx(
              
              () =>  Row(
              
                children: [
                  Checkbox(
                      value: ctr1.isCheckedEmployee.value,
                      onChanged: (bool? value) {
                 
                          ctr1.isCheckedEmployee.value = value!;
                          ctr1.isCheckedStudent.value =false;
                          ctr1.isCheckedWorker.value =false;
                      
                      }),
                  Text(
                    'I\'m a Employee',
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  if(ctr1.isCheckedEmployee.value==true)
                  //  Icon(
                  //   Icons.check,
                  //   color: Colors.green,
                  //   size: 30,
                  // ),
                  Lottie.network("https://assets8.lottiefiles.com/packages/lf20_AWGRRVDFNv.json",
                  animate: true,
                  repeat: false,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 90
                  )
                ],
              ),
            ),
            //row for Worker?
            Obx(
              () =>  Row(
                
                children: [
                  Checkbox(
                      value: ctr1.isCheckedWorker.value,
                      onChanged: (bool? value) {
                    
                          ctr1.isCheckedWorker.value = value!;
                          ctr1.isCheckedStudent.value = false;
                          ctr1.isCheckedEmployee.value=false;
                      
                      }),
                  Text(
                    'I\'m a Worker     ',
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  if(ctr1.isCheckedWorker.value==true)
                  //  Icon(
                  //   Icons.check,
                  //   color: Colors.green,
                  //   size: 30,
                  // ),
                  Lottie.network("https://assets8.lottiefiles.com/packages/lf20_AWGRRVDFNv.json",
                  animate: true,
                  repeat: false,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 90
                  ),
                ],
              ),
            ),
            //next button
             GestureDetector(
              onTap: () {
                ontaponNext();
              } ,
               child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 183, 240),
                              borderRadius: BorderRadius.circular(12)),
                          child:  Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text(
                            'Next ',
                            
                            style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward,color: Colors.white,),
                                ],
                              )),
                        ),
             ),
            ],
            ),
            
          ),
          
        ],
      )),
    );
  }
  void ontaponNext(){
    if(ctr1.isCheckedStudent.value){
                  ctr1.type = "Student";
                }
                else if(ctr1.isCheckedEmployee.value){
                  ctr1.type = "Employee";
                }
                else if(ctr1.isCheckedWorker.value){
                  ctr1.type = "Worker";
                }
                if(ctr1.type != null){
                  Get.to(RegistrationScreen());
                }
                else{
                  Get.snackbar( "Alert","Select a option to continue",backgroundColor: Color.fromARGB(255, 169, 201, 228));
                }
  }
}
