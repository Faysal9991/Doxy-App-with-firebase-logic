import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jadeais/app/models/recharge_model.dart';
import 'package:jadeais/app/services/auth_service.dart';

class RechargeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  var rechargeinstance = <RechargeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    collectionReference = firebaseFirestore.collection('recharges');
    rechargeinstance.bindStream(getCustomRecharge());
  }

  Stream<List<RechargeModel>> getCustomRecharge() {
    print(AuthService().inputData());
    return collectionReference
        .where('uid', isEqualTo: "2rmblYWFNZeoftH5j4N04DEQ2c72")
        .snapshots()
        .map((QuerySnapshot quesry) {
      List<RechargeModel> recharges = [];
      for (var singlerechage in quesry.docs) {
        final recharge = RechargeModel.fromMap(documentSnapshot: singlerechage);
        recharges.add(recharge);
      }
      return recharges;
    });
  }
}
