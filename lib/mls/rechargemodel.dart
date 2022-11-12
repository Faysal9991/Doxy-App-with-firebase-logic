class RechargeModel{
  String? uid;
  String? amount;
  String? transactionId;
  String? number;
  RechargeModel({this.uid, this.amount, this.transactionId,this.number});

  Map<String, dynamic> toJson()=>{
    "uid":uid,
    "amount":amount,
    "transactionId":transactionId,
    'number': number
  };
}