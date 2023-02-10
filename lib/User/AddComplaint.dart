import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qstart/Controller/AuthController.dart';
import 'package:qstart/Controller/complaintController.dart';
import 'package:qstart/utilities/colors.dart';
import 'package:qstart/utilities/inputBox.dart';

class AddComplaint extends StatelessWidget {
   AddComplaint({super.key});

  final ctrl = Get.put(complaintController());
 

  @override
  Widget build(BuildContext context) {
    return Container(
      //container for main background color
      decoration: BoxDecoration(gradient: AppColor().secondGradient),
      child: 
         Center(
          child: Column(children: [
            //main column
            Container(
              //top most container having gradient background
              decoration: BoxDecoration(gradient: AppColor().mainGradient),
              child: Column(
                children: [
                  //sized box for get logo on correct position(instead of appbar)
                  SizedBox(
                    height: 59,
                  ),
                  //row which hold logo and main name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //logo container
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(             //App Name
                          'QSTART',
                          style: TextStyle(
                              color: Color.fromARGB(255, 77, 82, 89),
                              letterSpacing: 2,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Amaranth-Bold'),
                        ),
                    ],
                  ),
                  //sizedbox between logo and file a complaint text
                  SizedBox(height: 30,),
                  Text('File a Complaint',
                      style: GoogleFonts.anybody(
                          color: Color.fromARGB(255, 67, 77, 82),
                          fontSize: 30)),
                  //sized box to move the second container little down
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            //second container
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                //main column of second container
                child: SingleChildScrollView(

                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      
                      //title textfield
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, right: 25.0, left: 25.0),
                        child: TextFormField(
                          // maxLength: 18,
                          controller:ctrl.title ,
                          decoration: inputBoxes()
                              .maininputDecoration
                              .copyWith(label: Text('Title')),
                        ),
                      ), 
                      //sizedbox between title and location textfield
                      SizedBox(
                        height: 10,
                      ),
                
                      //location hint
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: ctrl.locationhint,
                          decoration: inputBoxes()
                              .maininputDecoration
                              .copyWith(label: Text('Location hint')),
                        ),
                      ),
                      //sizedbox between location and description  textfield
                      SizedBox(
                        height: 10,
                      ),
                      //description box
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: ctrl.description,
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                          decoration: inputBoxes()
                              .maininputDecoration
                              .copyWith(label: Text('Description')),
                        ),
                      ),
                          //sizedbox between description textbox and add image stack
                      SizedBox(height: 15,),
                      //image add stack
                       Stack(
                      
                        children: [
                          //image container
                          Container(
                height: 190,
                width: 170,
                child: Obx(
                  ()=> ClipRRect(
                      borderRadius: BorderRadius.circular(30),          //
                      child: 
                      (ctrl.loadimgusingpath.value=='')?
                      Image.asset(
                        fit: BoxFit.cover,
                        
                        
                        'assets/images/nophoto.png'
                        
                      ):
                      Image.file(File(ctrl.loadimgusingpath.value))
                      
                    
                      ),
                )),
                    //image add icon
                          Positioned(
                            top: 140,                       //
                            left: 120,                      //
                            child: Obx(
                              ()=> IconButton(
                                  onPressed: (){
                                    (ctrl.loadimgusingpath.value=='')?
                                    ctrl.accessImage():
                                    
                                    ctrl.loadimgusingpath.value='';
                                    print(ctrl.loadimgusingpath.value);
                                  },
                                  icon: Icon(
                                    // FontAwesomeIcons.cameraRetro,
                                    (ctrl.loadimgusingpath.value=='')?
                                    Icons.image:
                                    Icons.delete,
                                    size: 28,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 17,
                          ),
                        ],
                      ),
                       SizedBox(height: 15,),
                      //sizedbox between camera icon(for add image) and add button
                      //submit button
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                        child: GestureDetector(
                          onTap: (){
                            ctrl.AddComplaint();
                            
                            // DateTime timestamp = DateTime.now();

                           
                          },
                          child: Obx(
                           ()=> Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 39, 183, 240),
                                  borderRadius: BorderRadius.circular(12)),
                              child:  Center(
                                  child: (ctrl.loading.value)?
                                  const CircularProgressIndicator(color: Colors.white,):
                                  const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                            ),
                          ),
                        ),
                      ),
                  
                    
                   
                      SizedBox(height: 100,),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      
    );
  }
}
