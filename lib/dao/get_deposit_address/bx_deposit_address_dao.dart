
class BxDepositAddressDao {
  bool success;
  String address;
  String error;

  BxDepositAddressDao({this.success, this.error});

  BxDepositAddressDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    address = json['address'] == false ? null : json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['address'] = this.address;

    return data;
  }
}