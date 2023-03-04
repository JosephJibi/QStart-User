import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/dimensions.dart';

Future helpPopup(BuildContext ctx) async {
  return showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: Center(
              child: Text(
            'Different Statues',
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
          )),
          actions: [
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('Close',style: GoogleFonts.poppins(),)))
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.height25),
          )),
          content: Container(
            width: MediaQuery.of(ctx).size.width,
            height: Dimensions.height300,
            padding: EdgeInsets.all(Dimensions.height11),
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //done row
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Done',
                            style: GoogleFonts.poppins(
                                fontSize: Dimensions.height15,
                                fontWeight: FontWeight.w300),
                          ),
                          Tooltip(
                            message: 'Work is completed by a worker',
                            child: Container(
                              height: Dimensions.height35,
                              width: Dimensions.width90,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreen.shade400,
                                      Colors.lightGreen
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight),
                              ),
                              child: const Text(''),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //Verified row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Verified',
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w300),
                        ),
                        Tooltip(
                          message:
                              'Work is done by a worker and is verified by the admin',
                          child: Container(
                            height: Dimensions.height35,
                            width: Dimensions.width90,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height10),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.green.shade700,
                                    Colors.green,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //Pending row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pending',
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w300),
                        ),
                        Tooltip(
                          message: 'The worker has put the work into pending',
                          child: Container(
                            height: Dimensions.height35,
                            width: Dimensions.width90,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height10),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.orange.shade700,
                                    Colors.orange,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //Processing row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Processing',
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w300),
                        ),
                        Tooltip(
                          message:
                              'Admin has accepted the complaint and also work is assigned to a worker',
                          child: Container(
                            height: Dimensions.height35,
                            width: Dimensions.width90,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height10),
                              gradient: const LinearGradient(
                                  colors: [Colors.lightBlueAccent, Colors.blue],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //Declined row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Declined',
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w300),
                        ),
                        Tooltip(
                          message:
                              'Admin has declined the complaint posted by the user',
                          child: Container(
                            height: Dimensions.height35,
                            width: Dimensions.width90,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height10),
                              gradient: const LinearGradient(
                                  colors: [Colors.redAccent, Colors.red],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //Requested row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Requested',
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w300),
                        ),
                        Tooltip(
                          message: 'A complaint is posed by a user',
                          child: Container(
                            height: Dimensions.height35,
                            width: Dimensions.width90,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height10),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade700,
                                    Colors.purple,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Dimensions.height10,
                    ),

                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ]),
            ),
          ),
        );
      });
}
