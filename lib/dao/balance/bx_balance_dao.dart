import 'package:flutter_bx_exchange/bx_pair_currency_manager.dart';
import 'package:flutter_bx_exchange/dao/balance/bx_balance_currency_dao.dart';

class BxBalanceDao {
  List<BxBalanceCurrencyDao> listBalanceCurrency;

  BxBalanceDao({this.listBalanceCurrency});

  BxBalanceDao.fromJson(Map<String, dynamic> json) {
    listBalanceCurrency = List();
    for (String currency in BxPairCurrencyManager.LIST_CURRENCY_AVAILABLE) {
      if (json[currency] != null) {
        listBalanceCurrency.add(BxBalanceCurrencyDao.fromJson(currency, json[currency]));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    for (BxBalanceCurrencyDao balance in listBalanceCurrency) {
      data[balance.currency] = balance.toJson();
    }
    return data;
  }
}