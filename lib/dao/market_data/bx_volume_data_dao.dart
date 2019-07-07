class BxVolumeDataDao {
  int total;
  double volume;
  double highbid;

  BxVolumeDataDao({this.total, this.volume, this.highbid});

  BxVolumeDataDao.fromJson(Map<String, dynamic> json) {
    total = int.parse(json['total'].toString());
    volume = double.parse(json['volume'].toString());
    highbid = double.parse(json['highbid'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['volume'] = this.volume;
    data['highbid'] = this.highbid;
    return data;
  }
}