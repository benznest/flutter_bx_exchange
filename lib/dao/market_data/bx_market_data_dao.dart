import 'package:flutter_bx_exchange/dao/market_data/bx_pair_currency_dao.dart';
import 'package:flutter_bx_exchange/bx_pair_currency_manager.dart';

class BxMarketDataDao {
  List<BxPairCurrencyBxDao> listPairCurrency;

  BxMarketDataDao({this.listPairCurrency});

  BxMarketDataDao.fromJson(Map<String, dynamic> json) {
    listPairCurrency = List();
    for(int id in BxPairCurrencyManager.listPairCurrencyId){
      if(json['$id'] != null) {
        listPairCurrency.add(BxPairCurrencyBxDao.fromJson(json['$id']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    for(BxPairCurrencyBxDao pair in listPairCurrency){
      data['${pair.pairingId}'] = pair.toJson();
    }
    return data;
  }

  get data {
    return listPairCurrency;
  }
}