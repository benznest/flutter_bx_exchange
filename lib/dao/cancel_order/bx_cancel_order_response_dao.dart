
class BxCancelOrderResponseDao {
  bool success;
  String error;

  BxCancelOrderResponseDao({this.success, this.error});

  BxCancelOrderResponseDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;

    return data;
  }
}