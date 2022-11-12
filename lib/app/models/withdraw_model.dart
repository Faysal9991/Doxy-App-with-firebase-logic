import 'package:cloud_firestore/cloud_firestore.dart';

class WithdrawsModel{
  String?docId;
  num?amount;
  bool?granted;
  String?number;
  String?uid;

  WithdrawsModel({this.docId, this.amount, this.granted, this.number, this.uid});

  WithdrawsModel.fromMap({required DocumentSnapshot snapshot}){
    docId = snapshot.id;
    amount = snapshot['amount'];
    granted = snapshot['granted'];
    number = snapshot['number'];
    uid = snapshot['uid'];
  }

}