import 'package:flutter_bx_exchange/dao/withdraw_history/bx_withdraw_transaction_dao.dart';

class BxWithdrawHistoryDao {
  bool success;
  List<BxWithdrawTransactionDao> withdrawals;
  String error;

  BxWithdrawHistoryDao({this.success, this.withdrawals, this.error});

  BxWithdrawHistoryDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['withdrawals'] != null) {
      withdrawals = new List<BxWithdrawTransactionDao>();
      json['withdrawals'].forEach((v) {
        withdrawals.add(BxWithdrawTransactionDao.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.withdrawals != null) {
      data['withdrawals'] = this.withdrawals.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    return data;
  }
}