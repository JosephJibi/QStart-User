
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Models/deleteComplaint.dart';
import 'AuthController.dart';

class deleteComplaint extends GetxController{
  //no data home screen flag
  int flag=0;
  //database instance
  FirebaseFirestore db = FirebaseFirestore.instance;

  //authcontroller instance
   final ctrl = Get.put(AuthController());
   
  delComplaint(
   var complaintid
  )async{
    DocumentSnapshot  document= await db.collection('complaint').doc(complaintid).get();
   



   
    //calling constructor of delete complaint class
    DeletedComplaintModel addcomplaint= DeletedComplaintModel(
     title:document['title'],
     locationhint:document['locationhint'],
    description:document['description'],
    deldate:   DateFormat("dd-MM-yyyy").format(DateTime.now()),
    deltime: DateFormat("hh:mm a").format(DateTime.now()),
    status: document['status'],
    userid: document['userid'],
    useremail: document['useremail'],
    img: document['img'],
    posteddate: document['date'],
    postedtime: document['time']
    );

    //add to database
    await db.collection("deletedcomplaint").add(addcomplaint.toMap());
    //update number of complaints in current user docs
    await db.collection("users")
      .doc(ctrl.docs)
      .update({"complaint": FieldValue.increment(-1)});

    // db.collection("complaint").where("userid",isEqualTo: document['userid']).get().then((QuerySnapshot) => 
    //        QuerySnapshot.docs.forEach((doc){
    //         doc.reference.delete();
    //        })
    // );
    db.collection('complaint').doc(complaintid).delete();
    flag=0;
    Get.snackbar('Success ⚠️', 'Deleted sucessfully');
    ctrl.profiledetails();
    print('flag=$flag');
    print('complaint1=');

    print(ctrl.profiledata['complaint']);
  }
}