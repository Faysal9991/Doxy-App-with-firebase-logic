import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jadeais/app/models/recharge_model.dart';

class RechargeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  var rechargeinstance = <RechargeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    collectionReference = firebaseFirestore.collection('recharges');
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      rechargeinstance.bindStream(getCustomRecharge(user.uid!));
    }
  }

  Stream<List<RechargeModel>> getCustomRecharge(String uid) {
    return collectionReference
        .where('uid', isEqualTo: uid).limit(5)
        .snapshots()
        .map((QuerySnapshot quesry) {
      List<RechargeModel> recharges = [];
      for (var singlerechage in quesry.docs) {
        final recharge = RechargeModel.fromMap(documentSnapshot: singlerechage);
        recharges.add(recharge);
        isLoading(false);
      }
      return recharges;
    });
  }
}
