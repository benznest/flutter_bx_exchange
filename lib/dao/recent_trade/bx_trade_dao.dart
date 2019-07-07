import 'package:flutter_bx_exchange/bx_trade_type.dart';

class BxTradeDao {
  int tradeId;
  double rate;
  double amount;
  String tradeDate;
  int orderId;
  BxTradeType tradeType;
  String referenceId;
  int seconds;

  BxTradeDao({this.tradeId,
    this.rate,
    this.amount,
    this.tradeDate,
    this.orderId,
    this.tradeType,
    this.referenceId,
    this.seconds});

  BxTradeDao.fromJson(Map<String, dynamic> json) {
    tradeId = int.parse(json['trade_id'].toString());
    rate = double.parse(json['rate'].toString());
    amount = double.parse(json['amount']);
    tradeDate = json['trade_date'];
    orderId = int.parse(json['order_id']);

    String type = json['trade_type'];
    if (type == "sell") {
      tradeType = BxTradeType.SELL;
    } else {
      tradeType = BxTradeType.BUY;
    }

    referenceId = json['reference_id'];
    seconds = int.parse(json['seconds'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trade_id'] = this.tradeId;
    data['rate'] = this.rate;
    data['amount'] = this.amount;
    data['trade_date'] = this.tradeDate;
    data['order_id'] = this.orderId;

    if (tradeType == BxTradeType.SELL) {
      data['trade_type'] = "sell";
    } else {
      data['trade_type'] = "buy";
    }

    data['reference_id'] = this.referenceId;
    data['seconds'] = this.seconds;
    return data;
  }

}