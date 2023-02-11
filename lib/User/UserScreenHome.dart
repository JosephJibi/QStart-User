import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qstart/Controller/deleteComplaintController.dart';
import 'package:qstart/User/DetailsPage.dart';
import 'package:qstart/utilities/colors.dart';
import 'package:qstart/utilities/dimensions.dart';

import '../Controller/AuthController.dart';

class UserScreenHome extends StatelessWidget {
  UserScreenHome({super.key});

  final auth = FirebaseAuth.instance;

  final ctrl = Get.put(AuthController());
  final ctrl2 = Get.put(deleteComplaint());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor().secondGradient,
      ),
      child: Column(children: [
        //first container(main 1)
        Container(
          height: (ctrl.profiledata['complaint'] == 0) ? Dimensions.height280 : Dimensions.height230,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: AppColor().mainGradient,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
             SizedBox(
              height: Dimensions.height70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Dimensions.height120,
                  width: Dimensions.width120,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                 Text(
                  'QSTART',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 77, 82, 89),
                      letterSpacing: Dimensions.height2,
                      fontSize: Dimensions.height40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Amaranth-Bold'),
                )
              ],
            ),
          ]),
        ),
        //second container
        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height30),
                    topRight: Radius.circular(Dimensions.height30),
                  ),
                  boxShadow:  [
                    BoxShadow(
                      color: const Color.fromARGB(255, 97, 85, 85),
                      spreadRadius: Dimensions.height07,
                      blurRadius: Dimensions.height15,
                    )
                  ]),
              //if complaint field of current user is null then we not need to use streambuilder because thatmeans user have not posted any complaints

              child:
              //  (ctrl.profiledata['complaint'] == 0)
              //     ?
              //     //if not complaint has posted by currentuser then return a column
              //     Column(
              //         children: [
              //           Container(
              //             height: 280,
              //             child: Lottie.network(
              //                 // 'https://assets6.lottiefiles.com/packages/lf20_zfnngl5k.json',
              //                 'https://assets2.lottiefiles.com/packages/lf20_fmieo0wt.json',
              //                 // repeat: false,
              //                 fit: BoxFit.contain),
              //           ),
              //           Text(
              //             'You haven\'posted \n any complaints',
              //             style: GoogleFonts.poppins(
              //                 fontSize: 15, fontWeight: FontWeight.w500),
              //           )
              //         ],
              //       ):
                   StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('complaint')
                          .orderBy('date',descending: false)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return ListView(
                            children: snapshot.data!.docs.map((document) {
                              if (ctrl.profiledata['complaint'] == 0 && ctrl2.flag==0) {
                                ctrl2.flag++;
                              //   print(ctrl2.flag);
                              //  print('working');
                              //  print(ctrl.profiledata['complaint']);
                                return Column(
                                  children: [
                                    Container(
                                      height: Dimensions.height280,
                                      child: Lottie.network(
                                          // 'https://assets6.lottiefiles.com/packages/lf20_zfnngl5k.json',
                                          'https://assets2.lottiefiles.com/packages/lf20_fmieo0wt.json',
                                          // repeat: false,
                                          fit: BoxFit.contain),
                                    ),
                                    Text(
                                      'You haven\'posted \n any complaints',
                                      style: GoogleFonts.poppins(
                                          fontSize: Dimensions.height15,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                );
                              }
                              if (document['useremail'] ==
                                  auth.currentUser?.email) {
                                return cardsForListOfComplaint(document);
                              } else {
                                return const SizedBox();
                              }
                            }).toList(),
                          );
                        }
                      })),
        ),
      ]),
    );
  }

//changed cards builded using containers to method for ux it will change when actual database is added
  GestureDetector cardsForListOfComplaint(QueryDocumentSnapshot document) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsPage(document));
      },
      child: Padding(
        padding:  EdgeInsets.all(Dimensions.height8),
        child: Container(
          height: Dimensions.height150,
          width: Dimensions.width380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.height10)),
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 159, 186, 218), width: Dimensions.height1)),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        document['title'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: Dimensions.height25),
                      ),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                 BorderRadius.all(Radius.circular(Dimensions.height10)),
                            color: (document['status'] == 'Requested')
                                ? AppColor.requestedColour
                                : (document['status'] == 'Processing')
                                    ? AppColor.processingColour
                                    : (document['status'] == 'Declined')
                                        ? AppColor.declainedColour
                                        : (document['status'] == 'Pending')
                                            ? AppColor.pendingColour
                                            : (document['status'] ==
                                                    'Done Verified')
                                                ? AppColor.doneVerifiedColour
                                                : AppColor.doneColour,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(Dimensions.height8),
                            child: Text(document['status']),
                          )),
                    ],
                  ),
                  //sizedbox between title row and description
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // document['description'].substring(0,45)
                        // +'...'
                        document['description'],
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      Divider(
                        thickness: Dimensions.height1,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              document['locationhint'],
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            VerticalDivider(
                              // color: Colors.black,  //color of divider
                              // width: 10, //width space of divider
                              thickness: Dimensions.height2, //thickness of divier line
                              // indent: 1, //Spacing at the top of divider.
                              // endIndent: 1, //Spacing at the bottom of divider.
                            ),
                            const Icon(Icons.calendar_month_outlined),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                            Text(document['date'])
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
