import 'package:flutter_bx_exchange/dao/order_book/bx_order_book_detail_dao.dart';

class BxOrderBookDao {
  int pairingsId;
  List<BxOrderBookDetailDao> bids;
  List<BxOrderBookDetailDao> asks;

  BxOrderBookDao({this.pairingsId, this.bids, this.asks});

  BxOrderBookDao.fromJson(this.pairingsId, Map<String, dynamic> json) {
    List listBids = json['bids'];
    bids = listBids.map((item) => BxOrderBookDetailDao.fromJson(item)).toList();

    List listAsks = json['asks'];
    asks = listAsks.map((item) => BxOrderBookDetailDao.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['bids'] = bids.map((item) => item.toJson()).toList();
    data['asks'] = asks.map((item) => item.toJson()).toList();
    return data;
  }

}