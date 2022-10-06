class MainAdminModel{
  String? bkash;
  String? nagad;

  MainAdminModel.fromJson(Map<String, dynamic>json){
    bkash = json["bkash"];
    nagad = json["nagad"];
  }
}