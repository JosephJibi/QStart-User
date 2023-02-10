class DeletedComplaintModel
{
  String? title,locationhint,description,img,status,statusreport,posteddate,postedtime,userid,useremail,deldate,deltime;
  DeletedComplaintModel({this.title,this.locationhint,this.description,this.posteddate,this.postedtime,this.status,this.userid,this.useremail,this.img,this.deldate,this.deltime});

  //to method
  Map<String,dynamic> toMap(){
    return {
      "useremail":useremail,
      "title":title,
      "locationhint":locationhint,
      "description":description,
      "posteddate":posteddate,
      "postedtime":postedtime,
      "status":status,
      "userid":userid,
      "img":img,
      "deldate":deldate,
      "deltime":deltime,
    };
  }



}