import 'package:flutter_bx_exchange/dao/transaction_history/bx_transaction_detail_dao.dart';

class BxTransactionHistoryDao {
  bool success;
  List<BxTransactionDetailDao> transactions;
  String error;

  BxTransactionHistoryDao({this.success, this.transactions});

  BxTransactionHistoryDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['transactions'] != null) {
      List list = json['transactions'];
      transactions = list.map((v) => BxTransactionDetailDao.fromJson(v)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    if (this.transactions != null) {
      data['transactions'] = this.transactions.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
