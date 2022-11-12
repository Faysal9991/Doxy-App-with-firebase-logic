import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/withdraw_model.dart';

class WithdrawController extends GetxController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  var withdrawinstance = <WithdrawsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    collectionReference = firebaseFirestore.collection('withdraws');
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      withdrawinstance.bindStream(getCustomWithdraw(user.uid!));
    }
  }

  Stream<List<WithdrawsModel>> getCustomWithdraw(String uid) {
    return collectionReference
        .where('uid', isEqualTo: uid).limit(5)
        .snapshots()
        .map((QuerySnapshot quesry) {
      List<WithdrawsModel> recharges = [];
      for (var singlerechage in quesry.docs) {
        final recharge = WithdrawsModel.fromMap(snapshot: singlerechage);
        recharges.add(recharge);
        isLoading(false);
      }
      return recharges;
    });
  }

}