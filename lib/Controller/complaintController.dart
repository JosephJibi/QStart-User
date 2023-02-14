
import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qstart/Models/complaintModel.dart';

import 'AuthController.dart';

class complaintController extends GetxController{

  //authcontroller instance
   final ctrl = Get.put(AuthController());

  //database instance
  FirebaseFirestore db = FirebaseFirestore.instance;
  //auth instance
  FirebaseAuth auth = FirebaseAuth.instance;
  
  //textfield controller
  TextEditingController title = TextEditingController();
  TextEditingController locationhint = TextEditingController();
  TextEditingController description = TextEditingController();

  //loading var
  var loading=false.obs;

  //complaint image url
  String imgUrl='';
  //file
  var loadimgusingpath=''.obs;
  XFile? file;

    //add compalint to database
  AddComplaint()async{
    

    //check if any fields are empty
    if(title.text == null  || title.text ==""){
      Get.snackbar("Title", "Title field is not filled");
      return;
    }
    else if(locationhint.text == null  || locationhint.text ==""){
      Get.snackbar("Locationhint", "Locationhint field is not filled");
      return;
    }
    else if(description.text == null  || description.text ==" "){
      Get.snackbar("Description", "Description field is not filled");
      return;
    }
    //image
    if(file==null || loadimgusingpath.value==''){
      Get.snackbar('Warning', 'Image is not selected');
      return;
    }
    loading.value=true;
    //creating a unique file name to image using datetime.now() function
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDir = referenceRoot.child('ComplaintImages');
    Reference referenceImage = referenceDir.child(uniqueFileName);

    
    try{
      //upload image
      await referenceImage.putFile(File(file!.path));
      //Sucess: Get image download url 
      imgUrl = await referenceImage.getDownloadURL();
      
      print('$imgUrl');
      Get.snackbar('Success 👍', 'Image uploaded successfully');
    }
    catch(e){
        Get.snackbar('Error', '$e');
        loading.value=false;
        return;
    }
    //calling constructor of complaintmodel class
    complaintModel addcomplaint= complaintModel(
     title:title.text,
     locationhint:locationhint.text,
    description:description.text,
    time: DateFormat("hh:mm a").format(DateTime.now()),
    date:  DateFormat("dd-MM-yyyy").format(DateTime.now()),
    status: "Requested",
    userid: auth.currentUser?.uid,
    useremail: auth.currentUser?.email,
    img: imgUrl,
    workerid: ''
    );

    //add to database
    await db.collection("complaint").add(addcomplaint.toMap());
    //update number of complaints in current user docs
    await db.collection("users")
      .doc(ctrl.docs)
      .update({"complaint": FieldValue.increment(1)});
    //clear all textfields
    title.clear();
    locationhint.clear();
    description.clear();
    file=null;
    loadimgusingpath.value='';
    loading.value=false;
  ctrl.profiledetails();
    //success snackbar
    Get.snackbar("Submitted sucessfully", "Complaint submitted sucessfully");
  }


  //add image
  accessImage() async{
    ImagePicker imagePicker = ImagePicker();
   file = await imagePicker.pickImage(source: ImageSource.gallery);
    loadimgusingpath.value=file!.path.toString();
    
    
  }

}