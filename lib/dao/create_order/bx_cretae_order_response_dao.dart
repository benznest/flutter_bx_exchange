class BxCreateOrderResponseDao {
  bool success;
  String error;
  int orderId;
  int historyId;

  BxCreateOrderResponseDao({this.success, this.error, this.orderId, this.historyId});

  BxCreateOrderResponseDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    orderId = json['order_id'];
    historyId = json['history_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['order_id'] = this.orderId;
    data['history_id'] = this.historyId;

    return data;
  }
}