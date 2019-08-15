import 'package:flutter_bx_exchange/bx_trade_type.dart';

class BxLowAskDao {
  int orderId;
  double rate;
  double amount;
  String dateAdded;
  BxTradeType orderType;
  String displayVol1;
  String displayVol2;

  BxLowAskDao({this.orderId,
    this.rate,
    this.amount,
    this.dateAdded,
    this.orderType,
    this.displayVol1,
    this.displayVol2});

  BxLowAskDao.fromJson(Map<String, dynamic> json) {
    orderId = int.parse(json['order_id'].toString());
    rate = double.parse(json['rate'].toString());
    amount = double.parse(json['amount'].toString());
    dateAdded = json['date_added'];

    String type = json['order_type'];
    if (type == "buy") {
      orderType = BxTradeType.BUY;
    } else {
      orderType = BxTradeType.SELL;
    }

    displayVol1 = json['display_vol1'];
    displayVol2 = json['display_vol2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['rate'] = this.rate;
    data['amount'] = this.amount;
    data['date_added'] = this.dateAdded;

    if (orderType == BxTradeType.BUY) {
      data['order_type'] = "buy";
    } else {
      data['order_type'] = "sell";
    }

    data['display_vol1'] = this.displayVol1;
    data['display_vol2'] = this.displayVol2;
    return data;
  }
}