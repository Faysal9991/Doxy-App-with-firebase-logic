class Profile{
  String? uid;
  String? email;
  String? username;
  String? profileImage;
  List<String> mybots = [];
  double totalMoney = 0;
  Profile({this.uid, this.email, this.username, this.profileImage});

  Profile.fromJson(Map<String, dynamic> json){
    uid = json["uid"];
    email = json["email"];
    username = json["username"];
    profileImage = json["profileImage"];
    if(json["mybots"]!=null){
      json["mybots"].forEach((e){
        mybots.add(e);
      });
    }else{
      mybots = [];
    }
    totalMoney = double.parse(json["totalMoney"].toString());
  }

  Map<String, dynamic> toJson(){
    return {
      "uid":uid,
      "email":email,
      "username":username,
      "profileImage":profileImage,
      "mybots":mybots,
      "totalMoney":totalMoney
    };
  }


}