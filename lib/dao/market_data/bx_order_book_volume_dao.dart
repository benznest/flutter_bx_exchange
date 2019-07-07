import 'package:flutter_bx_exchange/dao/market_data/bx_volume_data_dao.dart';

class BxOrderBookVolumeDao {
  BxVolumeDataDao bids;
  BxVolumeDataDao asks;

  BxOrderBookVolumeDao({this.bids, this.asks});

  BxOrderBookVolumeDao.fromJson(Map<String, dynamic> json) {
    bids = json['bids'] != null ? BxVolumeDataDao.fromJson(json['bids']) : null;
    asks = json['asks'] != null ? BxVolumeDataDao.fromJson(json['asks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bids != null) {
      data['bids'] = this.bids.toJson();
    }
    if (this.asks != null) {
      data['asks'] = this.asks.toJson();
    }
    return data;
  }
}
