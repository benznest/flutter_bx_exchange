import 'package:flutter_bx_exchange/bx_withdraw_transaction_type.dart';

class BxWithdrawTransactionDao {
  int withdrawalId;
  String dateRequested;
  double amount;
  String currency;
  String address;
  BxWithdrawTransactionType withdrawalStatus;
  String transactionId;

  BxWithdrawTransactionDao({this.withdrawalId,
    this.dateRequested,
    this.amount,
    this.currency,
    this.address,
    this.withdrawalStatus,
    this.transactionId});

  BxWithdrawTransactionDao.fromJson(Map<String, dynamic> json) {
    withdrawalId = int.parse(json['withdrawal_id'].toString());
    dateRequested = json['date_requested'];
    amount = double.parse(json['amount'].toString());
    currency = json['currency'];
    address = json['address'];
    withdrawalStatus = fromStringToBxWithdrawTransactionType(json['withdrawal_status']);
    transactionId = json['transaction_id'] == false ? "-" : json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['withdrawal_id'] = this.withdrawalId;
    data['date_requested'] = this.dateRequested;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['address'] = this.address;
    data['withdrawal_status'] = fromBxWithdrawTransactionTypeToString(this.withdrawalStatus);
    data['transaction_id'] = this.transactionId;
    return data;
  }
}