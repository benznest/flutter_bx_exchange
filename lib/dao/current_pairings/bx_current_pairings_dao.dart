import 'package:flutter_bx_exchange/dao/current_pairings/bx_pair_curency_meta_dao.dart';
import 'package:flutter_bx_exchange/bx_pair_currency_manager.dart';

class BxCurrentPairingsDao {
  List<BxPairCurrencyMetaDao> listPairCurrency;

  BxCurrentPairingsDao({this.listPairCurrency});

  BxCurrentPairingsDao.fromJson(Map<String, dynamic> json) {
    listPairCurrency = List();
    for(int id in BxPairCurrencyManager.LIST_PAIR_CURRENCY_ID){
      if(json['$id'] != null) {
        listPairCurrency.add(BxPairCurrencyMetaDao.fromJson(json['$id']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    for(BxPairCurrencyMetaDao pair in listPairCurrency){
      data['${pair.pairingId}'] = pair.toJson();
    }
    return data;
  }

  get data {
    return listPairCurrency;
  }
}