import 'package:flutter_bx_exchange/dao/recent_trade/bx_order_detail_dao.dart';
import 'package:flutter_bx_exchange/dao/recent_trade/bx_trade_dao.dart';

class BxRecentTradeDao {
  int pairingId;
  List<BxTradeDao> trades;
  List<BxOrderDetailDao> lowAsk;
  List<BxOrderDetailDao> highBid;

  BxRecentTradeDao.fromJson(this.pairingId, Map<String, dynamic> json) {
    List listTrade = json['trades'];
    trades = listTrade.map((item) => BxTradeDao.fromJson(item)).toList();

    List listLowAsk = json['lowask'];
    lowAsk = listLowAsk.map((item) => BxOrderDetailDao.fromJson(item)).toList();

    List listHighBid = json['highbid'];
    highBid = listHighBid.map((item) => BxOrderDetailDao.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trades'] = trades.map((item) => item.toJson()).toList();
    data['lowask'] = lowAsk.map((item) => item.toJson()).toList();
    data['highbid'] = highBid.map((item) => item.toJson()).toList();
    return data;
  }
}