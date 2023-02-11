import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/complaintController.dart';
import 'package:qstart/utilities/colors.dart';
import 'package:qstart/utilities/dimensions.dart';
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
                    height: Dimensions.height59,
                  ),
                  //row which hold logo and main name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //logo container
                        height: Dimensions.height100,
                        width: Dimensions.width100,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                       Text(             //App Name
                          'QSTART',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 77, 82, 89),
                              letterSpacing: Dimensions.height2,
                              fontSize: Dimensions.height40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Amaranth-Bold'),
                        ),
                    ],
                  ),
                  //sizedbox between logo and file a complaint text
                  SizedBox(height: Dimensions.height30,),
                  Text('File a Complaint',
                      style: GoogleFonts.anybody(
                          color: const Color.fromARGB(255, 67, 77, 82),
                          fontSize: Dimensions.height30)),
                  //sized box to move the second container little down
                  SizedBox(
                    height: Dimensions.height30,
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
                //main column of second container
                child: SingleChildScrollView(

                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      
                      //title textfield
                      Padding(
                        padding:  EdgeInsets.only(
                            top: Dimensions.height30, right: Dimensions.height25, left: Dimensions.height25),
                        child: TextFormField(
                          // maxLength: 18,
                          controller:ctrl.title ,
                          decoration: inputBoxes()
                              .maininputDecoration
                              .copyWith(label: const Text('Title')),
                        ),
                      ), 
                      //sizedbox between title and location textfield
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                
                      //location hint
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Dimensions.width25),
                        child: TextFormField(
                          controller: ctrl.locationhint,
                          decoration: inputBoxes()
                              .maininputDecoration
                              .copyWith(label: const Text('Location hint')),
                        ),
                      ),
                      //sizedbox between location and description  textfield
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //description box
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Dimensions.width25),
                        child: TextFormField(
                          controller: ctrl.description,
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                          decoration: inputBoxes()
                              .maininputDecoration
                              .copyWith(label: const Text('Description')),
                        ),
                      ),
                          //sizedbox between description textbox and add image stack
                      SizedBox(height: Dimensions.height15,),
                      //image add stack
                       Stack(
                      
                        children: [
                          //image container
                          Container(
                height: Dimensions.height190,
                width: Dimensions.width170,
                child: Obx(
                  ()=> ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.height30),          //
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
                            top: Dimensions.height140,                       //
                            left: Dimensions.width120,                      //
                            child: Obx(
                              ()=> IconButton(
                                  onPressed: (){
                                    (ctrl.loadimgusingpath.value=='')?
                                    ctrl.accessImage():
                                    
                                    ctrl.loadimgusingpath.value='';
                        
                                  },
                                  icon: Icon(
                                    // FontAwesomeIcons.cameraRetro,
                                    (ctrl.loadimgusingpath.value=='')?
                                    Icons.image:
                                    Icons.delete,
                                    size: Dimensions.height28,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width17,
                          ),
                        ],
                      ),
                       SizedBox(height: Dimensions.height15,),
                      //sizedbox between camera icon(for add image) and add button
                      //submit button
                      Padding(
                        padding:  EdgeInsets.only(right: Dimensions.width25, left: Dimensions.width25),
                        child: GestureDetector(
                          onTap: (){
                            ctrl.AddComplaint();
                            
                            // DateTime timestamp = DateTime.now();

                           
                          },
                          child: Obx(
                           ()=> Container(
                              padding:  EdgeInsets.all(Dimensions.height20),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 39, 183, 240),
                                  borderRadius: BorderRadius.circular(Dimensions.height12)),
                              child:  Center(
                                  child: (ctrl.loading.value)?
                                  const CircularProgressIndicator(color: Colors.white,):
                                   Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.height18),
                              )),
                            ),
                          ),
                        ),
                      ),
                  
                    
                   
                      SizedBox(height: Dimensions.height100,),
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
