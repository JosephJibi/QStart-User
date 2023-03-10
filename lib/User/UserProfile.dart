import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/AuthController.dart';
import 'package:qstart/User/Popup/HelpPopup.dart';
import 'package:qstart/User/Popup/InfoPopup.dart';
import 'package:qstart/utilities/dimensions.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    //add to profile image var of obs
    ctrl.profimg.value = ctrl.profiledata['profileimg'];

    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      infoPopUp(context);
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
                  height: Dimensions.height190,
                  width: Dimensions.width170,
                  child: Obx(
                    () => ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height300),
                        child: (ctrl.profimg.value == '')
                            ? Image.asset(
                                fit: BoxFit.cover, 'assets/images/default.png')
                            : FadeInImage(
                                image: NetworkImage(
                                  ctrl.profimg.value,
                                ),
                                placeholder: const AssetImage(
                                    'assets/images/imageloading.gif'),
                                fit: BoxFit.cover,
                              )),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: -20,
                    child: RawMaterialButton(
                      onPressed: () {
                        ctrl.addProfileImage();
                      },
                      elevation: 2.0,
                      fillColor: const Color(0xFFF5F6F9),
                      
                      padding: const EdgeInsets.all(10.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Text(ctrl.profiledata['username'],
                style: GoogleFonts.poppins(
                  letterSpacing: Dimensions.height2,
                  fontSize: Dimensions.height30,
                  fontWeight: FontWeight.w500,
                )),
            Text(ctrl.profiledata['type'],
                style: GoogleFonts.poppins(
                  fontSize: Dimensions.height22,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: Dimensions.height20,
            ),
            IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.only(
                    right: Dimensions.width20, left: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('${ctrl.profiledata['complaint']}',
                            style: GoogleFonts.poppins(
                              fontSize: Dimensions.height25,
                            )),
                        Text('Complaints',
                            style: GoogleFonts.poppins(
                                fontSize: Dimensions.height20)),
                      ],
                    ),
                    VerticalDivider(
                      thickness: Dimensions.height2, //thickness of divier line
                    ),
                    Column(
                      children: [
                        Text('${ctrl.profiledata['donecount']}',
                            style: GoogleFonts.poppins(
                              fontSize: Dimensions.height25,
                            )),
                        Text('Done',
                            style: GoogleFonts.poppins(
                                fontSize: Dimensions.height20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //
            SizedBox(
              height: Dimensions.height20,
            ),
            card(
                title: 'E-mail',
                // content: 'josephjibi33@gmail.com',
                content: ctrl.profiledata['email'],
                cardicon: const Icon(Icons.mail)),
            card(
                title: 'Phone No.',
                // content: '9496035739',
                content: ctrl.profiledata['phoneNo'],
                cardicon: const Icon(Icons.phone)),
            card(
                title: 'Unique id',
                // content: '5445',
                content: ctrl.profiledata['uniqueNo'],
                cardicon: const Icon(Icons.numbers)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      helpPopup(context);
                    },
                    child: Text(
                      'Different Statues ? ',
                      style: GoogleFonts.poppins(
                          fontSize: Dimensions.height12,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            GestureDetector(
              onTap: () {
                // ctrl.profiledetails();
                ctrl.signout();
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width14,
                    vertical: Dimensions.height10),
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 39, 183, 240),
                    borderRadius: BorderRadius.circular(Dimensions.height12)),
                child: Center(
                    child: Text(
                  'Log out',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.height18),
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
      color: const Color.fromARGB(255, 244, 245, 245),
      elevation: Dimensions.height1,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width14, vertical: Dimensions.height10),
      child: Padding(
          padding: EdgeInsets.all(Dimensions.height10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title!,
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 126, 124, 124))),
            SizedBox(height: Dimensions.height5),
            Row(children: [
              cardicon!,
              SizedBox(width: Dimensions.width5),
              Text(content!, style: GoogleFonts.poppins()),
            ]),
          ])),
    );
  }
}
