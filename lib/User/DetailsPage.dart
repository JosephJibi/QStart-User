import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qstart/Controller/deleteComplaintController.dart';
import 'package:qstart/utilities/dimensions.dart';
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
          placeholder: const AssetImage('assets/images/loading.gif'),
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
                padding:  EdgeInsets.only(top: Dimensions.height98, left: Dimensions.width20),
                onPressed: () {
                  Get.back();
                },
                icon:   Icon(
                  // Icons.close,
                  size: Dimensions.height30,
                  FontAwesomeIcons.xmark
                )),
            //delete item button
            IconButton(
                color: Colors.white,
                padding:  EdgeInsets.only(top: Dimensions.height98, right: Dimensions.width20),
                onPressed: () {
                    popUpBox(context);
                },
                icon:    Icon(
                  Icons.delete,
                  // FontAwesomeIcons.trash,
                  size: Dimensions.height30,
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
                  topLeft: Radius.circular(Dimensions.height45),
                  // topRight: Radius.circular(40)
                )),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: Dimensions.height30, right: Dimensions.width20, left: Dimensions.width20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                     //row to hold complaint date and status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           //define date of complaint
                          const Icon(Icons.calendar_month_outlined),
                          Text(document['date']),
                          const Spacer(),
                           //container for display work status
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(Dimensions.height10)),
                                  color: (document['status']=='Requested')?
                                                AppColor.requestedColour:
                                                (document['status']=='Processing')?
                                                AppColor.processingColour:
                                                (document['status']=='Declined')?
                                                AppColor.declainedColour:
                                                (document['status']=='Pending')?
                                                AppColor.pendingColour:
                                                (document['status']=='Verified')?
                                                AppColor.doneVerifiedColour:
                                                AppColor.doneColour
                                                ,),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.height8),
                                child: Text(document['status']),
                              )),

                        ],
                      ),
                      SizedBox(height: Dimensions.height20,),
                      //heading - title of complaint
                      Text(
                        document['title'],
                        style: GoogleFonts.firaSans(fontWeight: FontWeight.bold,fontSize: Dimensions.height40),
                      ),
                      //location hint of complaint
                      Text(
                        document['locationhint'],
                        style: GoogleFonts.poppins(
                          fontSize: Dimensions.height20,
                        ),
                      ),
                      SizedBox(height: Dimensions.height5,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                       
                        
                          children: [
                            const Icon(Icons.access_time_sharp),
                            SizedBox(width: Dimensions.width10,),
                            Text(document['time'])
                          ],
                      ),
                     SizedBox(height: Dimensions.height20,),
                      Text(
                        'Description :  '
                        + document['description'],
                          // 'We have been using this purifier from our 1st yr. It\'s not working from last 3 days. Do check on this and ensure it\'s working ',
                          style: GoogleFonts.poppins(
                          fontSize: Dimensions.height15,
                          fontWeight: FontWeight.w500,
                          ),),
                        SizedBox(height: Dimensions.height15,),
                        //display declined or pending message
                    (document['declinemsg']!='')? Text('Pending due to :'+document['declinemsg'],style: GoogleFonts.poppins(fontSize: Dimensions.height15,color: Color.fromARGB(255, 71, 83, 90)),):
                    (document['pendingmsg']!='')? Text('Pending due to :'+document['pendingmsg'],style: GoogleFonts.poppins(fontSize: Dimensions.height15,color: Color.fromARGB(255, 71, 83, 90)),):
                      SizedBox(), 
                   
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
    
    return showDialog(
      context: ctx,
          builder: (ctx1) {
      return 
          AlertDialog(
             
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.height25))),
            content: Container(
               width: MediaQuery.of(ctx).size.width,
            height: Dimensions.height210,
               padding: EdgeInsets.all(Dimensions.height11),
            color: Colors.white,
              child: ListView(
                children: [
                  Center(child: Text('Alert ⚠️',style: GoogleFonts.amaranth(fontSize: Dimensions.height30,fontWeight: FontWeight.bold))),
                  SizedBox(height: Dimensions.height10,),
                  Text('Do you need delete this complaint?',style: GoogleFonts.poppins(fontSize: Dimensions.height20,fontWeight: FontWeight.w500),),
                  Text('You can\'t undo this action',style: GoogleFonts.poppins(fontSize: Dimensions.height18),),
                  Divider(thickness: Dimensions.height1,),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                        Navigator.of(ctx).pop();
                      }, child: Text('Close',style: GoogleFonts.poppins(fontSize: Dimensions.height15),)),
                      VerticalDivider(thickness: Dimensions.height1,),
                      TextButton(onPressed: (){
                      if(document['status']=='Requested'){

                      print('Delete...................');
                       ctrl.delComplaint(document.id);
                      }
                      else if(document['status']=='Declined'){
                          Get.snackbar('Permission Denied ⚠️', 'Your complaint is already declined, You can\'t delete it now...');
                      }
                      else{
                        Get.snackbar('Permission Denied ⚠️', 'Your complaint is under process, You can\'t delete it now...');
                      }
                       Navigator.of(ctx).pop();
                       Navigator.of(ctx).pop();
                      }, child: Text('Delete',style: GoogleFonts.poppins(fontSize:Dimensions.height15,color: Colors.red),)),
                      ],
                    ),
                  ),
                    SizedBox(height: Dimensions.height20,),
                    
                
              ]),
            ),
          );
          }
    );
  }
 
}
