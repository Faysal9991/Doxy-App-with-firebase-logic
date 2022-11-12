import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jadeais/mls/profilemodel.dart';

import '../mls/botmodel.dart';
import '../mls/mainadminmodel.dart';
import '../mls/rechargemodel.dart';
import '../mls/withdrawmodel.dart';

class FireBase{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  signUp(String email, String password,String username)async{
    EasyLoading.show(status: "Creating Profile");
    final x = await auth.createUserWithEmailAndPassword(email: email, password: password)

        .then((value)async{
      Profile profile = Profile(uid: value.user!.uid, username: username, profileImage: "", email: email);
      final y = await firestore.collection("profile").doc(value.user!.uid).set(profile.toJson());
    })
    .onError((error, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showError("error");

    });

    EasyLoading.showSuccess("Successful");
    EasyLoading.dismiss();

  }

  signIn(String email, String password)async{
    EasyLoading.show(status: "Signing in");
    final x = await auth.signInWithEmailAndPassword(email: email, password: password).catchError((error, stackTrace){

      EasyLoading.showError("Error");
      EasyLoading.dismiss();


    });
    EasyLoading.showSuccess("Successful");

    EasyLoading.dismiss();
  }
  Future<Profile> myProfile()async{
      Profile modelUser = Profile();
      final x = await firestore.collection("profile").doc(auth.currentUser!.uid).get().then((value) {
        modelUser = Profile.fromJson(value.data()!);
      });
      return modelUser;
  }
  Future<List<Bot>> allmyactivebot()async{
    Profile myp = await myProfile();
    List<Bot> bots = [];
    for (var element in myp.mybots) {
      final x = await firestore.collection("bot").doc(element).get().then((value) {

        Bot bot = Bot.fromJson(value.data()!);
        if(DateTime.now().isBefore(bot.expired!)){
          bots.add(bot);
        }

      });
    }
    return bots;
  }
  Future<double> totalAssets()async{
    double totalAsset = 0;
    Profile profile = Profile();
    final x = firestore.collection("profile").doc(auth.currentUser!.uid);
    final y = await x.get().then((value) {
      profile = Profile.fromJson(value.data()!);
    });
    totalAsset = profile.totalMoney;
    for (var element in profile.mybots) {
      var x = await firestore.collection("bot").doc(element).get().then((value) {
        print(value);
        Bot bot = Bot.fromJson(value.data()!);
        if(bot.expired!.isAfter(DateTime.now())){
          var dif = DateTime.now().difference(bot.created!);

          totalAsset+=(bot.daily_add!*dif.inDays);
        }

      });

    }
    return totalAsset;

  }
  Stream<Profile> myProfileStream(){
    var y = firestore.collection("profile").doc(auth.currentUser!.uid).snapshots().map((event) => Profile.fromJson(event.data()!));
    return y;
  }

  Stream<List<WithdrawModel>> withdrawhestory(){
    return firestore
        .collection("withdraws")
        .doc(auth.currentUser!.uid)
        .collection("")
        .snapshots()
        .map((event) =>
        event.docs.map((e){
          WithdrawModel withdrawModel = WithdrawModel.fromJson(e.data());
          return withdrawModel;
        }).toList());
  }

  Stream<List<Bot>> allthebots(){
    return firestore
        .collection("bot")
        .snapshots()
        .map((event) =>
        event.docs.map((e){
          Bot bot = Bot.fromJson(e.data());
          bot.id=e.id;
          return bot;
        }).toList());
  }

  buyRobot(Profile myprofile, Bot bot)async{
    final x = firestore.collection("profile").doc(myprofile.uid);
    final z = firestore.collection("bot").doc(bot.id);
    final y = await x.get();
    final b = await z.get();
    double money = double.parse(y.data()!["totalMoney"].toString());
    money = money-bot.price!;
    List<String> mybots = [];
    y.data()!["mybots"].forEach((e){
      mybots.add(e);
    });

    mybots.add(bot.id!);
    List<String> user_id = [];
    b.data()!["users_uid"].forEach((e){
      user_id.add(e);
    });

    user_id.add(myprofile.uid!);

    await x.update({
      "totalMoney":money,
      "mybots":mybots
    });
    await z.update({
      "users_uid":user_id
    });



  }

  Future<double>todaytotalincomefrombots()async{
    double total = 0;
    Profile modelUser = Profile();
    final x = await firestore.collection("profile").doc(auth.currentUser!.uid).get().then((value) {
      modelUser = Profile.fromJson(value.data()!);
    });
    print(modelUser.mybots.length);
    for (var element in modelUser.mybots) {

      var x = await firestore.collection("bot").doc(element).get().then((value) {
        print(value);
        Bot bot = Bot.fromJson(value.data()!);
        if(bot.expired!.isAfter(DateTime.now())){
          total+=bot.daily_add!;
        }

      });

    }
    return total;

  }
  Future<bool>rechargeTobalance(String amount, String transactionId,String number)async{
    final x = await firestore.collection("recharges").doc().set(RechargeModel(uid: auth.currentUser!.uid, amount: amount, transactionId: transactionId,number: number).toJson()).onError((error, stackTrace) => false);
    return true;
  }
  Future<bool> withdrawRequest(WithdrawModel withdrawModel)async{
    final x = await firestore.collection("withdraws").doc().set(withdrawModel.toJson()).onError((error, stackTrace) => false);
    return true;
  }

  Stream<MainAdminModel> mainAdminData(){
    var y = firestore.collection("mainadmin").doc("staticdata").snapshots().map((event) => MainAdminModel.fromJson(event.data()!));
    return y;
  }


}