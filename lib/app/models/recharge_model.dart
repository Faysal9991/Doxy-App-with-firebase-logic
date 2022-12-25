import 'package:cloud_firestore/cloud_firestore.dart';

class RechargeModel {
  String?id;
  String? ammount;
  String? transactionid;
  String? uid;

  RechargeModel(this.ammount, this.transactionid, this.uid,this.id);

  RechargeModel.fromMap({required DocumentSnapshot documentSnapshot}){
    id = documentSnapshot.id;
    ammount = documentSnapshot['amount'];
    transactionid = documentSnapshot['transactionId'];
    uid = documentSnapshot['uid'];

  }
}