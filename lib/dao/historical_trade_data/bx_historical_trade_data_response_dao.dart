import 'package:flutter_bx_exchange/dao/historical_trade_data/bx_historical_trade_data_dao.dart';

class BxHistoricalTradeDataResponseDao {
  bool success;
  BxHistoricalTradeDataDao data;
  String error;

  BxHistoricalTradeDataResponseDao({this.success, this.data});

  BxHistoricalTradeDataResponseDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? BxHistoricalTradeDataDao.fromJson(json['data']) : null;
    error = json['error'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error ?? "";
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
