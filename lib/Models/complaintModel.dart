class complaintModel
{
  String? title,locationhint,description,img,status,statusreport,date,time,userid,useremail,workerid,pendingmsg,declinemsg;
  complaintModel({this.title,this.locationhint,this.description,this.date,this.time,this.status,this.userid,this.useremail,this.img,this.workerid,this.pendingmsg,this.declinemsg});

  //to method
  Map<String,dynamic> toMap(){
    return {
      "useremail":useremail,
      "title":title,
      "locationhint":locationhint,
      "description":description,
      "date":date,
      "time":time,
      "status":status,
      "userid":userid,
      "img":img,
      "workerid":workerid,
      "pendingmsg":pendingmsg,
      "declinemsg":declinemsg,
    };
  }



}