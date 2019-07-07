import 'package:flutter_bx_exchange/dao/balance/bx_balance_dao.dart';

class BxBalanceResponseDao {
  bool success;
  BxBalanceDao balance;
  String error;

  BxBalanceResponseDao({this.success, this.balance});

  BxBalanceResponseDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    balance = json['balance'] != null ? BxBalanceDao.fromJson(json['balance']) : null;
    error = json['error'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error ?? "";
    if (this.balance != null) {
      data['balance'] = this.balance.toJson();
    }
    return data;
  }
}
