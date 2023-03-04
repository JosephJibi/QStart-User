import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/dimensions.dart';

Future infoPopUp(BuildContext ctx) async {
  return showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.only(top: Dimensions.height50),
          title: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'QSTART  ',
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlueAccent),
              ),
              Text(
                'v1.0',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ],
          )),
          actions: [
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Close')))
          ],
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.height28))),
          content: Container(
            width: MediaQuery.of(ctx).size.width,
            height: Dimensions.height130,
            padding: EdgeInsets.all(Dimensions.height11),
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Coded with ❤️',
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Text(
                      'Developed by : Jibi Joseph,',
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Text(
                      'Prof. Renie Mathews,',
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      'Asish, Jerome, Adithyan',
                      style: GoogleFonts.poppins(),
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
