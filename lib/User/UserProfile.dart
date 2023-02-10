import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/AuthController.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final ctrl = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    //add to profile image var of obs
      ctrl.profimg.value=ctrl.profiledata['profileimg'];

    return Container(
      child: SafeArea(
        child: ListView(physics: BouncingScrollPhysics(), children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      print(ctrl.docs);
                    },
                    icon: const FaIcon(
                        color: Color.fromARGB(255, 58, 73, 99),
                        FontAwesomeIcons.circleInfo))
              ],
            ),
            Stack(
              children: [
                //rounded image view container
                Container(
                  
                  height: 190,
                  width: 170,
                  child: Obx(
                    ()=>ClipRRect(
                        borderRadius: BorderRadius.circular(900),       //
                        child: (ctrl.profimg.value=='')?
                        Image.asset(
                            fit: BoxFit.cover, 'assets/images/default.png'):
                            Image.network(ctrl.profimg.value,fit: BoxFit.cover,)
                            ),
                  ),
                ),
                Positioned(
                            top: 140,                       //
                            left: 120,                      //
                            child: IconButton(
                                  onPressed: (){
                                    print('working 1');
                                    ctrl.addProfileImage();
                                    print('working 2');
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.cameraRetro,
                                    size: 28,
                                  )),
                            
                          ),
              ],
            ),
            SizedBox(height: 10,),
            Text(ctrl.profiledata['username'],
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amaranth-Bold')),
            Text(ctrl.profiledata['type'],
                style: GoogleFonts.firaSans(
                  fontSize: 25,
                )),
            SizedBox(
              height: 20,
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('3',
                            style: GoogleFonts.firaSans(
                                fontSize: 25, fontWeight: FontWeight.w500)),
                        Text('Complaints',
                            style: GoogleFonts.firaSans(fontSize: 20)),
                      ],
                    ),
                    VerticalDivider(
                      thickness: 2, //thickness of divier line
                    ),
                    Column(
                      children: [
                        Text(
                          '1',
                          style: GoogleFonts.firaSans(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text('Done', style: GoogleFonts.firaSans(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //
            SizedBox(
              height: 20,
            ),
            card(
                title: 'E-mail',
                // content: 'josephjibi33@gmail.com',
                content: ctrl.profiledata['email'],
                cardicon: Icon(Icons.mail)),
            card(
                title: 'Phone No.',
                // content: '9496035739',
                content: ctrl.profiledata['phoneNo'],
                cardicon: Icon(Icons.phone)),
            card(
                title: 'Unique id',
                // content: '5445',
                content: ctrl.profiledata['uniqueNo'],
                cardicon: Icon(Icons.numbers)),

            GestureDetector(
              onTap: () {
                // ctrl.profiledetails();
                ctrl.signout();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 39, 183, 240),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  'Log out',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Card card({String? title, String? content, Icon? cardicon}) {
    return Card(
      color: Color.fromARGB(255, 244, 245, 245),
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title!,
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 126, 124, 124))),
            SizedBox(height: 5.0),
            Row(children: [
              cardicon!,
              SizedBox(width: 10.0),
              Text(content!, style: GoogleFonts.poppins()),
            ]),
          ])),
    );
  }
}
