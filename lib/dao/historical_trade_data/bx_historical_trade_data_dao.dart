class BxHistoricalTradeDataDao {
  double avg;
  double high;
  double low;
  double volume;
  double open;
  double close;

  BxHistoricalTradeDataDao({this.avg, this.high, this.low, this.volume, this.open, this.close});

  BxHistoricalTradeDataDao.fromJson(Map<String, dynamic> json) {
    avg = double.parse(json['avg'].toString());
    high = double.parse(json['high'].toString());
    low = double.parse(json['low'].toString());
    volume = double.parse(json['volume'].toString());
    open = double.parse(json['open'].toString());
    close = double.parse(json['close'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    data['high'] = this.high;
    data['low'] = this.low;
    data['volume'] = this.volume;
    data['open'] = this.open;
    data['close'] = this.close;
    return data;
  }
}