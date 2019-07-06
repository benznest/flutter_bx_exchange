import 'package:flutter_bx_exchange/dao/bx_order_book_dao.dart';

class BxPairCurrencyBxDao {
  int pairingId;
  String primaryCurrency;
  String secondaryCurrency;
  double change;
  double lastPrice;
  double volume24hours;
  BxOrderBookDao orderbook;

  BxPairCurrencyBxDao(
      {this.pairingId, this.primaryCurrency, this.secondaryCurrency, this.change, this.lastPrice, this.volume24hours, this.orderbook});

  BxPairCurrencyBxDao.fromJson(Map<String, dynamic> json) {
    pairingId = int.parse(json['pairing_id'].toString());
    primaryCurrency = json['primary_currency'];
    secondaryCurrency = json['secondary_currency'];
    change = double.parse(json['change'].toString());
    lastPrice = double.parse(json['last_price'].toString());
    volume24hours = double.parse(json['volume_24hours'].toString());
    orderbook = json['orderbook'] != null ? new BxOrderBookDao.fromJson(json['orderbook']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pairing_id'] = this.pairingId;
    data['primary_currency'] = this.primaryCurrency;
    data['secondary_currency'] = this.secondaryCurrency;
    data['change'] = this.change;
    data['last_price'] = this.lastPrice;
    data['volume_24hours'] = this.volume24hours;
    if (this.orderbook != null) {
      data['orderbook'] = this.orderbook.toJson();
    }
    return data;
  }
}