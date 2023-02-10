import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qstart/Controller/deleteComplaintController.dart';
import 'package:qstart/User/DetailsPage.dart';
import 'package:qstart/utilities/colors.dart';

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
          height: (ctrl.profiledata['complaint'] == 0) ? 280 : 230,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: AppColor().mainGradient,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'QSTART',
                  style: TextStyle(
                      color: Color.fromARGB(255, 77, 82, 89),
                      letterSpacing: 2,
                      fontSize: 40,
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 97, 85, 85),
                      spreadRadius: 0.7,
                      blurRadius: 15,
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
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView(
                            children: snapshot.data!.docs.map((document) {
                              if (ctrl.profiledata['complaint'] == 0 && ctrl2.flag==0) {
                                ctrl2.flag++;
                                print(ctrl2.flag);
                               print('working');
                               print(ctrl.profiledata['complaint']);
                                return Column(
                                  children: [
                                    Container(
                                      height: 280,
                                      child: Lottie.network(
                                          // 'https://assets6.lottiefiles.com/packages/lf20_zfnngl5k.json',
                                          'https://assets2.lottiefiles.com/packages/lf20_fmieo0wt.json',
                                          // repeat: false,
                                          fit: BoxFit.contain),
                                    ),
                                    Text(
                                      'You haven\'posted \n any complaints',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                );
                              }
                              if (document['useremail'] ==
                                  auth.currentUser?.email) {
                                return cardsForListOfComplaint(document);
                              } else {
                                return SizedBox();
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(
                  color: Color.fromARGB(255, 159, 186, 218), width: 1)),
          child: Padding(
            padding: EdgeInsets.all(20),
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
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
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
                            padding: EdgeInsets.all(8.0),
                            child: Text(document['status']),
                          )),
                    ],
                  ),
                  //sizedbox between title row and description
                  SizedBox(
                    height: 5,
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
                        height: 5,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              document['locationhint'],
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            VerticalDivider(
                              // color: Colors.black,  //color of divider
                              // width: 10, //width space of divider
                              thickness: 2, //thickness of divier line
                              // indent: 1, //Spacing at the top of divider.
                              // endIndent: 1, //Spacing at the bottom of divider.
                            ),
                            Icon(Icons.calendar_month_outlined),
                            SizedBox(
                              width: 5,
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
