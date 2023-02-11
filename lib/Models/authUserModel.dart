import 'package:cloud_firestore/cloud_firestore.dart';

class authUserModel
{
  String? username,dep,uniqueNo,phoneNo,email,type,id,profileimg;
  int? complaint,donecount;
  
  //
  //all this varables are based on inputbox in signup screen:
  //user name-full name
  //dep - department
  //uniqueNo - unique number
  //phoneNo - phone number
  //email - email
  //
  //id - gives id of registration
  //
  
  //Creating constructor
  authUserModel({this.username,this.dep,this.uniqueNo,this.phoneNo,this.email,this.type,this.id,this.profileimg,this.complaint,this.donecount});

  // //getmethod
  // factory authUserModel.fromMap(DocumentSnapshot map){
  //   return authUserModel(
  //     email:  map["email"],
  //     username: map["username"],
  //     id: map.id,
  //     dep: map["dep"],
  //     uniqueNo: map["uniqueNo"],
  //     phoneNo: map["phoneNo"],
  //     type: map["type"]

  //   );
  // }

  //to method
  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "email":email,
      "username":username,
      "dep":dep,
      "uniqueNo":uniqueNo,
      "phoneNo":phoneNo,
      "type":type,
      "profileimg":profileimg,
      "complaint":complaint,
      "donecount":donecount,
    };
  }
 
}