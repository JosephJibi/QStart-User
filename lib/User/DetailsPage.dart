import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/deleteComplaintController.dart';

import '../Controller/complaintController.dart';
import '../utilities/colors.dart';

class DetailsPage extends StatelessWidget {
 final QueryDocumentSnapshot document;
   DetailsPage(this.document,{super.key});

  final ctrl = Get.put(deleteComplaint());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //image uploaded by user
        FadeInImage(
          image: NetworkImage(
            document['img'],
            
          ),
          placeholder: AssetImage('assets/images/loading.gif'),
          height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
        ),
        //row for icons(close screen, delete item)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //close button
            IconButton(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 70, left: 20),
                onPressed: () {
                  Get.back();
                },
                icon:  Icon(
                  Icons.close
                  // FontAwesomeIcons.xmark
                )),
            //delete item button
            IconButton(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 70, right: 20),
                onPressed: () {
                    popUpBox(context);
                },
                icon:  Icon(
                  Icons.delete
                  // FontAwesomeIcons.trash
                  )),
          ],
        ),
        //bottom part
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  // topRight: Radius.circular(40)
                )),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                     //row to hold complaint date and status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           //define date of complaint
                          Icon(Icons.calendar_month_outlined),
                          Text(document['date']),
                          Spacer(),
                           //container for display work status
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: (document['status']=='Requested')?
                                                AppColor.requestedColour:
                                                (document['status']=='Processing')?
                                                AppColor.processingColour:
                                                (document['status']=='Declined')?
                                                AppColor.declainedColour:
                                                (document['status']=='Pending')?
                                                AppColor.pendingColour:
                                                (document['status']=='Done Verified')?
                                                AppColor.doneVerifiedColour:
                                                AppColor.doneColour
                                                ,),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(document['status']),
                              )),

                        ],
                      ),
                      SizedBox(height: 20,),
                      //heading - title of complaint
                      Text(
                        document['title'],
                        style: GoogleFonts.firaSans(fontWeight: FontWeight.bold,fontSize: 40),
                      ),
                      //location hint of complaint
                      Text(
                        document['locationhint'],
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                       
                        
                          children: [
                            Icon(Icons.access_time_sharp),
                            SizedBox(width: 10,),
                            Text(document['time'])
                          ],
                      ),
                     SizedBox(height: 20,),
                      Text(
                        'Description :  '
                        + document['description'],
                          // 'We have been using this purifier from our 1st yr. It\'s not working from last 3 days. Do check on this and ensure it\'s working ',
                          style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
   //popup
   Future popUpBox(BuildContext ctx) async
  {
    print('working');
    return showDialog(
      context: ctx,
          builder: (ctx1) {
      return 
          AlertDialog(
             
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            content: Container(
               width: MediaQuery.of(ctx).size.width,
            height: 210,
               padding: EdgeInsets.all(11.0),
            color: Colors.white,
              child: ListView(
                children: [
                  Center(child: Text('Alert ⚠️',style: GoogleFonts.amaranth(fontSize: 30,fontWeight: FontWeight.bold))),
                  SizedBox(height: 10,),
                  Text('Do you need delete this complaint?',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),),
                  Text('You can\'t undo this action',style: GoogleFonts.poppins(fontSize: 18),),
                  Divider(thickness: 1,),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                        Navigator.of(ctx).pop();
                      }, child: Text('Close',style: GoogleFonts.poppins(fontSize: 15),)),
                      VerticalDivider(thickness: 1,),
                      TextButton(onPressed: (){
                       ctrl.delComplaint(document);
                       Navigator.of(ctx).pop();
                       Navigator.of(ctx).pop();
                      }, child: Text('Delete',style: GoogleFonts.poppins(fontSize:15,color: Colors.red),)),
                      ],
                    ),
                  ),
                    SizedBox(height: 20,),
                    
                
              ]),
            ),
          );
          }
    );
  }
 
}
