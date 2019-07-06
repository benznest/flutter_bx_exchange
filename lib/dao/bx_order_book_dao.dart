import 'package:flutter_bx_exchange/dao/volume_data_dao.dart';

class BxOrderBookDao {
  VolumeDataDao bids;
  VolumeDataDao asks;

  BxOrderBookDao({this.bids, this.asks});

  BxOrderBookDao.fromJson(Map<String, dynamic> json) {
    bids = json['bids'] != null ? new VolumeDataDao.fromJson(json['bids']) : null;
    asks = json['asks'] != null ? new VolumeDataDao.fromJson(json['asks']) : null;
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
