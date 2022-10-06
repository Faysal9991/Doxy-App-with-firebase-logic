class MainAdminModel{
  String? bkash;
  String? nagad;
  String? rocket;
  String? upay;

  MainAdminModel.fromJson(Map<String, dynamic>json){
    bkash = json["bkash"];
    nagad = json["nagad"];
    rocket = json["rocket"];
    upay = json["upay"];
  }
}