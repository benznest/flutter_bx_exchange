
import 'package:flutter_bx_exchange/dao/get_order/bx_open_order_detail_dao.dart';

class BxOpenOrderResponseDao {
  bool success;
  String error;
  List<BxOpenOrderDetailDao> orders;

  BxOpenOrderResponseDao({this.success});

  BxOpenOrderResponseDao.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    List listOrder = json['orders'];
    orders = listOrder.map((item) => BxOpenOrderDetailDao.fromJson(item)).toList();
    error = json['error'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error ?? "";
    if (this.orders != null) {
      data['orders'] = orders.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
