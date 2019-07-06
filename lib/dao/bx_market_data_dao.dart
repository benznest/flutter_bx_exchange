import 'package:flutter_bx_exchange/dao/bx_pair_currency_dao.dart';

class BxMarketDataDao {
  BxPairCurrencyBxDao pair_thb_btc;
  BxPairCurrencyBxDao pair_btc_ltc;

  BxMarketDataDao({this.pair_thb_btc, this.pair_btc_ltc});

  BxMarketDataDao.fromJson(Map<String, dynamic> json) {
    pair_thb_btc = BxPairCurrencyBxDao.fromJson(json['1']);
    pair_btc_ltc = BxPairCurrencyBxDao.fromJson(json['2']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.pair_thb_btc.toJson();
    data['2'] = this.pair_btc_ltc.toJson();
    return data;
  }

  List<BxPairCurrencyBxDao> toList() {
    List<BxPairCurrencyBxDao> listPairCurrency = List()
      ..add(pair_thb_btc)..add(pair_btc_ltc);
    return listPairCurrency;
  }
}