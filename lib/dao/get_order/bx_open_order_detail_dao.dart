import 'package:flutter_bx_exchange/bx_trade_type.dart';

class BxOpenOrderDetailDao {
  int pairingId;
  int orderId;
  BxTradeType orderType;
  double rate;
  double amount;
  String date;

  BxOpenOrderDetailDao({this.pairingId,
    this.orderId,
    this.orderType,
    this.rate,
    this.amount,
    this.date});

  BxOpenOrderDetailDao.fromJson(Map<String, dynamic> json) {
    pairingId = int.parse(json['pairing_id'].toString());
    orderId = int.parse(json['order_id'].toString());

    String type = json['order_type'];
    if (type == "buy") {
      orderType = BxTradeType.BUY;
    } else {
      orderType = BxTradeType.SELL;
    }

    rate = double.parse(json['rate'].toString());
    amount = double.parse(json['amount'].toString());
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pairing_id'] = this.pairingId;
    data['order_id'] = this.orderId;

    if (orderType == BxTradeType.BUY) {
      data['order_type'] = "buy";
    } else {
      data['order_type'] = "sell";
    }

    data['rate'] = this.rate;
    data['amount'] = this.amount;
    data['date'] = this.date;
    return data;
  }
}